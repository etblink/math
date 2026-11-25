"""Exact independent abstract Clifford covariance and Lie bracket audit.
No occupation-state expansion, floating arithmetic, or external packages.
The imaginary Yukawa scalar is stripped; commutators are linear in it.
"""
from itertools import combinations, product
from functools import cache
import json
from pathlib import Path

WORDS = 'JIIJ JIJX JXJZ JZJZ JJIZ JJXX JJZX XIII ZIII'.split()
GAMMA = [[(i ^ sum(1 << (3-k) for k,c in enumerate(w) if c in 'JX'),
           (-1)**sum((i >> (3-k)) & 1 for k,c in enumerate(w) if c in 'JZ'))
          for i in range(16)] for w in WORDS]

def add(out, key, value):
    if value:
        n = out.get(key, 0) + value
        if n: out[key] = n
        else: out.pop(key, None)

def accum(out, src, c=1):
    for k,v in src.items(): add(out,k,c*v)

def t(i,a): return 1 << (3*i+a)

@cache
def sign(a,b):
    s=1
    while a:
        l=a & -a
        if (b & (l-1)).bit_count() % 2: s=-s
        a ^= l
    return s

def term(out,a,b,w): add(out,a^b,w*sign(a,b))

def comm(A,B):
    out={}
    for a,u in A.items():
        for b,v in B.items():
            term(out,a,b,u*v)
            term(out,b,a,-u*v)
    return out

CP=list(combinations(range(3),2)); SP=list(combinations(range(9),2))
C={}; R={}; L={}
for a,b in CP:
    z={}
    for i in range(16): term(z,t(i,a),t(i,b),1)
    C[a,b]=z
for r,s in SP:
    z={}
    for i in range(16):
        j,u=GAMMA[r][i]; k,v=GAMMA[s][j]
        for a in range(3): term(z,t(i,a),t(k,a),u*v)
    R[r,s]=z
for a,i in product(range(3),range(9)):
    z={}
    for j,(k,w) in enumerate(GAMMA[i]):
        term(z,t(j,(a+1)%3),t(k,(a+2)%3),w)
    L[a,i]=z

def expect(actual,expected,label):
    if actual!=expected:
        z=dict(actual);accum(z,expected,-1)
        raise AssertionError((label,len(z),list(z.items())[:5]))

for (a,b),g in C.items():
    for c,i in L:
        z={}
        if c==b: accum(z,L[a,i],2)
        if c==a: accum(z,L[b,i],-2)
        expect(comm(g,L[c,i]),z,('color Y',a,b,c,i))
for (r,s),g in R.items():
    for a,i in L:
        z={}
        if i==s: accum(z,L[a,r],8)
        if i==r: accum(z,L[a,s],-8)
        expect(comm(g,L[a,i]),z,('spin Y',r,s,a,i))
for g,h in product(C.values(),R.values()): expect(comm(g,h),{},'mixed bracket')

def plane(out,table,a,b,scale):
    if a<b: accum(out,table[a,b],scale)
    if b<a: accum(out,table[b,a],-scale)

def bracket(table,factor):
    n=0
    for (a,b),(c,d) in product(table,repeat=2):
        z={}
        if b==c: plane(z,table,a,d,factor)
        if a==c: plane(z,table,b,d,-factor)
        if b==d: plane(z,table,a,c,-factor)
        if a==d: plane(z,table,b,c,factor)
        expect(comm(table[a,b],table[c,d]),z,('Lie bracket',a,b,c,d))
        n+=1
    return n

cb=bracket(C,2); rb=bracket(R,8)
# Symbolic H3 compressed tensor B15, on all 27 independent coordinates.
# Each polynomial is a dict of sorted coordinate-index triples to integers.
def X(a,i): return 9*a+i

def sym_GX(a,b,c,i):
    z={}
    for a,b,c in ((a,b,c),(a,c,b),(b,c,a)):
        for j in range(9): add(z,tuple(sorted((X(a,j),X(b,j),X(c,i)))),1)
    return z

def trG_X_plus_2GX(a,i):
    z={}
    for b,j in product(range(3),range(9)):
        add(z,tuple(sorted((X(b,j),X(b,j),X(a,i)))),1)
        add(z,tuple(sorted((X(a,j),X(b,j),X(b,i)))),2)
    return z

T={}
for a,b,c,i in product(range(3),range(3),range(3),range(9)):
    z={};accum(z,sym_GX(a,b,c,i),5)
    for p,q,r in ((a,b,c),(a,c,b),(b,c,a)):
        if p==q: accum(z,trG_X_plus_2GX(r,i),-1)
    T[a,b,c,i]=z
for a,i in product(range(3),range(9)):
    z={}
    for b in range(3): accum(z,T[b,b,a,i])
    expect(z,{},('color trace',a,i))

def replace_axis(a,p,q):
    if a==p: return q,1
    if a==q: return p,-1
    return a,0

def deriv(poly,p,q,color):
    z={}
    for mon,w in poly.items():
        for k,j in enumerate(mon):
            a,i=divmod(j,9)
            b,s=replace_axis(a if color else i,p,q)
            if s: add(z,tuple(sorted(mon[:k]+(X(b,i) if color else X(a,b),)+mon[k+1:])),s*w)
    return z

def tensor_tangent(key,p,q,color):
    z={}
    for k in (range(3) if color else (3,)):
        b,s=replace_axis(key[k],p,q)
        if s: accum(z,T[key[:k]+(b,)+key[k+1:]],s)
    return z

for color,planes in ((True,CP),(False,SP)):
    for p,q in planes:
        for k,z in T.items(): expect(deriv(z,p,q,color),tensor_tangent(k,p,q,color),('tensor tangent',color,p,q,k))
# Wrong sign, omission of trace, wrong projector normalization are separate controls.
bad=comm(C[0,1],L[1,0]);accum(bad,L[0,0],2)
trace={}
for b in range(3): accum(trace,sym_GX(b,b,0,0),5)
assert bad and trace
result={'color_yukawa':len(C)*len(L),'spin_yukawa':len(R)*len(L),
        'mixed_brackets':len(C)*len(R),'color_lie_brackets':cb,'spin_lie_brackets':rb,
        'H3_color_trace':27,'H3_tangent_polynomial_checks':len(T)*(len(C)+len(R)),
        'H3_tensor_components':len(T),'wrong_color_sign_residual_terms':len(bad),
        'omitted_trace_residual_terms':len(trace),'all_exact':True,
        'scope':'Abstract Clifford and polynomial identities; not a Lean or physical-domain certificate'}
print(json.dumps(result,indent=2));Path(__file__).with_name('results.json').write_text(json.dumps(result,indent=2)+'\n')
