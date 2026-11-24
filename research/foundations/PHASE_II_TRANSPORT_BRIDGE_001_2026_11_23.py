import sympy as s
from math import cos, pi
I=s.eye(2); X=s.Matrix([[0,1],[1,0]]); Z=s.diag(1,-1); Y=s.Matrix([[0,-s.I],[s.I,0]])
# Source-reported numbers from Tonomura Fig 6/7 and Rauch pp 426-427.
for n in range(-8,9):
    assert s.exp(s.I*s.pi*n)==s.Integer(-1)**n
    assert s.exp(2*s.I*s.pi*n)==1
# ideal fringe shifts modulo one spacing, and amplified fringe shifts
for n,delta in [(1,s.Rational(0)),(0,s.Rational(0)),(1,s.Rational(32,100)),(0,s.Rational(25,100))]:
    print('AB example parity, offset, fringe fractions 1x, 2x:',n,delta,((n+delta)/2)%1,(n+delta)%1)
for angle in [0,180,360,540,720]:
    U=s.diag(s.exp(-s.I*s.pi*angle/360),s.exp(s.I*s.pi*angle/360))
    assert s.simplify(s.re(s.trace(U)/2)-s.cos(s.pi*angle/360))==0
    print('spin angle, ideal P0:',angle,s.simplify((1+s.re(s.trace(U)/2))/2))
print('reported field integral period difference / reported uncertainty:',(144-149)/8)
print('reported angular period difference / reported uncertainty:',(704-720)/38)
# Unpolarized comparison cannot distinguish rotations about distinct axes of same angle.
A=-s.I*X; B=-s.I*Z
assert s.trace(A)==s.trace(B)==0 and A!=B
assert A*B==-B*A
assert A*B*A.inv()*B.inv()==-I
# Y-polarized preparation with a quadrature reference separates A vs B; direct order comparison works even unpolarized.
R=(I+Y)/2
assert s.simplify(s.trace(R*A.conjugate().T*B)) in (s.I,-s.I)
assert (A*B).conjugate().T*(B*A)==-I
print('noncommuting order comparison: exact relative operator -I')
print('PASS')
