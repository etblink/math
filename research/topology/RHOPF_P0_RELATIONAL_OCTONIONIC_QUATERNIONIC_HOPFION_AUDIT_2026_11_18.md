# RHOPF-P0 — Relational octonionic / quaternionic hopfion: source-exact feasibility and obstruction audit

**Date:** 2026-11-18. **Project Lead judgment:** Strong mathematical connection identified; no empirical particle claim qualified.
**Authority:** bounded research on the existing unified `integration/bfss-unified-research-20261108` branch. NFC frozen canon, FCP main, BFSS accepted proof gates and SM-P0N0–P0N9 remain unchanged.

## Question

Can a relational, octonionic or quaternionic internal field provide a physically protected particle-like hopfion? What follows *mathematically* from our actual source, and what would distinguish a particle model from a topology analogy?

**Hypothesis candidates — do not silently collapse them into one claim:**

- **H-Q3 (quaternionic 3D carrier):** a continuous unit quaternion `q:S^3_{space}->S^3=SU(2)` with a fixed spatial boundary; projecting `n=q i q^{-1}:S^3->S^2` gives the classical 3D Hopf topology. This is a mathematically viable carrier, and the original NFC Book III conditional `Phi:R^3->S^3` statement makes it a worthy comparator, not a source-qualified physical realization.
- **H-O9 (octonionic / Spin(9) internal map):** a real 16-component unit spinor maps quadratically to a nine-component unit vector. The repository's *literal* 9 real symmetric 16×16 gamma matrices satisfy the needed composition/norm identity **exactly**, and are plausibly an octonionic Hopf presentation. Exact equivalence to a standard octonion coordinate convention, full equivariance and the source-defined physical spinor field are still open.
- **H-Q7/H-O15 (genuine higher Hopf charge):** second/third division-algebra fibrations `S^7->S^4` / `S^15->S^8` have nontrivial higher-dimensional geometry but DO NOT automatically create a protected 3D Hopf invariant. A physical higher-dimensional domain, internal parameter cycle, extra constraint or different invariant must be supplied separately.
- **H-rel (operational 'relational' proposal):** physically measurable, gauge-invariant or quotient observables must be defined from specified field components, with a testable source-to-observable map. The word relational by itself adds no topology or dynamics.

## Actual BFSS original gamma source, exact finite algebraic certificate

**Immutable source entry (read at the checked branch):**
`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean`
Git blob **b9b8192055c70f0d001d7982669b9823c55562ed**.
The original Lean file defines *nine* real symmetric signed-permutation matrices of shape `16×16` and checks the Euclidean Clifford relation. This original source is preserved, not edited or replaced.

For any real spinor `psi∈R^16`, set `Q_k(psi)=psi^T gamma_k psi`, with k=0,...,8.

**Exact source-specific polynomial identity (checked with integer coefficients):**

`sum_{k=0}^8 Q_k(psi)^2 = (sum_{a=0}^{15} psi_a^2)^2.`

Consequently a norm-one spinor determines a map `Q:S^15->S^8`. The certificate is not a numerical least-squares fit: parse the literal nine signed permutations/signs; validate all `9×9×16×16=20,736` Clifford entry cases; expand all homogeneous quartic monomials in the difference and check every integer coefficient equals zero. **248** monomial keys receive terms; every one cancels; unmentioned monomials have coefficient zero by construction.

Source block structure: gamma_8 is `diag(+I_8,-I_8)` and gamma_0..7 exchange the two real 8-spinor halves. Therefore with psi=(u,v), u,v∈R^8,

`Q_8=|u|²−|v|²; Q_k=2 B_k(u,v) (k<8).`

The eight original bilinear forms satisfy an **independent exact integer norm-composition identity**

`sum_{k=0}^7 B_k(u,v)^2 = |u|² |v|².`

The coefficient-by-coefficient certificate touched **176** quartic bi-degree-(2,2) keys with no nonzero residual. This is an eight-dimensional orthogonal multiplication, a particularly strong *mathematical* octonionic clue. **Do not claim its exact standard-octonion multiplication table, choice of basis or octonionic associator has been identified yet.**

The north-pole fiber of the actual source Q consists exactly of psi=(u,0), |u|=1, hence **S^7**. Seven representative target points, including both poles, passed independent explicit preimage constructions. A full source-specific proof of every fiber's structure and a *Spin(9)-equivariant isomorphism to the standard octonionic Hopf map* are still OPEN. Ornea–Parton–Piccinni–Vuletescu prove the geometry of the standard `S^15->S^8` fibration and its Spin(9) symmetry; we have not replaced their theorem with numerical resemblance.

**Do not conflate:** these real spinor/gamma carriers with original 48-Majorana quantum Fock operators or a physical 3+1D lepton. The fact that the original BFSS model uses Spin(9) does not prove an octonionic hopfion is dynamically realized or stable.

## The decisive three-space obstruction, with a constructive negative control

For localized finite-boundary fields, compactified 3-space is `S^3`. Homotopy distinguishes

`pi_3(S^2)=Z, pi_3(S^3)=Z, pi_3(S^4)=0, pi_3(S^8)=0, pi_3(S^15)=0.`

Thus **direct unrestricted** textures `S^3->S^4` and `S^3->S^8` have no nonzero 3D Hopf class. This does not rule out a 3D *subsector* or higher-dimensional physical/parameter topology; it requires a load-bearing constraint to be specified.

For an exact illustrative quaternionic soliton carrier, use inverse stereographic coordinates on R^3:

`q(x,y,z)=[r²−1+2xi+2yj+2zk]/(1+r²), r²=x²+y²+z².`

This is a unit quaternion q→1 at infinity. Its first Hopf projection `n=q i q^{-1}` is S²-valued. The north-pole fiber n=+i contains the x-axis compactified at infinity; the south-pole fiber n=−i is the unit circle in the y-z plane. They form canonical linked circles on S³ (Hopf charge magnitude one under conventional orientations). **This quaternionic SU(2) representation of the FIRST Hopf map is not the distinct SECOND Hopf fibration** `S^7->S^4`.

The structural vulnerability is explicit. Embed S² in a higher target sphere by adding one real direction e perpendicular to S²; fix a spatial basepoint n0∈S². For any n∈S² and t∈[0,π/2], with a=n·n0, v=n−a n0, write

`H_t(n)=[(cos²t)a+sin²t] n0 + cos(t)v + sin(t)cos(t)(1−a)e.`

This is unit norm, continuous, starts at n, finishes at constant n0 and **holds H_t(n0)=n0 at all times**. It explicitly unwinds the Hopf texture as soon as the one additional target direction is allowed. The same construction embeds into S⁴ or S⁸. A valid particle-hopfion hypothesis must **physically forbid or energetically suppress this deformation**, not simply draw a linked fiber picture.

## NFC prior negative knowledge: do not overwrite

The controlling scientific source is the **frozen canon**, not the publication README. NFC Book III has a conditional topological-conservation scholium for a field `Phi:R^3->S^3⊂C²` with fixed boundary and admissible evolution; it does not prove every abstract field is physically generated by NFC. More importantly, NFC speculative-holding entry **D-03 explicitly retires** the assertion that the recursive complex/quaternionic/octonionic Hopf tower or total-space-as-fiber recursion is *forced at NFC source*. It preserves NFR only as a restricted bridge tool and forbids automatic Hopf tower or E8 matter claims.

Frozen NFC commitment: `etblink/Nested-Fibrational-Cosmology@ed3047c2cbc0abc34d2549dd27754e4d3d05af78`,
`NFC_Book_III.tex` blob `987710948d7ac9d48643b14aeb1a31d2abee1165`;
`NFC_SPECULATIVE_HOLDING.md` blob `2d1eafee01b78e298907244fa607515ee3be857e`.

**Dimension ceiling:** the octonionic Hopf *base* S⁸ has 8 intrinsic spatial degrees and can be embedded in R⁹, which relates to the existing nine-vector geometry. The **total spinor target** S¹⁵ uses 16 real components. An internal field target of dimension 15 is not automatically 15 physical spacetime dimensions. If a candidate imposes ≤9 real dimensions on *all* coordinate and internal carriers, however, the standard S¹⁵ total space is outside that rule. Explicitly state which kind of dimension the cap constrains before claiming compatibility.

## External sources and Dennis relevance

- Sugic et al. incl. Mark R. Dennis, *Particle-like topologies in light* (2021): full polarization+phase volumetric field reconstruction and finite-volume measured Skyrme number ≈0.945; **complex optical S³ texture**, not an observed octonionic particle. https://doi.org/10.1038/s41467-021-26171-5
- Ornea, Parton, Piccinni, Vuletescu, *Spin(9) geometry of the octonionic Hopf fibration* (2013): standard S¹⁵→S⁸ geometry. https://arxiv.org/abs/1208.0899
- Parton & Piccinni, *The Role of Spin(9) in Octonionic Geometry* (2018): non-associative geometry and the important warning that the classical complex/quaternionic Hopf fibrations are **not automatically subfibrations** of the octonionic fibration. https://www.mdpi.com/2075-1680/7/4/72
- quaternionic q i q^{-1} description and topology: https://doi.org/10.1103/PhysRevB.110.075135

## Exact evidence and scientific roadmap

The companion cached fixture contains the original source gamma permutations and signs, with the original **Git blob SHA**. The independent local Python 3.13 consumer checked:
- 20,736 exact integer Clifford entries;
- all integer coefficients of two separate quartic identities (248 and 176 touched keys; all zero);
- unit spinor-to-unit vector target tests; north S⁷ fiber; representative inverse images;
- quaternionic q texture and both distinguished Hopf pole fibers;
- a **based**, boundary-preserving null homotopy after adding one target direction.

**Status:** local source-faithful symbolic computation PASS; **not a new Lean kernel qualification or physical experiment**. The source extraction itself was independently performed against the exact original GitHub blob. The fixture is a cache of source data; a future strict acceptance gate must fail if original Lean blob/arrays drift and must test a distinct independent consumer.

**NEXT GATES, prioritized by information gain:**
1. **Mathematical bridge:** establish an explicit O(8)×O(8)×O(8) basis match (or precisely specified isotopy) between the original source bilinear norm-composition and standard octonion multiplication, then a source-defined Spin(9)-equivariant full Hopf map. Separate original and consumer; no physics claim.
2. **Topological discriminator:** define the actual 3D field and relational observables. Identify the physical symmetry or energy term enforcing S² or SU(2) subcarrier; require boundary-fixed integer charge and prove that permitted perturbations cannot escape it. Counterfactual: allow one extra internal component and verify unwinding (above).
3. **Physical falsifier:** specify energy/action, domains, stability criterion, gauge identities, finite-energy solutions, quantized observable, and an experimental prediction distinct from established optical/condensed-matter/SM physics. If nothing can discriminate, label it MATHEMATICALLY_INTERESTING_PHYSICALLY_UNIDENTIFIED.
4. **FCP/SCC neutral comparison:** test the same observable in the weaker quaternionic/complex models and in non-topological field models. Octonionic structure earns no explanatory credit unless it changes an independently measurable result beyond those controls.

**Decision:** advance the octonionic source bridge as a bounded mathematical gate, with the three-space no-go and NFC retired-tower claim binding. **No promotion to fundamental particle, particle family, mass spectrum, or a Theory of Everything.** Keep the canonical unified branch; do not edit FCP main, NFC canon, or previously qualified BFSS anchors.
