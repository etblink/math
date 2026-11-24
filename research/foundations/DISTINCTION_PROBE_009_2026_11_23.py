"""Two-rebit resource requirements and noisy process discrimination."""
import sympy as s
from scipy.stats import binom
I=s.eye(2); X=s.Matrix([[0,1],[1,0]]); Z=s.diag(1,-1)
J=s.Matrix([[0,-1],[1,0]]); K=s.kronecker_product
W=-K(J,J); E=(s.eye(4)+W)/2

def channel(M,t):
    t=s.sympify(t)
    mats=[K(U,I) for U in (I,J,X,Z)]
    weights=[(1+t)/4,(1+t)/4,(1-t)/4,(1-t)/4]
    return s.simplify(sum((a*U*M*U.T for a,U in zip(weights,mats)),s.zeros(4)))

def ptrace_A(M):
    return M[:2,:2]+M[2:,2:]

a=s.symbols('a:10',real=True)
M=s.zeros(4); k=0
for i in range(4):
    for j in range(i,4):
        M[i,j]=M[j,i]=a[k]; k+=1
t,u,eta=s.symbols('t u eta',real=True)
w=s.trace(M*W)
out=channel(M,t)
assert s.simplify(out-K(I/2,ptrace_A(M))-t*w*W/4)==s.zeros(4)
assert s.simplify(channel(M,t)-channel(M,u)-(t-u)*w*W/4)==s.zeros(4)
assert W.eigenvals()=={-1:2,1:2}
noisyE=(s.eye(4)+eta*W)/2
assert s.simplify(s.trace(noisyE*out)-(s.trace(M)+eta*t*w)/2)==0
for A in (I,X,Z):
    for B in (I,X,Z):
        assert s.trace(K(A,B)*W)==0
# arbitrary unnormalized symmetric real product states
A=s.Matrix([[a[0],a[1]],[a[1],a[2]]]); B=s.Matrix([[a[3],a[4]],[a[4],a[5]]])
assert s.trace(K(A,B)*W)==0
# Nonzero resource in real theory, separable in complex theory.
Y=s.I*J; plus=(I+Y)/2; minus=(I-Y)/2
for sign in (1,-1):
    rho=(s.eye(4)+sign*W)/4
    mixture=(K(plus,plus)+K(minus,minus))/2 if sign==1 else (K(plus,minus)+K(minus,plus))/2
    assert rho==mixture and rho.eigenvals()=={0:2,s.Rational(1,2):2}
    assert s.trace(rho*W)==sign
    assert channel(rho,1)-channel(rho,-1)==sign*W/2
# White-noise family: any nonzero visibility supplies real concurrence.
v=s.symbols('v',real=True)
rho=(s.eye(4)+v*W)/4
assert s.trace(rho*W)==v
assert s.trace(noisyE*channel(rho,t))==(1+eta*t*v)/2
print('Symbolic identities: PASS (arbitrary real symmetric input)')
print('complex-separable witnesses: PASS')
print('contrast, single-shot success, odd shots for >=95%, achieved success')
for d in (1,.5,.25,.1,.05,0):
    p=(1+d)/2
    if d==0:
        print(d,p,'impossible',.5); continue
    def success(n): return binom.sf(n//2,n,p)
    n=1
    while success(n)<.95: n+=2
    assert n==1 or success(n-2)<.95
    print(d,p,n,round(float(success(n)),8))
