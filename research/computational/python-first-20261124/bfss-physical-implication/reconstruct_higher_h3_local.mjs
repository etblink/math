// Exact local occupation replay for the 52-row candidate.
// Core construction uses direct scalar tensor traces, not rotation derivatives.
// Integer Number operations have strict safe-integer bounds; dot products use BigInt.
// Archived as an executable Node module, also callable in an isolated JS runtime.
export function reconstructHigherAnchor(seed,diag,archived){
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
 const cache=new WeakMap();
 function compile(T){let g=new Map();for(let [p,u,q,v,w,h] of T){let d=(1<<p)^(1<<q),la=(1<<(p+u))-1,lb=(1<<(q+v))-1,phase=(h+u+v+2*((la>>>q)&1))&3,par=la^lb;
  if(!g.has(d))g.set(d,new Map());let row=g.get(d),key=par*4+(phase&1),c=phase>=2?-w:w;row.set(key,(row.get(key)||0)+c)}
  return [...g].map(([d,row])=>[d,[...row].filter(([k,c])=>c).map(([k,c])=>[Math.floor(k/4),k&1,c])]).filter(([d,t])=>t.length)}
 function apply(T,V,control=false){let O=new Map();if(!T.length||!V.size)return O;bound(max(V)*T.reduce((s,t)=>s+Math.abs(t[4]),0));stats.actions++;
  let G=cache.get(T);if(!G){G=compile(T);cache.set(T,G)}
  for(let [d,terms] of G)for(let [m,z] of V){let cr=0,ci=0;for(let [par,h,w] of terms){let c=poppar(m&par)?-w:w;if(h)ci+=c;else cr+=c}
   if(cr||ci)add(O,m^d,cr*z[0]-ci*z[1],cr*z[1]+ci*z[0])}
  if(control){let L=new Map();
   for(let [p,u,q,v,w,h] of T){let Q=1<<q,P=1<<p;for(let [m,[a,b]] of V){let n=m^Q,phase=(h+u+v+2*(poppar(m&(Q-1))+v*((m>>>q)&1)+poppar(n&(P-1))+u*((n>>>p)&1)))&3;let r=phase===0?a:phase===1?-b:phase===2?-a:b,i=phase===0?b:phase===1?a:phase===2?-b:-a;add(L,n^P,w*r,w*i)}}
   assert(equal(O,L),"compiled/literal action discrepancy");stats.dual_controls++;
  }return O}
 function equal(A,B){if(A.size!==B.size)return false;for(let [m,z] of A){let x=B.get(m);if(!x||x[0]!==z[0]||x[1]!==z[1])return false}return true}
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
 function H(T){let outer=new Map(),memo=new Map();for(let [p,qs] of T){let mid=new Map();for(let [q,rs] of qs){let key=q+':'+rs.map(([c,r])=>c+','+r).join(';'),v=memo.get(key);if(!v){v=apply(K[q],lin(...rs.map(([c,r])=>[c,first[r]])));memo.set(key,v)}mid=lin([1,mid],[1,v])}if(mid.size)outer=lin([1,outer],[1,apply(K[p],mid,p===1)])}return outer}
 const T=tensor(),V=H(T),expected=lin([6,archived]);
 let count=0,examples=[];for(let m of new Set([...V.keys(),...expected.keys()])){let A=V.get(m)||[0,0],B=expected.get(m)||[0,0];if(A[0]!==B[0]||A[1]!==B[1]){count++;if(examples.length<8)examples.push([m,A,B])}}
 let nonzero=0,tensorNorm=0;for(let [p,qs] of T)for(let [q,rs] of qs)for(let [v,k] of rs){nonzero++;tensorNorm+=v*v}
 return {scope:"Independent literal ordered tensor contraction, no archived H3 use until final coefficient comparison",diag,scale:330,tensor_nonzero:nonzero,tensor_norm2:tensorNorm,support:V.size,archived_support:expected.size,norm2:dot(V,V).map(String),expected_norm2:dot(expected,expected).map(String),coefficient_mismatches:count,examples,stats}
}
