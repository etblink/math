"""Cubic jets and all 16 source charge actions on Gaussian-polynomial states.
Run with same 3 arguments as charge_audit.py, then H3 or Phi and fixture name.
"""
from charge_audit import *

def phi_jet(x):
    z=a.Z(x);w=action(z,seed);z2=action(z,w);As=[a.opsum((1,a.M(x,d,c)),(-1,a.M(x,c,d))) for d,c in it.combinations(range(3),2)];Aw=[action(A,w) for A in As]
    s=int(np.sum(x*x));p=add((160*s,w),(-1,action(z,z2)),*[(-1,action(A,v)) for A,v in zip(As,Aw)])
    deriv=[]
    for c,i in it.product(range(3),range(9)):
        E=np.zeros((3,9),int);E[c,i]=1;dz=a.K[c,i];dw=action(dz,seed);dAs=[a.opsum((1,a.M(E,d,e)),(-1,a.M(E,e,d))) for d,e in it.combinations(range(3),2)]
        pieces=[(320*int(x[c,i]),w),(160*s,dw),(-1,action(dz,z2)),(-1,action(z,action(dz,w))),(-1,action(z,action(z,dw)))]
        for A,dA,v in zip(As,dAs,Aw):pieces.extend([(-1,action(dA,v)),(-1,action(A,action(dA,w))),(-1,action(A,action(A,dw)))])
        deriv.append(add(*pieces))
    return p,deriv,1

def plane(n,i,j):
    B=np.zeros((n,n),int);B[i,j]=1;B[j,i]=-1;return B
def taction(t,B):return sum(np.moveaxis(np.tensordot(B,t,axes=(1,k)),0,k) for k in range(3))
def symmul(G,X):return np.einsum('ab,ck->abck',G,X)+np.einsum('ac,bk->abck',G,X)+np.einsum('bc,ak->abck',G,X)
def B15(x):
    G=x@x.T;return 5*symmul(G,x)-symmul(np.eye(3,dtype=int),np.trace(G)*x+2*G@x)
def DB15(x,e):
    G=x@x.T;dG=e@x.T+x@e.T;return 5*(symmul(dG,x)+symmul(G,e))-symmul(np.eye(3,dtype=int),np.trace(dG)*x+np.trace(G)*e+2*dG@x+2*G@e)
def h_jet(x):
    q=np.load(T/'rank1_vector.npz');v0=(q['masks'],q['real'].astype(float)+1j*q['imag'].astype(float));den0=int(q['denominator']);assert den0==55
    u=np.zeros((3,3,3),int);u[0,0,0]=5
    for c in range(3):u[c,c,0]-=1;u[c,0,c]-=1;u[0,c,c]-=1
    basis=[u];vectors=[v0];idx=0
    mat=lambda bs:sp.Matrix(np.stack([b.ravel() for b in bs],axis=1).tolist())
    while len(basis)<7:
        for (c,d),g in a.G.items():
            b=2*taction(basis[idx],plane(3,c,d))
            if mat(basis+[b]).rank()>len(basis):
                basis.append(b);vectors.append(action(g,vectors[idx]))
                if len(basis)==7:break
        idx+=1
    M=mat(basis);rows=list(M.T.rref()[1]);inverse=M[rows,:].inv();cache={}
    def lift(B):
        terms=[]
        for j in range(9):
            if not np.any(B[:,:,:,j]):continue
            rhs=sp.Matrix(B[:,:,:,j].ravel().tolist())/3;sol=inverse*rhs[rows,:];assert M*sol==rhs
            for k,r in enumerate(sol):
                if not r:continue
                if (k,j) not in cache:cache[k,j]=vectors[k] if j==0 else add((-1,action(a.R[0,j],vectors[k])))
                terms.append((r/(1 if j==0 else 8),cache[k,j]))
        if not terms:return a.zero,1
        den=math.lcm(*[int(r.q) for r,v in terms]);h=add(*[(int(r*den),v) for r,v in terms]);return h,den*den0
    p,den=lift(B15(x));ds=[]
    for c,i in it.product(range(3),range(9)):
        E=np.zeros((3,9),int);E[c,i]=1;ds.append(lift(DB15(x,E)))
    common=math.lcm(den,*[d for v,d in ds]);return add((common//den,p)),[add((common//d,v)) for v,d in ds],common

def main():
    name,fixture=sys.argv[4:6];x=fixtures[fixture];t=time.monotonic();p,ds,den=(h_jet if name=='H3' else phi_jet)(x);scale=8 if name=='H3' else 2
    assert a.eq(add(*[(int(x[c,i]),v) for (c,i),v in zip(it.product(range(3),range(9)),ds)]),add((3,p)))
    if name=='H3':
        q=np.load(T/(fixture+'_orbit_vector.npz'));v0=(q['masks'],q['real'].astype(float)+1j*q['imag'].astype(float));assert a.eq(add((int(q['denominator']),p)),add((den,v0)))
    elif fixture=='rank1':assert a.norm2(p)==998638878720
    print(name,fixture,'jet ready',len(p[0]),den,time.monotonic()-t,flush=True)
    # Directional covariance check for each of the three color tangent generators.
    for (i,j),g in a.G.items():
        dx=plane(3,i,j)@x;d=add(*[(int(dx[c,k]),v) for (c,k),v in zip(it.product(range(3),range(9)),ds)]);assert a.eq(action(g,p),add((2,d)))
    # Spatial planes selected to include a nontrivial ninth-axis direction.
    for i,j in [(0,1),(0,8),(1,8)]:
        dx=-x@plane(9,i,j);d=add(*[(int(dx[c,k]),v) for (c,k),v in zip(it.product(range(3),range(9)),ds)]);assert a.eq(action(a.R[i,j],p),add((8,d)))
    # Cancel a common gcd across the jet to limit exact integer arithmetic size.
    g=den
    for v in [p]+ds:
        if len(v[0]):g=math.gcd(g,int(np.gcd.reduce(np.abs(v[1].real.astype(np.int64)))),int(np.gcd.reduce(np.abs(v[1].imag.astype(np.int64)))))
    if g>1:p=(p[0],p[1]/g);ds=[(v[0],v[1]/g) for v in ds];den//=g
    r=charges(x,p,ds,den,scale);r.update({'Euler_homogeneity_exact':True,'color_tangent_checks':3,'spatial_tangent_checks':3,'poly_norm2':a.norm2(p),'poly_support':len(p[0]),'derivative_support':[len(v[0]) for v in ds],'fixture':fixture,'covariant':name,'elapsed_seconds':time.monotonic()-t})
    if fixture=='rank1':assert all(z['B_norm2']==0 for z in r['per_charge'])
    (D/(name+'_'+fixture+'.json')).write_text(json.dumps(r,indent=2)+'\n');print(name,fixture,'charge mean',r['mean'],'spread',r['spread'],flush=True)
if __name__=='__main__':main()
