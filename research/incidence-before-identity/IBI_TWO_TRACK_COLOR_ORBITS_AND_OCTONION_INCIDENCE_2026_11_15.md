# Incidence before identity — two-track program after accepted G0C-SO3-HOM

Date: 2026-11-15 Pacific (GitHub UTC 2026-11-16).  
Branch: `research/bfss-incidence-unified-20261114`.  
Governance: bounded research planning; no declaration in this note is a new Lean theorem; no automatic promotion to unified integration or physical ontology.

## Baseline

The source-exact typed original BFSS `GaugeGroup 2 →* SO(3)` homomorphism and surjectivity are **GREEN_QUALIFIED** by [#43782546758](https://github.com/etblink/math/actions/runs/43782546758) on `b3fce75382db8a50148b30d02585c0dd37ec1a20`. Qualified exact original-source G0A Gram, G1A Lie triple, G1B signed cross and G0B1 finite determinant/source columns/orientation remain separate accepted mathematical dependencies. G2A boson action and G3A coefficient image are shared, byte-identical between incidence and unified integration at the prior cross-branch audit.

The original `SU2RealGammaProbe.lean` source, blob `b9b8192055c70f0d001d7982669b9823c55562ed`, supplies real symmetric nine gamma Clifford identities. Independent source-pinned exact-arithmetic research in `IBI_OCTONION_TO_SOURCE_BRIDGE_AUDIT_2026_11_15.md` provides an eight-real-dimensional unital normed composition candidate from corrected gamma blocks, **NOT** a qualified Lean octonion algebra equivalence or physical operator theorem.

## Track A: original BFSS bosonic color incidence and orbit recovery

### Aim

For arbitrary original source `x y : Boson 2`, prove in Lean, with exact normalized signed triple:
```text
  (∀ i j, originalGram x i j = originalGram y i j)
  ∧ (∀ i j k, originalCrossTriple x i j k = originalCrossTriple y i j k)
    ↔ ∃ g : GaugeGroup 2, FCP.BFSSSU2GaugeG2A.bosonGauge g x = y.
```
The forward implication in the sense of gauge-related ⇒ invariants is already source qualified. The converse is not.

### Smallest proof DAG

A1. Original source G2A-to-G3A coordinate intertwiner:
```text
spatialColor (bosonGauge g x) i B
  = ∑ A : Fin 3, (adjointColorMatrix g) B A * spatialColor x i A.
```
Use `AlgebraData.spatialColor_gaugeConjugate`, `AlgebraData.colorConjugate_coefficient`, and G3A's exact row/output, column/input convention. This must be a source-exact theorem with independent arbitrary `g,x,i,B` consumer. Do not use an unlinked SO3 surrogate.

A2. Standalone finite-dimensional theorem: same Gram induces isometry between the spans of nine real three-vectors; extend to O(3), including all rank 0,1,2,3 cases. If rank 3, nonzero oriented triple forces determinant +1; if rank ≤2, correct sign on an unused orthogonal complement. Maintain explicit improper-reflection rank-3 negative control and rank-2 proper-correction positive control.

A3. Transport through the accepted `originalAdjointSO3Hom_surjective` and A1 to the literal G2A boson gauge orbit. Distinguish coarse orbit classification from gauge stabilizers/groupoid, polynomial invariant-ring generation, Hilbert/Fock quotient and domains.

A4. Identify a nontrivial existing BFSS downstream consumer. Candidate: source-exact original gauge-invariant scalar witnesses or rank-one valley/section obstruction. Source-Fock nonzero physical L² witness or relevant kinetic/Hardy bridge earns higher priority but is not presumed.

### Stop rule

Two analogous first-causal Lean failures ⇒ isolate abstract algebra/gauge adapter. One complete mathematical orbit classifier with no identifiable original-operator consumer ⇒ preserve and park physical-priority claims, not merge all exploratory work. Kernel ±I2 is optional for coarse orbits, necessary for fuller isotropy/fermionic transfer.

## Track B: from original Spin(9) gamma incidence to octonions

### Correct logical strength

A bare incidence graph or Gram metric is not uniquely octonionic. A suitable *oriented and signed* seven-point Fano incidence system with full compatible multiplication rules, or a positive stable 3-form `φ` plus its metric/orientation, determines a normed octonionic multiplication. The raw Fano support without signs does not fix the complete source multiplication table. The original BFSS color SU2 SO3 map is **not** the same symmetry as spatial Spin9 or the exceptional G2 automorphism group.

### Source-specific signed incidence target

Using the real gamma `A_i` blocks and corrected basis `Q x = A(x)e7`, the reconstructed product is
```text
x ⋆ y = A(Qᵀ x)y,   unit = e7,  ||x ⋆ y||² = ||x||²||y||².
```
Existing exact-integer source-table recomputation yields the source-coordinate 7-form on imaginary `e0..e6`:
```text
φ = -e^{016} -e^{025} -e^{034} -e^{124}
    +e^{135} -e^{236} -e^{456}.
```
Each of the 21 unordered pairs belongs to exactly one of these seven triples. The distinct nonassociativity fixture is
```text
(e6 ⋆ e5) ⋆ e0 = -e3,     e6 ⋆ (e5 ⋆ e0) = +e3.
```
Importantly, raw `A(x)y` is NOT already two-sided unital in the source coordinate order (e.g. `A(e0)e7=e6`), and `det Q=-1` tracks the exact basis parity.

### Smallest proof DAG

B0. Separate source-independent signed Fano incidence table on `Fin 7`. Prove all 21 pair-to-third uniqueness/sign laws and wrong-sign negative controls; reconstruct an eight-dimensional `ℝ ⊕ ℝ⁷` multiplication directly from the signed 3-form. Do not copy the source gamma multiplication as the definition of the consumer algebra.

B1. Source-exact `SU2RealGammaProbe` matrix-block extraction and the explicit orthogonal `Q` adapter. Prove corrected two-sided unit and full norm-composition identity in Lean. Keep source gamma blob pinned; source implementation can reuse accepted Clifford relations rather than recomputing all 9×16² entries.

B2. Exhibit the single explicit signed-basis isomorphism between B0's independently defined incidence multiplication and B1's gamma-derived product. Check the 64 basis pairs, nonassociativity and wrong-orientation fixtures with an independent consumer. Source-to-octonion isomorphism is NOT accepted until strict Lean cold build and independent consumer pass.

B3. Separately recover the quadratic Hopf map `S¹⁵→S⁸` via source gamma incidence norm identity. Physical Spin9 covariance, Fock CAR transfer, possible RP8 descent obstruction, and spectral utility are **new** tests, not automatic corollaries of an octonion multiplication table.

### Stop rule

If signed incidence B0 reproduces only a conventional octonion table with no exact gamma-source crosswalk, park. If B1's source matching fails, preserve the first incorrect coefficient/basis sign. Do not equate signed color triple in `ℝ³` with the positive G2 3-form in `ℝ⁷`. Do not infer Standard Model families, a ToE, or an original BFSS spectral conclusion.

## Coupling, promotion, and priority

The common **method** is reconstruction from invariant relational structure; the two branches have different source carriers and symmetries. Do not claim mathematical coupling solely because both use signed triples.

Run A1 (smallest missing original bosonic adapter) as the immediate proof lane, while B0 runs as a *source-independent research/control lane*. Then qualify B1/B2 independently only if the B0 basis and sign certificates are stable.

Use an explicit bridge ledger to evaluate physics payoff: concrete original BFSS theorem improved, assumption removed, negative control survived, and strict source/consumer cost. Preserve accepted/failed receipts. Any import to `integration/bfss-unified-research-20261108` must be clean, exact-pinned, selectively rebased against the live unified HEAD, independently qualified with an identifiable mainline consumer, and owner-approved. Never touch `main` or rewrite historical branch evidence.
