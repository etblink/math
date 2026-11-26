// Exact local occupation replay for the 52-row candidate.
// Core construction uses direct scalar tensor traces, not rotation derivatives.
// Integer Number operations have strict safe-integer bounds; dot products use BigInt.
// Archived as an executable Node module, also callable in an isolated JS runtime.
export function replay52corrections(seed,H3,diag,axes,active,includeCV=true){
 const assert=(ok,m)=>{if(!ok)throw Error(JSON.stringify(m))};
 const P=Array.from({length:27},(_,p)=>[Math.floor(p/9),p%9]);
 const deg=[0,1,2,3,4,5,6,7,8,3,3,4,4,5,5,6,6,7,7,8,8];
 const pairs=active.flatMap(p=>active.map(q=>[p,q]));
 const gammaFlip=[9,11,14,10,12,15,13,8,0],gammaSign=[9,10,11,15,13,12,14,0,8];
 const poppar=m=>{m^=m>>>16;m^=m>>>8;m^=m>>>4;return (0x6996>>>(m&15))&1};
 const gamma=gammaFlip.map((f,i)=>Array.from({length:16},(_,a)=>[a^f,poppar(a&gammaSign[i])?-1:1]));
 const mul=(A,B)=>A.map(([j,w])=>[B[j][0],w*B[j][1]]);
 for(let i=0;i<9;i++)for(let j=0;j<9;j++){let A=mul(gamma[i],gamma[j]),B=mul(gamma[j],gamma[i]);assert(A.every(([a,w],k)=>i===j?a===k&&w===1&&B[k][0]===k&&B[k][1]===1:a===B[k][0]&&w===-B[k][1]),"Clifford")}
 const B=(a,b,G,h=0)=>G.map(([j,w],i)=>[3*(i>>1)+a,i&1,3*(j>>1)+b,j&1,w,h]);
 const K=P.map(([a,i])=>B((a+1)%3,(a+2)%3,gamma[i],1));
 const ops=(...parts)=>parts.flatMap(([c,T])=>c?T.map(([p,u,q,v,w,h])=>[p,u,q,v,c*w,h]):[]);
 const stats={actions:0,dual_controls:0,max_bound:0,combines:0,wide_actions:0,wide_combines:0,max_wide_bound:'0',max_output_component:0};
 function max(V){let a=0;for(let [r,i] of V.values())a=Math.max(a,Math.abs(r),Math.abs(i));return a}
 function add(O,m,r,i){let z=O.get(m),a=(z?z[0]:0)+r,b=(z?z[1]:0)+i;if(a||b)O.set(m,[a,b]);else O.delete(m)}
 function safeBound(parts){let n=0n;for(let [c,V] of parts)n+=BigInt(Math.abs(c))*BigInt(max(V));return n}
 function small(n){if(n<2n**52n){stats.max_bound=Math.max(stats.max_bound,Number(n));return true}if(n>BigInt(stats.max_wide_bound))stats.max_wide_bound=String(n);return false}
 function wideAdd(O,m,a,b){let z=O.get(m),r=(z?z[0]:0n)+a,i=(z?z[1]:0n)+b;if(r||i)O.set(m,[r,i]);else O.delete(m)}
 function narrow(O){let W=new Map();for(let [m,[a,b]] of O){assert(a>-(2n**52n)&&a<2n**52n&&b>-(2n**52n)&&b<2n**52n,["actual coefficient exceeds narrow storage",m,String(a),String(b)]);let r=Number(a),i=Number(b);stats.max_output_component=Math.max(stats.max_output_component,Math.abs(r),Math.abs(i));W.set(m,[r,i])}return W}
 function lin(...parts){let O=new Map(),n=safeBound(parts);stats.combines++;if(!small(n)){stats.wide_combines++;for(let [c,V] of parts)if(c)for(let [m,[a,b]] of V)wideAdd(O,m,BigInt(c)*BigInt(a),BigInt(c)*BigInt(b));return narrow(O)}
 for(let [c,V] of parts)if(c)for(let [m,[a,b]] of V)add(O,m,c*a,c*b);return O}
 const cache=new WeakMap();
 function compile(T){let g=new Map();for(let [p,u,q,v,w,h] of T){let d=(1<<p)^(1<<q),la=(1<<(p+u))-1,lb=(1<<(q+v))-1,phase=(h+u+v+2*((la>>>q)&1))&3,par=la^lb;
  if(!g.has(d))g.set(d,new Map());let row=g.get(d),key=par*4+(phase&1),c=phase>=2?-w:w;row.set(key,(row.get(key)||0)+c)}
  return [...g].map(([d,row])=>[d,[...row].filter(([k,c])=>c).map(([k,c])=>[Math.floor(k/4),k&1,c])]).filter(([d,t])=>t.length)}
 function apply(T,V,control=false){let O=new Map();if(!T.length||!V.size)return O;let wide=!small(BigInt(max(V))*T.reduce((s,t)=>s+BigInt(Math.abs(t[4])),0n));stats.actions++;if(wide)stats.wide_actions++;
  let G=cache.get(T);if(!G){G=compile(T);cache.set(T,G)}
  for(let [d,terms] of G)for(let [m,z] of V){let cr=0,ci=0;for(let [par,h,w] of terms){let c=poppar(m&par)?-w:w;if(h)ci+=c;else cr+=c}
   if(cr||ci){if(wide){let a=BigInt(z[0]),b=BigInt(z[1]),c=BigInt(cr),e=BigInt(ci);wideAdd(O,m^d,c*a-e*b,c*b+e*a)}else add(O,m^d,cr*z[0]-ci*z[1],cr*z[1]+ci*z[0])}} if(wide)O=narrow(O);
  if(control){let L=new Map();
   for(let [p,u,q,v,w,h] of T){let Q=1<<q,P=1<<p;for(let [m,[a,b]] of V){let n=m^Q,phase=(h+u+v+2*(poppar(m&(Q-1))+v*((m>>>q)&1)+poppar(n&(P-1))+u*((n>>>p)&1)))&3;let r=phase===0?a:phase===1?-b:phase===2?-a:b,i=phase===0?b:phase===1?a:phase===2?-b:-a;if(wide)wideAdd(L,n^P,BigInt(w)*BigInt(r),BigInt(w)*BigInt(i));else add(L,n^P,w*r,w*i)}}
   if(wide)L=narrow(L);assert(equal(O,L),"compiled/literal action discrepancy");stats.dual_controls++;
  }return O}
 function equal(A,B){if(A.size!==B.size)return false;for(let [m,z] of A){let x=B.get(m);if(!x||x[0]!==z[0]||x[1]!==z[1])return false}return true}
 function dot(A,B){let r=0n,i=0n;for(let [m,[a,b]] of A){let x=B.get(m);if(x){let [c,d]=x;r+=BigInt(a)*BigInt(c)+BigInt(b)*BigInt(d);i+=BigInt(a)*BigInt(d)-BigInt(b)*BigInt(c)}}return [r,i]}
 function gram(A,B){return pairs.map(([p,q])=>dot(A[p],B[q]).map(String))}
 const x=P.map(([a,i])=>a===i?diag[a]:0),s=x.reduce((s,v)=>s+v*v,0),Z=y=>ops(...K.map((k,p)=>[y[p],k]));
 const cp=[[0,1],[0,2],[1,2]],M=(y,d,c)=>ops(...Array.from({length:9},(_,i)=>[y[9*d+i],K[9*c+i]])),L=y=>[Z(y),...cp.map(([d,c])=>ops([1,M(y,d,c)],[-1,M(y,c,d)]))];
 const z=Z(x),ls=L(x),w=apply(z,seed,true);
 const SCALE=55;
 function Phi(){return lin([320*SCALE*s,w],...ls.map(l=>[-2*SCALE,apply(l,apply(l,w),true)]))}
 let V=[lin([SCALE,seed])];for(let p=0;p<6;p++)V.push(apply(z,V[p]));V[9]=Phi();V[10]=H3;
 for(let p=9;p<19;p+=2){V[p+2]=apply(z,V[p]);V[p+3]=apply(z,V[p+1])}
 let anchor=dot(V[10],V[10]);assert(seed.size===19136&&dot(seed,seed)[0]===8072064n,"seed norm");
 const cross=(j,k,b)=>{let a=(b+1)%3,c=(b+2)%3;return x[9*a+j]*x[9*c+k]-x[9*c+j]*x[9*a+k]};
 let cvparts=[];for(let [c,i] of P)if(x[9*c+i])for(let j=0;j<9;j++)for(let k=j+1;k<9;k++)for(let b=0;b<3;b++){let w=x[9*c+i]*cross(j,k,b);if(w)cvparts.push([w,B(c,b,mul(mul(gamma[i],gamma[j]),gamma[k]),1)])}let CV=ops(...cvparts);
 let records=[];
 for(let i of axes){let k=10*i;let B2=ops(...P.map(([a,j],p)=>[p===k?0:x[p],B(a,i,mul(gamma[j],gamma[i]))]));
  let BV=V.map((v,p)=>active.includes(p)?apply(B2,v,p===active[0]):undefined);
  records.push({axis:i,t:gram(V,BV)});
 }
 let cv=includeCV?gram(V,V.map((v,p)=>active.includes(p)?apply(CV,v,p===active[0]):undefined)):[];

 return {scope:"higher rank weighted corrections from frozen H3 anchor; not independent anchor reconstruction",diag,scale:SCALE,active,deg,pairs,anchor:anchor.map(String),v:cv,records,stats};
}
