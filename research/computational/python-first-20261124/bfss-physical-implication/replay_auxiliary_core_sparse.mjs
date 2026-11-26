// Reproduce finite auxiliary-energy ablation; no GitHub Actions needed.
import {readFileSync} from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {createHash} from 'node:crypto';
import {fileURLToPath} from 'node:url';
import {dirname,resolve} from 'node:path';
function explore(raw,rows){
 const n=rows.length,assert=(p,m)=>{if(!p)throw Error(m)};
 function rat(s){let [a,b="1"]=s.split("/");return [BigInt(a),BigInt(b)]}
 function gcd(a,b){a=a<0n?-a:a;b=b<0n?-b:b;while(b){[a,b]=[b,a%b]}return a}
 function reduce(a,b){let g=gcd(a,b);return [a/g,b/g]}
 const fraction=([a,b])=>`${a}/${b}`, f=([a,b])=>Number(a)/Number(b);
 function sub([a,b],[c,d]){return reduce(a*d-b*c,b*d)}
 function div([a,b],[c,d]){return reduce(a*d,b*c)}
 const keys=["mass","H","q1"];
 const R=Object.fromEntries(keys.map(k=>[k,raw[k].map(row=>row.map(rat))]));
 for(const k of keys)for(let i=0;i<n;i++)for(let j=0;j<i;j++){let [a,b]=R[k][i][j],[c,d]=R[k][j][i];assert(a*d===c*b,"symmetry")}
 const M0=R.mass.map(r=>r.map(f)), H0=R.H.map(r=>r.map(f)), Q0=R.q1.map(r=>r.map(f));
 const D=M0.map((r,i)=>Math.sqrt(r[i]));assert(D.every(d=>d>0&&Number.isFinite(d)),"mass diagonal");
 const M=M0.map((r,i)=>r.map((v,j)=>v/(D[i]*D[j]))), A=Q0.map((r,i)=>r.map((v,j)=>(v-H0[i][j])/(D[i]*D[j])));
 const Q=Q0.map((r,i)=>r.map((v,j)=>v/(D[i]*D[j])));
 const dot=(u,v)=>u.reduce((s,x,i)=>s+x*v[i],0);
 const mv=(B,x)=>B.map(r=>dot(r,x));
 function chol(B){let L=B.map(r=>r.map(()=>0));for(let i=0;i<B.length;i++)for(let j=0;j<=i;j++){let s=B[i][j];for(let k=0;k<j;k++)s-=L[i][k]*L[j][k];if(i===j){if(!(s>0))throw Error("nonpositive numerical pivot "+i+" "+s);L[i][j]=Math.sqrt(s)}else L[i][j]=s/L[j][j]}return L}
 function solve(L,b){let y=b.slice(),z=b.slice();for(let i=0;i<L.length;i++){for(let j=0;j<i;j++)y[i]-=L[i][j]*y[j];y[i]/=L[i][i]}for(let i=L.length-1;i>=0;i--){z[i]=y[i];for(let j=i+1;j<L.length;j++)z[i]-=L[j][i]*z[j];z[i]/=L[i][i]}return z}
 function eig(ix,B=A){let m=ix.map(i=>ix.map(j=>M[i][j])),a=ix.map(i=>ix.map(j=>B[i][j]));let L=chol(a);let x=ix.map((i,j)=>Math.sin((i+1)*1.37)+Math.cos((j+1)*.71));let previous=Infinity,v=0,iter=0;
 for(;iter<250;iter++){x=solve(L,mv(m,x));let norm=Math.sqrt(dot(x,mv(m,x)));x=x.map(v=>v/norm);v=dot(x,mv(a,x));if(Math.abs(v-previous)<1e-12*Math.max(1,Math.abs(v))&&iter>25)break;previous=v}
 let res=mv(a,x).map((z,i)=>z-v*mv(m,x)[i]);return {value:v,x,iter,residual:Math.sqrt(dot(res,res))}}
 const ix=fn=>rows.map((r,i)=>fn(r)?i:-1).filter(i=>i>=0);
 const spaces={};function set(k,fn){let i=ix(fn);if(i.length)spaces[k]=i}
 set("all",()=>true);set("S",r=>r.seed==="S");set("S+Phi",r=>r.seed!=="H3");set("S+H3",r=>r.seed!=="Phi");
 for(let p=0;p<=8;p++)set("S_through"+p,r=>r.seed==="S"&&r.power<=p);
 for(let p=0;p<=5;p++)for(let fam of ["both","Phi","H3"])set("S+"+fam+"_through"+p,r=>r.seed==="S"||(r.power<=p&&(fam==="both"||r.seed===fam)));
 for(let p=2;p<=8;p++)set("total_degree_through"+p,r=>r.power+(r.seed==="S"?0:3)+r.exponents.reduce((s,e,j)=>s+2*(j+1)*e,0)<=p);
 for(let w of [0,1])for(let fam of ["both","S","S+H3","S+Phi"])set("width"+w+"_"+fam,r=>r.width===w&&(fam==="both"||fam==="S"&&r.seed==="S"||fam==="S+H3"&&r.seed!=="Phi"||fam==="S+Phi"&&r.seed!=="H3"));
 set("no_invariants",r=>r.exponents.every(x=>!x));set("s_only",r=>!r.exponents[1]&&!r.exponents[2]);set("no_v_det",r=>!r.exponents[2]);set("no_u",r=>!r.exponents[1]);set("no_s",r=>!r.exponents[0]);
 for(let p=3;p<=8;p++)for(let fam of ["S+H3","both"])set(fam+"_S_cap"+p,r=>(r.seed==="S"&&r.power<=p)||(r.seed!=="S"&&(fam==="both"||r.seed==="H3")));
 // Encode the archive as exact integer matrices over a common denominator.
 const E={};for(const k of keys){let den=1n;for(const r of R[k])for(const [a,b] of r)den=den/gcd(den,b)*b;E[k]={den,B:R[k].map(r=>r.map(([a,b])=>a*(den/b)))}}
 function cert(i,e){let c=e.x.map((x,k)=>x/D[i[k]]),mx=Math.max(...c.map(Math.abs));c=c.map(x=>BigInt(Math.round(x/mx*1e24)));let g=c.reduce((g,x)=>gcd(g,x),0n);c=c.map(x=>x/g);
 const quad=k=>{let {den,B}=E[k],s=0n;for(let p=0;p<i.length;p++){s+=c[p]*c[p]*B[i[p]][i[p]];for(let q=0;q<p;q++)s+=2n*c[p]*c[q]*B[i[p]][i[q]]}return reduce(s,den)};
 const mass=quad("mass");assert(mass[0]>0n,"exact mass positivity");let h=div(quad("H"),mass),q1=div(quad("q1"),mass),aux=sub(q1,h);let pass=aux[0]*66n<25n*aux[1];
 return {q_aux_decimal:f(aux),q_H_decimal:f(h),q1_decimal:f(q1),strict_pass:pass,fidelity_lower_decimal:1-66/25*f(aux),q_aux_exact:fraction(aux),q_H_exact:fraction(h),q1_exact:fraction(q1),labels:i.map(k=>rows[k].label),integer_coefficients:c.map(String)}
 }

 function inv(B){const n=B.length,T=B.map((r,i)=>r.concat(Array.from({length:n},(_,j)=>+(i===j))));for(let j=0;j<n;j++){let p=j;for(let i=j+1;i<n;i++)if(Math.abs(T[i][j])>Math.abs(T[p][j]))p=i;[T[p],T[j]]=[T[j],T[p]];let q=T[j][j];assert(Math.abs(q)>1e-15,'singular threshold matrix');for(let k=0;k<2*n;k++)T[j][k]/=q;for(let i=0;i<n;i++)if(i!==j){q=T[i][j];if(q)for(let k=0;k<2*n;k++)T[i][k]-=q*T[j][k]}}
 return T.map(r=>r.slice(n));}
 function prune(start,target,mode){let i=start.slice();let t=target;let K=inv(i.map(p=>i.map(q=>A[p][q]-t*M[p][q])));let traj=[],current=eig(i),c0=cert(i,current);
 if(!(c0.q_aux_decimal<t))return {target,mode,initial:c0.q_aux_decimal,skipped:true};
 traj.push({rows:i.length,q_aux:c0.q_aux_decimal});
 while(i.length>1){
 let options=i.map((p,j)=>({j,label:rows[p].label,k:K[j][j],score:K[j][j]>0?current.x[j]**2/K[j][j]:Infinity})).filter(o=>o.k>1e-9&&Number.isFinite(o.score)).sort((a,b)=>a.score-b.score||a.label-b.label);
 if(!options.length)break;
 // Try a few numerically ranked removals; retain only if exact quotient stays below target.
 let ok=null;let chosen=mode===0?options.slice(0,4):mode===1?options.slice(0,8).reverse():options.slice(0,6).sort((a,b)=>b.k-a.k);
 for(let o of chosen){let test=i.filter((_,j)=>j!==o.j),e=eig(test),c=cert(test,e);if(c.q_aux_decimal<t&&c.strict_pass){ok={o,test,e,c};break}}
 if(!ok)break;
 let {o,test,e,c}=ok,j=o.j,k=K[j][j];K=K.filter((_,p)=>p!==j).map((r,p)=>r.map((v,q)=>v-K[p>=j?p+1:p][j]*K[j][q]/k).filter((_,q)=>q!==j));
 i=test;current=e;c0=c;traj.push({removed:o.label,rows:i.length,q_aux:c.q_aux_decimal});
 // Avoid accumulated inverse roundoff; recompute from threshold matrix.
 if(traj.length%6===0)K=inv(i.map(p=>i.map(q=>A[p][q]-t*M[p][q])));
 }
 return {target,mode,initial_rows:start.length,trajectory:traj,final_rows:i.length,...c0,remaining: i.map(k=>rows[k])};
 }

 const starts={"all_0.375":[1,2,3,4,5,6,37,39,40,54,55,56,57,58,59,90,107,108,109,110,160,161,213,214,425,426,427,428,429,430,461,463,464,478,479,480,481,482,483,514,531,532,533,534,584,585,637,638,1066,1068,1069,1094,1096,1097,1150,1234],"no_v_det_0.375":[1,2,3,4,5,6,37,39,40,54,55,56,57,58,59,90,107,108,109,110,160,161,425,426,427,428,429,430,461,463,464,478,479,480,481,482,483,514,531,532,533,534,584,585,1066,1068,1069,1094,1096,1097,1150,1234],"no_u_0.375":[1,2,3,4,5,6,35,37,38,39,40,54,55,56,57,58,59,88,90,91,213,214,425,426,427,428,429,430,459,461,462,463,464,478,479,480,481,482,483,512,514,515,637,638,1066,1067,1068,1069,1094,1095,1096,1097,1150,1151,1234,1235]};
 let results={};
 for(let [name,labels] of Object.entries(starts)){
 const start=ix(r=>labels.includes(r.label));assert(start.length===labels.length,'group labels');
 for(let target of [.3749,.376,.3785])for(let mode of [0,1]){
 let key=name+'_'+target+'_'+mode;
 results[key]=prune(start,target,mode);
 }
 }
 return {scope:'Heuristic row pruning within preselected core spaces. Exact finite matrix upper bounds, no global minimality.',results}
}
}
const D=dirname(fileURLToPath(import.meta.url));
function readPinned(path,expected){let b=readFileSync(path);let sha=createHash('sha1').update('blob '+b.length+'\\0'.replace('\\0','\0')).update(b).digest('hex');if(sha!==expected)throw Error('blob mismatch '+path+' '+sha);return b;}
const raw=JSON.parse(gunzipSync(readPinned(resolve(D,'../bfss-mixed104/mixed104_matrices.json.gz'),'07fb3c65e81b342034f2330d710bce400ab7ec05')));
const rows=JSON.parse(readPinned(resolve(D,'../bfss-mixed104/mixed104_results.json'),'935ddcebcaeccb2d92ef1c20ec01520eb423320d')).rows;
console.log(JSON.stringify({...explore(raw,rows),matrix_blob:'07fb3c65e81b342034f2330d710bce400ab7ec05',metadata_blob:'935ddcebcaeccb2d92ef1c20ec01520eb423320d'},null,2));
