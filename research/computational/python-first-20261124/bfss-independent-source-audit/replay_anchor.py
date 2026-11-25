"""Retrospective translation of ordered H3 anchor algorithm.
Requires numpy; use scratch checkout with sibling source archives.
No prior archived projector/cyclic code is imported. Not yet locally executed.
"""
import hashlib, itertools as it, json, re
from pathlib import Path
import numpy as np
D=Path(__file__).resolve().parent.parent
ROOT=next(p for p in D.parents if (p/"lean").is_dir())
def pinned(path,sha):
    b=path.read_bytes()
    assert hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()==sha
    return path
s=np.load(pinned(D/"bfss-seed-transport/source_seed_integer.npz","91c57e1f3f1e856a51bbc11dbb5a01ee9099ecc0"))
h=np.load(pinned(D/"bfss-h3-tensor/rank1_vector.npz","fd48a584ad72683ab1aa4b974a8e3dfcc9fa15c7"))
src=pinned(ROOT/"lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMSYPythonGammaRows.lean","818ff344566c2f2552a30591d92fb7f718efe866").read_text()
def masks(name):
    return list(map(int,re.search(r"def "+name+r"[^\n]*\n\s*!\[([^\]]+)\]",src)[1].split(",")))
flip,sign=masks("pythonFlipMask"),masks("pythonSignMask")
def norm(v):return sum(a*a+b*b for a,b in v.values())
seed={int(m):(int(a),int(b)) for m,a,b in zip(s["masks"],s["real"],s["imag"])}
assert len(seed)==19136 and norm(seed)==8072064
def step(m,a,c):
    p=3*(a//2)+c
    return m^(1<<p),(2*(m&((1<<p)-1)).bit_count()+a%2+2*(a%2)*((m>>p)&1))%4
def rot(a,b,k):return ((a,b),(-b,a),(-a,-b),(b,-a))[k%4]
def add(out,m,a,b):
    r,i=out.get(m,(0,0));v=(r+a,i+b)
    if v==(0,0):out.pop(m,None)
    else:out[m]=v
def combine(items):
    out={}
    for c,v in items:
        for m,(a,b) in v.items():add(out,m,c*a,c*b)
    return out
def K(p,v):
    c,i=divmod(p,9);out={}
    for a in range(16):
        b=a^flip[i];sg=(-1)**((a&sign[i]).bit_count())
        for m,(r,j) in v.items():
            q,pb=step(m,b,(c+2)%3);t,pa=step(q,a,(c+1)%3)
            u,w=rot(sg*r,sg*j,1+pa+pb);add(out,t,u,w)
    return out
def delta(a,b):return int(a==b)
T={};nn=ss=0
for p,q,r in it.product(range(27),repeat=3):
    a,i=divmod(p,9);b,j=divmod(q,9);c,k=divmod(r,9)
    u=5*delta(a,0)*delta(b,0)*delta(c,0)-delta(a,b)*delta(c,0)-delta(a,c)*delta(b,0)-delta(b,c)*delta(a,0)
    d=delta(i,j)*delta(k,0)+delta(i,k)*delta(j,0)+delta(j,k)*delta(i,0)
    if u*d:T.setdefault(p,{}).setdefault(q,[]).append((u*d,r));nn+=1;ss+=(u*d)**2
assert (nn,ss)==(175,330)
first=[K(p,seed) for p in range(27)]
outer=[]
for p,group in T.items():
    middle=[(1,K(q,combine((c,first[r]) for c,r in terms))) for q,terms in group.items()]
    outer.append((1,K(p,combine(middle))))
actual=combine(outer);expected={int(m):(int(a),int(b)) for m,a,b in zip(h["masks"],h["real"],h["imag"])}
assert int(h["denominator"])==55 and actual==expected
control=K(0,K(0,first[0]));assert control
print(json.dumps({"support":len(actual),"norm2":str(norm(actual)),"denominator":55,"coefficient_mismatches":0,"negative_support":len(control),"negative_norm2":str(norm(control))},indent=2))
