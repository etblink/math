import { readFileSync } from "node:fs";
import { createHash } from "node:crypto";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
function select(atlas,query="SO3",limit=6){
 const seen=new Set(atlas.lexical_import_links.map(e=>e.from)),reach=new Set(atlas.existence_reachability.records);
 const prioritized=atlas.records.filter(r=>reach.has(r.id)&&!seen.has(r.id)&&r.source_paths.length===1&&r.source_paths[0].endsWith(".lean")).sort((x,y)=>y.dependents.length-x.dependents.length||x.id.localeCompare(y.id)).filter((r,i,a)=>a.findIndex(q=>q.source_paths[0]===r.source_paths[0])===i).slice(0,limit).map(r=>({id:r.id,path:r.source_paths[0],kind:"unindexed-import-scan"}));
 const bundle=atlas.records.filter(r=>r.source_paths.length>1&&r.named_roots.length===0).flatMap(r=>r.source_paths.filter(p=>p.startsWith("lean/OAI/")&&p.endsWith(".lean")&&p.split("/").at(-1).toLowerCase().includes(query.toLowerCase())).map(path=>({id:r.id,path,kind:"bundle-root-gap"})));
 return [...prioritized,...bundle];
}
function discover(atlas,inputs,query="SO3",limit=6){
 const records=new Map(atlas.records.map(r=>[r.id,r])),modules=new Map();
 for(const r of atlas.records)for(const p of r.source_paths)if(p.startsWith("lean/")&&p.endsWith(".lean")){const m=p.slice(5,-5).replaceAll("/",".");if(!modules.has(m))modules.set(m,[]);modules.get(m).push(r.id)}
 const closure=id=>{const s=new Set();function w(x){if(s.has(x))return;s.add(x);records.get(x).prerequisites.forEach(w)}w(id);return s};
 const shared=[];
 for(let i=0;i<atlas.records.length;i++)for(let j=i+1;j<atlas.records.length;j++){
  const x=atlas.records[i],y=atlas.records[j];
  if(x.track===y.track||closure(x.id).has(y.id)||closure(y.id).has(x.id))continue;
  const paths=x.source_paths.filter(p=>y.source_paths.includes(p));
  if(paths.length)shared.push({ids:[x.id,y.id],paths,roots:[x.named_roots.length,y.named_roots.length],scope:"Co-location candidate only; not proof equivalence."});
 }
 const sources=select(atlas,query,limit).map(s=>{
  const f=inputs[s.path];if(!f||!f.blob||typeof f.content!=="string")throw Error("missing source "+s.path);
  const lines=f.content.split("\n");
  const imports=lines.flatMap((l,i)=>/^import\s/.test(l)?l.trim().split(/\s+/).slice(1).map(module=>({module,line:i+1})):[]);
  const outside=imports.flatMap(x=>(modules.get(x.module)||[]).filter(id=>!closure(s.id).has(id)).map(id=>({module:x.module,line:x.line,target:id,root_mentions:records.get(id).named_roots.flatMap(root=>{const name=root.split(".").at(-1);const rx=new RegExp("(^|[^A-Za-z0-9_'])"+name.replace(/[.*+?^${}()|[\]\\]/g,"\\$&")+"(?=$|[^A-Za-z0-9_'])");return lines.map((line,i)=>({line:i+1,text:line.trim()})).filter(x=>rx.test(x.text)).map(x=>({root,...x}))})})));
  const requests=lines.flatMap((l,i)=>{const m=l.match(/^\s*#print axioms\s+(\S+)\s*$/);return m?[{line:i+1,name:m[1]}]:[]});
  return {...s,blob:f.blob,imports,outside_editorial_closure:outside,lexical_axiom_requests:s.kind==="bundle-root-gap"?requests:[]};
 });
 return {schema:"rska-discovery-scan-v0.1",query,limit,scope:"Deterministic bounded scan. Source sharing, lexical imports, identifier mentions and axiom requests are candidate evidence only, not kernel proof dependencies or qualification.",shared_source_candidates:shared,sources};
}
const here=dirname(fileURLToPath(import.meta.url)),root=resolve(here,"../../..");
const atlas=JSON.parse(readFileSync(resolve(root,"research/maintenance/knowledge-atlas/ATLAS_INDEX_V7.json"),"utf8"));
const query=process.argv[2]||"SO3",limit=6;
const inputs=Object.fromEntries(select(atlas,query,limit).map(s=>{
 const bytes=readFileSync(resolve(root,s.path));
 return [s.path,{content:bytes.toString("utf8"),blob:createHash("sha1").update("blob "+bytes.length+"\0").update(bytes).digest("hex")}];
}));
const report=discover(atlas,inputs,query,limit);
if(process.argv[3]==="check"){
 const saved=JSON.parse(readFileSync(resolve(here,"discovery-results.json"),"utf8"));
 if(JSON.stringify(saved.scan)!==JSON.stringify(report))throw Error("scan drift");
 console.log("PASS: bounded source-discovery scan matches saved result");
}else console.log(JSON.stringify(report,null,2));
