# M3G0B1-BI prospective basis-independence route — forward research ONLY
**Date:** 2026-11-13 Pacific. **Current accepted math:** M3G0B0 R3 strict [#43422546945](https://github.com/etblink/math/actions/runs/43422546945), tested `38017936230c959dc61dfb07c0e776d5ffc04ab5`. **B1 pending** strict [#43461444633](https://github.com/etblink/math/actions/runs/43461444633), tested `f163921f3363be9154a2ffbe0d3c10e94d0c8e75`. No mathematical B1/B1-BI acceptance asserted by this note. Canonical `integration/bfss-unified-research-20261108`.

## Original physical action and the exact conditional B1 dependency
The bounded original-Fock operator action candidate is `originalFockOperatorGaugeEquiv b g f`, where `b : OrthonormalBasis ι ℂ (Fermion 2)`, `g : GaugeGroup 2`, and `f : OriginalFockOperatorLp`. Pending B1 theorem `originalFockOperatorGaugeEquiv_source_operator_ae` is intended to prove that, almost everywhere on the **original** `Boson 2`,
`Γ_b(g)f(x) = ((pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap).comp (f (pairedGaugeData.boson g⁻¹ x))`.
The RHS is independent of the basis `b`; it is the exact left-fermionic-output/inverse-bosonic-pullback source action, **not** conjugation.

## Next separate bounded theorem, conditional on B1 STRICT GREEN
Let `ι κ` be *possibly distinct finite types*, `b : OrthonormalBasis ι ℂ (Fermion 2)`, `c : OrthonormalBasis κ ℂ (Fermion 2)`. For each fixed `g,f` prove
`originalFockOperatorGaugeEquiv b g f = originalFockOperatorGaugeEquiv c g f`.
This is an equality in the original operator-norm `OriginalFockOperatorLp` class, *not* only a Hilbert–Schmidt column norm statement.

**Minimal prospective Lean proof, to be rechecked against exact type signatures when B1 qualifies:**
```lean
theorem originalFockOperatorGaugeEquiv_basis_independent
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (c : OrthonormalBasis κ ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) :
    originalFockOperatorGaugeEquiv b g f =
      originalFockOperatorGaugeEquiv c g f := by
  apply Lp.ext
  exact (originalFockOperatorGaugeEquiv_source_operator_ae b g f).trans
    (originalFockOperatorGaugeEquiv_source_operator_ae c g f).symm
```
The `Lp.ext` API is used on the **actual** original operator-valued Lp type in accepted `P3M2B2B1OriginalOperatorLpTransport.lean`, at the existing `originalFockOperatorLp_recovered` and `originalFockHSFieldLp_recovered` proofs (qualified #43368580602). Separate `=ᵐ[volume]` identities are combined by `EventuallyEq.trans`; each a.e. set is for fixed `b,c,g,f`, not a uniform full-measure set for all uncountable SU(2) parameters.

## Guards and next intended proof
- B1 must first pass independent strict #43461444633 (or later exact verified repair) with all 463 pins and three root axiom audits. If B1 is RED, this basis-independence candidate is unqualified and cannot be used as a donor.
- Propose separate B1-BI receipt/source/consumer/strict gate only **after** accepting B1. No edits to accepted M3G0A/B0/M2B2B1.
- Do not conflate **basis independence** with `Γ_b(g)` being *isometric* in the original operator norm. The latter requires a separate B2 theorem: source fermion isometry by left composition plus source measure-preserving inverse boson pullback, and original operator norm. Avoid deriving it from the M2/HS-column continuous equivalence, which is not isometric.
- M3G0C physical fixedness (L6G7V), nonzero physical `L²` witnesses, closed BFSS Hamiltonian/domain, spectral gap, Spin9 or ToE/GUT conclusions remain out of scope.

**Disposition:** forward route qualified as *research design only*. Do not stage B1-BI Lean or a strict workflow until B1 GREEN is verified and entered in canonical `BFSS_GATE_STATE.json`.
