# K1D18V7F Gate 1 — explicit `invOf_mul_self` argument repair

**Project Lead negative evidence and bounded repair, 2026-10-30 UTC.** Previous accepted K1D18V7E remains unchanged. V7F has NO accepted roots before a new terminal strict gate. The correction is type-level application only, not a mathematical claim or changed source geometry.

## Failed gate provenance

- [GitHub Actions run #41000014744](https://github.com/etblink/math/actions/runs/41000014744) completed failure, tested SHA `acddd43b9e9bb2bda9711651cb7998a4134d57eb`, job `123881974528`.
- Original failed source blob `1a91aca261e0832d31f8194143199dae312dbc42`. Retained error artifact `12953052670`, SHA-256 digest `b980842b38cab859bf34969967e444d9d4ec169ede9de7aec303bd011dee87a5`.
- Original source hash/pins, dependency restoration, 37-module/81-root accepted-ancestry cache validation passed. The **fresh warning-as-error source compilation** step failed on K1D18V7F. Independent 118-root audit was skipped, so no V7F root was qualified.
- **First causal compiler error:** source module `SU2BFSSPhysicalDomainS1V52K1D18V7FOriginalSourcePolarEuclideanLineAxisFormulaProbe.lean:76:15` reported `Type mismatch` for bare `invOf_mul_self`. Lean revealed its type `∀ (a : ?m.87) [inst : Invertible a], ⅟a * a = 1`, but expected concrete `⅟(Q u) * Q u = 1`. The theorem has an explicit argument; bare `exact invOf_mul_self` did not instantiate that argument. This is **elaboration/application mismatch**, not a failure of source-Q polarization or geometry.
- The initial `quadraticPolar_eq_two_realInner_of_normSq`, `originalSourcePolar_eq_twoEuclideanInner`, and `originalSourceUnitQ_euclidean_norm_one` printed only the normal accepted axiom whitelist in the failed module; dependent original source rank-one action and negative-formula roots show `sorryAx` as a *consequence of failed compilation* and are NOT accepted. Preserve this distinction.

## Surgical repair and gate

- Change the unique occurrence `_ = 1 := invOf_mul_self` to `_ = 1 := invOf_mul_self (Q u)`.
- New source blob `5712cb4ca7a93e4b610cd977e44cc34054210b4b`. Update only the corresponding exact source hash in `.github/workflows/bfss-kotler-k1d18v7f-source-polar-euclidean-line-axis-strict.yml`; all other pinned ancestor/source SHA checks, original `Fin 24 × Fin 2` labels, `source48Quadratic`, accepted S1V37/B/C/V6D rank-one action, Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and source-qualification contract remain unchanged.
- Exact retained strict target: 35 fresh warning-as-error source modules, 118 independently checked declaration types and axioms, 81 sealed accepted ancestry roots. No resource-limit or assumption adjustments, no alternate source, no unapproved upstream changes.
- The new commit is **only a candidate until a successful independent strict gate**. If red, stop and identify the new earliest causal diagnostic; do not repeat blind retries.

## Remaining mathematical boundary

V7F still aims to establish the exact original source-Q polarization `polar Q u w = 2 inner (E u) (E w)` and original Clifford line-axis matrix formula in same-label Euclidean coordinates. Only a subsequent separate theorem may identify that action with minus the native `(ℝ ∙ E u)ᗮ.reflection`; original sourceSO group generation, unconditional Spin48 surjectivity, covering, global Spin9 and BFSS physical spectra remain unproved.
