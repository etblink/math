// Independent signed-permutation Hardy diagonal and highest-weight replay.
// Baseline a8e52c2dd4da96e26460c1d90c455eb15d9a4532.
// Executed algorithm in isolated JS; local Node wrapper not separately run.
// No new Lean qualification or unconditional spectral assertion.
import assert from 'node:assert/strict';
const words='JIIJ JIJX JXJZ JZJZ JJIZ JJXX JJZX XIII ZIII'.split(' ');
const I=Array.from({length:16},(_,j)=>[j,1]);
const g=words.map(w=>I.map(([j])=>{let k=j,s=1;for(let p=0;p<4;p++){let b=(j>>(3-p))&1,c=w[p];if(c==='X'||c==='J')k^=1<<(3-p);if(c==='J'&&!b||c==='Z'&&b)s=-s;}return[k,s]}));
const mul=(a,b)=>b.map(([k,s])=>[a[k][0],s*a[k][1]]);
const tr=a=>a.reduce((v,[k,s],j)=>v+(k===j?s:0),0);
const dot=(a,b)=>a.reduce((v,[k,s],j)=>v+(k===b[j][0]?s*b[j][1]:0),0);
const B=[0,2,4,6].map(i=>mul(g[i],g[i+1]));
let traces=[];for(let m=0;m<16;m++){let p=I;for(let j=0;j<4;j++)if(m>>j&1)p=mul(p,B[j]);traces.push(tr(p));}
let gram=[];for(let k=0;k<9;k++){let a=B.map((b,p)=>k===2*p?[7,g[k+1]]:k===2*p+1?[-7,g[k-1]]:[2,mul(g[k],b)]);gram.push(a.reduce((v,[c,x])=>v+a.reduce((w,[d,y])=>w+c*d*dot(x,y),0),0));}
assert.deepEqual(traces,[16,...Array(15).fill(0)]);
assert.deepEqual(gram,[...Array(8).fill(976),256]);
assert.equal(gram.reduce((a,b)=>a+b,0)*28,9*25088);
console.log(JSON.stringify({traces,highestWeightRank:1,tauNumerators:gram,denominator:25088,scope:'diagonal and highest-weight checks only'},null,2));
