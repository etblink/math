#!/usr/bin/env python3
"""Independent exact 16x16 ⊗ 3x3 trace factor expansion of BFSS Berry atom.
Each term in every C[dC_i,dC_j] contraction is tested *separately*.
No numerical floating point is used; global reasoning is in the report.
"""
import json
from pathlib import Path
import numpy as np
from d1p_berry_curvature_exact import G,K,E

EYE=np.eye(3,dtype=np.int64)

def tensor_terms(u,n):
    gm=np.einsum('i,ijk->jk',u,G,optimize=True)
    j=np.einsum('a,abc->bc',n,E,optimize=True)
    p=np.outer(n,n)
    c=[('GammaJ',gm,j),('KProj',K,p)]
    ds=[]
    for i in range(9):ds.append([('duGammaJ',G[i],j)])
    for a in range(3):
        e=EYE[a]
        ds.append([('dnGammaJ',gm,E[a]),('dnKProj',K,np.outer(e,n)+np.outer(n,e))])
    return c,ds

def tr_comm(t,a,b):
    _,cs,cc=t;_,as_,ac=a;_,bs,bc=b
    return int(np.trace(cs@as_@bs)*np.trace(cc@ac@bc) - np.trace(cs@bs@as_)*np.trace(cc@bc@ac))

def run():
    rng=np.random.default_rng(19023)
    cases=[]
    for z in range(9):
        u=rng.integers(-3,4,size=9);n=rng.integers(-3,4,size=3)
        c,d=tensor_terms(u,n)
        maxima={};count={};bad=[]
        for i in range(12):
            for k in range(i+1,12):
                cat='uu' if k<9 else 'nn' if i>=9 else 'un'
                for C in c:
                    for a in d[i]:
                        for b in d[k]:
                            val=tr_comm(C,a,b)
                            key=cat+'/'+C[0]+'/'+a[0]+'/'+b[0]
                            count[key]=count.get(key,0)+1
                            maxima[key]=max(abs(val),maxima.get(key,0))
                            if val:bad.append({'pair':(i,k),'atom':key,'val':val})
        if bad:raise ValueError({'case':z,'failed_atomic_terms':bad[:10]})
        cases.append({'case':z,'u':u.tolist(),'n':n.tolist(),'atom_types':count,'maximum_nonzero_atom':max(maxima.values())})
    return {'status':'PASS: every individual source-tensor trace atom zero without cancellation between types',
            'cases':len(cases),'total_individually_zero_trace_atoms':sum(sum(c['atom_types'].values()) for c in cases),
            'atom_type_labels':sorted(cases[0]['atom_types']),'cases_detail':cases,
            'qualification':'Exact integer trace-factor check, supporting analytic all-real trace proof. Not source-typed Lean.'}

if __name__=='__main__':
    r=run();Path(__file__).with_name('d1p_berry_tensor_atoms_results.json').write_text(json.dumps(r,indent=2)+'\n')
    print(r['status'],r['total_individually_zero_trace_atoms'])
