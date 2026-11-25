// Standalone wrapper for the exact executed stage functions; Node wrapper not separately run.
import fs from 'node:fs'; import path from 'node:path'; import crypto from 'node:crypto'; import {fileURLToPath} from 'node:url';
const {audit,exactJSON,stages} = (()=>{function audit(s,raw,J,P){
const req=(x,m)=>{if(!x)throw Error(m)};
function gcd(a,b){if(a<0n)a=-a;if(b<0n)b=-b;while(b)[a,b]=[b,a%b];return a}
function F(n,d=1n){if(!n)return [0n,1n];if(d<0n){n=-n;d=-d}let g=gcd(n,d);return [n/g,d/g]}
function frac(s){let [n,d="1"]=String(s).split("/");return F(BigInt(n),BigInt(d))}
function add(a,b){return F(a[0]*b[1]+b[0]*a[1],a[1]*b[1])}
function sc(a,n){return F(a[0]*n,a[1])}
function eq(a,b){return a[0]===b[0]&&a[1]===b[1]}
function inv(d){let g=d.map(x=>BigInt(x)**2n);return [g[0]+g[1]+g[2],g[0]*g[1]+g[0]*g[2]+g[1]*g[2],g[0]*g[1]*g[2],g]}
function ev(poly,x,z=0n){return poly.reduce((a,t)=>add(a,sc(frac(t.coefficient),t.exponents.reduce((p,e,i)=>p*x[i]**BigInt(e),1n)*z**BigInt(t.G_power||0))),F(0n))}
const prime=1000003n,mod=x=>(x%prime+prime)%prime;
function pow(a,n){let r=1n;for(;n;n>>=1n,a=mod(a*a))if(n&1n)r=mod(r*a);return r}
function rank(A){A=A.map(r=>r.map(mod));let n=0;for(let j=0;j<A[0].length;j++){let i=A.findIndex((r,k)=>k>=n&&r[j]);if(i<0)continue;[A[n],A[i]]=[A[i],A[n]];let a=pow(A[n][j],prime-2n);for(let k=j;k<A[n].length;k++)A[n][k]=mod(A[n][k]*a);for(let h=n+1;h<A.length;h++){let b=A[h][j];if(b)for(let k=j;k<A[h].length;k++)A[h][k]=mod(A[h][k]-b*A[n][k])}n++}return n}
function basis(d,t){let k=d/2,B=[];for(let j=0;j<=(t?2:0);j++)for(let c=0;3*c<=k-j;c++)for(let b=0;2*b+3*c<=k-j;b++)B.push([k-j-2*b-3*c,b,c,j]);return B}
const degrees=[0,1,2,3,4,5,6,7,8,3,3,4,4,5,5,6,6,7,7,8,8],names=["tau","nu","beta","t","v"],off={tau:-2,nu:0,beta:0,t:2,v:3},rawkeys={tau:"tau_raw",nu:"nu_raw",beta:"B2_beta_raw",t:"B2_t_raw",v:"sqrt2_i_cV_raw"};
let ids=[...s.fit,...s.hold],files=ids.map(n=>`${s.dir}/${s.mass?"mom_":"jet_"}${n}${s.raw?"_p8":""}.json`),D=files.map(p=>raw[p].record),rankMap=new Map(),c={stage:s.dir,fit_fixtures:s.fit,holdouts:s.hold,lists:0,zero_lists:0,coefficients:0,fit_values:0,holdout_values:0,designs:0,source_blobs:Object.fromEntries(files.map(p=>[p,raw[p].sha]))};
for(let k=0;k<D.length;k++)req(D[k].diag.join("")===ids[k],"diag");
function check(poly,d,t,ys,key,forcedZero){let B=d>=0&&d%2===0&&!forcedZero?basis(d,t):[];if(!B.length)req(!poly.length,"forced zero "+key);for(let term of poly){req(term.exponents.length===3&&term.exponents.every(x=>Number.isInteger(x)&&x>=0)&&Number.isInteger(term.G_power||0)&&(term.G_power||0)<=(t?2:0),"basis term "+key);req(2*(term.exponents[0]+2*term.exponents[1]+3*term.exponents[2]+(term.G_power||0))===d,"degree "+key);req(frac(term.coefficient)[0]!==0n,"explicit zero");c.coefficients++}
if(B.length){let k=d+","+t;if(!rankMap.has(k)){let M=D.slice(0,s.fit.length).flatMap(r=>{let [a,b,c,g]=inv(r.diag);return (t?g:[0n]).map(z=>B.map(([i,j,k,l])=>a**BigInt(i)*b**BigInt(j)*c**BigInt(k)*z**BigInt(l)))});let r=rank(M);req(r===B.length,"rank fail "+s.dir+" "+k);rankMap.set(k,r);c.designs++}}
for(let k=0;k<D.length;k++){let [a,b,v,g]=inv(D[k].diag),actual=(t?g:[0n]).map(z=>ev(poly,[a,b,v],z));req(actual.length===ys[k].length,"length");for(let j=0;j<actual.length;j++){req(eq(actual[j],ys[k][j]),"receipt mismatch "+s.dir+" "+key+" "+ids[k]+" "+j+" got "+actual[j]+" want "+ys[k][j]);if(k<s.fit.length)c.fit_values++;else c.holdout_values++}}
c.lists++;if(!poly.length)c.zero_lists++}
if(s.mass){for(let [name,table] of Object.entries(P))for(let [key,poly] of Object.entries(table)){let d=name.split(",").reduce((n,f)=>n+(f==="S"?0:3),Number(key));check(poly,d,false,D.map(r=>[frac(r.moments[name][key])]),name+" "+key,false)}}else{for(let name of names)for(let i=0;i<s.hi;i++)for(let j=0;j<s.hi;j++){if(Math.max(i,j)<s.lo)continue;let t=name==="nu"||name==="t",d=degrees[i]+degrees[j]+off[name],key=i+","+j;let ys=D.map(r=>{let z=s.raw?r[rawkeys[name]]:r[name],vs=t?z.map(x=>x[i][j]):[z[i][j]];if(!s.raw)return vs.map(frac);let den=BigInt(r.N)*2n**BigInt(Math.floor((i+j+(name==="v"?1:0))/2))*(name==="beta"||name==="t"?2n:1n);return vs.map(v=>F(BigInt(v),den))});check(J[name][key],d,t,ys,name+" "+key,name==="t"&&i===j)}}
return c;
}
function exactJSON(s){return JSON.parse(s.replace(/"(?:\\.|[^"\\])*"|-?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?/g,x=>x[0]==='"'||/[.eE]/.test(x)||x.replace("-","").length<16?x:JSON.stringify(x)))}
const stages=[{"dir":"bfss-full-jets","lo":0,"hi":9,"fit":["001","011","012","111","013","112","023","113","122","114","123","133"],"hold":["124","223"],"raw":true},{"dir":"bfss-mixed68","lo":9,"hi":11,"fit":["001","011","012","111","013","112","113","122"],"hold":["023","114"]},{"dir":"bfss-mixed80","lo":11,"hi":13,"fit":["001","011","012","111","013","112","113","122","123","124"],"hold":["023","114"]},{"dir":"bfss-mixed96","lo":13,"hi":17,"fit":["001","011","012","111","013","112","023","113","122","114","123","133"],"hold":["124","223"]},{"dir":"bfss-mixed104","lo":17,"hi":21,"fit":["001","011","012","111","013","112","023","113","122","114","123","133","014","134","125"],"hold":["124","223"]},{"dir":"bfss-covariant-cross","fit":["001","011","012","111","013","112","023","113","122","114","123","133"],"hold":["124","223"],"mass":true}];
return {audit,exactJSON,stages};})();
const base=fileURLToPath(new URL('../',import.meta.url));
const saved=JSON.parse(fs.readFileSync(fileURLToPath(new URL('all_strata_results.json',import.meta.url)),'utf8'));
const pins=Object.assign({},...saved.stages.map(r=>r.source_blobs));
function read(p,sha){let b=fs.readFileSync(path.join(base,p));if(crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex')!==sha)throw Error('blob drift '+p);return b.toString('utf8');}
const J=JSON.parse(read('bfss-mixed104/jet_polynomials.json','f1a0bbb2ba7b585d706e6c56e11fbfb44e167306')),P=JSON.parse(read('bfss-covariant-cross/cross_polynomials.json','95f5dd083eef0d6d5c582c27da91e57323002520'));
const raw=Object.fromEntries(Object.entries(pins).map(([p,sha])=>[p,{sha,record:exactJSON(read(p,sha))}]));
const actual=stages.map(s=>audit(s,raw,J,P));if(JSON.stringify(actual)!==JSON.stringify(saved.stages))throw Error('receipt replay mismatch');console.log(JSON.stringify({all_exact:true,stages:actual},null,2));
