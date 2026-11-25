#include <cstdint>
extern "C" int apply(const int32_t* m,const int64_t* r,const int64_t* i,int n,const int32_t* f,const int32_t* p,const int64_t* wr,const int64_t* wi,int nt,int64_t* sr,int64_t* si,int32_t* om,int64_t* orr,int64_t* oi,int cap){
 for(int j=0;j<nt;j++)for(int k=0;k<n;k++){int s=__builtin_parity((uint32_t)(m[k]&p[j]))?-1:1,t=m[k]^f[j];auto re=r[k]*s,im=i[k]*s;sr[t]+=wr[j]*re-wi[j]*im;si[t]+=wr[j]*im+wi[j]*re;}
 int c=0;for(int k=0;k<(1<<24);k++)if(sr[k]||si[k]){if(c>=cap)return -1;om[c]=k;orr[c]=sr[k];oi[c]=si[k];c++;sr[k]=si[k]=0;}return c;
}
extern "C" void inner(const int32_t* m,const int64_t* r,const int64_t* i,int n,const int32_t* m2,const int64_t* r2,const int64_t* i2,int n2,uint64_t* result){
 __int128 re=0,im=0;int a=0,b=0;while(a<n&&b<n2){if(m[a]<m2[b]){a++;continue;}if(m[a]>m2[b]){b++;continue;}re+=(__int128)r[a]*r2[b]+(__int128)i[a]*i2[b];im+=(__int128)r[a]*i2[b]-(__int128)i[a]*r2[b];a++;b++;}
 auto x=(unsigned __int128)re,y=(unsigned __int128)im;result[0]=(uint64_t)x;result[1]=(uint64_t)(x>>64);result[2]=(uint64_t)y;result[3]=(uint64_t)(y>>64);
}
