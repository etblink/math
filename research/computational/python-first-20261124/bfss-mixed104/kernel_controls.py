import numpy as np,ctypes as C,json,time,sys
from pathlib import Path
D=Path(__file__).resolve().parent;L=C.CDLL(str(D/'exact_kernels.so'));p=C.c_void_p;i=C.c_int;L.combine2.argtypes=[p,p,p,i,C.c_int64,p,p,p,i,C.c_int64,p,p,p];L.combine2.restype=i
rng=np.random.default_rng(12345);count=0
for n,m in [(0,0),(0,123),(123,0),(1000,1500),(10000,15000)]:
 for a,b in [(1,1),(1,-1),(-7,9),(0,3),(2,0)]:
  V=[];E={}
  for size,c in [(n,a),(m,b)]:
   masks=np.sort(rng.choice(65536,size,replace=False)).astype(np.int32);r=rng.integers(-10000,10001,size,dtype=np.int64);im=rng.integers(-10000,10001,size,dtype=np.int64);V.append((masks,r,im));
   for k,x,y in zip(masks,r,im):E[int(k)]=E.get(int(k),0)+c*complex(int(x),int(y))
  out=[np.empty(n+m,np.int32),np.empty(n+m,np.int64),np.empty(n+m,np.int64)];args=lambda x:[t.ctypes.data for t in x]+[len(x[0])];size=L.combine2(*args(V[0]),a,*args(V[1]),b,*[t.ctypes.data for t in out]);expected=sorted((k,int(v.real),int(v.imag)) for k,v in E.items() if v);assert list(zip(*(x[:size].tolist() for x in out)))==expected;count+=1
# Actual archived rank-three tensor vector and its deliberately shifted subset.
f=np.load(sys.argv[1]);u=tuple(f[k].astype(t) for k,t in [('masks',np.int32),('real',np.int64),('imag',np.int64)]);v=tuple(a[::2].copy() for a in u);N=len(u[0])+len(v[0]);out=[np.empty(N,np.int32),np.empty(N,np.int64),np.empty(N,np.int64)];args=lambda x:[t.ctypes.data for t in x]+[len(x[0])];t=time.monotonic();n=L.combine2(*args(u),7,*args(v),-7,*[a.ctypes.data for a in out]);elapsed=time.monotonic()-t;assert np.array_equal(out[0][:n],u[0][1::2]) and np.array_equal(out[1][:n],7*u[1][1::2]) and np.array_equal(out[2][:n],7*u[2][1::2]);report={'random_dictionary_tests':count,'archived_vector_support':len(u[0]),'exact_cancellation_output_support':n,'merge_seconds':elapsed};(D/'kernel_controls.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
