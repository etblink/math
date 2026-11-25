// Pure exact MGF algorithm executed in isolated JS. Node replay: node mgf_moments.mjs
import fs from 'node:fs';
function audit(){
const req=(v,m)=>{if(!v)throw Error(m)},D=11,code=e=>e.reduce((s,x,i)=>s+x*16**i,0),dec=(k,n)=>Array.from({length:n},(_,i)=>(k>>>(4*i))&15),V=[1,16,256,4096,65536,1048576];
function inc(p,k,v){if(!v)return;let x=(p.get(k)||0n)+v;if(x)p.set(k,x);else p.delete(k)}
function pmul(a,b){let r=new Map;for(let [i,x] of a)for(let [j,y] of b)inc(r,i+j,x*y);return r}
function add(p,q,c=1n){for(let [k,v] of q)inc(p,k,c*v);return p}
const one=new Map([[0,1n]]),mon=k=>new Map([[k,1n]]);
function powers(p,n){let a=[one];for(let i=1;i<=n;i++)a.push(pmul(a[i-1],p));return a}
let [a,b,c,d,e,f]=V;
const S=new Map([[a,1n],[b,1n],[c,1n]]),U=new Map([[a+b,1n],[a+c,1n],[b+c,1n],[2*d,-1n],[2*e,-1n],[2*f,-1n]]),W=new Map([[a+b+c,1n],[d+e+f,2n],[a+2*f,-1n],[b+2*e,-1n],[c+2*d,-1n]]);
const det=new Map([[a,-2n],[b,-2n],[c,-2n],[a+b,4n],[a+c,4n],[b+c,4n],[2*d,-1n],[2*e,-1n],[2*f,-1n],[a+b+c,-8n],[a+2*f,2n],[b+2*e,2n],[c+2*d,2n],[d+e+f,-2n]]);
const dt=[...det].map(([k,v])=>[k,dec(k,6),v]),memo=new Map([[0,1n]]);
function fall(n,b){let p=1n;for(let j=0;j<n.length;j++){if(n[j]<b[j])return 0n;for(let k=0;k<b[j];k++)p*=BigInt(n[j]-k)}return p}
function moment(k){if(memo.has(k))return memo.get(k);let al=dec(k,6),j=al.findIndex(x=>x),n=al.slice();n[j]--;let sum=0n;for(let [key,g,co] of dt){if(g.some((x,i)=>x>al[i]))continue;let ff=fall(n,g),term=-2n*ff;if(g[j]){let h=g.slice();h[j]--;term-=9n*BigInt(g[j])*fall(n,h)}if(term)sum+=co*term*moment(k-key)}req(sum%2n===0n,"noninteger MGF moment");let r=sum/2n;memo.set(k,r);return r}
const sp=powers(S,D),up=powers(U,D>>1),vp=powers(W,Math.floor(D/3)),insert=[one,mon(a),new Map([[2*a,1n],[2*d,1n],[2*e,1n]])];
function eigpoly(k,l,m,p){let pol=pmul(pmul(pmul(sp[k],up[l]),vp[m]),insert[p]),out=new Map;for(let [key,c] of pol){let [a,b,c0,d,e,f]=dec(key,6),row=[2*a+d+e,2*b+d+f,2*c0+e+f],v=moment(key);if(row.some(x=>x%2)){req(v===0n,"odd MGF moment");continue}inc(out,code(row.map(x=>x/2)),c*v)}return out}
const L=new Map([[16,1n],[256,1n]]),lp=powers(L,D),Pows=powers(new Map([[1,1n],[4096,-1n]]),D),Qows=powers(new Map([[16,1n],[1+4096,-1n],[2*4096,1n]]),D>>1);
function reduce(out,key,c){if(!c)return;let [s,u,v,x]=dec(key,4);if(x<3){inc(out,key,c);return}reduce(out,key-4096+1,c);reduce(out,key-2*4096+16,-c);reduce(out,key-3*4096+256,c)}
function convert(poly){let p=new Map(poly),res=new Map;while(p.size){let key=-1,rank=-1;for(let k of p.keys()){let [x,y,z]=dec(k,3),r=256*y+16*z+x;if(r>rank){rank=r;key=k}}let [x,y,z]=dec(key,3),co=p.get(key);req(y>=z,"nonsymmetric in y,z");let term=lp[y-z];for(let [k,v] of term)inc(p,k+x+16*z+256*z,-co*v);
let q=pmul(Pows[y-z],Qows[z]);for(let [k,v] of q)reduce(res,k+4096*x,co*v)}return res}
function evalpoly(p,R){let s=0n;for(let [k,v] of p){let a=dec(k,3);s+=v*R.reduce((x,r,i)=>x*r**BigInt(a[i]),1n)}return s}
function evalbasis(p,R){let [a,b,c]=R,ss=a+b+c,uu=a*b+a*c+b*c,vv=a*b*c,rs=[ss,uu,vv,a];let z=0n;for(let [k,v] of p)z+=v*rs.reduce((x,r,i)=>x*r**BigInt(dec(k,4)[i]),1n);return z}
function stein(R){let M=new Map;function E(k,l,m,p,i=0){let key=[k,l,m,p,p?i:0].join(",");if(M.has(key))return M.get(key);let a=R[i],v;if(p===0){if(!k&&!l&&!m)v=1n;else if(k)v=R.reduce((s,_,i)=>s+E(k-1,l,m,1,i),0n);else if(l){let n=E(2,l-1,m,0)-R.reduce((s,_,i)=>s+E(0,l-1,m,2,i),0n);req(n%2n===0n,"Stein half");v=n/2n}else{let n=BigInt(2*m+5)*R.reduce((s,r,i)=>s+r*(E(0,0,m-1,2,i)-E(1,0,m-1,1,i)+E(0,1,m-1,0)),0n);req(n%3n===0n,"Stein third");v=n/3n}}else if(p===1)v=a*(BigInt(9+2*m)*E(k,l,m,0)+(k?BigInt(2*k)*E(k-1,l,m,1,i):0n)+(l?BigInt(2*l)*(E(k+1,l-1,m,1,i)-E(k,l-1,m,2,i)):0n));else v=a*(E(k+1,l,m,0)+BigInt(10+2*l+2*m)*E(k,l,m,1,i)+(k?BigInt(2*k)*E(k-1,l,m,2,i):0n)-(l?BigInt(2*l)*E(k,l-1,m+1,0):0n));M.set(key,v);return v}return E}
const fixtures=[[1n,1n,1n],[2n,3n,5n],[3n,2n,1n],[21n,14n,30n]],es=fixtures.map(stein);
let checks=0,conversionChecks=0,n=0,termCount=0,maxterms=0,byDegree={},table={};
for(let p=0;p<=2;p++)for(let m=0;3*m+p<=D;m++)for(let l=0;2*l+3*m+p<=D;l++)for(let k=0;k+2*l+3*m+p<=D;k++){let deg=k+2*l+3*m+p,poly=eigpoly(k,l,m,p),base=convert(poly);if(!p)req([...base].every(([k])=>dec(k,4)[3]===0),"scalar has x term");for(let i=0;i<fixtures.length;i++){let R=fixtures[i],val=evalpoly(poly,R);req(val===es[i](k,l,m,p,0),"MGF Stein mismatch "+[k,l,m,p,i]);checks++;req(val===evalbasis(base,R),"basis mismatch");conversionChecks++;if(p)for(let j=1;j<3;j++){let rr=[R[j],...R.filter((_,i)=>i!==j)];req(evalpoly(poly,rr)===es[i](k,l,m,p,j),"permuted Stein");checks++;req(evalpoly(poly,rr)===evalbasis(base,rr),"basis mismatch permutation");conversionChecks++}}
table[[k,l,m,p].join(",")]=[...base].map(([key,v])=>[...dec(key,4),v.toString()]);n++;termCount+=base.size;maxterms=Math.max(maxterms,base.size);byDegree[deg]=(byDegree[deg]||0)+1}
const vdiag=moment(a),voff=moment(2*d);req(vdiag===9n&&voff===9n,"control standard moments");req(vdiag!==8n&&voff!==36n,"negative control");
return {table,report:{max_gram_degree:D,moment_polynomial_count:n,scalar_matrix_basis_terms:termCount,maximum_terms:maxterms,mgf_monomial_moments:memo.size,stein_exact_comparisons:checks,basis_evaluation_checks:conversionChecks,fixtures:fixtures.map(r=>r.map(String)),degree_counts:byDegree,negative_controls:{wrong_column_count:{expected:"9",wrong:"8"},missing_off_diagonal_half:{expected:"9",wrong:"36"}},all_exact:true,scale:"Each coefficient represents E of the Gram polynomial with G replaced by 2G; divide by 2^total Gram degree."}}
}
const out=audit(); console.log(JSON.stringify(out.report,null,2)); if(process.env.WRITE_MGF==='1')fs.writeFileSync('mgf_moment_table.json',JSON.stringify(out.table)+'\n');
