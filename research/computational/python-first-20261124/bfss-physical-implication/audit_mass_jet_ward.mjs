export function auditMassJetWard(P, R, diag, active) {
  // Exact rational arithmetic; checks do not reuse the stored Euler flag.
  const gcd=(a,b)=>{if(a<0n)a=-a;if(b<0n)b=-b;while(b)[a,b]=[b,a%b];return a};
  const F=(n,d=1n)=>{if(!d)throw Error("zero denominator");if(!n)return [0n,1n];if(d<0n){n=-n;d=-d}let h=gcd(n,d);return [n/h,d/h]};
  const fr=s=>{let [n,d="1"]=String(s).split("/");return F(BigInt(n),BigInt(d))};
  const add=(a,b)=>F(a[0]*b[1]+b[0]*a[1],a[1]*b[1]);
  const neg=a=>[-a[0],a[1]], sc=(a,n)=>F(a[0]*n,a[1]);
  const mul=(a,b)=>F(a[0]*b[0],a[1]*b[1]);
  const eq=(a,b)=>a[0]===b[0]&&a[1]===b[1];
  const str=a=>a[0]+"/"+a[1], Z=()=>F(0n);
  const g=diag.map(d=>BigInt(d)**2n),s=g.reduce((a,b)=>a+b,0n),u=g[0]*g[1]+g[0]*g[2]+g[1]*g[2],v=g.reduce((a,b)=>a*b,1n),X=[s,u,v];
  const core=Array.from({length:21},(_,i)=>i<9?["S",i]:[(i-9)%2===0?"Phi":"H3",Math.floor((i-9)/2)]);
  const order={S:0,Phi:1,H3:2},degree=i=>core[i][1]+(i<9?0:3);
  const pol=(i,j)=>{let [a,p]=core[i],[b,q]=core[j];if(order[a]>order[b])[a,b]=[b,a];let x=P[a+","+b]?.[p+q];if(!Array.isArray(x))throw Error("missing moment "+a+","+b+":"+ (p+q));return x};
  const ev=(poly,der=-1)=>poly.reduce((acc,t)=>{let e=t.exponents.slice(),c=fr(t.coefficient);if(der>=0){if(!e[der])return acc;c=sc(c,BigInt(e[der]));e[der]--;}return add(acc,sc(c,e.reduce((z,a,k)=>z*X[k]**BigInt(a),1n)))},Z());
  const stage=(i,j)=>{let k=Math.max(i,j);return k<9?"full":k<11?"68":k<13?"80":k<17?"96":"104"};
  const val=(name,i,j,a)=>{let key=stage(i,j),r=R[key];if(!r||r.diag.join()!==diag.join())throw Error("missing or wrong fixture "+key);if(key!=="full")return fr(name==="nu"||name==="t"?r[name][a][i][j]:r[name][i][j]);const keys={tau:"tau_raw",nu:"nu_raw",beta:"B2_beta_raw",t:"B2_t_raw",v:"sqrt2_i_cV_raw"};let n=BigInt(name==="nu"||name==="t"?r[keys[name]][a][i][j]:r[keys[name]][i][j]);return F(n,BigInt(r.N)*2n**BigInt(Math.floor((i+j+(name==="v"?1:0))/2))*(name==="beta"||name==="t"?2n:1n))};
  const counts={},nonzero={},byStage={},errors=[];
  const check=(name,actual,expected,i,j,a=null)=>{counts[name]=(counts[name]||0)+1;if(actual[0]||expected[0])nonzero[name]=(nonzero[name]||0)+1;let k=stage(i,j);byStage[k]=(byStage[k]||0)+1;if(!eq(actual,expected))errors.push({name,i,j,a,actual:str(actual),expected:str(expected)})};
  for(const i of active)for(const j of active) {
    let Pij=pol(i,j),M=ev(Pij),n=g.map((_,a)=>val("nu",i,j,a)),tn=g.map((_,a)=>val("t",i,j,a));
    check("euler",n.reduce(add,Z()),sc(M,BigInt(degree(j))),i,j);
    for(let a=0;a<3;a++){
      let k=g[a],D=add(ev(Pij,0),add(sc(ev(Pij,1),s-k),sc(ev(Pij,2),u-s*k+k*k)));
      check("mass_derivative",add(n[a],val("nu",j,i,a)),sc(D,2n*k),i,j,a);
      check("t_antisym",tn[a],neg(val("t",j,i,a)),i,j,a);
    }
    check("t_trace",tn.reduce(add,Z()),Z(),i,j);
    check("tau_symmetry",val("tau",i,j),val("tau",j,i),i,j);
    check("v_symmetry",val("v",i,j),val("v",j,i),i,j);
    if(i===j){const m=M,tau=val("tau",i,i);if(m[0]<0n||tau[0]<0n)errors.push({name:"negative_gram_diag",i,m:str(m),tau:str(tau)});}
  }
  return {diag,active,scope:"Exact Ward and consistency identities across archived independently constructed mass and jet values; no new raw occupation action",counts,nonzero,byStage,errors,total:Object.values(counts).reduce((a,b)=>a+b,0),status:errors.length?"DISCREPANCY":"SURVIVED_FINITE_TESTS"};
}
export function exactJSON(s){return JSON.parse(s.replace(/"(?:\\.|[^"\\])*"|-?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?/g,x=>x[0]==='"'||/[.eE]/.test(x)||x.replace("-","").length<16?x:JSON.stringify(x)))}
