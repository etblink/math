import {readFileSync} from "node:fs";
import {createHash} from "node:crypto";
import {dirname,resolve} from "node:path";
import {fileURLToPath} from "node:url";
function inspectRefinements(atlas,overlay,data,observed){
 const assert=(ok,msg)=>{if(!ok)throw Error(msg)};
 assert(data.schema==="rska-refinements-v0.1","schema");
 assert(observed.atlas===data.atlas_blob&&observed.overlay===data.overlay_blob&&observed.discovery===data.discovery_blob,"base pin drift");
 for(const [key,p] of Object.entries(data.pins))assert(p.path&&/^[0-9a-f]{40}$/.test(p.blob)&&observed[key]===p.blob,"pin drift "+key);
 const inherited=new Map(atlas.records.map(r=>[r.id,r])),other=new Set(overlay.records.map(r=>r.id));
 const lookup=Object.fromEntries(Object.entries(atlas.reverse_declaration_index).map(([k,v])=>[k,[...v]])),refs=new Map();
 for(const r of data.refinements){
   assert(r.id&&r.title&&r.scope&&r.status==="HISTORICAL_STRICT"&&/^\d+$/.test(r.source_run)&&/^[0-9a-f]{40}$/.test(r.tested_commit),"invalid refinement");
   assert(!refs.has(r.id)&&!inherited.has(r.id)&&!other.has(r.id),"ID collision");
   const parent=inherited.get(r.parent);assert(parent&&parent.source_paths.includes(data.pins[r.source]?.path)&&parent.source_paths.includes(data.pins[r.consumer]?.path),"source/consumer not in parent");
   assert(r.evidence.length&&r.evidence.every(k=>Object.hasOwn(data.pins,k)),"unknown evidence");
   assert(r.named_roots.length&&new Set(r.named_roots).size===r.named_roots.length,"duplicate root");
   for(const root of r.named_roots){assert(!Object.hasOwn(lookup,root),"root collision "+root);lookup[root]=[r.id]}
   for(const s of r.candidate_support){assert((inherited.has(s.target)||other.has(s.target))&&s.scope,"invalid support target")}
   refs.set(r.id,r)
 }
 assert(data.interface_review.evidence.every(k=>Object.hasOwn(data.pins,k)),"interface evidence");
 function find(root){return (lookup[root]||[]).map(id=>refs.has(id)?{id,kind:"scoped_refinement",record:refs.get(id),parent:inherited.get(refs.get(id).parent)}:{id,kind:"inherited",record:inherited.get(id)})}
 function children(parent){assert(inherited.has(parent),"unknown parent");return [...refs.values()].filter(r=>r.parent===parent)}
 const preserved=Object.entries(atlas.reverse_declaration_index).filter(([k,v])=>JSON.stringify(v)===JSON.stringify(lookup[k])).length;
 assert(preserved===Object.keys(atlas.reverse_declaration_index).length,"inherited lookup drift");
 return {find,children,report:{schema:"rska-refinement-test-v0.1",inherited_keys_preserved:preserved,new_keys:Object.keys(lookup).length-preserved,refinements:refs.size,source_pins:Object.keys(data.pins).length,baseline_route_records:atlas.existence_reachability.records.length,scope:"Refinement membership and candidate support are non-entailing; neither is a prerequisite edge. No original record or route mutation.",new_lookup:find("FCP.BFSSIBIG0CSO3Hom.originalAdjointSO3Hom_surjective").map(x=>({id:x.id,kind:x.kind,parent:x.parent?.id,status:x.record.status})),inherited_lookup:find("FCP.BFSSCSQF2.paired_native_common_square").map(x=>({id:x.id,kind:x.kind,status:x.record.status}))}}
}
function suite(atlas,overlay,data,observed){
 const a=inspectRefinements(atlas,overlay,data,observed);
 if(a.report.new_lookup[0]?.id!=="IBI-SO3-HOM"||a.report.inherited_lookup[0]?.id!=="PE-SQUARE"||a.children("E08-IBI").length!==1||a.find("nonexistent.root").length)throw Error("lookup expectations");
 const cases=[["parent ID absent",x=>x.refinements[0].parent="ABSENT"],["unrelated bundle",x=>x.refinements[0].parent="D-01"],["ID collision",x=>x.refinements[0].id="PE-SQUARE"],["inherited root collision",x=>x.refinements[0].named_roots.push("FCP.BFSSCSQF2.paired_native_common_square")],["unsupported promotion",x=>x.refinements[0].status="INTEGRATED_STRICT"],["evidence drift",x=>x.pins.receipt.blob="0".repeat(40)],["missing candidate target",x=>x.refinements[0].candidate_support[0].target="ABSENT"]];
 const controls=cases.map(([name,mutate])=>{const x=JSON.parse(JSON.stringify(data));mutate(x);try{inspectRefinements(atlas,overlay,x,observed)}catch(e){return {name,rejected:true,reason:e.message}}throw Error("mutation accepted "+name)});
 return {...a.report,controls};
}
const here=dirname(fileURLToPath(import.meta.url)),root=resolve(here,"../../..");
const read=path=>readFileSync(path);
const hash=bytes=>createHash("sha1").update("blob "+bytes.length+"\0").update(bytes).digest("hex");
const a=read(resolve(root,"research/maintenance/knowledge-atlas/ATLAS_INDEX_V7.json")),o=read(resolve(here,"overlay.json")),d=read(resolve(here,"discovery-results.json"));
const atlas=JSON.parse(a),overlay=JSON.parse(o),data=JSON.parse(read(resolve(here,"refinements.json")));
const observed={atlas:hash(a),overlay:hash(o),discovery:hash(d),...Object.fromEntries(Object.entries(data.pins).map(([key,p])=>[key,hash(read(resolve(root,p.path)))]))};
const report=suite(atlas,overlay,data,observed),api=inspectRefinements(atlas,overlay,data,observed);
const [cmd,arg]=process.argv.slice(2);
if(cmd==="check"){if(JSON.stringify(report)!==JSON.stringify(JSON.parse(read(resolve(here,"refinement-results.json")))))throw Error("result drift");console.log("PASS: refinement and all inherited lookups preserved")}
else if(cmd==="lookup")console.log(JSON.stringify(api.find(arg),null,2));
else if(cmd==="children")console.log(JSON.stringify(api.children(arg),null,2));
else if(!cmd||cmd==="report")console.log(JSON.stringify(report,null,2));
else throw Error("usage: node refine.mjs [check|lookup ROOT|children ID|report]");
