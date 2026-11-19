#!/usr/bin/env node
/**
 * RHOPF-P0 research-only exact integer consumer (not Lean qualification).
 * Runs from a checkout. Default: FAIL CLOSED unless the literal original
 * Lean gamma source hashes and parses identically to the cached data.
 * CLI --fixture-only is exploratory and explicitly NOT source acceptance.
 *
 * node research/topology/tools/rhopf_source_exact_consumer.mjs
 */
import assert from "node:assert/strict";
import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
import {fileURLToPath} from "node:url";

const dir=path.dirname(fileURLToPath(import.meta.url));
const root=path.resolve(dir,"../../..");
const fixturePath=path.resolve(dir,"../data/BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json");
const fixture=JSON.parse(fs.readFileSync(fixturePath,"utf8"));
const {perm:p,sign:s}=fixture;
assert.equal(fixture.source_git_blob_sha,"b9b8192055c70f0d001d7982669b9823c55562ed");
assert.equal(p.length,9);assert.equal(s.length,9);
const fixtureOnly=process.argv.includes("--fixture-only");
if(!fixtureOnly){
  const sourcePath=path.join(root,fixture.source_path);
  const bytes=fs.readFileSync(sourcePath);
  const hashed=crypto.createHash("sha1").update(Buffer.concat([
    Buffer.from("blob "+bytes.length+"\0"),bytes
  ])).digest("hex");
  assert.equal(hashed,fixture.source_git_blob_sha,"original BFSS source byte drift");
  const lean=bytes.toString("utf8");
  function scan(name,next) {
    const begin=lean.indexOf("private def "+name),end=lean.indexOf("private def "+next,begin);
    assert(begin>=0&&end>begin);
    const a=[...lean.slice(begin,end).matchAll(/\|\s+(\d+)\s+=>\s+!\[([\s\S]*?)\]/g)];
    return a.map(m=>m[2].split(",").map(x=>Number(x.trim())).filter(Number.isFinite));
  }
  assert.deepEqual(scan("perm","sign"),p,"original permutation drift");
  assert.deepEqual(scan("sign","gammaInt"),s,"original sign drift");
}
const ck=(condition,label)=>assert(condition,label);
for(let k=0;k<9;k++){
  ck(p[k].length===16&&s[k].length===16,"original gamma shape");
  ck(p[k].slice().sort((a,b)=>a-b).every((v,i)=>v===i),"permutation not bijective");
  for(let i=0;i<16;i++){
    let j=p[k][i];
    ck(p[k][j]===i&&s[k][i]===s[k][j],"source gamma not symmetric");
    ck(Math.abs(s[k][i])===1,"nonunit gamma sign");
  }
}
for(let a=0;a<9;a++)for(let b=0;b<9;b++)for(let i=0;i<16;i++){
  const abj=p[b][p[a][i]],baj=p[a][p[b][i]];
  const abs=s[a][i]*s[b][p[a][i]],bas=s[b][i]*s[a][p[b][i]];
  for(let j=0;j<16;j++){
    const val=(abj===j?abs:0)+(baj===j?bas:0);
    assert.equal(val,a===b&&i===j?2:0,"Clifford entry mismatch");
  }
}
const poly=new Map(), plus=(key,val)=>poly.set(key,(poly.get(key)||0)+val);
const sorted=xs=>xs.slice().sort((a,b)=>a-b).join(",");
const termSizes=[];
for(let k=0;k<9;k++){
  const q=new Map();
  for(let i=0;i<16;i++) {
    const key=sorted([i,p[k][i]]);
    q.set(key,(q.get(key)||0)+s[k][i]);
  }
  const terms=[...q.entries()].filter(([,v])=>v!==0);
  termSizes.push(terms.length);
  for(const [ab,x] of terms)for(const [cd,y] of terms)
    plus(sorted([...ab.split(",").map(Number),...cd.split(",").map(Number)]),x*y);
}
for(let i=0;i<16;i++)for(let j=0;j<16;j++)
  plus(sorted([i,i,j,j]),-1);
const bad=[...poly.entries()].filter(([,v])=>v!==0);
assert.deepEqual(bad,[],"quartic source Spin(9) norm identity failed");

assert.deepEqual(p[8],Array.from({length:16},(_,i)=>i));
assert.deepEqual(s[8],Array.from({length:16},(_,i)=>i<8?1:-1));
const comp=new Map(), add=(key,v)=>comp.set(key,(comp.get(key)||0)+v);
for(let k=0;k<8;k++)for(let i=0;i<8;i++)for(let j=0;j<8;j++){
  const ia=p[k][i]-8,ja=p[k][j]-8;
  ck(ia>=0&&ia<8&&ja>=0&&ja<8,"source off-block error");
  const key=sorted([i,j])+"|"+sorted([ia,ja]);
  add(key,s[k][i]*s[k][j]);
}
for(let i=0;i<8;i++)for(let j=0;j<8;j++)add(sorted([i,i])+"|"+sorted([j,j]),-1);
assert.deepEqual([...comp.entries()].filter(([,v])=>v!==0),[],
  "eight-dimensional norm-composition identity failed");

function Q(v) {
  return Array.from({length:9},(_,k)=>v.reduce((z,x,i)=>z+s[k][i]*x*v[p[k][i]],0));
}
const row0=Array.from({length:8},(_,k)=>p[k][0]);
assert.deepEqual(row0.slice().sort((a,b)=>a-b),[8,9,10,11,12,13,14,15]);
for(const t of [-1,-.7,0,.4,1]){
  const spin=Array(16).fill(0), z=Array(8).fill(Math.sqrt(1-t*t)/Math.sqrt(8));
  if(t===-1)spin[8]=1;
  else {
    const alpha=Math.sqrt((1+t)/2);spin[0]=alpha;
    for(let k=0;k<8;k++)spin[p[k][0]]=z[k]/(2*alpha*s[k][0]);
  }
  const out=Q(spin);
  ck(Math.max(...out.slice(0,8).map((v,i)=>Math.abs(v-z[i])))<1e-12,"surjective witness");
  ck(Math.abs(out[8]-t)<1e-12,"target pole coordinate");
}
function basedUnwind(n,t) {
  const [a,b,c]=n, cs=Math.cos(t),sn=Math.sin(t);
  return [cs*cs*a+sn*sn,cs*b,cs*c,sn*cs*(1-a)];
}
for(const n of [[1,0,0],[0,1,0],[-1,0,0],[0,0,1],[.6,.8,0]]){
  for(const t of [0,.3,.8,Math.PI/2]){
    const v=basedUnwind(n,t);
    ck(Math.abs(v.reduce((z,x)=>z+x*x,0)-1)<1e-12,"nullhomotopy norm");
    if(n[0]===1&&n[1]===0&&n[2]===0)
      ck(Math.abs(v[0]-1)<1e-12&&v.slice(1).every(x=>Math.abs(x)<1e-12),"based boundary");
  }
  const end=basedUnwind(n,Math.PI/2);
  ck(Math.abs(end[0]-1)<1e-12&&end.slice(1).every(x=>Math.abs(x)<1e-12),"not contracted");
}
console.log(JSON.stringify({
 status:"SOURCE_EXACT_INTEGER_CERTIFICATE_PASS_RESEARCH_ONLY",
 original_git_blob_sha:fixture.source_git_blob_sha,
 strict_original_source_guard:!fixtureOnly,
 gamma_clifford_entries_checked:20736,
 quartic_identity_touched_coefficients:poly.size,
 orthogonal_eight_dimensional_multiplication_touched_coefficients:comp.size,
 all_exact_integer_coefficients_zero:true,
 north_pole_fiber:"S7",
 extra_target_based_unwinding_checked:true,
 original_spin9_equivariance_proved:false,
 physical_particle_stability_qualified:false
},null,2));
