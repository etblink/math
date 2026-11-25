// Exact independent assembly using MGF-derived moment table. Run from this directory: node integrate_mgf.mjs
import fs from 'node:fs'; import path from 'node:path'; import zlib from 'node:zlib'; import {fileURLToPath} from 'node:url';
function integrate(P,J,T,rows,widths,refMatrix){
const req=(x,m)=>{if(!x)throw Error(m)};
function gcd(a,b){if(a<0n)a=-a;if(b<0n)b=-b;while(b)[a,b]=[b,a%b];return a}
const F=(n,d=1n)=>{if(!n)return [0n,1n];if(d<0n){n=-n;d=-d}let g=gcd(n,d);return [n/g,d/g]},zero=F(0n),one=F(1n);
function parse(s){let [n,d="1"]=String(s).split("/");return F(BigInt(n),BigInt(d))}
function add(a,b){if(!a[0])return b;if(!b[0])return a;let g=gcd(a[1],b[1]);return F(a[0]*(b[1]/g)+b[0]*(a[1]/g),a[1]/g*b[1])}
function mul(a,b){if(!a[0]||!b[0])return zero;let g=gcd(a[0],b[1]),h=gcd(b[0],a[1]);return [(a[0]/g)*(b[0]/h),(a[1]/h)*(b[1]/g)]}
function sub(a,b){return add(a,[-b[0],b[1]])}
function div(a,b){return mul(a,F(b[1],b[0]))}
function pow(a,n){if(n<0)return pow(F(a[1],a[0]),-n);return [a[0]**BigInt(n),a[1]**BigInt(n)]}
function sc(a,n,d=1){return mul(a,F(BigInt(n),BigInt(d)))}
function eq(a,b){return a[0]===b[0]&&a[1]===b[1]}
function str(a){return a[1]===1n?a[0].toString():a.join("/")}
function bin(n,k){if(k<0||k>n)return 0n;let r=1n;for(let i=1;i<=k;i++)r=r*BigInt(n+1-i)/BigInt(i);return r}
const widthsF=widths.map(r=>r.map(parse)),orientCache=new Map,allMoments=new Map,weightedKeys=new Set;
function makeOrient(i,j){
let [a,b]=widthsF[i],[c,d]=widthsF[j];req(eq(b,d),"shared smallest width");let g=sc(add(a,c),1,2),h=sc(sub(a,b),1,2),k=sc(sub(c,d),1,2),hk=mul(h,k),D0=mul(sub(g,h),sub(g,k)),D1=sub(D0,hk),k1=sub(sc(g,3),add(h,k)),k2=sub(sc(g,2),add(h,k));req(eq(D1,mul(g,b)),"D1");
const primCache=new Map,emCache=new Map;
function primitive(r,L){let key=r+","+L;if(primCache.has(key))return primCache.get(key);let n=3+L-r;req(n>=0,"primitive exponent "+key);let out=zero;for(let t=0;t<=n;t++)out=add(out,mul(F(bin(n,t),BigInt(2*r+2*t+1)),div(pow(hk,t),pow(D1,r+t))));out=mul(pow(D0,r-4-L),out);primCache.set(key,out);return out}
const nFactors=[[[0,0,one]],[[1,0,sub(g,k)],[1,1,k]],[[2,0,pow(sub(g,k),2)],[2,1,mul(k,sub(sc(g,2),k))]]],mFactors=[[[0,0,one]],[[1,0,sub(g,h)],[1,1,h]],[[2,0,pow(sub(g,h),2)],[2,1,mul(h,sub(sc(g,2),h))]]],zFactors=[[[0,1,one]],[[1,1,g]],[[2,1,sub(pow(g,2),hk)],[2,2,hk]]];
function atom(e,j,type){let key=[...e,j,type].join(",");if(emCache.has(key))return emCache.get(key);let [a,b,c]=e,out=zero;
if(type==="I"){out=j===0?sc(atom(e,0,"scalar"),3):j===1?atom([a+1,b,c],0,"scalar"):sub(atom([a+2,b,c],0,"scalar"),sc(atom([a,b+1,c],0,"scalar"),2))}
else{let fac=type==="scalar"?[[0,0,one]]:({n:nFactors,m:mFactors,z:zFactors})[type][j];for(let t=0;t<=a;t++){let pref=mul(F(bin(a,t)),mul(pow(mul(g,k2),a-t),pow(k1,b)));for(let [dp,r,co] of fac)out=add(out,mul(mul(pref,co),primitive(r,a+b+c-t+dp)))}out=div(out,pow(g,5+a+b+c))}
emCache.set(key,out);return out}
function contract(e,j,tag){if(tag==="scalar")return atom(e,0,"scalar");let tr=atom(e,j,"I");if(tag==="I")return tr;let n=atom(e,j,"n"),m=atom(e,j,"m");if(tag==="A")return sub(mul(a,tr),mul(sc(h,2),n));if(tag==="B")return sub(mul(c,tr),mul(sc(k,2),m));if(tag==="BA")return add(sub(sub(mul(mul(a,c),tr),mul(sc(mul(h,c),2),n)),mul(sc(mul(k,a),2),m)),mul(sc(hk,4),atom(e,j,"z")));throw Error("tag")}
return {contract,primitive,atom,cacheSizes:()=>[primCache.size,emCache.size]}
}
function integral(e,p,tag,i,j,kind){let key=[...e,p,tag,i,j].join(",");if(kind!=="mass")weightedKeys.add(key);if(allMoments.has(key))return allMoments.get(key);let n=e[0]+2*e[1]+3*e[2]+p,tab=T[[...e,p].join(",")];req(tab!==undefined,"missing MGF moment "+key);let orientKey=i+","+j;if(!orientCache.has(orientKey))orientCache.set(orientKey,makeOrient(i,j));let o=orientCache.get(orientKey),r=zero;for(let [a,b,c,j,co] of tab){req(tag!=="scalar"||j===0,"scalar matrix");r=add(r,mul(F(BigInt(co),2n**BigInt(n)),o.contract([a,b,c],j,tag)))}allMoments.set(key,r);return r}
const C=Array.from({length:9},(_,p)=>["S",p]).concat(Array.from({length:6},(_,p)=>[["Phi",p],["H3",p]]).flat()),deg=C.map(([f,p])=>p+(f==="S"?0:3)),rowIds=rows.map(r=>C.findIndex(([f,p])=>f===r.seed&&p===r.power)),S=[1,0,0],U=[0,1,0],V=[0,0,1],addE=(...args)=>args.reduce((a,b)=>a.map((x,i)=>x+b[i]),[0,0,0]),order=["S","Phi","H3"];
const dd=e=>{let [a,b,c]=e,res=[];if(a)res.push([[a-1,b,c],0,2*a]);if(b)res.push([[a+1,b-1,c],0,2*b],[[a,b-1,c],1,-2*b]);if(c)res.push([[a,b+1,c-1],0,2*c],[[a+1,b,c-1],1,-2*c],[[a,b,c-1],2,2*c]);return res};
function form(i,j,weighted,massOnly=false,omitT=false){
let a=rows[i],b=rows[j],e=a.exponents,h=b.exponents,p=rowIds[i],q=rowIds[j],pq=p+","+q,qp=q+","+p,eh=addE(e,h),name=[a.seed,b.seed].sort((a,b)=>order.indexOf(a)-order.indexOf(b)).join(","),k=a.power+b.power,even=(deg[p]+deg[q])%2===0,out=new Map,ep=dd(e),hp=dd(h);
function inc(ex,p,tag,c){if(!c[0])return;if(p>=3){inc(addE(ex,S),p-1,tag,c);inc(addE(ex,U),p-2,tag,[-c[0],c[1]]);inc(addE(ex,V),p-3,tag,c);return}let key=[...ex,p,tag].join(","),v=add(out.get(key)||zero,c);if(v[0])out.set(key,v);else out.delete(key)}
function put(ex,p,t,c){inc(ex,p,t,c);if(weighted)inc(addE(ex,S),p,t,c)}
if(massOnly){if(even)for(let r of P[name][String(k)])inc(addE(eh,r.exponents),0,"scalar",parse(r.coefficient));return out}
if(even){for(let r of P[name][String(k)]){let c=parse(r.coefficient),ex=r.exponents;put(addE(eh,ex,U),0,"scalar",c);put(addE(eh,ex),1,"BA",sc(c,1,2));for(let [de,g,u] of ep){put(addE(de,h,ex),g+1,"B",sc(c,-u,2));for(let [dh,l,v] of hp)put(addE(de,dh,ex),g+l+1,"I",sc(c,u*v,2))}for(let [dh,l,v] of hp)put(addE(e,dh,ex),l+1,"A",sc(c,-v,2))}}
else for(let r of P[name][String(k+1)])put(addE(eh,r.exponents),0,"scalar",parse(r.coefficient));
for(let [key,ds,other,tag] of [[pq,ep,h,"A"],[qp,hp,e,"B"]])for(let r of J.nu[key]){let c=sc(parse(r.coefficient),1,2);put(addE(eh,r.exponents),r.G_power,tag,sc(c,-1));for(let [de,g,u] of ds)put(addE(de,other,r.exponents),r.G_power+g,"I",sc(c,u))}
for(let r of J.tau[pq])put(addE(eh,r.exponents),0,"scalar",sc(parse(r.coefficient),1,2));
if(weighted){if(!omitT)for(let r of J.t[pq]){let c=sc(parse(r.coefficient),1,8);inc(addE(eh,r.exponents),r.G_power,"B",c);for(let [dh,g,v] of hp)inc(addE(e,dh,r.exponents),r.G_power+g,"I",sc(c,-v))}
for(let n of ["beta","v"])for(let r of J[n][pq])inc(addE(eh,r.exponents),0,"scalar",sc(parse(r.coefficient),-1,8))}
return out}
function evalForm(f,i,j,kind){let r=zero;for(let [key,c] of f){let v=key.split(","),e=v.slice(0,3).map(Number),p=Number(v[3]),tag=v[4];r=add(r,mul(c,integral(e,p,tag,rows[i].width,rows[j].width,kind)))}return r}
let counts={mass:0,H:0,q1:0},nonzero={mass:0,H:0,q1:0},reverse=0,omitT=null,computed={mass:[],H:[],q1:[]};
for(let key of Object.keys(computed))computed[key]=Array.from({length:rows.length},()=>Array(rows.length).fill("0"));
for(let i=0;i<rows.length;i++)for(let j=i;j<rows.length;j++){for(let [key,w,m] of [["mass",false,true],["H",false,false],["q1",true,false]]){let val=evalForm(form(i,j,w,m),i,j,key),expect=parse(refMatrix[key][i][j]);req(eq(val,expect),key+" "+i+","+j+" "+str(val)+" != "+str(expect));counts[key]++;if(val[0])nonzero[key]++;computed[key][i][j]=computed[key][j][i]=str(val);if(key!=="mass"&&(i===j||i===0||j===rows.length-1)){req(eq(val,evalForm(form(j,i,w,m),j,i,key)),"reverse "+key);reverse++}
if(key==="q1"&&!omitT&&i!==j&&J.t[rowIds[i]+","+rowIds[j]].length){let damaged=evalForm(form(i,j,true,false,true),i,j,"control");if(!eq(val,damaged))omitT={i,j,correct:str(val),omitted_t:str(damaged),residual:str(sub(damaged,val))}}}}
req(omitT,"omitted t control absent");
let momentDump=Object.fromEntries([...allMoments].map(([k,v])=>[k,str(v)]));
return {report:{counts,nonzero,weighted_key_count:weightedKeys.size,all_moment_keys:allMoments.size,selected_reverse_checks:reverse,omit_t_control:omitT,orientation_cache_counts:[...orientCache].map(([k,v])=>[k,...v.cacheSizes()]),all_exact:true},moments:momentDump,computed};
}
const D=fileURLToPath(new URL('.',import.meta.url));const B=path.dirname(D);const read=p=>JSON.parse(fs.readFileSync(path.join(B,p),'utf8'));const M=JSON.parse(zlib.gunzipSync(fs.readFileSync(path.join(B,'bfss-mixed104/mixed104_matrices.json.gz'))));const out=integrate(read('bfss-covariant-cross/cross_polynomials.json'),read('bfss-mixed104/jet_polynomials.json'),read('bfss-independent-integrals/mgf_moment_table.json'),read('bfss-mixed104/mixed104_results.json').rows,read('bfss-mixed104/trial-104.json').physical_widths,M);console.log(JSON.stringify(out.report,null,2));if(process.env.WRITE_MOMENTS==='1')fs.writeFileSync('independent_orientation_moments.json',JSON.stringify(out.moments)+'\n');
