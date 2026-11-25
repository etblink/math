"""S + Z(X)S (not a released trial); deliberately reverse potential sign."""
from charge_audit import *
x=fixtures['rank3'];z=action(a.Z(x),seed);p=add((1,seed),(1,z));ds=[action(a.K[c,i],seed) for c,i in it.product(range(3),range(9))]
r=charges(x,p,ds,1,1);wrong=[(v['A_norm2']/2+v['B_norm2']-math.sqrt(2)*v['Re_A_B'])/N for v in r['per_charge']]
r['wrong_potential_sign_density']=wrong;r['wrong_sign_max_difference']=max(abs(i-j) for i,j in zip(wrong,r['charge_density_without_f_squared']));r['scope']='Artificial mixed polynomial S+sqrt(2)Y S, not companion witness; tests interference and sign sensitivity.'
assert r['wrong_sign_max_difference']>0
(D/'mixed_control.json').write_text(json.dumps(r,indent=2)+'\n');print(r['mean'],r['spread'],r['wrong_sign_max_difference'],r['per_charge'][0])
