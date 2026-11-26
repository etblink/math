// Exact local occupation replay for the 52-row candidate.
// Core construction uses direct scalar tensor traces, not rotation derivatives.
// Integer Number operations have strict safe-integer bounds; dot products use BigInt.
// Archived as an executable Node module, also callable in an isolated JS runtime.
export function replay52(seed,diag,coords){
 const assert=(ok,m)=>{if(!ok)throw Error(JSON.stringify(m))};
 const P=Array.from({length:27},(_,p)=>[Math.floor(p/9),p%9]);
 const active=[1,2,3,4,5,6,13,14,17,18,19,20],deg=[0,1,2,3,4,5,6,7,8,3,3,4,4,5,5,6,6,7,7,8,8];
 const pairs=active.flatMap(p=>active.map(q=>[p,q]));
 const gammaFlip=[9,11,14,10,12,15,13,8,0],gammaSign=[9,10,11,15,13,12,14,0,8];
 const poppar=m=>{m^=m>>>16;m^=m>>>8;m^=m>>>4;return (0x6996>>>(m&15))&1};
 const gamma=gammaFlip.map((f,i)=>Array.from({length:16},(_,a)=>[a^f,poppar(a&gammaSign[i])?-1:1]));
 const mul=(A,B)=>A.map(([j,w])=>[B[j][0],w*B[j][1]]);
 for(let i=0;i<9;i++)for(let j=0;j<9;j++){let A=mul(gamma[i],gamma[j]),B=mul(gamma[j],gamma[i]);assert(A.every(([a,w],k)=>i===j?a===k&&w===1&&B[k][0]===k&&B[k][1]===1:a===B[k][0]&&w===-B[k][1]),"Clifford")}
 const B=(a,b,G,h=0)=>G.map(([j,w],i)=>[3*(i>>1)+a,i&1,3*(j>>1)+b,j&1,w,h]);
 const K=P.map(([a,i])=>B((a+1)%3,(a+2)%3,gamma[i],1));
 const ops=(...parts)=>parts.flatMap(([c,T])=>c?T.map(([p,u,q,v,w,h])=>[p,u,q,v,c*w,h]):[]);
 const stats={actions:0,dual_controls:0,max_bound:0,combines:0};
 function max(V){let a=0;for(let [r,i] of V.values())a=Math.max(a,Math.abs(r),Math.abs(i));return a}
 function add(O,m,r,i){let z=O.get(m),a=(z?z[0]:0)+r,b=(z?z[1]:0)+i;if(a||b)O.set(m,[a,b]);else O.delete(m)}
 function bound(n){assert(Number.isSafeInteger(n)&&n<2**52,["unsafe bound",n]);stats.max_bound=Math.max(stats.max_bound,n)}
 function lin(...parts){let O=new Map();bound(parts.reduce((s,[c,V])=>s+Math.abs(c)*max(V),0));stats.combines++;for(let [c,V] of parts)if(c)for(let [m,[a,b]] of V)add(O,m,c*a,c*b);return O}
 function apply(T,V,control=false){let O=new Map();if(!T.length||!V.size)return O;bound(max(V)*T.reduce((s,t)=>s+Math.abs(t[4]),0));stats.actions++;
  for(let [p,u,q,v,w,h] of T){let Q=1<<q,P=1<<p;for(let [m,[a,b]] of V){let n=m^Q,phase=(h+u+v+2*(poppar(m&(Q-1))+v*((m>>>q)&1)+poppar(n&(P-1))+u*((n>>>p)&1)))&3;let r=phase===0?a:phase===1?-b:phase===2?-a:b,i=phase===0?b:phase===1?a:phase===2?-b:-a;add(O,n^P,w*r,w*i)}}
  if(control){let G=new Map(); // independent compiled inverse-target gather, grouped by XOR
   let groups=new Map();for(let [p,u,q,v,w,h] of T){let delta=(1<<p)^(1<<q),la=(1<<(p+u))-1,lb=(1<<(q+v))-1,phase=(h+u+v+2*((la>>>q)&1))&3;if(!groups.has(delta))groups.set(delta,[]);groups.get(delta).push([la^lb,phase,w])}
   for(let [d,ts] of groups)for(let m0 of V.keys()){let target=m0^d,m=target^d,[a,b]=V.get(m),cr=0,ci=0;for(let [par,h,w] of ts){let phase=(h+2*poppar(m&par))&3;cr+=phase===0?w:phase===2?-w:0;ci+=phase===1?w:phase===3?-w:0}add(G,target,cr*a-ci*b,cr*b+ci*a)}
   assert(equal(O,G),"dual action discrepancy");stats.dual_controls++;
  }return O}
 function equal(A,B){return A.size===B.size&&[...A].every(([m,[r,i]])=>{let x=B.get(m);return x&&x[0]===r&&x[1]===i})}
 function dot(A,B){let r=0n,i=0n;for(let [m,[a,b]] of A){let x=B.get(m);if(x){let [c,d]=x;r+=BigInt(a)*BigInt(c)+BigInt(b)*BigInt(d);i+=BigInt(a)*BigInt(d)-BigInt(b)*BigInt(c)}}return [r,i]}
 function gram(A,B){return pairs.map(([p,q])=>dot(A[p],B[q]).map(String))}
 const x=P.map(([a,i])=>a===i?diag[a]:0),s=x.reduce((s,v)=>s+v*v,0),Z=y=>ops(...K.map((k,p)=>[y[p],k]));
 const cp=[[0,1],[0,2],[1,2]],M=(y,d,c)=>ops(...Array.from({length:9},(_,i)=>[y[9*d+i],K[9*c+i]])),L=y=>[Z(y),...cp.map(([d,c])=>ops([1,M(y,d,c)],[-1,M(y,c,d)]))];
 const z=Z(x),ls=L(x),first=K.map(k=>apply(k,seed,true)),w=apply(z,seed,true);
 function tensor(e=-1){let U=new Map(),F=new Map(),Tr=new Map();
  function u(a,b,c,i,j,k){let key=((((a*3+b)*3+c)*9+i)*9+j)*9+k;if(U.has(key))return U.get(key);let v=0;for(let [A,B,C] of [[a,b,c],[a,c,b],[b,a,c],[b,c,a],[c,a,b],[c,b,a]]){let p=9*A+i,q=9*B+j,r=9*C+k;v+=e<0?x[p]*x[q]*x[r]:+(p===e)*x[q]*x[r]+x[p]*+(q===e)*x[r]+x[p]*x[q]*+(r===e)}U.set(key,v);return v}
  function t(c,i,j,k){return u(0,0,c,i,j,k)+u(1,1,c,i,j,k)+u(2,2,c,i,j,k)}
  function f(a,b,c,i,j,k){let key=((((a*3+b)*3+c)*9+i)*9+j)*9+k;if(F.has(key))return F.get(key);let v=5*u(a,b,c,i,j,k)-(a===b?t(c,i,j,k):0)-(a===c?t(b,i,j,k):0)-(b===c?t(a,i,j,k):0);F.set(key,v);return v}
  function tr(a,b,c,k){let key=((a*3+b)*3+c)*9+k;if(Tr.has(key))return Tr.get(key);let v=0;for(let i=0;i<9;i++)v+=f(a,b,c,i,i,k);Tr.set(key,v);return v}
  let T=[];for(let p=0;p<27;p++){let [a,i]=P[p],qs=[];for(let q=0;q<27;q++){let [b,j]=P[q],rs=[];for(let r=0;r<27;r++){let [c,k]=P[r],v=(i===j?tr(a,b,c,k):0)+(i===k?tr(a,b,c,j):0)+(j===k?tr(a,b,c,i):0);if(v)rs.push([v,r])}if(rs.length)qs.push([q,rs])}if(qs.length)T.push([p,qs])}return T
 }
 function H(T){let outer=new Map();for(let [p,qs] of T){let mid=new Map();for(let [q,rs] of qs){let v=lin(...rs.map(([c,r])=>[c,first[r]]));mid=lin([1,mid],[1,apply(K[q],v)])}if(mid.size)outer=lin([1,outer],[1,apply(K[p],mid,p===1)])}return outer}
 function Phi(){return lin([320*330*s,w],...ls.map(l=>[-660,apply(l,apply(l,w))]))}
 let V=[lin([330,seed])];for(let p=0;p<6;p++)V.push(apply(z,V[p]));V[9]=Phi();V[10]=H(tensor());for(let p=9;p<19;p+=2){V[p+2]=apply(z,V[p]);V[p+3]=apply(z,V[p+1])}
 let anchor=dot(V[10],V[10]);if(diag.join("")==="001")assert(anchor[0]===9549400422481920n&&anchor[1]===0n,"H3 anchor");
 assert(seed.size===19136&&dot(seed,seed)[0]===8072064n,"seed norm");
 let mass=gram(V,V),Y=gram(V,V.map((v,p)=>active.includes(p)?apply(z,v):undefined));
 const cross=(j,k,b)=>{let a=(b+1)%3,c=(b+2)%3;return x[9*a+j]*x[9*c+k]-x[9*c+j]*x[9*a+k]};
 let CV=ops(...P.flatMap(([c,i],p)=>x[p]?Array.from({length:9},(_,j)=>Array.from({length:9},(_,k)=>k>j?[0,1,2].map(b=>[x[p]*cross(j,k,b),B(c,b,mul(mul(gamma[i],gamma[j]),gamma[k]),1)]):[]).flat(2)).flat():[]));
 let cv=gram(V,V.map((v,p)=>active.includes(p)?apply(CV,v):undefined)),records=[];
 for(let [b,i] of coords){let k=9*b+i,e=P.map((_,j)=>+(j===k)),dl=L(e),dw=first[k],dz=K[k];let dphi=lin([640*330*x[k],w],[320*330*s,dw],...ls.flatMap((l,j)=>{let h=dl[j];return [apply(h,apply(l,w)),apply(l,apply(h,w)),apply(l,apply(l,dw))].map(v=>[-660,v])}));
  let A=[new Map()];for(let j=0;j<6;j++)A[j+1]=lin([1,apply(dz,V[j])],[1,apply(z,A[j])]);A[9]=dphi;A[10]=H(tensor(k));for(let j=9;j<19;j+=2)for(let r of [j,j+1])A[r+2]=lin([1,apply(dz,V[r])],[1,apply(z,A[r])]);
  let B2=ops(...P.map(([a,j],p)=>[p===k?0:x[p],B(a,b,mul(gamma[j],gamma[i]))]));
  let BV=V.map((v,p)=>active.includes(p)?apply(B2,v):undefined);
  const euler=diag.filter(v=>v!==0).length===1&&x[k]!==0?active.every(p=>equal(lin([x[k],A[p]]),lin([deg[p],V[p]]))):null;
  if(euler!==null)assert(euler,"Euler");
  records.push({coordinate:[b,i],tau:gram(A,A),beta:gram(BV,A),nu:gram(V,A),t:gram(V,BV),euler,active_support:active.map(p=>A[p].size)});
 }
 return {scope:"direct coordinate integer contractions; rank-one orbit reduction applied separately",diag,active,deg,pairs,anchor:anchor.map(String),mass,Y,v:cv,records,stats};
}
