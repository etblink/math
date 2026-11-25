"""Independent exact controls for archived Gaussian integration identities.
Checks matrix factors at rational orientations and low-degree Wishart moments
by direct independent-column polynomial expansion, not archived matrices.
"""
from fractions import Fraction as F
from functools import cache
from itertools import product
from math import comb, factorial
import json
from pathlib import Path
import sympy as sp
# Rational 3x3 matrix factors for two orientation widths.
widths=[(F(29,10),F(29,20)),(F(87,20),F(29,20))]
I=sp.eye(3); n=sp.Matrix([1,0,0]);checks=0;sub_checks=0
for (a,b),(c,d) in product(widths,repeat=2):
    g=(a+c)/2;h=(a-b)/2;k=(c-d)/2;D0=(g-h)*(g-k);D1=D0-h*k
    assert D1==g*b and D1>0 and b==d
    for z,y in [(F(0),F(1)),(F(1),F(0)),(F(3,5),F(4,5)),(F(5,13),F(12,13)),(F(8,17),F(15,17))]:
        m=sp.Matrix([z,y,0]);K=g*I-h*n*n.T-k*m*m.T;R=K.inv();D=D0-h*k*z*z
        def eq(u,v):
            global checks
            assert u==v,(a,c,z,u,v);checks+=1
        eq(K.det(),g*D);eq(sp.trace(R),(g*(2*g-h-k)+D)/(g*D));eq((sp.trace(R)**2-sp.trace(R**2))/2,(3*g-h-k)/(g*D));eq(R.det(),1/(g*D))
        eq((n.T*R*n)[0],(g-k+k*z*z)/D);eq((m.T*R*m)[0],(g-h+h*z*z)/D)
        eq((n.T*R*m)[0],g*z/D);eq((n.T*R**2*n)[0],((g-k)**2+k*(2*g-k)*z*z)/D**2)
        eq((m.T*R**2*m)[0],((g-h)**2+h*(2*g-h)*z*z)/D**2)
        eq((n.T*R**2*m)[0],z*(g*g-h*k+h*k*z*z)/D**2)
    # For every exponent range considered, differentiate the transformed
    # primitive termwise. u=z/sqrt(D); D=D0/(1+hk*u²).
    for L in range(14):
        for r in range(4+L):
            # polynomial coefficients of u^(2r)*(1+hk*u²)^(3+L-r)
            n0=3+L-r
            co={2*r+2*t:comb(n0,t)*(h*k)**t for t in range(n0+1)}
            primitive={power+1:value/F(power+1) for power,value in co.items()}
            assert {power-1:value*power for power,value in primitive.items()}==co
            sub_checks+=1
# Direct Gaussian moment controls: 3 independent rows, 9 columns;
# covariance diag(R_i/2). A monomial in entries of G is a product of
# dot products. Expand by assigning its <=4 factors to columns, grouping
# assignments by set partitions to avoid a large polynomial in 27 vars.
# Each block corresponds to one column; independent 1D Gaussian moments.
@cache
def partitions(n):
    if n==0:return ((),)
    out=[]
    for p in partitions(n-1):
        out.append(p+((n-1,),))
        for j in range(len(p)):
            out.append(p[:j]+(p[j]+(n-1,),)+p[j+1:])
    return tuple(out)

def moment(edges,R):
    total=F(0)
    for p in partitions(len(edges)):
        z=F(factorial(9),factorial(9-len(p)))
        for block in p:
            counts=[0]*3
            for j in block:
                a,b=edges[j];counts[a]+=1;counts[b]+=1
            if any(k%2 for k in counts):z=0;break
            for k,r in zip(counts,R):
                z*=F(factorial(k),2**(k//2)*factorial(k//2))*(r/2)**(k//2)
        total+=z
    return total
# Independent polynomial expressions in the six entries of symmetric G.
vars=sp.symbols('a b c d e f');a,b,c,d,e,f=vars
G=sp.Matrix([[a,d,e],[d,b,f],[e,f,c]]);s=sp.trace(G);u=(s*s-sp.trace(G**2))/2;v=G.det();edges=[(0,0),(1,1),(2,2),(0,1),(0,2),(1,2)]
@cache
def polys(k,l,m,p,i):
    return sp.Poly(sp.expand(s**k*u**l*v**m*(1 if p==0 else G[i,i] if p==1 else (G**2)[i,i])),*vars).terms()
def direct(e,p,i,R):
    return sum(F(int(co))*moment(tuple(edge for edge,n in zip(edges,mon) for _ in range(n)),R) for mon,co in polys(*e,p,i))
# Archived scalar and diagonal Stein recurrences evaluated with rational R.
# Same equations, independently tested against the direct column moments.
def stein(R):
    @cache
    def E0(k,l,m):
        if (k,l,m)==(0,0,0):return F(1)
        if k:return sum(E1(k-1,l,m,i) for i in range(3))
        if l:return (E0(2,l-1,m)-sum(E2(0,l-1,m,i) for i in range(3)))/2
        return F(2*m+5,6)*sum(R[i]*(E2(0,0,m-1,i)-E1(1,0,m-1,i)+E0(0,1,m-1)) for i in range(3))
    @cache
    def E1(k,l,m,i):
        return R[i]/2*((9+2*m)*E0(k,l,m)+(2*k*E1(k-1,l,m,i) if k else 0)+(2*l*(E1(k+1,l-1,m,i)-E2(k,l-1,m,i)) if l else 0))
    @cache
    def E2(k,l,m,i):
        return R[i]/2*(E0(k+1,l,m)+(10+2*l+2*m)*E1(k,l,m,i)+(2*k*E2(k-1,l,m,i) if k else 0)-(2*l*E0(k,l-1,m+1) if l else 0))
    return E0,E1,E2
wick_checks=0;det_checks=0
for R in [(F(1),F(1),F(1)),(F(1,2),F(2,3),F(5,7)),(F(3),F(2),F(1,5))]:
    E=stein(R)
    for p in range(3):
        for e in product(range(5),range(3),range(2)):
            if e[0]+2*e[1]+3*e[2]+p>4:continue
            for i in (range(3) if p else [0]):
                expect=E[p](*e,i) if p else E[p](*e)
                actual=direct(e,p,i,R)
                assert expect==actual,(R,p,e,i,expect,actual);wick_checks+=1
    # Bartlett independent chi-square determinant moments (all through degree 12).
    for m in range(5):
        expect=(R[0]*R[1]*R[2]/8)**m
        for j in range(3):
            for k in range(m):expect*=9-j+2*k
        assert E[0](0,0,m)==expect;det_checks+=1
# Falsifying control on the E1 coefficient: 9 columns, not 8.
R=(F(1,2),F(2,3),F(5,7));wrong=4*R[0];true=direct((0,0,0),1,0,R);assert wrong!=true
result={'rational_orientation_matrix_factor_checks':checks,'substitution_primitive_coefficient_checks':sub_checks,'direct_column_Wick_checks_degree_le_4':wick_checks,'Bartlett_determinant_checks_degree_le_12':det_checks,'wrong_column_count_residual':str(true-wrong),'all_exact':True,'scope':'Independent mathematical controls of orientation and Stein formulas; not full 104-row matrix or physical integral recertification.'}
print(json.dumps(result,indent=2));Path(__file__).with_name('integral_results.json').write_text(json.dumps(result,indent=2)+'\n')
