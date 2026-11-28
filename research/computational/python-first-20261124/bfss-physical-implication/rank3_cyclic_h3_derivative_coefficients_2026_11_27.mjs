// Exact coefficient differentiation in the archived 7 x 9 cyclic H3 basis.
// Returns integer coordinate numerators over a common denominator 720.
export function cyclicCoefficients(diag,coord=null){
 const assert=(x,m)=>{if(!x)throw Error(JSON.stringify(m))};
 const idx=(a,b,c)=>9*a+3*b+c, triples=Array.from({length:27},(_,i)=>[Math.floor(i/9),Math.floor(i/3)%3,i%3]);
 const ds=(a,b)=>+(a===b);
 const seed=triples.map(([a,b,c])=>5*+(a===0&&b===0&&c===0)-ds(a,b)*ds(c,0)-ds(a,c)*ds(b,0)-ds(b,c)*ds(a,0));
 function rotate(v,a,b){return triples.map(t=>2*t.reduce((sum,k,j)=>{let u=t.slice();if(k===a){u[j]=b;return sum+v[idx(...u)]}if(k===b){u[j]=a;return sum-v[idx(...u)]}return sum},0))}
 const basis=[seed,rotate(seed,0,1),rotate(seed,0,2)];basis.push(rotate(basis[1],0,1),rotate(basis[1],0,2));basis.push(rotate(basis[3],0,1),rotate(basis[3],0,2));
 const rows=[0,1,2,4,5,13,14], inv=[[264,0,0,288,0,0,0],[0,-132,0,0,0,-136,0],[0,0,-44,0,0,0,-56],[6,0,0,12,0,0,0],[0,0,0,0,12,0,0],[0,-3,0,0,0,-4,0],[0,0,-1,0,0,0,-4]];
 for(let i=0;i<7;i++)for(let j=0;j<7;j++)assert(inv[i].reduce((s,v,k)=>s+v*basis[j][rows[k]],0)===240*ds(i,j),"inverse");
 const X=Array.from({length:3},(_,a)=>Array.from({length:9},(_,i)=>a===i?diag[a]:0)),E=Array.from({length:3},(_,a)=>Array.from({length:9},(_,i)=>+(coord!==null&&a===coord[0]&&i===coord[1])));
 const G=X.map((r,a)=>X.map((q,b)=>r.reduce((s,v,i)=>s+v*q[i],0))),DG=X.map((r,a)=>X.map((q,b)=>r.reduce((s,v,i)=>s+E[a][i]*q[i]+v*E[b][i],0))),s=G.reduce((s,r,i)=>s+r[i],0),dS=DG.reduce((s,r,i)=>s+r[i],0);
 const F=X.map((r,a)=>r.map((v,i)=>s*v+2*G[a].reduce((z,g,b)=>z+g*X[b][i],0)));
 const DF=X.map((r,a)=>r.map((v,i)=>dS*v+s*E[a][i]+2*G[a].reduce((z,g,b)=>z+DG[a][b]*X[b][i]+g*E[b][i],0)));
 const perms=[[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]];
 function U(a,b,c,i,j,k){const t=[a,b,c],p=[i,j,k];return perms.reduce((s,perm)=>{const v=perm.map((a,j)=>X[t[a]][p[j]]),e=perm.map((a,j)=>E[t[a]][p[j]]);return s+(coord===null?v[0]*v[1]*v[2]:e[0]*v[1]*v[2]+v[0]*e[1]*v[2]+v[0]*v[1]*e[2])},0)}
 const tr=(c,i,j,k)=>U(0,0,c,i,j,k)+U(1,1,c,i,j,k)+U(2,2,c,i,j,k);
 function C(a,b,c,i,j,k){return 5*U(a,b,c,i,j,k)-ds(a,b)*tr(c,i,j,k)-ds(a,c)*tr(b,i,j,k)-ds(b,c)*tr(a,i,j,k)}
 const numerators=[];let literalChecks=0,basisChecks=0;
 for(let i=0;i<9;i++){
   const N=triples.map(([a,b,c])=>{const cyclic=[[a,b,c],[a,c,b],[b,c,a]];return cyclic.reduce((s,[u,v,w])=>s+5*(coord===null?G[u][v]*X[w][i]:DG[u][v]*X[w][i]+G[u][v]*E[w][i])-ds(u,v)*(coord===null?F[w][i]:DF[w][i]),0)});
   for(let [j,[a,b,c]] of triples.entries()){let t=0;for(let k=0;k<9;k++)t+=C(a,b,c,k,k,i);assert(t===2*N[j],["literal trace",coord,i,j,t,N[j]]);literalChecks++}
   let nums=inv.map(row=>row.reduce((s,v,k)=>s+v*N[rows[k]],0));for(let j=0;j<27;j++){assert(nums.reduce((s,v,k)=>s+v*basis[k][j],0)===240*N[j],["basis",coord,i,j]);basisChecks++}numerators.push(nums);
 }
 return {diag,coord,den:720,numerators,literalChecks,basisChecks};
}
