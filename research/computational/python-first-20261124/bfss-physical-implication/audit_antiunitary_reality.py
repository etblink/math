"""Antiunitary reality diagnostic; standard library only.
--synthetic-only verifies finite controls without a checkout seed.
Default additionally checks the pinned seed and all 27 first K actions.
This is not a full fixture receipt replay or physical theorem.
"""
import argparse,itertools as it,json,sys
from pathlib import Path
FULL=(1<<24)-1
ODD=sum(1<<p for p in range(1,24,2))
def Cterm(m,a,b):
    s=(-1)**((m&ODD).bit_count())
    return m^FULL,s*a,-s*b
def C(V):
    return {n:(a,b) for m,(r,i) in V.items() for n,a,b in [Cterm(m,r,i)]}
def t(m,a,b,p,u):
    q=(u+2*((m&((1<<p)-1)).bit_count()+u*((m>>p)&1)))%4
    r,i=((a,b),(-b,a),(-a,-b),(b,-a))[q]
    return m^(1<<p),r,i
def scale(c,V):
    return {m:(c*a,c*b) for m,(a,b) in V.items()}
def synthetic():
    samples=[0,FULL,0xaaaaaa,0x555555]+[1<<j for j in range(24)]+[((1<<j)-1) for j in range(24)]
    for m in samples:
        assert Cterm(*Cterm(m,2,3))==(m,2,3)
        for p,u in it.product(range(24),range(2)):
            assert Cterm(*t(m,2,3,p,u))==t(*Cterm(m,2,3),p,u)
    return {'synthetic_C_squared_checks':len(samples),'synthetic_C_t_commutation_checks':48*len(samples)}
def main():
    p=argparse.ArgumentParser();p.add_argument('--synthetic-only',action='store_true');p.add_argument('--output',type=Path);args=p.parse_args()
    report=synthetic()
    if not args.synthetic_only:
        D=Path(__file__).resolve().parent.parent
        sys.path.insert(0,str(D/'bfss-seed-transport'))
        from independent_integer_recheck import read_seed,words_and_terms,scatter,gather,rotate
        seed=read_seed();cs=C(seed)
        eigen=1 if cs==seed else -1 if cs==scale(-1,seed) else None
        report['seed_C_eigenvalue']=eigen
        report['seed_support']=len(seed)
        report['seed_C_support']=len(cs)
        if eigen is None:
            report['seed_C_plus_mismatches']=sum(cs.get(m,(0,0))!=seed.get(m,(0,0)) for m in set(seed)|set(cs))
            report['seed_C_minus_mismatches']=sum(cs.get(m,(0,0))!=scale(-1,{m:seed[m]}).get(m,(0,0)) if m in seed else cs.get(m,(0,0))!=(0,0) for m in set(seed)|set(cs))
        else:
            words,flip,sign,_=words_and_terms()
            checks=[]
            for a,i in it.product(range(3),range(9)):
                T=[(s,(a+1)%3,s^flip[i],(a+2)%3,(-1)**((s&sign[i]).bit_count())) for s in range(16)]
                A,ta=scatter(seed,T);B,tb=gather(seed,T)
                assert A==B and ta==tb
                V={m:rotate(r,j,1) for m,(r,j) in A.items()}
                checks.append({'color':a,'axis':i,'support':len(V),'C_parity_pass':C(V)==scale(-eigen,V)})
            report['K_checks']=checks
    report['scope']='Finite diagnostic; analytic reality argument requires source equivariance and C eigenvector premise.'
    data=json.dumps(report,indent=2)+'\n';print(data,end='')
    if args.output:args.output.write_text(data)
    if not args.synthetic_only:
        assert report['seed_C_eigenvalue'] in (-1,1) and all(x['C_parity_pass'] for x in report['K_checks'])
if __name__=='__main__':main()
