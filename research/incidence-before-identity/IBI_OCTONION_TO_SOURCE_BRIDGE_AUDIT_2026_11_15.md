# OCT-SRC source bridge audit: BFSS gamma, orthogonal multiplication, octonions and incidence

**Date:** 2026-11-15 Pacific.
**Branch:** `research/bfss-incidence-unified-20261114`.
**Disposition:** source-pinned forward research + exact integer diagnostics, **not a new
Lean-qualified source-to-octonion equivalence, Fock/physical operator
theorem, or new framework admission**. The live G1B failure is separately
recorded at its exact SHA, without editing its source.

## Scope and repository inventory

Reviewed the unified-integration ancestry
`a04a26d1360a85398a21d2c73688c9fa7d9aa2b7` and the actual current
IBI branch. Searched file-tree names under the 7,787-entry
`lean/OAI/MathematicalPhysics` subtree, the 994-entry Kotler source
subtree and 450-entry `research` subtree, plus original FCP/NFC main
file inventories. **No dedicated BFSS Lean file with an explicit
octonion-to-source equivalence or an `Octonion`-named BFSS module was
identified**. This is a file-name/source-inventory result, not a proof
that no octonion-relevant algebra is embedded in unnamed files.

There is substantive existing octonionic *source geometry* and finite
diagnostics:

1. [Literal source nine real Clifford gamma signed permutations](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean),
   blob `b9b8192055c70f0d001d7982669b9823c55562ed`.
   Source supplies real symmetric nine-gamma Clifford relations;
   Lean statements are present, unlike the missing octonion crosswalk.
2. [All-nine-vector gamma Clifford lift](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceCliffordGammaLiftProbe.lean),
   blob `f53d7c52559d8e00061716d2746a87154e35e3fa`.
3. [Actual source Spin9/global gamma covariance](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaCovariance.lean),
   blob `a781695776197adb057f5a7c2c2f2d983a6441eb`.
   **Availability is not independently recertified in this audit**:
   historical notes describe accepted gamma/Spin9 infrastructure,
   but this pass did not replay old strict gates.
4. [Source-derived Hopf eigenbundle/clutching memo](../unification/SPIN9_EQUIVARIANT_HOPF_BUNDLE_CLUTCHING_AND_COLOR_TRIPLING_2026_11_10.md),
   and [pinned exact checker](../unification/tools/spin9_octonionic_hopf_clutching_exact.py),
   blob `db2fd1ac99ef425dfe0c20964a3866eb278ab020`;
   the research note explicitly says a source-to-octonionic
   coordinate **identification remains a separate future proof**.
5. [Spin8 triality/source SU2 commutant audit](../unification/SPIN8_GAUGE_COMMUTANT_TRIALITY_AND_PROJECTOR_TESTS_2026_11_10.md);
   [rank-one RP8 and labeled-projector descent obstruction](../unification/SPIN9_HOPF_BUNDLE_PHYSICAL_VALLEY_RP8_OBSTRUCTION_2026_11_10.md);
   [naive Majorana Hopf quadratic null control](../top-down-symmetry/TD0N_MAJORANA_HOPF_QUADRATIC_NULL_CONTROL_2026_11_13.md).
   These are exploratory topology/representation arguments,
   **not yet end-to-end Lean source physical theorems**.

## Exact new coordinate clarification from the literal source

For the literal 16-by-16 real source gammas,
```text
Gamma(x,t) = [ t I8       A(x)   ]
             [ A(x)^T    -t I8   ],
A(x) = sum_(i=0)^7 x_i A_i.
```
The original gamma relations imply
`A(x)^T A(x)=A(x)A(x)^T=|x|² I8` for real eight-vectors.
The source signed-permutation table has `A_7=I8` exactly.

**Important negative control:** the raw bilinear orthogonal
multiplication `B(x,y)=A(x)y` is NOT the standard unital octonion
table in the source coordinate order. It has
`B(e7,y)=y`, but `B(e0,e7)=e6 ≠ e0`.
A direct claim that `e7` is already a two-sided unit for raw B
would be false.

Define an explicitly source-calculated orthogonal signed-permutation
map `Q:R8→R8` by
`Q x := A(x)e7`, with columns `Q_(·,i)=A_i e7`.
Exact integer arithmetic verifies `Q^T Q=QQ^T=I8`,
`Q e7=e7`, and **det Q = -1**. The exact columns are
```text
Q e0= e6,  Q e1= e4,   Q e2= -e1,  Q e3= e5,
Q e4=-e3,  Q e5= e0,   Q e6= -e2,  Q e7= e7.
```
Now define
```text
x star y := A(Q^T x) y.
```
For ALL real vectors (by bilinearity and matrix identities),
```text
e7 star y = y,     x star e7 = x,
|x star y|² = |x|² |y|².
```
Thus the source gives an explicit candidate **unital positive-definite
eight-real-dimensional composition algebra**. Standard real normed
division-algebra classification identifies an eight-dimensional such
algebra with the octonions, up to real isometric algebra isomorphism.
The classification step and a *literal coordinate equivalence to a
particular existing octonion library representation* have not been
formalized in this BFSS source. Do not call this an accepted Lean
`ℝ^8 ≃ₐ ℍ/𝕆` equivalence or silently replace matrix multiplication.

Direct exact integer signed-table computation gave an explicitly
nonassociative original-source witness:
```text
(e6 star e5) star e0 = -e3,
e6 star (e5 star e0) = +e3.
```
Basis-unit, imaginary-unit-square, anticommutator, and deterministic
integer-vector tests agree with a normed octonionic multiplication.

## Original spinor Hopf map, source-normalized

For the literal 16-real-spinor split `s=(u,v)` with `u,v∈R8`,
form the nine real quadratic coordinates
```text
h_i(u,v)=2 <u,A_i v>,  i=0,...,7,
h_8(u,v)=|u|²-|v|².
```
The orthogonal multiplication identity implies
```text
sum_(i=0)^8 h_i(u,v)^2 = (|u|²+|v|²)^2.
```
Therefore the map on the unit `S15` lands in `S8`, matching
the source gamma quadratic `h_i(s)=s^T gamma_i s`.
The exact integer checker tests nontrivial (including mixed-sign)
vectors and this norm formula. This directly targets the
*actual source coordinates*, not an unrelated octonion parametrization.

The underlying finite identities can be a small independently
qualified **OCT-SRC0** Lean gate:
exact 8×8 source block relations, source Q orthogonality, the
two-sided unit and norm composition laws, gamma-to-Hopf quadratic
equality. Source Spin9 family equivariance, group topology,
smooth bundle charts and Euler class remain separate.

## Important physical and incidence negative controls

- The 48 source Majorana labels are `R3_color⊗R16_spin`;
  the original SU2 action mixes the three color copies.
  Giving *each color copy a different Spin8 triality twist*
  violates the unchanged source SU2/Spin8 commutant;
  three color copies do NOT prove three observed generations.
- The natural **commuting** real-spinor quadratic Hopf map
  cannot be naively substituted by original noncommuting
  Majorana CAR operators: the source-informed symmetrized
  quadratic `sum Gamma_i[αβ] theta_(αa) theta_(βa)`
  is exactly zero when the Clifford trace is zero.
  This negative control is analytic, not yet native Lean.
- The color-summed classical Hopf vector on three spinors
  may vanish for nonzero source-like vectors; its normalized
  version is **not a globally defined** `S47→S8` map.
- On the original nonzero rank-one bosonic valley, the
  gauge-unoriented direction is `[n]∈RP8`, not a chosen
  `n∈S8`; the source gamma `P_+(n)` and `P_-(n)`
  exchange under antipodes. The labeled rank-eight Hopf
  bundle does not automatically descend to physical RP8
  data; only source-compatible unordered/twisted or full
  groupoid representations are candidates.
- **Different symmetries:** OCT-SRC pertains to spatial
  Spin9 and original spinor gamma geometry. Our ongoing
  G1B/G0B1 incidence proof concerns 3-color SU2→SO3.
  The octonion bridge supplies NO free det-one proof or
  surjectivity for the original color gauge matrix.
- Nonassociativity prohibits treating arbitrary octonionic
  2×2 matrices as a naive associative matrix group;
  source spin action requires exact nested/group-compatible
  constructions. See also Gazeau–Sliżewska (2026),
  arXiv:2610.26975, as external contextual mathematics,
  **not** a source qualification.

## Reproducible source-pinned diagnostic

`research/incidence-before-identity/tools/bfss_octonion_source_gamma_bridge_exact.py`
is a **new prospective stdlib checker**, pinned by Git blob, that
reads the literal source, checks block and Clifford identities,
constructs Q and the corrected product, checks the non-associative
fixture, basis identities and Hopf norm samples. The key identities
and fixtures were independently recomputed in this investigation
using exact integer JavaScript directly on retrieved source tables.
**The new committed Python file has not yet been executed or
CI-qualified in this turn**; avoid claiming it passed CI.

## Gate and project-lead decision

1. **Retain this octonionic source-coordinates route as an
   independently falsifiable OCT-SRC0 candidate**, but do not
   interleave it with G1B's failed inner-scalar proof.
2. G1B [#43695261997](https://github.com/etblink/math/actions/runs/43695261997)
   finished **RED_UNQUALIFIED** with first causal `simp made no progress`
   at `IBIG1BOriginalSignedCross.lean:84:2`, propagating
   `sorryAx` to its two dependent roots. Preserve the
   [first-causal receipt](IBI_G1B_R1_RED_43695261997_SOURCE_INNER_SCALING_2026_11_15.md)
   before any separately preregistered source-only repair.
3. Continue main IBI G1B and G0B1 orientation gates on the
   original bosonic SU2 color path after qualification.
   Octonionic source Spin9 geometry cannot shortcut these.
4. **Promotion rule:** no OCT-SRC merger or change to IBI
   priority until a strictly qualified source gamma-coordinate
   identity, independent consumer and demonstrable downstream
   original BFSS Spin9/gauge/Fock/domain application. A
   source-Hopf sphere identity alone is known geometry, not
   ground-state fidelity, new physics or an ontology.

No original accepted Lean source, unified integration/G9,
`main`, frozen FCP or historical research record was modified
by this audit.
