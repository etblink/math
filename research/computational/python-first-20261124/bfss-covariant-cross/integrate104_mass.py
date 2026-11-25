"""Integrate all 104 mass/multiplication rows with reconstructed cross moments."""
import json,math,itertools as it,gzip,sys,time
from pathlib import Path
from fractions import Fraction as F
import numpy as np
D=Path(__file__).resolve().parent;MD=Path(sys.argv[1]).resolve();sys.path.insert(0,str(MD));sys.argv[1]=str(Path(sys.argv[2]).resolve()/'results.json');import integrate_mass as m
P=json.loads((D/'cross_polynomials.json').read_text());rows=json.loads((D/'rows104.json').read_text());N=len(rows);assert N==104
W=json.loads((MD/'trial-104.json').read_text());keys=set();O=(0,0,0);S=(1,0,0);U=(0,1,0);add=m.addex
blocks={'mass':(0,O),'Y':(1,O),'u':(0,U),'sY':(1,S),'su':(0,add(S,U))};A={b:[[F(0) for _ in rows] for _ in rows] for b in blocks};deg={'S':0,'Phi':3,'H3':3};order=['S','Phi','H3']
for i,j in it.combinations_with_replacement(range(N),2):
 r,t=rows[i],rows[j];p,q=r['power'],t['power'];e=add(r['exponents'],t['exponents']);iw,jw=r['width'],t['width'];k=','.join(sorted([r['seed'],t['seed']],key=order.index))
 for b,(shift,ex0) in blocks.items():
  if (deg[r['seed']]+deg[t['seed']]+p+q+shift)%2:continue
  z=F(0)
  for a in P[k][str(p+q+shift)]:
   g=add(add(e,ex0),a['exponents']);keys.add((g,iw,jw));z+=F(a['coefficient'])*m.exact(g,iw,jw)
  A[b][i][j]=A[b][j][i]=z
print('integrated',N,'rows',len(keys),'moments',flush=True)
base=json.loads(gzip.decompress((MD/'exact_matrices.json.gz').read_bytes()));oldrows=json.loads((MD/'rows56.json').read_text());ix=[next(i for i,r in enumerate(rows) if r['label']==s['label']) for s in oldrows];assert all(A[b][i][j]==F(base[b][k][l]) for b in A for k,i in enumerate(ix) for l,j in enumerate(ix))
err=0.
for e,i,j in sorted(keys):
 q=m.numerical(e,i,j,32);v=float(m.exact(e,i,j));err=max(err,abs(v-q)/max(abs(v),1e-100))
assert err<1e-10
print('prior all blocks exact, quadrature',err,flush=True)
(D/'matrices.json.gz').write_bytes(gzip.compress((json.dumps({k:[[str(x) for x in r] for r in v] for k,v in A.items()},separators=(',',':'))+'\n').encode(),mtime=0))
# Positive pivots via row/column rational congruence and fraction-free symmetric elimination.
def ldl_signs(M):
 d=[math.lcm(*(x.denominator for x in row)) for row in M];B=[[int(M[i][j]*d[i]*d[j]) for j in range(len(M))] for i in range(len(M))];p=1;signs=[]
 for k in range(len(B)):
  a=B[k][k];assert a>0,(k,a);signs.append(a.bit_length())
  for i in range(k+1,len(B)):
   for j in range(i,len(B)):
    b,r=divmod(a*B[i][j]-B[k][i]*B[k][j],p);assert r==0;B[i][j]=b
  p=a
 return signs
start=time.monotonic();piv=ldl_signs(A['mass']);print('positive pivots',len(piv),'seconds',time.monotonic()-start,flush=True)
M=np.array(A['mass'],float);d=np.sqrt(np.diag(M));C=M/np.outer(d,d);coeff=[F(W['reduced_basis_coefficients'][W['labels'].index(r['label'])]) for r in rows];q=lambda T:sum(coeff[i]*T[i][j]*coeff[j] for i in range(N) for j in range(N));norm=q(A['mass']);assert norm>0
# Schur complement distances via numerical normalized mass matrix, NOT spectral energy bounds.
report={'rows':N,'labels':[r['label'] for r in rows],'matrix_blocks':list(A),'unique_entries_per_block':N*(N+1)//2,'orientation_moment_count':len(keys),'exact_vs_quadrature_relative':err,'prior_56_all_five_blocks_exact':True,'mass_positive_pivots':len(piv),'mass_pivot_numerator_bit_lengths':piv,'mass_condition_diagonal_scaled':float(np.linalg.cond(C)),'trial_104_norm2':str(norm),'trial_104_norm2_decimal':float(norm),'multiplication_expectations':{b:float(q(T)/norm) for b,T in A.items() if b!='mass'},'scope':'Rational mass and multiplication blocks conditional on reconstructed finite covariant polynomials; no differential or physical energy claim.'}
(D/'integrated.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({k:v for k,v in report.items() if k not in ('labels','mass_pivot_numerator_bit_lengths','trial_104_norm2')},indent=2))
