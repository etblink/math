export function compareRectPartial(blocks,raw,q96,q104,cross,active){
const N=8072064n,D=blocks[0].diag,rank2=D.join("")==="120",g=D.map(v=>BigInt(v*v)),inv=[g.reduce((a,b)=>a+b,0n),g[0]*g[1]+g[0]*g[2]+g[1]*g[2],g[0]*g[1]*g[2]];
const assert=(p,m)=>{if(!p)throw Error(m)};
function rat(x){let [a,b="1"]=String(x).split("/");return [BigInt(a),BigInt(b)]}
function gcd(a,b){a=a<0n?-a:a;while(b){[a,b]=[b,a%b]}return a}
function add([a,b],[c,d]){let n=a*d+b*c,m=b*d,g=gcd(n,m);return[n/g,m/g]}
let vals=new Map(),errors=[],counts={},nonzero={},direct={},transpose={},traceErrors=[],sources={};
const family=i=>i<9?["S",i]:[i%2===1?"Phi":"H3",Math.floor((i-9)/2)],order=["S","Phi","H3"];
const keys=["mass","Y","v",...D.map((_,i)=>"t"+i)];
for(let r of blocks){assert(r.diag.join()===D.join()&&r.scale===55&&r.anchor.join()===blocks[0].anchor.join(),"block input mismatch");for(let i=0;i<r.pairs.length;i++){let [p,q]=r.pairs[i];for(let [k,z] of [["mass",r.mass[i]],["Y",r.Y[i]],["v",r.v[i]],...r.records.map(t=>["t"+t.axis,t.t[i]])]){if(z===undefined)continue;let key=k+":"+p+","+q;let a=BigInt(z[0])*(k.startsWith("t")?BigInt(D[Number(k[1])]):1n);if(z[1]!=="0")errors.push({key,imag:z[1]});if(vals.has(key)&&vals.get(key)!==a)errors.push({key,duplicate:true});vals.set(key,a)}}}
const S=55n;
for(let p of active)for(let q of active){let trace=0n;for(let k of keys){let axis=k.startsWith("t")?Number(k[1]):null,f=axis!==null?"t":k,parity=blocks[0].deg[p]+blocks[0].deg[q]+(k==="Y"||k==="v"?1:0),scale=N*S*S*2n**BigInt(Math.floor(parity/2))*(f==="t"?2n:1n),key=k+":"+p+","+q,reverse=k+":"+q+","+p,a,method;
if(axis!==null&&D[axis]===0){a=0n;method="structural_zero"}else if(vals.has(key)){a=vals.get(key);method="direct"}else if(vals.has(reverse)){a=vals.get(reverse)*(f==="t"?-1n:1n);method="transpose"}else throw Error("missing "+key);
if(vals.has(key)&&vals.has(reverse)&&vals.get(key)!==vals.get(reverse)*(f==="t"?-1n:1n))errors.push({key,symmetry:true});
if(f==="t")trace+=a;
let expected,src;
if(f==="mass"||f==="Y"){let [c,m]=family(p),[d,n]=family(q),name=[c,d].sort((a,b)=>order.indexOf(a)-order.indexOf(b)).join(",");let poly=parity%2?[]:cross[name][String(m+n+(f==="Y"?1:0))];assert(poly,"cross key");expected=poly.reduce((s,t)=>{let [a,b]=rat(t.coefficient);let mon=t.exponents.reduce((x,e,j)=>x*inv[j]**BigInt(e),1n);return add(s,[a*mon,b])},[0n,1n]);src="cross_polynomials"}else{let caxis=rank2?(axis+1)%3:axis;if(Math.max(p,q)<9){let x=f==="v"?raw.sqrt2_i_cV_raw[p][q]:raw.B2_t_raw[caxis][p][q];expected=[BigInt(x),scale/(S*S)];src="full_jets"}else{let rec=Math.max(p,q)<17?q96:q104;expected=rat(f==="v"?rec.v[p][q]:rec.t[caxis][p][q]);src=Math.max(p,q)<17?"mixed96":"mixed104"}}
counts[f]=(counts[f]||0)+1;nonzero[f]=(nonzero[f]||0)+ +(a!==0n);sources[src]=(sources[src]||0)+1;if(method==="direct")direct[f]=(direct[f]||0)+1;if(method==="transpose")transpose[f]=(transpose[f]||0)+1;if(a*expected[1]!==expected[0]*scale)errors.push({key,actual:a+"/"+scale,expected:expected.join("/"),src,method});
}if(trace!==0n)traceErrors.push({p,q,trace:String(trace)})}
return {diag:D,counts,nonzero,direct,transpose,structural_zero_t:rank2?active.length**2:0,sources,traceChecks:active.length**2,traceErrors,errors,scope:"All active mass/Y/t/v entries at fixture; transpose by real Hermitian mass/Y/v and skew t; inactive rank-two t axis structural zero. Not full derivative or integral verification."}
}
