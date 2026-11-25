// Executed pure comparison, standalone Node replay wrapper.
import fs from 'node:fs'; import crypto from 'node:crypto'; import {fileURLToPath} from 'node:url';
function compare(A,B){
let polys=0,terms=0,zeros=0;
function gcd(a,b){if(a<0n)a=-a;while(b)[a,b]=[b,a%b];return a}
function frac(s){let [n,d=1n]=s.split("/").map(BigInt);let g=gcd(n,d);return [String(n/g),String(d/g)]}
for(let [name,p] of Object.entries(B))for(let [key,terms0] of Object.entries(p)){let expected=A[name][key].map(t=>[...t.exponents,t.G_power,...frac(t.coefficient)]);let canonical=x=>x.map(v=>v.join(",")).sort().join(";");if(canonical(expected)!==canonical(terms0))throw Error(name+" "+key);polys++;terms+=terms0.length;if(!terms0.length)zeros++}
return {polynomial_lists_exact:polys,nonzero_polynomials:polys-zeros,zero_polynomials:zeros,nonzero_coefficients:terms,original_blob:"f1a0bbb2ba7b585d706e6c56e11fbfb44e167306",independent_blob:"cca25ef4a7c20d53772ab42b70a5028ea8d1588e"};
}
function read(url,pin){let b=fs.readFileSync(fileURLToPath(new URL(url,import.meta.url)));let sha=crypto.createHash('sha1').update('blob '+b.length+'\0').update(b).digest('hex');if(sha!==pin)throw Error('input drift '+url);return JSON.parse(b);}
console.log(JSON.stringify(compare(read('../bfss-mixed104/jet_polynomials.json','f1a0bbb2ba7b585d706e6c56e11fbfb44e167306'),read('../bfss-independent-source-audit/independent_refit_coefficients.json','cca25ef4a7c20d53772ab42b70a5028ea8d1588e')),null,2));
