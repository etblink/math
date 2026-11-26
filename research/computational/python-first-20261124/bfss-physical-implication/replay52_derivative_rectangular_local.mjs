// Exact local occupation replay for the 52-row candidate.
// Core construction uses direct scalar tensor traces, not rotation derivatives.
// Integer Number operations have strict safe-integer bounds; dot products use BigInt.
// Archived as an executable Node module, also callable in an isolated JS runtime.
export function replay52derivative(seed,H3,diag,coord,left,right){
 const assert=(ok,m)=>{if(!ok)throw Error(JSON.stringify(m))};
 const P=Array.from({length:27},(_,p)=>[Math.floor(p/9),p%9]);
 const deg=[0,1,2,3,4,5,6,7,8,3,3,4,4,5,5,6,6,7,7,8,8];
 const active=[...new Set([...left,...right])].sort((a,b)=>a-b),pairs=left.flatMap(p=>right.map(q=>[p,q]));
 const gammaFlip=[9,11,14,10,12,15,13,8,0],gammaSign=[9,10,11,15,13,12,14,0,8];
 const poppar=m=>{m^=m>>>16;m^=m>>>8;m^=m>>>4;return (0x6996>>>(m&15))&1};
 const gamma=gammaFlip.map((f,i)=>Array.from({length:16},(_,a)=>[a^f,poppar(a&gammaSign[i])?-1:1]));
 const mul=(A,B)=>A.map(([j,w])=>[B[j][0],w*B[j][1]]);
 for(let i=0;i<9;i++)for(let j=0;j<9;j++){let A=mul(gamma[i],gamma[j]),B=mul(gamma[j],gamma[i]);assert(A.every(([a,w],k)=>i===j?a===k&&w===1&&B[k][0]===k&&B[k][1]===1:a===B[k][0]&&w===-B[k][1]),"Clifford")}
 const B=(a,b,G,h=0)=>G.map(([j,w],i)=>[3*(i>>1)+a,i&1,3*(j>>1)+b,j&1,w,h]);
 const K=P.map(([a,i])=>B((a+1)%3,(a+2)%3,gamma[i],1));
 const ops=(...parts)=>parts.flatMap(([c,T])=>c?T.map(([p,u,q,v,w,h])=>[p,u,q,v,c*w,h]):[]);
 const stats={actions:0,dual_controls:0,max_bound:0,combines:0,wide_actions:0,wide_combines:0,max_wide_bound:'0',max_output_component:'0',wide_vectors:0,content_reductions:0,chunked_dots:0,bigint_dots:0};
 function max(V){if(!V.size)return 0n;let wide=typeof V.values().next().value[0]==='bigint';if(!wide){let a=0;for(let [r,i] of V.values())a=Math.max(a,Math.abs(r),Math.abs(i));return BigInt(a)}let a=0n;for(let [r,i] of V.values()){if(r<0n)r=-r;if(i<0n)i=-i;if(r>a)a=r;if(i>a)a=i}return a}
 function add(O,m,r,i){let z=O.get(m),a=(z?z[0]:0)+r,b=(z?z[1]:0)+i;if(a||b)O.set(m,[a,b]);else O.delete(m)}
 function safeBound(parts){let n=0n;for(let [c,V] of parts)n+=BigInt(Math.abs(c))*BigInt(max(V));return n}
 function small(n){if(n<2n**52n){stats.max_bound=Math.max(stats.max_bound,Number(n));return true}if(n>BigInt(stats.max_wide_bound))stats.max_wide_bound=String(n);return false}
 function wideAdd(O,m,a,b){let z=O.get(m),r=(z?z[0]:0n)+a,i=(z?z[1]:0n)+b;if(r||i)O.set(m,[r,i]);else O.delete(m)}
 function narrow(O){let m=max(O);if(m>BigInt(stats.max_output_component))stats.max_output_component=String(m);if(m>=2n**52n){stats.wide_vectors++;return O}let W=new Map();for(let [k,[a,b]] of O)W.set(k,[Number(a),Number(b)]);return W}
 function lin(...parts){let O=new Map(),n=safeBound(parts);stats.combines++;if(!small(n)){stats.wide_combines++;for(let [c,V] of parts)if(c)for(let [m,[a,b]] of V)wideAdd(O,m,BigInt(c)*BigInt(a),BigInt(c)*BigInt(b));return narrow(O)}
 for(let [c,V] of parts)if(c)for(let [m,[a,b]] of V)add(O,m,c*Number(a),c*Number(b));return O}
 const cache=new WeakMap();
 function compile(T){let g=new Map();for(let [p,u,q,v,w,h] of T){let d=(1<<p)^(1<<q),la=(1<<(p+u))-1,lb=(1<<(q+v))-1,phase=(h+u+v+2*((la>>>q)&1))&3,par=la^lb;
  if(!g.has(d))g.set(d,new Map());let row=g.get(d),key=par*4+(phase&1),c=phase>=2?-w:w;row.set(key,(row.get(key)||0)+c)}
  return [...g].map(([d,row])=>[d,[...row].filter(([k,c])=>c).map(([k,c])=>[Math.floor(k/4),k&1,c])]).filter(([d,t])=>t.length)}
 function apply(T,V,control=false){let O=new Map();if(!T.length||!V.size)return O;let wide=!small(BigInt(max(V))*T.reduce((s,t)=>s+BigInt(Math.abs(t[4])),0n));stats.actions++;if(wide)stats.wide_actions++;
  let G=cache.get(T);if(!G){G=compile(T);cache.set(T,G)}
  for(let [d,terms] of G)for(let [m,z] of V){let cr=0,ci=0;for(let [par,h,w] of terms){let c=poppar(m&par)?-w:w;if(h)ci+=c;else cr+=c}
   if(cr||ci){if(wide){let a=BigInt(z[0]),b=BigInt(z[1]),c=BigInt(cr),e=BigInt(ci);wideAdd(O,m^d,c*a-e*b,c*b+e*a)}else add(O,m^d,cr*Number(z[0])-ci*Number(z[1]),cr*Number(z[1])+ci*Number(z[0]))}} if(wide)O=narrow(O);
  if(control){let L=new Map();
   for(let [p,u,q,v,w,h] of T){let Q=1<<q,P=1<<p;for(let [m,[a,b]] of V){let n=m^Q,phase=(h+u+v+2*(poppar(m&(Q-1))+v*((m>>>q)&1)+poppar(n&(P-1))+u*((n>>>p)&1)))&3;let r=phase===0?a:phase===1?-b:phase===2?-a:b,i=phase===0?b:phase===1?a:phase===2?-b:-a;if(wide)wideAdd(L,n^P,BigInt(w)*BigInt(r),BigInt(w)*BigInt(i));else add(L,n^P,w*Number(r),w*Number(i))}}
   if(wide)L=narrow(L);assert(equal(O,L),"compiled/literal action discrepancy");stats.dual_controls++;
  }return O}
 function equal(A,B){if(A.size!==B.size)return false;for(let [m,z] of A){let x=B.get(m);if(!x||BigInt(x[0])!==BigInt(z[0])||BigInt(x[1])!==BigInt(z[1]))return false}return true}
 function dot(A,B){let r=0n,i=0n;for(let [m,[a,b]] of A){let x=B.get(m);if(x){let [c,d]=x;r+=BigInt(a)*BigInt(c)+BigInt(b)*BigInt(d);i+=BigInt(a)*BigInt(d)-BigInt(b)*BigInt(c)}}return [r,i]}
 const factors=[];
 function gcd(a,b){while(b){[a,b]=[b,a%b]}return a}
 function primitive(V,p,inherited=1n,fs=factors){let g=0n;for(let [r,i] of V.values()){let a=BigInt(r),b=BigInt(i);g=gcd(g,a<0n?-a:a);g=gcd(g,b<0n?-b:b);if(g===1n)break}if(!g)g=1n;
  fs[p]=inherited*g;if(g===1n)return V;stats.content_reductions++;
  let W=new Map();for(let [m,[a,b]] of V)W.set(m,[BigInt(a)/g,BigInt(b)/g]);return narrow(W)}
 const maxima=new WeakMap();
 function vmax(V){if(!maxima.has(V))maxima.set(V,max(V));return maxima.get(V)}
 function fastDot(A,B){let b=2n*vmax(A)*vmax(B);if(b===0n)return [0n,0n];if(b>=2n**50n){stats.bigint_dots++;return dot(A,B)}
  stats.chunked_dots++;let cap=Number((2n**51n-1n)/b);cap=Math.min(cap,1048576);
  let n=0,r=0,i=0,R=0n,I=0n;for(let [m,z] of A){let w=B.get(m);if(!w)continue;let a=Number(z[0]),c=Number(w[0]),d=Number(z[1]),e=Number(w[1]);r+=a*c+d*e;i+=a*e-d*c;if(++n===cap){R+=BigInt(r);I+=BigInt(i);n=0;r=i=0}}
  return [R+BigInt(r),I+BigInt(i)]}
 function gram(A,B,fA=factors,fB=factors){return pairs.map(([p,q])=>fastDot(A[p],B[q]).map(z=>String(z*fA[p]*fB[q])))}
 const x=P.map(([a,i])=>a===i?diag[a]:0),s=x.reduce((s,v)=>s+v*v,0),Z=y=>ops(...K.map((k,p)=>[y[p],k]));
 const cp=[[0,1],[0,2],[1,2]],M=(y,d,c)=>ops(...Array.from({length:9},(_,i)=>[y[9*d+i],K[9*c+i]])),L=y=>[Z(y),...cp.map(([d,c])=>ops([1,M(y,d,c)],[-1,M(y,c,d)]))];
 const z=Z(x),ls=L(x),w=apply(z,seed,true);
 const SCALE=330;
 function Phi(){return lin([320*SCALE*s,w],...ls.map(l=>[-2*SCALE,apply(l,apply(l,w),true)]))}
 let V=[primitive(lin([SCALE,seed]),0)];const maxS=Math.max(0,...active.filter(p=>p<9));for(let p=0;p<maxS;p++)V.push(primitive(apply(z,V[p]),p+1,factors[p]));
 for(let base of [9,10]){let mx=Math.max(-1,...active.filter(p=>p>=base&&(p-base)%2===0));if(mx>=base){V[base]=primitive(base===9?Phi():lin([6,H3]),base);for(let p=base;p<mx;p+=2)V[p+2]=primitive(apply(z,V[p]),p+2,factors[p])}}
 let anchor=dot(H3,H3);assert(seed.size===19136&&dot(seed,seed)[0]===8072064n,"seed norm");

 const [b,i]=coord,k=9*b+i,e=P.map((_,j)=>+(j===k)),dl=L(e),dz=K[k],dw=apply(dz,seed,true);
 const df=[];
 function dstep(p,q){let f=factors[p],d=df[p],g=gcd(f,d);let a=f/g,b=d/g;assert(a<2n**52n&&b<2n**52n,"derivative factor bound");return primitive(lin([Number(a),apply(dz,V[p])],[Number(b),apply(z,A[p])]),q,g,df)}
 let A=[new Map()];df[0]=1n;
 for(let p=0;p<maxS;p++)A[p+1]=dstep(p,p+1);
 if(V[9]){let dphi=lin([640*SCALE*x[k],w],[320*SCALE*s,dw],...ls.flatMap((l,j)=>{let h=dl[j];return [apply(h,apply(l,w)),apply(l,apply(h,w)),apply(l,apply(l,dw))].map(v=>[-2*SCALE,v])}));A[9]=primitive(dphi,9,1n,df)}
 if(V[10]){
  const first=K.map(k=>apply(k,seed,true));
  function tensor(e=-1){let U=new Map(),F=new Map(),Tr=new Map();
  function u(a,b,c,i,j,k){let key=((((a*3+b)*3+c)*9+i)*9+j)*9+k;if(U.has(key))return U.get(key);let v=0;for(let [A,B,C] of [[a,b,c],[a,c,b],[b,a,c],[b,c,a],[c,a,b],[c,b,a]]){let p=9*A+i,q=9*B+j,r=9*C+k;v+=e<0?x[p]*x[q]*x[r]:+(p===e)*x[q]*x[r]+x[p]*+(q===e)*x[r]+x[p]*x[q]*+(r===e)}U.set(key,v);return v}
  function t(c,i,j,k){return u(0,0,c,i,j,k)+u(1,1,c,i,j,k)+u(2,2,c,i,j,k)}
  function f(a,b,c,i,j,k){let key=((((a*3+b)*3+c)*9+i)*9+j)*9+k;if(F.has(key))return F.get(key);let v=5*u(a,b,c,i,j,k)-(a===b?t(c,i,j,k):0)-(a===c?t(b,i,j,k):0)-(b===c?t(a,i,j,k):0);F.set(key,v);return v}
  function tr(a,b,c,k){let key=((a*3+b)*3+c)*9+k;if(Tr.has(key))return Tr.get(key);let v=0;for(let i=0;i<9;i++)v+=f(a,b,c,i,i,k);Tr.set(key,v);return v}
  let T=[];for(let p=0;p<27;p++){let [a,i]=P[p],qs=[];for(let q=0;q<27;q++){let [b,j]=P[q],rs=[];for(let r=0;r<27;r++){let [c,k]=P[r],v=(i===j?tr(a,b,c,k):0)+(i===k?tr(a,b,c,j):0)+(j===k?tr(a,b,c,i):0);if(v)rs.push([v,r])}if(rs.length)qs.push([q,rs])}if(qs.length)T.push([p,qs])}return T
 }
 function H(T){let outer=new Map(),memo=new Map();for(let [p,qs] of T){let mid=new Map();for(let [q,rs] of qs){let key=q+':'+rs.map(([c,r])=>c+','+r).join(';'),v=memo.get(key);if(!v){v=apply(K[q],lin(...rs.map(([c,r])=>[c,first[r]])));memo.set(key,v)}mid=lin([1,mid],[1,v])}if(mid.size)outer=lin([1,outer],[1,apply(K[p],mid,p===1)])}return outer}

  A[10]=primitive(H(tensor(k)),10,1n,df);
 }
 for(let base of [9,10])if(V[base]){let mx=Math.max(...active.filter(p=>p>=base&&(p-base)%2===0));for(let p=base;p<mx;p+=2)A[p+2]=dstep(p,p+2)}
 const B2=ops(...P.map(([a,j],p)=>[p===k?0:x[p],B(a,b,mul(gamma[j],gamma[i]))]));
 const BV=V.map((v,p)=>left.includes(p)?apply(B2,v,p===left[0]):undefined);
 return {scope:"literal direct coordinate derivative from frozen independently compared H3 anchor; H3 derivative from fresh scalar ordered tensor",diag,coord,scale:SCALE,active,left,right,deg,pairs,factors:factors.map(v=>String(v)),derivative_factors:df.map(v=>String(v)),anchor:anchor.map(String),tau:gram(A,A,df,df),beta:gram(BV,A,factors,df),nu:x[k]?gram(V,A,factors,df):[],stats};
}
