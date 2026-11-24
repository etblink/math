"""Exact arithmetic controls for the proposed uniform vacuum-exclusion theorem.
Not an independent proof of the branching theorem or the infinite-dimensional estimates.
"""
from fractions import Fraction as F
from itertools import combinations_with_replacement, product

slow = {(F(0),)*4, (F(1),F(0),F(0),F(0)), (F(2),F(0),F(0),F(0)),
        (F(1),F(1),F(0),F(0)), (F(1),F(1),F(1),F(0))}
slow |= {(F(a,2),F(1,2),F(1,2),F(b,2)) for a,b in product((1,3),(-1,1))}
assert len(slow)==9

def occurs(w,v):
    return (w[0]-v[0]).denominator==1 and w[0]>=v[0]>=w[1]>=v[1]>=w[2]>=v[2]>=w[3]>=abs(v[3])

def overlaps(w):
    return {v for v in slow if occurs(w,v)}

counts={'integer_excluded':0,'integer_allowed':0,'half_excluded':0,'half_allowed':0}
partners=0
for half in (0,1):
    for u in combinations_with_replacement(range(13),4):
        w=tuple(F(i)+F(half,2) for i in reversed(u))
        allowed=bool(overlaps(w))
        if half:
            expected=w[1]<=F(3,2) and w[2]==w[3]==F(1,2)
        else:
            expected=w[1]<=1 or (w[1]==2 and w[2]==0)
        assert allowed==expected
        counts[('half' if half else 'integer')+('_allowed' if allowed else '_excluded')]+=1
        p=tuple(a+b for a,b in zip(w,(1,1,1,0)))
        if w[1]>0:
            assert not overlaps(p); partners+=1
        else:
            assert overlaps(p) # ordinary symmetric traceless W: control
print('weight grid:',counts,'non-symmetric W partner checks:',partners)
assert overlaps((2,2,0,0))=={(F(2),F(0),F(0),F(0))} # lambda2>1 alone insufficient
assert not overlaps((2,2,2,0))
assert not overlaps((F(5,2),F(3,2),F(3,2),F(1,2)))
# Exact IMS constants; explicit color net via rounding 7*v to nearest lattice point.
# distance ||v-y|| <= sqrt(3)/14, giving normalized directional dot squared >= 1-3/196.
k=F(32,33); eta=F(99,100); delta=F(1,18)
assert 1-F(3,196)>eta**2
assert eta**2>k
assert (1-eta**2)/3>F(1,200)
assert 9*(1-delta)-8/k==F(1,4)
assert F(192)/(4*delta)==864
# (1-delta) gap + zero-point; all occupation levels above vacuum have ≥1 quantum.
for bos in range(17):
    for ferm in range(17):
        if bos+ferm:
            assert (1-delta)*(8+bos)+(ferm-8)/k >= F(1,4) if ferm<=8 else (1-delta)*(8+bos)+ferm-8 >= F(1,4)
print('explicit net, cover, completion of square and frozen-gap checks PASS')
print('PASS')
