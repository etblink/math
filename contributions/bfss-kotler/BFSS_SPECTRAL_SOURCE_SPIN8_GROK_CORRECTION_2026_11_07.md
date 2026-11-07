# Grok independent review — corrected torus and connected-cover argument

> Research provenance: externally supplied corrective mathematical review, 2026-11-07. This text supersedes the original review's vector-weight and torus-circle claims. This is analytical research, not a Lean-qualified theorem.

---

The vector line has weight \(+1\), not \(-1\). The relative-sign obstruction is withdrawn, and the perpendicular-word theorem stands. Passing to the axis stabilizer does not delete a torus circle.

## A. One character convention

Use the source circle already in the qualified rotor formulas. For \(r\neq s\),

\[
c(t)=\operatorname{source9PlaneSpinCurve}_{r,s}(t),
\]

with qualified value \(\cos(t/2)+\sin(t/2)\,e_re_s\) and qualified gamma image \(\cos(t/2)I+\sin(t/2)\,\gamma_r\gamma_s\). Qualified F10BS says the derivative of its vector matrix at \(0\) is

\[
F_{rs}=E_{rs}-E_{sr}.
\]

**Convention.** In a complex-linear representation \(\pi\), a vector \(v\) has weight \(w\) along this circle when

\[
\pi(c(t))v=e^{iwt}v.
\]

Equivalently, \(\frac{d}{dt}\big|_{0}\pi(c(t))\) has eigenvalue \(iw\). The inverse element is \(c(-t)\).

**Vectors.** \(F_{rs}e_r=-e_s\) and \(F_{rs}e_s=e_r\), so

\[
F_{rs}(e_r+ie_s)=-e_s+ie_r=i(e_r+ie_s).
\]

On that plane \(F_{rs}^2=-I\), hence \(R(c(t))=\exp(tF_{rs})=\cos(t)I+\sin(t)F_{rs}\), and

\[
R(c(t))(e_r+ie_s)=e^{it}(e_r+ie_s).
\]

The line \(\mathbb C(e_r+ie_s)\) has weight \(+1\). The conjugate line \(\mathbb C(e_r-ie_s)\) has weight \(-1\). Every axis outside the plane has weight \(0\).

The real-chart formula is a different object. For real \(x,y\),

\[
R(c(t))(xe_r+ye_s)=(x\cos t+y\sin t)e_r+(-x\sin t+y\cos t)e_s,
\]

so the coordinate \(z=x+iy\) is multiplied by \(e^{-it}\). That is the clock sense of this matrix on the real plane. It is not the weight of the complexified vector \(e_r+ie_s\). The November 7 note identified those two statements and was wrong.

**Spinors.** Let \(B=\gamma_r\gamma_s\), so \(B^2=-I\). On the \(+i\) eigenspace \(B\psi=i\psi\),

\[
S(c(t))\psi=\bigl(\cos(t/2)+i\sin(t/2)\bigr)\psi=e^{it/2}\psi.
\]

That eigenspinor has weight \(+1/2\). The \(-i\) eigenspace has weight \(-1/2\).

The matched positive lines therefore stand in the standard double-cover ratio: vector weight \(+1\), spinor weight \(+1/2\), same circle, same sign. No orientation correction enters the branching coordinates.

**Duals.** Define \((\rho^*(g)\varphi)(v)=\varphi(\rho(g)^{-1}v)\). If \(v\) has weight \(w\), its dual-basis functional has weight \(-w\), because \(c(t)^{-1}=c(-t)\) contributes \(e^{-iwt}\).

| Object | Weight along \(c(t)\) |
| --- | --- |
| \(e_r+ie_s\) | \(+1\) |
| \(e_r-ie_s\) | \(-1\) |
| dual basis functional of \(e_r+ie_s\) | \(-1\) |
| \(+i\) eigenspace of \(\gamma_r\gamma_s\) | \(+1/2\) |
| \(-i\) eigenspace of \(\gamma_r\gamma_s\) | \(-1/2\) |
| dual basis functional of a spinor of weight \(\mu\) | \(-\mu\) |

On operators, a pure tensor \(\psi\otimes\varphi\) has weight \(w_\psi+w_\varphi\). With \(\varphi\) the dual basis vector of a spinor of weight \(\lambda\), this is \(w_\psi-\lambda\). Along one circle that difference lies in \(\{-1,0,+1\}\). The sign correction does not change the interval. The operator-column endpoint \(\pm 12\), coming from twenty-four such planes and the input dual, does not move, and the false thresholds \(M=6\) and exclusion for \((24,18,0,0)\) stay false.

For the four source planes \((0,1),\ (2,3),\ (4,5),\ (6,7)\), declare \(\varepsilon_j\) by this same convention: \(\varepsilon_j=+1\) on \(e_{2j}+ie_{2j+1}\) and \(\varepsilon_j=+1/2\) on the \(+i\) eigenspace of \(\gamma_{2j}\gamma_{2j+1}\). Dominant coordinates are the ordinary sorted ones. This is the classical positive system.

**Short roots are not circles.** \(B_4\) and \(D_4\) both have rank \(4\). These four circles lie in the stabilizer \(K\) of \(e_8\) and are a maximal torus of the ambient source \(\operatorname{Spin}(9)\) as well: in odd dimension a maximal torus of \(\operatorname{SO}(9)\) is four plane rotations and already fixes one axis. Restriction to \(K\) deletes nothing from this torus.

The short roots \(\pm\varepsilon_i\) are characters of that same torus. Their root spaces are the infinitesimal rotations in planes that meet \(e_8\), such as the line \(\mathbb R F_{k8}\). Those are eight lines in the Lie algebra, accounting for \(\dim\mathfrak{so}(9)-\dim\mathfrak{so}(8)=8\). They are not circle factors of \(T^4\). The groups \(\exp(tF_{k8})\) are circles in the ambient group, but they are conjugate to Cartan circles rather than contained in this Cartan, and they lie in \(K\) only at the discrete parameters that fix \(e_8\).

Deleting the short roots replaces the root system \(\{\pm\varepsilon_i\pm\varepsilon_j\}\cup\{\pm\varepsilon_i\}\) by the subsystem \(\{\pm\varepsilon_i\pm\varepsilon_j\}\). The Cartan algebra stays, the Weyl group loses the odd sign changes, and \(\nu_4\) is allowed to be negative. Deleting a torus circle would drop the rank to \(3\). That is the stabilizer of a further vector, a \(\operatorname{Spin}(7)\)-type subgroup, and it is the wrong group for this branching rule.

## B. The connected-cover shortcut

No counterexample to the perpendicular-word theorem appeared. The sign correction is only about weights. Assume that theorem in the form already proved mathematically: \(g\in K\) if and only if the Clifford value of \(g\) is an ordered product of eight original \(Q\)-unit vectors with coordinate \(8\) equal to \(0\).

Let \(D\) be that eight-fold perpendicular unit locus, a closed subspace of the qualified eight-input domain \((\text{\(Q\)-unit sphere})^8\). Then \(D\cong(S^7)^8\) is path-connected.

The qualified map `source9EightUnitSpinWord` is continuous into source \(\operatorname{Spin}(9)\) with its PBW subtype topology (C0-A5b, run 42395290981) and surjective onto the whole group (C0-A5a). Two compositions are still required, and neither is a named theorem:

- the inclusion \(D\hookrightarrow(\text{\(Q\)-unit})^8\) is continuous because coordinate \(8\) is continuous;
- the easy half of the word theorem puts the image of \(D\) inside \(K\): every factor lies in \(W\), so the reflection product fixes \(e_8\).

The hard half, assumed here, says the restricted map is surjective onto \(K\). A continuous image of a path-connected space is path-connected, so **\(K\) is path-connected** in the subspace topology. In particular the qualified element \(-1\) lies in the identity path component. This does not construct \(\operatorname{Cl}(W)\).

The restricted representation \(\rho:K\to\operatorname{SO}(W)\) is the qualified nine-vector action, rewritten on the invariant decomposition \(\mathbb R^9=W\oplus\mathbb R e_8\).

- **Kernel.** If \(\rho(g)=I\), then the nine-vector action is \(I\), so qualified F10CU gives \(g\in\{1,-1\}\). Both elements fix \(e_8\) and lie in \(K\). The kernel is exactly \(\{1,-1\}\), and these are distinct by the qualified central separation.
- **Surjectivity.** Perpendicular Cartan factorization writes every element of \(\operatorname{SO}(W)\) as an ordered even product of hyperplane reflections in \(W\)-normals. The qualified pair lift of that list is an element of \(K\) over it. This is the action half of the word proof. It does not need \(\operatorname{Cl}(W)\).
- **Quotient.** Source \(\operatorname{Spin}(9)\) is compact and closed in the PBW topology (C0-A5c, run 42397460623). Closedness of \(K\) is the equalizer of \(g\mapsto R(g)e_8\) and the constant \(e_8\). That needs continuity of the vector action, available from the qualified smooth action package but not as a named stabilizer lemma. Granting it, \(K\) is compact, the quotient by \(\{1,-1\}\) is compact, and the induced continuous bijection onto the Hausdorff group \(\operatorname{SO}(W)\) is a topological-group isomorphism. The quotient map is a two-sheeted covering because multiplication by \(-1\) is a fixed-point-free homeomorphism of order \(2\).

Thus \(K\to\operatorname{SO}(8)\) is a compact, path-connected, nontrivial double cover. Nontriviality is the connectedness just proved: a continuous section would split the cover and disconnect \(K\), since \(\operatorname{SO}(8)\times\mathbb Z/2\) is disconnected, while \(-1\neq 1\).

**Classical uniqueness, not a source theorem.** For \(n\ge 3\), \(\pi_1(\operatorname{SO}(n))=\mathbb Z/2\), so a connected, locally path-connected base has exactly one connected two-sheeted cover. The Clifford group \(\operatorname{Spin}(8)\to\operatorname{SO}(8)\) is one model. Any other connected group cover is isomorphic to it over \(\operatorname{SO}(8)\): the covering-space lift sending the identity to the identity is the unique base-preserving map, and it preserves multiplication because both products lift the same product on \(\operatorname{SO}(8)\) and agree at the identity. That isomorphism does not require a map \(\operatorname{Cl}(W)\to\operatorname{Cl}(V)\).

What this identification includes:

- the abstract compact group and its unique nontrivial central kernel element;
- the projection, pinned as the vector representation on \(W\cong\mathbb R^8\);
- exclusion of triality. An automorphism moving the vector representation to a half-spinor does not commute with \(\rho\). The unique cover isomorphism over \(\operatorname{SO}(8)\) cannot apply triality.

What it does not include:

- which \(\gamma_8\)-block is \(8_s\) and which is \(8_c\). The cover does not see spinors. The external matrix calculation from the previous note still supplies that distinction, and swapping the blocks only flips the sign of \(\nu_4\). Interlacing uses \(|\nu_4|\), so the exclusion inequality is insensitive to the swap and sensitive to replacing either block by the vector representation;
- the \(B_4\) coordinate formulas. Those need the four shared circles and the weights in section A. Uniqueness of the cover does not by itself name \(\varepsilon_j\).

## What is which

**Established source mathematics.** The nine-dimensional pair calculus, two-sign kernel, exact eight-word map, its PBW continuity, and compactness of the full source group. The generator identity \(F_{rs}(e_r+ie_s)=i(e_r+ie_s)\) and the weights in the table above, read off those qualified formulas. Rank \(4\) on both sides of the inclusion, with the same four circles.

**Conditional on the perpendicular-word theorem, which remains a mathematical proof rather than a Lean qualification.** Path-connectedness of \(K\), surjectivity of \(\rho\) onto \(\operatorname{SO}(W)\), and the two-sheeted covering once the two composition obligations below are written.

**Source compositions still unwritten.** Restriction of the qualified word map to coordinate \(8=0\); closedness of the equalizer \(K\); the compact-to-Hausdorff quotient identification; transport of the nine-dimensional kernel onto \(W\).

**Classical, and appropriately left classical.** Uniqueness of the connected double cover of \(\operatorname{SO}(8)\); the Weyl-alternant interlacing rule for this aligned torus; maximality of the four-plane torus. None of these is a reason to build \(\operatorname{Cl}(W)\).

**Still missing if one wants source theorems rather than this reduction.** A qualified perpendicular-word gate, including Cartan–Dieudonné on \(e_8^\perp\) in the existing reflection order. Without that gate, connectedness of \(K\) is not source-qualified. A named half-spinor certificate is still missing if the blocks must be source theorems; it is not needed to define the cover. No operator action, domain identification, coercivity, or eigenvalue statement follows.
