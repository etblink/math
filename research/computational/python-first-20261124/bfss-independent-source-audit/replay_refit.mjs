// Exact replay of the independently executed rational reconstruction.
// Node.js: node replay_refit.mjs [path-to-bfss-mixed104]
import fs from 'node:fs';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import crypto from 'node:crypto';
function replay(data){
const names=["001","011","012","111","013","112","023","113","122","114","123","133","014","134","125","124","223"],fit=names.slice(0,15),hold=names.slice(15),req=(a,m)=>{if(!a)throw Error(m)};
function gcd(a,b){if(a<0n)a=-a;if(b<0n)b=-b;while(b)[a,b]=[b,a%b];return a}
function F(n,d=1n){if(!n)return [0n,1n];if(d<0n){n=-n;d=-d}let g=gcd(n,d);return [n/g,d/g]}
function P(s){let [n,d="1"]=s.split("/");return F(BigInt(n),BigInt(d))}
function add(a,b){if(!a[0])return b;if(!b[0])return a;let g=gcd(a[1],b[1]);return F(a[0]*(b[1]/g)+b[0]*(a[1]/g),a[1]/g*b[1])}
function mul(a,b){if(!a[0]||!b[0])return F(0n);let g=gcd(a[0],b[1]),h=gcd(b[0],a[1]);return [(a[0]/g)*(b[0]/h),(a[1]/h)*(b[1]/g)]}
function sub(a,b){return add(a,[-b[0],b[1]])}
function div(a,b){return mul(a,F(b[1],b[0]))}
function eq(a,b){return a[0]===b[0]&&a[1]===b[1]}
function ip(a,b){let r=F(0n);for(let j=0;j<a.length;j++)r=add(r,mul(a[j],b[j]));return r}
const prime=1000003n,mod=x=>(x%prime+prime)%prime;function pow(x,n){let r=1n;for(;n;n>>=1n,x=mod(x*x))if(n&1n)r=mod(r*x);return r}
function pick(M,n){let A=M.slice(0,n).map(r=>r.map(mod)),ids=Array.from({length:n},(_,i)=>i),r=0;for(let j=0;j<M[0].length;j++){let h=A.findIndex((v,i)=>i>=r&&v[j]!==0n);req(h>=0,"rank fail");[A[r],A[h]]=[A[h],A[r]];[ids[r],ids[h]]=[ids[h],ids[r]];let s=pow(A[r][j],prime-2n);for(let k=j;k<A[r].length;k++)A[r][k]=mod(A[r][k]*s);for(let i=r+1;i<n;i++){let z=A[i][j];if(z)for(let k=j;k<A[i].length;k++)A[i][k]=mod(A[i][k]-z*A[r][k])}r++}return ids.slice(0,r)}
function inverse(M){let n=M.length,A=M.map((r,i)=>[...r.map(x=>F(x)),...Array.from({length:n},(_,j)=>F(i===j?1n:0n))]);for(let j=0;j<n;j++){let h=A.findIndex((v,i)=>i>=j&&v[j][0]!==0n);req(h>=0,"singular exact");[A[j],A[h]]=[A[h],A[j]];let a=A[j][j];A[j]=A[j].map(x=>div(x,a));for(let i=0;i<n;i++)if(i!==j&&A[i][j][0]){let b=A[i][j];A[i]=A[i].map((x,k)=>sub(x,mul(b,A[j][k])))}}return A.map(r=>r.slice(n))}
function bs(d,t){let k=d/2,out=[];for(let j=0;j<=(t?2:0);j++)for(let l=0;3*l<=k-j;l++)for(let b=0;2*b<=k-j-3*l;b++)out.push([k-j-2*b-3*l,b,l,j]);return out}
function row(x,b,t){let g=x.map(x=>BigInt(x)**2n),s=g.reduce((a,b)=>a+b,0n),u=g[0]*g[1]+g[1]*g[2]+g[2]*g[0],v=g[0]*g[1]*g[2];return (t?g:[0n]).map(z=>b.map(([a,b,c,j])=>s**BigInt(a)*u**BigInt(b)*v**BigInt(c)*z**BigInt(j)))}
const D=data.map(x=>x.record),degrees=D[0].degrees;req(D.every((r,i)=>r.diag.join("")===names[i]&&r.degrees.join(",")===degrees.join(",")),"receipt metadata");
const cache=new Map();function setup(d,t){let key=d+","+t;if(cache.has(key))return cache.get(key);let b=bs(d,t),m=D.flatMap(r=>row(r.diag,b,t)),nfit=fit.length*(t?3:1),p=pick(m,nfit),inv=inverse(p.map(i=>m[i])),result={b,m:m.map(r=>r.map(x=>F(x))),p,inv,nfit};cache.set(key,result);return result}
let fits=0,zeros=0,fitChecks=0,holdChecks=0,zeroEntries=0,nnz=0,nonzeroHold=0,counts={};const coeffs={};
for(let name of ["tau","nu","beta","t","v"]){coeffs[name]={};let t=name==="nu"||name==="t",off={tau:-2,nu:0,beta:0,t:2,v:3}[name],c={fits:0,zeros:0,train:0,hold:0,zeroEntries:0};for(let i=0;i<21;i++)for(let j=0;j<21;j++){if(Math.max(i,j)<17)continue;let d=degrees[i]+degrees[j]+off,ys=D.flatMap(r=>t?r[name].map(x=>P(x[i][j])):[P(r[name][i][j])]);if(d<0||d%2||(name==="t"&&i===j)){req(ys.every(x=>x[0]===0n),"zero "+name+i+","+j);coeffs[name][i+","+j]=[];zeros++;c.zeros++;zeroEntries+=ys.length;c.zeroEntries+=ys.length;continue}let s=setup(d,t),rhs=s.p.map(k=>ys[k]),v=s.inv.map(r=>ip(r,rhs));for(let k=0;k<ys.length;k++){let x=ip(s.m[k],v);req(eq(x,ys[k]),"fit mismatch "+name+" "+i+","+j+" "+k);if(k<s.nfit){fitChecks++;c.train++}else{holdChecks++;c.hold++;if(x[0])nonzeroHold++}}fits++;c.fits++;nnz+=v.filter(x=>x[0]).length;coeffs[name][i+","+j]=v.map((x,k)=>[...s.b[k],x[0].toString(),x[1].toString()]).filter(x=>x[4]!=="0")}
counts[name]=c}
let sym=0;for(let n of ["tau","v","t"])for(let i=0;i<21;i++)for(let j=0;j<21;j++){if(Math.max(i,j)<17)continue;let a=coeffs[n][i+","+j],b=coeffs[n][j+","+i];req(a.length===b.length,"sym length");for(let k=0;k<a.length;k++){req(a[k].slice(0,4).join(",")===b[k].slice(0,4).join(",")&&BigInt(a[k][4])===(n==="t"?-1n:1n)*BigInt(b[k][4])&&a[k][5]===b[k][5],"sym coeff");sym++}}
return {report:{fixtures:D.length,training:fit.length,holdouts:hold,designs:cache.size,fit_polynomials:fits,zero_polynomials:zeros,fit_point_exact_checks:fitChecks,holdout_exact_checks:holdChecks,nonzero_holdout_comparisons:nonzeroHold,structural_zero_entries:zeroEntries,nonzero_coefficients:nnz,coefficient_symmetry_checks:sym,by_family:counts,all_exact:true,source_blobs:Object.fromEntries(names.map((n,i)=>[n,data[i].sha]))},coeffs};
}
const dir=process.argv[2] || fileURLToPath(new URL('../bfss-mixed104/',import.meta.url));
const names=["001","011","012","111","013","112","023","113","122","114","123","133","014","134","125","124","223"];
const pins={"111":"e9940db1bb3d7fe11db4b7fbd163136c69b8bea6","112":"c169414f8b60c4375b07695bc79c37d0b03c6968","113":"42352cdf21cd0f8f55d16112f3a6da0feaf288ff","114":"ea9171de0a80f589b92fce3f3b1299da2038fab4","122":"a8c28c11f6891ba9c6415bccd02b44c314bd5469","123":"035863559cac8eed8219490fe5263615409ef3cb","124":"82367a4e8ee25d55e8d9a0dd05359d60f2bc6b12","125":"4ee120df341e60d00c025e83a576caf3d51107f6","133":"ead35854cb78dcbefe8b40bafe3ea5cfd6cb0685","134":"87929133edb5a1162924c863429c13b4fec3cc42","223":"de296e8a30a29a7a7308f0905a406f88d17859e6","001":"89a8c71ccf96f20ed9f6c378341d826135b47afd","011":"9623bd3e1e5a7d317f350fc70ef99833da569f90","012":"231095afb7ee91346146eea80d464bfe79aec2dc","013":"c87d4e1725ad564129cd70dc5f2538d22a76d8e5","023":"9ea9255888bb461dc8e412b29cd012bd7123fa2a","014":"a6f220e68e246c694091284e2934ba955e690ae7"};
const data=names.map(n=>{const b=fs.readFileSync(path.join(dir,'jet_'+n+'.json'));const sha=crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(sha!==pins[n])throw Error('input blob drift '+n);return {sha,record:JSON.parse(b.toString('utf8'))};});
const result=replay(data);console.log(JSON.stringify(result.report,null,2));if(process.env.WRITE_REFIT==='1')fs.writeFileSync('independent_refit_coefficients.json',JSON.stringify(result.coeffs,null,2)+'\n');
