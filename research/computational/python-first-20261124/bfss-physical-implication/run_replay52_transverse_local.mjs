// Run from a local checkout, not CI. One coordinate per invocation; coordinate-only tau/beta replay.
// Node standard library; no external packages. Preserve each completed JSON atomically.
import {readFileSync,writeFileSync,renameSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {dirname,resolve} from 'node:path';
import {fileURLToPath} from 'node:url';
import {readSeed} from './read_frozen_seed_local.mjs';
import {replay52fast} from './replay52_transverse_local.mjs';
const D=dirname(fileURLToPath(import.meta.url));
function pinned(path,sha){const b=readFileSync(path);const actual=createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(actual!==sha)throw Error('blob mismatch: '+path+' '+actual);return b;}
const seedBytes=pinned(resolve(D,'../bfss-seed-transport/source_seed_integer.npz'),'91c57e1f3f1e856a51bbc11dbb5a01ee9099ecc0');
if(createHash('sha256').update(seedBytes).digest('hex')!=='131e703b19da9a1aea1e137dac45f451bbfc7f64374aff6619a46488410d5ff7')throw Error('seed SHA256');
const source=pinned(resolve(D,'../../../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMSYPythonGammaRows.lean'),'818ff344566c2f2552a30591d92fb7f718efe866').toString();
for(let [k,expected] of [['pythonFlipMask',[9,11,14,10,12,15,13,8,0]],['pythonSignMask',[9,10,11,15,13,12,14,0,8]]]){
 const match=source.match(new RegExp('def '+k+'[^\\n]*\\n?\\s*!\\[([^\\]]+)\\]'));if(!match||JSON.stringify(match[1].split(',').map(Number))!==JSON.stringify(expected))throw Error('gamma masks '+k)
}
const [coord,out]=process.argv.slice(2);
if(!/^[0-2][0-8]$/.test(coord||'')||!out)throw Error('usage: node run_replay52_transverse_local.mjs 22 /absolute/path/coord22.json');
const seed=readSeed(seedBytes.toString('base64'),s=>gunzipSync(Buffer.from(s,'base64')));
const report=replay52fast(seed,[0,0,1],[[Number(coord[0]),Number(coord[1])]]);
report.input={seed_blob:'91c57e1f3f1e856a51bbc11dbb5a01ee9099ecc0',gamma_blob:'818ff344566c2f2552a30591d92fb7f718efe866',replay_blob:createHash('sha1').update('blob '+readFileSync(resolve(D,'replay52_transverse_local.mjs')).length+'\0').update(readFileSync(resolve(D,'replay52_transverse_local.mjs'))).digest('hex')};
writeFileSync(out+'.tmp',JSON.stringify(report,null,2)+'\n');renameSync(out+'.tmp',out);
console.log(JSON.stringify({coord,stats:report.stats,anchor:report.anchor,output:out}));
