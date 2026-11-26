// Standard RFC1951 decoder with CRC and ISIZE verification for frozen matrix archive.
export function decodeGzip(s){
 const abc="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", a=[];let acc=0,bits=0;
 for(const c of s){if(c==="=")break;let v=abc.indexOf(c);if(v<0)continue;acc=(acc<<6)|v;bits+=6;if(bits>=8){bits-=8;a.push((acc>>bits)&255)}}
 if(a[0]!==31||a[1]!==139||a[2]!==8||a[3]!==0)throw Error("gzip header");
 let pos=80,out=new Uint8Array((a[a.length-4]|a[a.length-3]<<8|a[a.length-2]<<16|a[a.length-1]<<24)>>>0),n=0;
 function read(k){let v=0;for(let i=0;i<k;i++,pos++)v|=((a[pos>>3]>>(pos&7))&1)<<i;return v}
 function tree(l){let count=Array(16).fill(0),next=Array(16).fill(0),maps=Array.from({length:16},()=>new Map());for(const x of l)if(x)count[x]++;let c=0;for(let i=1;i<=15;i++){c=(c+count[i-1])<<1;next[i]=c}for(let j=0;j<l.length;j++)if(l[j])maps[l[j]].set(next[l[j]]++,j);return maps}
 function sym(t){let v=0;for(let i=1;i<=15;i++){v=v*2+read(1);if(t[i].has(v))return t[i].get(v)}throw Error("invalid huffman")}
 const lb=[3,4,5,6,7,8,9,10,11,13,15,17,19,23,27,31,35,43,51,59,67,83,99,115,131,163,195,227,258],le=[0,0,0,0,0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,0],db=[1,2,3,4,5,7,9,13,17,25,33,49,65,97,129,193,257,385,513,769,1025,1537,2049,3073,4097,6145,8193,12289,16385,24577];
 let last;do{last=read(1);let type=read(2);if(type===0){pos=(pos+7)&~7;let len=read(16),inv=read(16);if((len^inv)!==65535)throw Error("stored block");for(let i=0;i<len;i++)out[n++]=read(8);continue}let lt,dt;
 if(type===1){lt=tree(Array.from({length:288},(_,i)=>i<144?8:i<256?9:i<280?7:8));dt=tree(Array(32).fill(5))}
 else if(type===2){let hl=read(5)+257,hd=read(5)+1,hc=read(4)+4,order=[16,17,18,0,8,7,9,6,10,5,11,4,12,3,13,2,14,1,15],cl=Array(19).fill(0);for(let i=0;i<hc;i++)cl[order[i]]=read(3);let ct=tree(cl),l=[];while(l.length<hl+hd){let x=sym(ct);if(x<16)l.push(x);else{let k=x===16?read(2)+3:x===17?read(3)+3:read(7)+11,v=x===16?l[l.length-1]:0;while(k--)l.push(v)}}lt=tree(l.slice(0,hl));dt=tree(l.slice(hl))}
 else throw Error("block type");
 while(true){let x=sym(lt);if(x<256){out[n++]=x;continue}if(x===256)break;let k=x-257,len=lb[k]+read(le[k]),d=sym(dt),dist=db[d]+read(d<4?0:(d>>1)-1);if(dist>n||n+len>out.length)throw Error("copy bounds");while(len--){out[n]=out[n-dist];n++}}
 }while(!last);
 if(n!==out.length)throw Error("size");let crc=-1;for(const x of out){crc^=x;for(let k=0;k<8;k++)crc=(crc>>>1)^((crc&1)?0xedb88320:0)}let got=(a[a.length-8]|a[a.length-7]<<8|a[a.length-6]<<16|a[a.length-5]<<24)>>>0;if(((crc^-1)>>>0)!==got)throw Error("CRC");
 let st="";for(let i=0;i<n;i+=16384)st+=String.fromCharCode(...out.subarray(i,i+16384));return JSON.parse(st)
}
