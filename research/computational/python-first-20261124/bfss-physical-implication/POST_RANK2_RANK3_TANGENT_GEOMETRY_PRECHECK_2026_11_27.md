# Rank-three fixture — tangent geometry precheck

2026-11-27 Pacific. Scope: exact finite coordinate geometry, not a source occupation-contraction replay or Lean qualification. Prior rank-two completion and CSQ-F2 R1 qualification unchanged. Donors: [rank-two completion](POST_CSQF2_RANK2_DERIVATIVE_FIXTURE_COMPLETE_2026_11_27.md), [source implication](README.md). No physical promotion.

## Coordinate convention and proof
Use rectangular X = [diag(d) | 0], d=(1,2,3), and action X -> O X R^T. At each pair a<b, choose skew C_ab and L_ab having +1 at (a,b), -1 at (b,a), in the respective color and spatial spaces. Then
C_ab X = d_b E_ab - d_a E_ba,
-X L_ab = -d_a E_ab + d_b E_ba.
With Delta=d_b^2-d_a^2, obtain
Delta E_ab = d_b C_ab X + d_a (-X L_ab),
Delta E_ba = d_a C_ab X + d_b (-X L_ab).
The three denominators are 3, 8, 5. For j>=3 (zero-based), -X L_aj=-d_a E_aj. All 24 off-diagonal coordinates are orbit tangent, with three diagonal directions complementary. Equivariant polynomial F therefore satisfies the corresponding derivative formulas with the infinitesimal Fock generators in place of coordinate tangents; signs must be matched to the actual generator engine independently. No division by zero here. This geometry does not itself verify generator implementation or equivariance.

The stabilizer contains SO(6) rotating the six null columns, leaving each color index fixed. Distinct nonzero singular values forbid permutations of the three active axes in the stabilizer. For coordinatewise scalar contractions tau and beta whose operator/vector components transform covariantly, null-column directions are equivalent within each color row. Use twelve coordinate representatives (a,i) for a=0,1,2 and i=0,1,2,3. Multiplicities [1,1,1,6,1,1,1,6,1,1,1,6] sum to 27; this is not the rank-two multiplicity of seven. Check this axis convention against the literal original gamma and B2 source before using the reduction. Nu diagonal requires all three active diagonal derivatives; none is automatically zero. Conditional on matching the rank-two receipt schema (tau,beta per coordinate and nu per active diagonal), expected rank-three count is 27 representative raw slots per ordered pair, 3888 for 144 pairs. These are planned slots, not completed.

## Exact executed precheck
The following dependency-free JS reproduces the coordinate identity checks and the exact Bareiss determinant on the 27 columns (six active orbit columns, eighteen null orbit columns, three diagonal complement columns).
```js
const d=[1,2,3], cols=[], errors=[];
const E=(a,i)=>Array.from({length:27},(_,k)=>Number(k===9*a+i));
const sc=(x,k)=>x.map(v=>v*k), ad=(x,y)=>x.map((v,i)=>v+y[i]);
const eq=(x,y)=>x.every((v,i)=>v===y[i]);
let checks=0;
for(let a=0;a<3;a++) for(let b=a+1;b<3;b++){
  const C=ad(sc(E(a,b),d[b]),sc(E(b,a),-d[a]));
  const L=ad(sc(E(a,b),-d[a]),sc(E(b,a),d[b]));
  cols.push(C,L);
  const D=d[b]**2-d[a]**2;
  for(const [x,y] of [[ad(sc(C,d[b]),sc(L,d[a])),sc(E(a,b),D)],
                       [ad(sc(C,d[a]),sc(L,d[b])),sc(E(b,a),D)]]){
    checks++; if(!eq(x,y)) errors.push([a,b]);
  }
}
for(let a=0;a<3;a++) for(let j=3;j<9;j++){
  const L=sc(E(a,j),-d[a]); cols.push(L); checks++;
  if(!eq(sc(L,-1),sc(E(a,j),d[a]))) errors.push([a,j]);
}
for(let a=0;a<3;a++) cols.push(E(a,a));
const m=Array.from({length:27},(_,i)=>cols.map(c=>BigInt(c[i])));
let prev=1n,sign=1n;
for(let k=0;k<26;k++){
  let p=k; while(p<27&&m[p][k]===0n)p++;
  if(p===27)throw Error("singular");
  if(p!==k){[m[p],m[k]]=[m[k],m[p]];sign=-sign;}
  const pivot=m[k][k];
  for(let i=k+1;i<27;i++){
    for(let j=k+1;j<27;j++){
      const n=m[i][j]*pivot-m[i][k]*m[k][j];
      if(n%prev!==0n)throw Error("nonexact");
      m[i][j]=n/prev;
    }
    m[i][k]=0n;
  }
  prev=pivot;
}
const g=d.map(x=>x*x), s=g.reduce((a,b)=>a+b);
const J=[d.map(x=>2*x),d.map((x,i)=>2*x*(s-g[i])),
         d.map((x,i)=>2*x*g.filter((_,j)=>i!==j).reduce((a,b)=>a*b,1))];
const [a,b,c]=J;
const jdet=a[0]*(b[1]*c[2]-b[2]*c[1])-a[1]*(b[0]*c[2]-b[2]*c[0])+a[2]*(b[0]*c[1]-b[1]*c[0]);
console.log({checks,errors,det:String(sign*m[26][26]),J,jdet});
```
Executed equivalent algorithm in isolated JS: 24/24 identities; errors []; exact determinant -5598720; invariant Jacobian [[2,4,6],[26,40,30],[72,36,24]], determinant -5760. Invariants (s,u,v)=(14,49,36). Tangent rank 24 and full rank 27. This independently verifies the coordinate algebra only. The Jacobian is not a generic polynomial interpolation design.

## Next raw-replay plan
1. Pin literal rank-three tensor anchor, frozen seed, direct derivative engine, tangent generator engine, historical target and input hashes. Check normalizations and axis mapping before acceptance.
2. Start pure-S six-core square; direct diagonal coordinates 00,11,22; direct active transverse 01,02,12 and null transverse 03,13,23 for independent holdout against tangent expressions. Compare both active orientations where feasible, retain exact division/remainder evidence and avoid using the same engine as both witnesses. Direct null-column orbit holdout at a second null column checks multiplicity.
3. Derive only independently justified remaining coordinates and keep direct and derived receipts distinct. Compare tau,beta,nu in both ordered pair orientations; use contracted Euler against independently computed rank-three mass, with all three d_i nonzero. Then mixed Phi/H3 and high-degree blocks. Stop on any mismatch; preserve negative data.
4. Proceed to generic design, literal weighted integration and remaining Spin(9)/trial/Hardy analytical premises. Do not treat fixture agreement as polynomial identity or physical existence.

Status: coordinate precheck SURVIVED_FINITE_TESTS; rank-three derivative raw replay NOT STARTED in this receipt. No source, Lean, historical evidence, or roadmap status change.
