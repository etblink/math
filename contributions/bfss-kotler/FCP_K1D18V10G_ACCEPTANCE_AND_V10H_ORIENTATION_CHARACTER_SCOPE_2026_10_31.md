# K1D18V10G — qualification; V10H Spin9 determinant character and SO48 exact boundary

Date: 2026-10-31 PDT. Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## V10G — ACCEPTED

- Verified [strict run #41256247497](https://github.com/etblink/math/actions/runs/41256247497), attempt 1, job `124699913529`, completed SUCCESS, immutable tested SHA `932a56ed10519f3297875e3e8458cbaf14a7fbce`.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9OriginalPaired48DeterminantTransferProbe.lean`, git blob `1f71be97fb11a01022257b791ab38863de4407b5`.
- Source exact Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` pinned. V10F full 48-label orthogonal ancestry built. Fresh compiler with `-DwarningAsError=true`, four independent typed examples, explicit four declaration-level axiom whitelist all PASS with only `propext`, `Classical.choice`, `Quot.sound`; **NO `sorryAx`**.
- Exact declarations: `gamma16ToOriginalPaired48_det`, `source9SpinOriginalPaired48OrthogonalHom_det`, `gamma16ToOriginalPaired48_plane`, `source9SpinOriginalPaired48_mem_specialOrthogonal_of_gamma_det_one`.
- Immutable verified [artifact #13063975485](https://github.com/etblink/math/actions/runs/41256247497/artifacts/13063975485), sha256 `57bcb3bd90808590a767874ad69d2fa186f0e8cecc6c0c3eabb803e25484fac4`, nonexpired at review.

**Qualified result:** The determinant of the original G1A paired 48-real matrix is the cube of the determinant of its original nine-source real 16-spinor gamma image. The paired generator equals the genuine previous originalPairedPlane. Under the *separately unproved* hypothesis `det gammaImage16(g)=1`, the original paired image belongs to `Matrix.specialOrthogonalGroup Source48Label ℝ`. V10G does NOT prove this antecedent.

## V10H — UNQUALIFIED source-exact next candidate

Pinned Mathlib's `Matrix.detMonoidHom` and `Matrix.det_mul` construct a determinant character `spinGroup source9Quadratic →* ℝ`. Since V10E proves genuine orthogonality `A Aᵀ=1`, the accepted `Matrix.det_transpose` implies `det(A)^2=1`; this **does not** choose the +1 or -1 sign. Combining this with accepted V10G cube identity should yield `det paired48 = det gamma16` (not merely the cube), and an exact **if and only if** equivalence between source 48-label SO membership and gamma 16 determinant-one. All declarations are tentative until verified by the strict gate.

The declaration-level source signatures under test: `source9SpinGammaDetHom`; `source9SpinGammaDetHom_sq`; `source9SpinOriginalPaired48_det_eq_gamma`; `source9SpinOriginalPaired48_mem_specialOrthogonal_iff_gamma_det_one`. Each gets its own independent typed elaboration and whitelist check.

**Research caution and true next obstacle:** `det gammaImage16(g)=1` for every genuine source `spinGroup source9Quadratic` remains a distinct, open proof obligation. Its resolution may require careful study of pinned `lipschitzGroup` generators, the real Clifford positive quadratic convention, the `pinGroup` unitary condition, and the source spinor gamma determinant; do not assume positivity, connectivity, source topology, or scalar-sign properties absent an exact theorem. V10H will NOT claim SO(48), a continuous Lie group homomorphism, a Spin(48) lift/covering, any Fock implementation or BFSS physical claim.

Two earlier V10E red CI runs (`#41253720110`, `#41254379517`) remain retained with explicit cause (scalar `algebraMap` vs `r • 1` definitional-equality mismatch). Prior gated successes are not used to overwrite red knowledge. Candidate changes are confined to a new source, gate, and this audit; main, upstream, pinned dependencies and accepted source declarations unchanged.
