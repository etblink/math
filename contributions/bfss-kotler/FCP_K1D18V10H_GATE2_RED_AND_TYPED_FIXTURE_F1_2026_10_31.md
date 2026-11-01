# K1D18V10H — Gate 2 red disposition, F1 isolated typed determinant fixture

Date: October 31, 2026 PDT. **Status:** V10G ACCEPTED; V10H Gates 1 and 2 RED; F1 is UNQUALIFIED until its own strict gate returns green.

## Red evidence (immutable)

- Gate 1 [run #41257058496](https://github.com/etblink/math/actions/runs/41257058496) tested `20e37c939a4f04909c99607680ba96f1aec371f7`, failed job `124702348480`, artifact [#13063922758](https://github.com/etblink/math/actions/runs/41257058496/artifacts/13063922758), SHA256 `a06dafe1ee31cad1ec4daae27581415e91df6aeaeafca842e9f86712774d2cff`. First unknown `Matrix.mem_orthogonalGroup_iff.mp`, followed by two `maxRecDepth` diagnostics at global character evaluation. Source V10G ancestor rebuild green; downstream proof had `sorryAx`; independent audit skipped.
- Gate 2 [run #41257744030](https://github.com/etblink/math/actions/runs/41257744030) tested `8ee8a6d4e779d28e51b761518461ed22c80ec054`, failed job `124704418686`, artifact [#13063553565](https://github.com/etblink/math/actions/runs/41257744030/artifacts/13063553565), SHA256 `9d7e1dbc88807d6c79017def913f92e030a4620e54034ea18bc15065424ebbde`. Exact first errors: two `maximum recursion depth has been reached` on the added `source9SpinGammaDetHom_apply` theorem at source line 40; `Invalid field mp` on the not-yet-specialized `Matrix.mem_orthogonalGroup_iff` source theorem at line 57, whose type requires explicit matrix index/type arguments; downstream unknown constant errors and unqualified `sorryAx`/kernel reports.
- Both gates passed source-hash preflight and pinned Lean4 v4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration and V10G exact ancestor rebuild. **Do not** reinterpret an unqualified printed theorem line as a proof.

## Root-cause update and decision

Our earlier scalar proof failures showed the same pattern: raw definitional unfolding of nested source adapters can be a poor Lean interface. V10H Gate 1 tried an unapplied iff projection, then a costly `change`. Gate 2 tried direct `rfl` on a composed MonoidHom and used `(Matrix.mem_orthogonalGroup_iff).mp` before specializing all required binders. These two fixes did not reduce elaboration ambiguity. **Stop broad V10H gate churn.** No compiler recursion/heartbeat limit is raised, no theorem statement weakened, no axiom/sorry/admit introduced.

## F1 bounded typed experiment, not a V10H acceptance

A new **separate source module and workflow** imports only *accepted V10G*, NOT unqualified V10H. It proves just two typed obligations directly from source O16 membership and accepted source V10G paired48 cube determinant, without introducing or reducing any determinant-character composite:

1. `FCP.BFSSPairedSpin9DetFixture.gammaDetSquareOne`: from the actual `(source9SpinGammaOrthogonalHom g).property`, first retype as matrix membership, then `rw [Matrix.mem_orthogonalGroup_iff] at horth` for exact argument inference, take matrix determinant, rewrite `det_mul`, `det_transpose`, and `det_one`, finally `pow_two`.
2. `FCP.BFSSPairedSpin9DetFixture.pairedDetEqualGamma`: exact original paired48 determinant is the **cube** of source gamma16 determinant (qualified V10G), which equals the **first power** by the preceding orthogonal determinant-square-one theorem. Does **not** claim determinant is +1.

These are the smallest useful obligations that bypass the observed failing character evaluation. A new warning-as-error source compile plus two independent exact-type elaborations, strict two-theorem whitelist axiom check and preserved compiler artifacts must pass **before any result is promoted**. The existing two V10H reds remain unmodified. A green fixture only establishes these two lemmas, not the full V10H candidate.

SO(48) orientation, source Spin9 topology/continuity, original Spin48 lift or covering and BFSS Fock or physics claims remain OPEN. No changes to main, external upstream, accepted source or pinned dependency.
