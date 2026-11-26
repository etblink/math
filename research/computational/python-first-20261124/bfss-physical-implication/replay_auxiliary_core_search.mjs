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

 // Exact Sylvester criterion by symmetric fraction-free elimination.
 let den=1n;for(let k of keys)den=den/gcd(den,E[k].den)*E[k].den;
 const C=rows.map((_,i)=>rows.map((_,j)=>66n*(E.q1.B[i][j]*(den/E.q1.den)-E.H.B[i][j]*(den/E.H.den))-25n*E.mass.B[i][j]*(den/E.mass.den)));
 function positive(ix){
 let B=ix.map(i=>ix.map(j=>C[i][j]));let g=0n;for(let r of B)for(let x of r)g=gcd(g,x);assert(g>0n,"zero matrix");B=B.map(r=>r.map(x=>x/g));
 let prev=1n,pivots=[];
 for(let k=0;k<B.length;k++){
 let q=B[k][k];pivots.push({sign:q>0n?1:q<0n?-1:0,decimal_digits:String(q<0n?-q:q).length});
 if(q<=0n)return {positive:false,pivots,stopped:k};
 for(let i=k+1;i<B.length;i++)for(let j=i;j<B.length;j++){
 let v=B[i][j]*q-B[i][k]*B[k][j];assert(v%prev===0n,"Bareiss division");B[i][j]=B[j][i]=v/prev;
 }
 prev=q;
 }
 return {positive:true,pivots};
 }
 let exclusions={};for(let name of ['S','S+Phi','S+H3','total_degree_through7','width0_both','width1_both','no_invariants','S+both_through3','no_s']){let i=spaces[name];exclusions[name]={rows:i.length,...positive(i)}}
 // Group deletion by distinct core, followed by row reduction only if needed.
 function groupPrune(start,target){
 let i=start.slice();let e=eig(i),c=cert(i,e),trajectory=[];
 if(!c.strict_pass)return {skipped:true};
 while(true){
 let groups=[...new Set(i.map(p=>rows[p].seed+':'+rows[p].power))],best=null;
 for(let group of groups){let j=i.filter(p=>rows[p].seed+':'+rows[p].power!==group);if(!j.length)continue;let ev=eig(j);if(ev.value<target&&(!best||ev.value<best.ev.value))best={group,j,ev}}
 if(!best)break;
 let cc=cert(best.j,best.ev);if(!cc.strict_pass||cc.q_aux_decimal>=target)break;
 i=best.j;c=cc;trajectory.push({removed_core:best.group,remaining_rows:i.length,q_aux:c.q_aux_decimal});
 }
 const coreLabels=[...new Set(i.map(p=>rows[p].seed+':'+rows[p].power))];
 return {initial_rows:start.length,final_rows:i.length,core_count:coreLabels.length,core_labels:coreLabels,trajectory,...c,remaining:i.map(p=>rows[p])};
 }
 let group_results={};for(let name of ['all','s_only','no_u','no_v_det'])for(let target of [.375,.3785])group_results[name+'_'+target]=groupPrune(spaces[name],target);
 return {scope:'Exact finite threshold exclusions and heuristic group pruning of frozen matrices. No source replay.',exclusions,group_results}
}
const D=dirname(fileURLToPath(import.meta.url));
function readPinned(path,expected){let b=readFileSync(path);let sha=createHash('sha1').update('blob '+b.length+'\\0'.replace('\\0','\0')).update(b).digest('hex');if(sha!==expected)throw Error('blob mismatch '+path+' '+sha);return b;}
const raw=JSON.parse(gunzipSync(readPinned(resolve(D,'../bfss-mixed104/mixed104_matrices.json.gz'),'07fb3c65e81b342034f2330d710bce400ab7ec05')));
const rows=JSON.parse(readPinned(resolve(D,'../bfss-mixed104/mixed104_results.json'),'935ddcebcaeccb2d92ef1c20ec01520eb423320d')).rows;
console.log(JSON.stringify({...explore(raw,rows),matrix_blob:'07fb3c65e81b342034f2330d710bce400ab7ec05',metadata_blob:'935ddcebcaeccb2d92ef1c20ec01520eb423320d'},null,2));
