#!/usr/bin/env python3
"""Independent P9A0 source-exact integer gamma/Lie consumer; standard library only.

The imported Lean proofs are the native source of qualification. This script
independently parses the ORIGINAL gamma matrix perm/sign tables and checks the
selected Hopf R4, full-spinor inequivalence, and transverse-component residual.
It is NOT a Lean proof of those finite identities and says nothing about the
BFSS physical Fock Hamiltonian, charge domain, or new particle.
"""
import json
import re
import subprocess
from pathlib import Path

ROOT=Path(__file__).resolve().parents[3]
SOURCE=ROOT/'lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean'
FIXTURE=ROOT/'research/topology/data/BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json'
SOURCE_SHA='b9b8192055c70f0d001d7982669b9823c55562ed'
S=(0,1,8,9)
PAIRS=((1,3,1),(2,5,-1),(4,6,-1))

def original_tables():
    git_sha=subprocess.check_output(['git','hash-object','--no-filters',str(SOURCE)],text=True).strip()
    assert git_sha==SOURCE_SHA,(git_sha,SOURCE_SHA)
    s=SOURCE.read_text()
    tables={}
    for name,nxt in (('perm','sign'),('sign','gammaInt')):
        a=s.index('private def '+name)
        b=s.index('private def '+nxt,a)
        t=s[a:b]
        rows=[(int(m.group(1)),[int(x.strip()) for x in m.group(2).split(',') if x.strip()])
              for m in re.finditer(r'\|\s+(\d+)\s+=>\s+!\[([\s\S]*?)\]',t)]
        assert [n for n,_ in rows]==list(range(9))
        assert all(len(row)==16 for _,row in rows)
        tables[name]=[row for _,row in rows]
    fixture=json.loads(FIXTURE.read_text())
    assert fixture.get('source_git_blob_sha')==SOURCE_SHA
    assert tables['perm']==fixture['perm'] and tables['sign']==fixture['sign']
    return tables

def matmul(A,B):
    return [[sum(A[i][k]*B[k][j] for k in range(16)) for j in range(16)] for i in range(16)]

def tmat(A):return [list(row) for row in zip(*A)]
def add(A,B):return [[A[i][j]+B[i][j] for j in range(16)] for i in range(16)]
def scale(A,c):return [[c*x for x in row] for row in A]
def dot(A,B):return sum(A[i][j]*B[i][j] for i in range(16) for j in range(16))

def matrices(d):
    G=[]
    for k in range(9):
        a=[[0]*16 for _ in range(16)]
        for i in range(16):
            j=d['perm'][k][i]
            sig=d['sign'][k][i]
            assert 0<=j<16 and sig in (-1,1)
            a[i][j]=sig
        G.append(a)
    I=[[int(i==j) for j in range(16)] for i in range(16)]
    Z=[[0]*16 for _ in range(16)]
    for a in range(9):
        assert G[a]==tmat(G[a])
        for b in range(9):
            assert add(matmul(G[a],G[b]),matmul(G[b],G[a]))==scale(I,2) if a==b else add(matmul(G[a],G[b]),matmul(G[b],G[a]))==Z
    return G,I,Z

def run():
    tab=original_tables()
    G,I,Z=matrices(tab)
    Ks=[scale(matmul(G[i],G[j]),sign) for i,j,sign in PAIRS]
    R4=[[-int(i==0 and j==1 or i==8 and j==9)+int(i==1 and j==0 or i==9 and j==8)
          for j in range(16)] for i in range(16)]
    tests=0
    for K in Ks:
        assert matmul(K,K)==scale(I,-1)
        assert tmat(K)==scale(K,-1)
        for i in S:
            for j in range(16):assert K[i][j]==R4[i][j]
        for i in range(16):
            for j in S:assert K[i][j]==R4[i][j]
        tests+=2*len(S)*16
    witness=[]
    for a,b in ((0,1),(0,2),(1,2)):
        W=[(i,j,Ks[a][i][j],Ks[b][i][j]) for i in range(16) for j in range(16) if Ks[a][i][j]!=Ks[b][i][j]]
        assert W and all(i not in S or j not in S for i,j,_,_ in W)
        witness.append({'pair':[a,b],'witness':list(W[0])})
    bivectors=[matmul(G[i],G[j]) for i in range(9) for j in range(i+1,9)]
    assert len(bivectors)==36
    assert all(dot(B,C)==(16 if a==b else 0) for a,B in enumerate(bivectors) for b,C in enumerate(bivectors))
    projections=[dot(B,R4) for B in bivectors]
    assert sorted([p for p in projections if p])==[-4,-4,4]
    norm_J=dot(R4,R4)
    norm_project=sum(p*p for p in projections)//16
    assert (norm_J,norm_project,norm_J-norm_project)==(4,3,1)
    result={'status':'INDEPENDENT_SOURCE_EXACT_INTEGER_FINITE_CONSUMER_PASS',
      'original_Lean_source_blob':SOURCE_SHA,
      'source_fixture_equal_to_original_tables':True,
      'full_clifford_matrix_pairs_checked':81,
      'source_original_3_pairs':[list(x) for x in PAIRS],
      'three_pairs_square_neg_one_and_skew':True,
      'selected_R4_equal_actions':True,
      'subcarrier_entry_checks':tests,
      'transverse_difference_witnesses':witness,
      'full_36_bivector_trace_Gram_orthogonal':True,
      'selected_only_U1_J_norm2':norm_J,
      'spin9_source_Lie_projection_norm2':norm_project,
      'nonzero_residual_norm2':norm_J-norm_project,
      'no_Fock_vector_Spin9_implementer_or_physical_conservation_claim':True,
      'native_Lean_proof_status':'RUN_CI_SEPARATELY'}
    print(json.dumps(result,sort_keys=True,indent=2))
    return result

if __name__=='__main__':run()
