"""Exact Gram formula and first derivative for the H3 trace tensor.
Usage: python gram_derivative.py COVARIANT_DIRECTORY
"""
import itertools as it,json,sys
from pathlib import Path
import numpy as np
from tensor_projection import tensor
D=Path(__file__).resolve().parent
I=np.eye(3,dtype=np.int64)
def symmul(G,X):
    return np.einsum('ab,ck->abck',G,X)+np.einsum('ac,bk->abck',G,X)+np.einsum('bc,ak->abck',G,X)
def B15(X):
    G=X@X.T;return 5*symmul(G,X)-symmul(I,np.trace(G)*X+2*G@X)
def DB15(X,E):
    G=X@X.T;dG=E@X.T+X@E.T
    return 5*(symmul(dG,X)+symmul(G,E))-symmul(I,np.trace(dG)*X+np.trace(G)*E+2*dG@X+2*G@E)
fixtures=[np.pad(np.diag(d),((0,0),(0,6))) for d in [[1,0,0],[1,2,0],[1,2,3]]]
fixtures.append(np.array([[1,0,1,0,0,0,0,0,1],[0,1,0,0,0,0,0,0,0],[1,0,0,0,0,0,1,0,0]],np.int64))
checks=0;wrong=[]
for X in fixtures:
    H,_=tensor(X);B=B15(X)
    assert np.array_equal(np.einsum('abciik->abck',H),22*B)
    assert np.count_nonzero(np.einsum('aack->ck',B))==0
    assert np.array_equal(DB15(X,X),3*B)
    for a,i in it.product(range(3),range(9)):
        E=np.zeros((3,9),np.int64);E[a,i]=1
        # A fourth-order centered stencil is exact on cubic polynomials.
        stencil=8*(B15(X+E)-B15(X-E))-(B15(X+2*E)-B15(X-2*E))
        deriv=DB15(X,E);assert np.array_equal(stencil,12*deriv)
        assert np.count_nonzero(np.einsum('aack->ck',deriv))==0
        G=X@X.T;wrong.append(int(np.count_nonzero(stencil-12*(5*symmul(G,E)-symmul(I,np.trace(G)*E+2*G@E)))))
        checks+=1
assert max(wrong)>0
result={'fixtures':len(fixtures),'gram_trace_tensor_exact':True,'coordinate_derivative_exact_checks':checks,'Euler_cubic_exact':True,'traceless_derivative_exact':True,'omitted_Gram_derivative_max_nonzero':max(wrong),'scope':'Exact tensor polynomial and first derivatives, not differential supercharge or weighted-domain qualification.'}
print(json.dumps(result,indent=2));(D/'gram_derivative_results.json').write_text(json.dumps(result,indent=2)+'\n')
