# BFSS × QIT × SCC — W0H1A R1 original centralizer/comap generator-membership pre-gate

Date: 2026-11-17 Pacific. **FROZEN PRE-GATE CONTRACT — UNQUALIFIED.** This is a distinct original-source centralizer pullback architecture, not W0B1 R3. The active accepted W0H0 R1 source-exact scalar-image adapter and W0B0 original generator commutant are unchanged.

## Accepted donor and negative knowledge

- W0H0 R1 [original strict GREEN #44139239821](https://github.com/etblink/math/actions/runs/44139239821), tested SHA `8760e7ecb1ac5bd0f8c3eb480d752b3c14716819`, source Git blob `7555f5e17d9f465c1e4b7b04ffc450eb1667fc13`, consumer `21c02789f62e5e345eff7caf4e10505f6cbe4961`, workflow `66ca52d2884c2c6dd25885fc1ccaaf5c8f36d135`. Provider original 13,262-byte ZIP Git blob `ffbd66e56aff83031aece2c3b310ed34678bdd9f`, original full CI job log blob `8861ab57e0e12df0d5143a014434fa3ecf5503de`, six-member SHA manifest blob `e6fe871ebefc67b3c2cde2b5a44345d781ef79a3`. Independent [preservation #44142635149](https://github.com/etblink/math/actions/runs/44142635149) and [acceptance guard #44143160424](https://github.com/etblink/math/actions/runs/44143160424) GREEN.
- Original M3I `FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv`: source Git blob `754a5f2a13baea90312f6031eb8fa7963dbdf42b`. Original W0B0 R2 [#44109519633](https://github.com/etblink/math/actions/runs/44109519633) source blob `c67f30bb76a9990e508a8a050a8c3313e694bda7` proves original complex Clifford generator-image commutation conditional on commutation with all 48 literal normalized Majoranas. Generic W0G0 R1 [#44135729729](https://github.com/etblink/math/actions/runs/44135729729) and original W0H0 R1 provide accepted scalar centrality.
- Both original W0B1 [R1 RED #44117272657](https://github.com/etblink/math/actions/runs/44117272657) and [R2 RED #44127193329](https://github.com/etblink/math/actions/runs/44127193329), their provider ZIPs, complete logs and manifests, remain frozen with stop reason `TWO_ANALOGOUS_ORIGINAL_SCALAR_INDUCTION_SOURCE_REDS_STOP`. No modifications, imports or new run on the W0B1 original induction source. W0A4 R1/R2 STOP and W0G0 harness-only RED remain archived.
- Mathlib pinned at `d13f23b723b8a846827a245b89c10fc7d3f11612`: `Mathlib.Algebra.Algebra.Subalgebra.Basic` defines `Subalgebra.centralizer`, `Subalgebra.comap`, `Subalgebra.mem_comap`, `Subalgebra.mem_centralizer_iff`. Clifford generation `CliffordAlgebra.adjoin_range_ι` is reserved for future W0H1B, **not used in W0H1A**. Lean pinned 4.34.1.

## Exactly one new original-source mathematical theorem

Use the real original `Fermion 2` carrier, no surrogate Fock operator and no changed Clifford algebra or gamma source; import the accepted original W0B0 and W0H0 modules and Mathlib's existing centralizer algebra interface.

Define one **source-exact subalgebra object** (not a new axiom):

```lean
private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

def originalSourceCentralizerPullback (T : Op) : Subalgebra ℂ A :=
  Subalgebra.comap
    (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv : A →ₐ[ℂ] Op)
    (Subalgebra.centralizer ℂ ({T} : Set Op))
```

Prove one theorem (and no second source theorem):

```lean
theorem originalGenerator_mem_sourceCentralizerPullback
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (w : ℂ ⊗[ℝ] Source48Vector) :
    CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w ∈
      originalSourceCentralizerPullback T
```

Proposed proof: `rw [Subalgebra.mem_comap, Subalgebra.mem_centralizer_iff]`; introduce `g ∈ {T}`, identify `g = T` from `Set.mem_singleton_iff`, then apply the exact previously qualified `originalComplexEquiv_generator_commutes T h w` by `.eq`. This is a generator-membership / set-centralizer theorem, not four-case `CliffordAlgebra.induction` and not source-exact all-element commutation. Avoid resource-option relaxation. Do not construct a replacement `CliffordAlgebra`, `AlgEquiv` or physical carrier.

## Independent consumer and strict checks

Consumer imports only W0H1A and transitively qualified sources; one consumer theorem restating the exact source claim, plus two concrete controls: `w = 0` and actual original pure-tensor `(1 : ℂ) ⊗ₜ[ℝ] v` for arbitrary original real source vector `v`. Source single theorem and independent consumer single theorem each have `#print axioms`, no sorry or unapproved axiom. No native Clifford generation yet.

Require strict exact Git blob preflight (source, consumer, workflow, W0H0 and W0B0 original evidence and W0B1 STOP original REDs), pinned Lean/Mathlib, cold source build, standalone independent consumer build, two independent concrete controls, allowed axioms exactly `propext`, `Classical.choice`, `Quot.sound` or subset, six independently negative mutations and full provider-original ZIP/complete original Actions job log rehash/CRC/member digests Git-pinned **before qualification**. Gate must be independently roadmap-guard GREEN. Two analogous *native original-source* failures trigger an architecture stop and diagnosis; do not permit cosmetic unchanged retries. `main` untouched.

## Claim ceiling

W0H1A only establishes conditional membership of each original Clifford generator in a source algebra pullback of a singleton Fock-operator centralizer. It does **not** prove full Clifford-image commutation, `adjoin_range_ι = ⊤` source application, scalar commutant (Schur), QIT trace completeness, fermion-parity/gauge operational observability, or any BFSS Hamiltonian claim. Full closure **W0H1B** remains a separate gate, strictly prospective until W0H1A source-exact acceptance.
