// Frozen seed loader, no dependencies in the isolated execution.
// gunzip argument must validate CRC32 and ISIZE and return bytes.
export function readAnchor(s,gunzip,count,expectedNorm){
 const abc="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",a=[];let acc=0,bits=0;for(let c of s){if(c==="=")break;let v=abc.indexOf(c);if(v<0)continue;acc=(acc<<6)|v;bits+=6;if(bits>=8){bits-=8;a.push((acc>>bits)&255)}}
 function base64(a){let out="";for(let i=0;i<a.length;i+=3){let n=a[i]<<16|(a[i+1]??0)<<8|(a[i+2]??0);out+=abc[(n>>18)&63]+abc[(n>>12)&63]+(i+1<a.length?abc[(n>>6)&63]:"=")+(i+2<a.length?abc[n&63]:"=")}return out}
 const u16=i=>a[i]+256*a[i+1],u32=i=>(a[i]+256*a[i+1]+65536*a[i+2]+16777216*a[i+3])>>>0;
 let e=a.length-22;while(e>=0&&u32(e)!==0x06054b50)e--;if(e<0)throw Error("ZIP EOCD");let n=u16(e+10),pos=u32(e+16),out={};
 for(let i=0;i<n;i++){if(u32(pos)!==0x02014b50||u16(pos+10)!==8)throw Error("ZIP central");let crc=u32(pos+16),cs=u32(pos+20),us=u32(pos+24),nl=u16(pos+28),el=u16(pos+30),cl=u16(pos+32),off=u32(pos+42);let name=String.fromCharCode(...a.slice(pos+46,pos+46+nl));if(u32(off)!==0x04034b50||out[name])throw Error("ZIP local");let st=off+30+u16(off+26)+u16(off+28);let payload=a.slice(st,st+cs);let g=[31,139,8,0,0,0,0,0,0,255,...payload,...[crc,us].flatMap(v=>[v&255,(v>>>8)&255,(v>>>16)&255,(v>>>24)&255])];let b=gunzip(base64(g));if(b.length!==us)throw Error("ZIP size");out[name]=b;pos+=46+nl+el+cl}
 if(Object.keys(out).sort().join()!==["denominator.npy","imag.npy","masks.npy","real.npy"].join())throw Error("NPZ members");
 function parse(b,descr,shape,count){if(b[0]!==147||String.fromCharCode(...b.slice(1,6))!=="NUMPY"||![1,2,3].includes(b[6])||b[7]!==0)throw Error("NPY header");let w=b[6]===1?2:4,offset=8+w,len=0;for(let i=0;i<w;i++)len+=b[8+i]*256**i;let h=String.fromCharCode(...b.slice(offset,offset+len));if(!h.includes("'descr': '"+descr+"'")||!h.includes("'fortran_order': False")||!h.includes("'shape': "+shape))throw Error(h);
 let dv=new DataView(b.buffer,b.byteOffset+offset+len,b.length-offset-len),bytes=Number(descr.slice(2)),v=[];if(dv.byteLength!==count*bytes)throw Error("NPY byte count");for(let p=0;p<dv.byteLength;p+=bytes)v.push(descr==="<u4"?dv.getUint32(p,true):descr==="<i2"?dv.getInt16(p,true):Number(dv.getBigInt64(p,true)));return v}
 let m=parse(out["masks.npy"],"<u4","("+count+",)",count),r=parse(out["real.npy"],"<i8","("+count+",)",count),i=parse(out["imag.npy"],"<i8","("+count+",)",count),den=parse(out["denominator.npy"],"<i8","()",1);
 if(den[0]!==55||m.some(v=>v>=2**24)||r.some(v=>!Number.isSafeInteger(v))||i.some(v=>!Number.isSafeInteger(v)))throw Error("anchor data");
 let norm=0n;for(let j=0;j<count;j++)norm+=BigInt(r[j])**2n+BigInt(i[j])**2n;
 if(norm!==BigInt(expectedNorm))throw Error("anchor norm "+norm);
 let anchor=new Map(m.map((v,j)=>[v,[r[j],i[j]]]));if(anchor.size!==count||[...anchor.values()].some(([r,i])=>!r&&!i))throw Error("anchor support");return anchor
}
