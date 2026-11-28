import { readFileSync } from "node:fs";
import { createHash } from "node:crypto";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

function inspect(atlas, overlay, observed){
 const assert=(b,m)=>{if(!b)throw Error(m)};
 const unique=a=>new Set(a).size===a.length;
 const ids=atlas.records.map(r=>r.id);
 assert(unique(ids),"duplicate inherited record");
 const base=new Map(atlas.records.map(r=>[r.id,r]));
 const extra=new Map();
 assert(overlay.schema==="rska-overlay-v0.1","schema");
 const allowed=new Set(["INTEGRATED_STRICT","COMPUTATIONAL_PASS","SURVIVED_FINITE_TESTS","PROPOSED_ANALYTICAL_ROUTE","OPEN_PROOF_OBLIGATION","ANALYTICAL_CONDITIONAL"]);
 const evidence=keys=>assert(Array.isArray(keys)&&keys.length>0&&keys.every(k=>Object.hasOwn(overlay.pins,k)),"unpinned evidence");
 for(const [key,p] of Object.entries(overlay.pins))assert(p.path&&/^[0-9a-f]{40}$/.test(p.blob)&&observed[key]===p.blob,"pin mismatch "+key);
 for(const r of overlay.records){assert(!base.has(r.id)&&!extra.has(r.id),"identity collision "+r.id);assert(r.id.startsWith("RSKA-")&&r.title&&r.scope&&allowed.has(r.status),"invalid added record");evidence(r.evidence);extra.set(r.id,r);}
 const all=new Map([...base,...extra]);
 const checkDeps=(id,ds)=>{assert(Array.isArray(ds)&&unique(ds),"duplicate/non-array dependency "+id);for(const d of ds)assert(all.has(d)&&d!==id,"dangling/self dependency "+id+" "+d)};
 for(const r of all.values())checkDeps(r.id,base.has(r.id)?r.prerequisites:r.requires);
 const routes=new Map();
 for(const r of overlay.alternatives){assert(!routes.has(r.id)&&r.id!=="atlas-v7"&&all.has(r.target)&&r.status==="PROPOSED_ANALYTICAL_ROUTE"&&r.scope,"invalid alternative");checkDeps(r.target,r.requires);evidence(r.evidence);routes.set(r.id,r)}
 for(const r of overlay.relations){assert(["limits","supports","replacement_for","scope_update"].includes(r.kind)&&all.has(r.from)&&all.has(r.to)&&r.scope,"invalid relationship");assert(r.from!==r.to||r.kind==="scope_update","self relationship");evidence(r.evidence)}
 // Validate reverse navigation for historical edges rather than infer mathematical identity from labels.
 for(const r of atlas.records){const reverse=atlas.records.filter(q=>q.prerequisites.includes(r.id)).map(q=>q.id).sort();assert(JSON.stringify(reverse)===JSON.stringify([...r.dependents].sort()),"inherited reverse mismatch "+r.id)}
 for(const [root,rs] of Object.entries(atlas.reverse_declaration_index)){assert(root&&Array.isArray(rs)&&rs.length&&rs.every(id=>base.has(id)),"invalid root lookup "+root)}
 function closure(target,routeId="atlas-v7"){
   const alt=routeId==="atlas-v7"?null:routes.get(routeId);
   assert(routeId==="atlas-v7"||alt,"unknown route");assert(!alt||alt.target===target,"route target mismatch");assert(all.has(target),"unknown target");
   const done=new Set(),active=new Set();
   const walk=id=>{if(done.has(id))return;assert(!active.has(id),"cycle "+id);active.add(id);const r=all.get(id);const ds=alt&&alt.target===id?alt.requires:base.has(id)?r.prerequisites:r.requires;for(const d of ds)walk(d);active.delete(id);done.add(id)};
   walk(target);return [...done].sort();
 }
 for(const id of all.keys())closure(id);for(const route of routes.values())closure(route.target,route.id);
 const historical=closure("PE-EXIST"),candidate=closure("PE-EXIST","compact-reduced52");
 assert(JSON.stringify(historical)===JSON.stringify([...atlas.existence_reachability.records].sort()),"baseline reachability mismatch");
 const summarize=rs=>({total:rs.length,status_counts:rs.reduce((s,id)=>(s[all.get(id).status]=(s[all.get(id).status]||0)+1,s),{}),open_or_conditional:rs.filter(id=>["OPEN_PROOF_OBLIGATION","ANALYTICAL_CONDITIONAL","PROPOSED_ANALYTICAL_ROUTE","PENDING_STRICT_GATE"].includes(all.get(id).status)),negative_context:overlay.relations.filter(r=>r.kind==="limits"&&rs.includes(r.to)||r.kind==="replacement_for"&&rs.includes(r.from)),ids:rs});
 function reuse(id){assert(all.has(id),"unknown donor");return {id,title:all.get(id).title,status:all.get(id).status,scope:all.get(id).scope,original_dependents:atlas.records.filter(r=>r.prerequisites.includes(id)).map(r=>({id:r.id,title:r.title,track:r.track})),pilot_dependents:overlay.records.filter(r=>r.requires.includes(id)).map(r=>({id:r.id,title:r.title})),nonentailing:overlay.relations.filter(r=>r.from===id||r.to===id)}}
 return {report:{schema:"rska-pilot-results-v0.1",baseline:overlay.baseline,counts:{inherited_records:base.size,added_records:extra.size,inherited_editorial_edges:atlas.records.reduce((n,r)=>n+r.prerequisites.length,0),inherited_lookup_keys:Object.keys(atlas.reverse_declaration_index).length,pinned_inputs:Object.keys(overlay.pins).length,typed_annotations:overlay.relations.length},historical:summarize(historical),candidate:summarize(candidate),shared:historical.filter(id=>candidate.includes(id)),baseline_only:historical.filter(id=>!candidate.includes(id)),candidate_only:candidate.filter(id=>!historical.includes(id)),reuse:[reuse("E08-LB1C1"),reuse("PE-SQUARE"),reuse("HARDY-G14"),reuse("PE-ICDC")],scope_updates:overlay.relations.filter(r=>r.kind==="scope_update"),limitations:["Graph reachability is not logical necessity, proof, minimality, or workload. Alternative and evidence annotations were curated from prior work, not discovered by machine.","Both route targets remain open; historical and proposed route differ in witness size and symmetry assumptions.","Blob checks compare current inputs against recorded Git identities; no source proof, historical binary or CI requalification."]},closure,reuse,lookup:root=>atlas.reverse_declaration_index[root]||[]};
}

function runSuite(atlas,overlay,observed){
 const res=inspect(atlas,overlay,observed);
 const clone=x=>JSON.parse(JSON.stringify(x));
 const cases=[
 ["inherited ID overwrite",x=>x.records[0].id=atlas.records[0].id],
 ["dangling prerequisite",x=>x.records[0].requires.push("ABSENT")],
 ["cyclic prerequisites",x=>{x.records[0].requires=[x.records[1].id];x.records[1].requires=[x.records[0].id]}],
 ["unknown evidence",x=>x.records[0].evidence=["missing"]],
 ["invalid non-entailing relation",x=>x.relations[0].kind="proves"],
 ["alternative cycle",x=>x.alternatives[0].requires=[x.alternatives[0].target]],
 ["unsupported status",x=>x.records[0].status="UNCONDITIONAL_EXISTENCE"],
 ["input blob drift",x=>x.pins.atlas.blob="0".repeat(40)]
 ];
 const tests=cases.map(([name,mut])=>{const bad=clone(overlay);mut(bad);try{inspect(atlas,bad,observed);throw Error("MUTATION_ACCEPTED")}catch(e){if(e.message==="MUTATION_ACCEPTED")throw Error(name+" accepted");return {name,rejected:true,reason:e.message}}});
 let rejected=false;try{res.closure("PE-SQUARE","compact-reduced52")}catch(e){rejected=true}if(!rejected)throw Error("route applied to wrong target");tests.push({name:"wrong target route",rejected:true});
 return {...res.report,negative_controls:tests};
}

const here=dirname(fileURLToPath(import.meta.url));
const root=resolve(here,"../../..");
const overlay=JSON.parse(readFileSync(resolve(here,"overlay.json"),"utf8"));
const observed=Object.fromEntries(Object.entries(overlay.pins).map(([key,p])=>{
  const bytes=readFileSync(resolve(root,p.path));
  return [key,createHash("sha1").update("blob "+bytes.length+"\0").update(bytes).digest("hex")];
}));
const atlas=JSON.parse(readFileSync(resolve(root,overlay.pins.atlas.path),"utf8"));
const report=runSuite(atlas,overlay,observed);
const api=inspect(atlas,overlay,observed);
const [cmd,arg,route]=process.argv.slice(2);
if(cmd==="check"){
  const saved=JSON.parse(readFileSync(resolve(here,"results.json"),"utf8"));
  if(JSON.stringify(saved)!==JSON.stringify(report))throw Error("generated report drift");
  console.log("PASS: pins, inherited graph, alternative routes, generated report and negative controls");
}else if(cmd==="reuse")console.log(JSON.stringify(api.reuse(arg),null,2));
else if(cmd==="lookup")console.log(JSON.stringify(api.lookup(arg),null,2));
else if(cmd==="route")console.log(JSON.stringify(api.closure(arg,route),null,2));
else if(!cmd||cmd==="report")console.log(JSON.stringify(report,null,2));
else throw Error("usage: node pilot.mjs [check|report|reuse ID|lookup ROOT|route ID [ROUTE]]");
