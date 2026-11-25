"""Exhaustive integer basis audit of the two coordinate-space projectors."""
import itertools as it,json
from pathlib import Path
import numpy as np
D=Path(__file__).resolve().parent

def trace_insert(T):
    tr=np.einsum('aacv->cv',T);I=np.eye(T.shape[0],dtype=np.int64)
    return np.einsum('ab,cv->abcv',I,tr)+np.einsum('ac,bv->abcv',I,tr)+np.einsum('bc,av->abcv',I,tr)
def sym(T):return sum(T.transpose((*p,3)) for p in it.permutations(range(3)))
def rot(T,i,j):
    out=np.zeros_like(T)
    for axis in range(3):
        a=np.moveaxis(T,axis,0);b=np.moveaxis(out,axis,0);b[i]+=a[j];b[j]-=a[i]
    return out
def cas(T):
    out=np.zeros_like(T)
    for i,j in it.combinations(range(T.shape[0]),2):out-=rot(rot(T,i,j),i,j)
    return out
# all color triple tensors, not only symmetric ones
T=np.eye(27,dtype=np.int64).reshape(3,3,3,27);U=sym(T);P=5*U-trace_insert(U)
Q=cas(T);Q=cas(Q)-2*Q;Q=cas(Q)-6*Q
assert np.array_equal(30*Q,720*P)
assert np.array_equal(cas(P),12*P)
assert np.array_equal(P.reshape(27,27)@P.reshape(27,27),30*P.reshape(27,27))
assert np.trace(P.reshape(27,27))==30*7
# all symmetric spatial cubic tensors, dimension choose(11,3)=165
b=list(it.combinations_with_replacement(range(9),3));S=np.zeros((9,9,9,len(b)),np.int64)
for k,v in enumerate(b):
    for x in set(it.permutations(v)):S[(*x,k)]=1
V=trace_insert(S);assert np.array_equal(11*(30*S-cas(S)),22*V)
assert np.array_equal(cas(V),8*V)
assert np.array_equal(trace_insert(V),11*V)
assert np.array_equal(trace_insert(S-V),-10*V) # scale check, not a projector test by itself
# omitted trace subtraction and wrong trace denominator are discriminating controls
bad_color=int(np.count_nonzero(cas(5*U)-12*5*U));bad_space=int(np.count_nonzero(10*(30*S-cas(S))-22*V))
assert bad_color and bad_space
report={'color_basis_count':27,'spatial_symmetric_basis_count':len(b),'color_projector_rank_exact_trace':7,'spatial_trace_image_dimension':9,'joint_target_dimension':63,'all_basis_identities_exact':True,'omitted_color_trace_nonzero':bad_color,'wrong_spatial_denominator_nonzero':bad_space,'scope':'Integer matrix identities on full color cubic tensor space and full symmetric spatial cubic tensor space; not typed original physical carrier.'}
print(json.dumps(report,indent=2));(D/'projector_basis_results.json').write_text(json.dumps(report,indent=2)+'\n')
