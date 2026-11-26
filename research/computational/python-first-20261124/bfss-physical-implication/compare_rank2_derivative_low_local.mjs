export function aggregate(blocks,raw,receipt,massblocks){
 const active=[1,2,3,13,14],N=8072064n,S=330n,D=[1,2,0],pairs=active.flatMap(p=>active.map(q=>[p,q]));let errors=[],eulerErrors=[],counts={},nonzero={},sources={},stats={actions:0,dual_controls:0,max_bound:0};
 const assert=(p,m)=>{if(!p)throw Error(m)};
 let coord=new Map();
 for(let r of blocks){assert(r.diag.join()===D.join()&&r.scale===330&&r.pairs.map(x=>x.join()).join(";")===pairs.map(x=>x.join()).join(";")&&r.anchor.join()==="15473565499392000,0","scope");let key=r.coord.join("");assert(!coord.has(key),"duplicate");coord.set(key,r);for(let k of ["actions","dual_controls"])stats[k]+=r.stats[k];stats.max_bound=Math.max(stats.max_bound,r.stats.max_bound)}
 let mass=new Map();for(let m of massblocks)for(let i=0;i<m.pairs.length;i++){let [p,q]=m.pairs[i];mass.set(p+","+q,BigInt(m.mass[i][0]));mass.set(q+","+p,BigInt(m.mass[i][0]))}
 let out={tau:[],beta:[],nu:[[],[],[]]};
 for(let j=0;j<pairs.length;j++){let [p,q]=pairs[j],ds=blocks[0].deg[p]+blocks[0].deg[q],base=N*S*S*2n**BigInt(Math.floor(ds/2)),radial=0n;
 for(let k of ["tau","beta","nu0","nu1","nu2"]){
 let n=0n,im=0n,axis=k.startsWith("nu")?Number(k[2]):null,f=axis===null?k:"nu";
 if(f==="nu"){if(D[axis]){let v=coord.get(""+axis+axis).nu[j];n=BigInt(v[0])*BigInt(D[axis]);im=BigInt(v[1])*BigInt(D[axis])}radial+=n;out.nu[axis].push(String(n))}
 else {for(let a=0;a<3;a++)for(let i=0;i<3;i++){let v=coord.get(""+a+i)[k][j],mult=i===2?7n:1n;n+=mult*BigInt(v[0]);im+=mult*BigInt(v[1])}if(k==="beta"){n=-n;im=-im}out[k].push(String(n))}
 let den=base*(f==="beta"?2n:1n),rawkey={tau:"tau_raw",beta:"B2_beta_raw",nu:"nu_raw"}[f],expected,src;
 if(Math.max(p,q)<9){let z=f==="nu"?raw[rawkey][(axis+1)%3][p][q]:raw[rawkey][p][q];expected=[BigInt(z),den/(S*S)];src="full_jets"}
 else {let z=f==="nu"?receipt.nu[(axis+1)%3][p][q]:receipt[f][p][q];let [a,b="1"]=String(z).split("/");expected=[BigInt(a),BigInt(b)];src="mixed96"}
 counts[f]=(counts[f]||0)+1;nonzero[f]=(nonzero[f]||0)+ +(n!==0n);sources[src]=(sources[src]||0)+1;if(n*expected[1]!==expected[0]*den||im!==0n)errors.push({f,axis,p,q,actual:n+"/"+den,expected:expected.join("/"),imag:String(im)});
 }
 let rhs=BigInt(blocks[0].deg[q])*36n*mass.get(p+","+q);if(radial!==rhs)eulerErrors.push({p,q,radial:String(radial),rhs:String(rhs)})
 }
 return {scope:"Rank-two five-core direct derivative square; nine signed stabilizer representatives cover all 27 directions; nu includes X factor, beta includes minus and half, Euler contracted not vector",diag:D,active,pairs,multiplicities:[1,1,7,1,1,7,1,1,7],counts,nonzero,sources,errors,eulerChecks:pairs.length,eulerErrors,stats,aggregate_numerators:out};
}
