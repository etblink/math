# K1D18V10H — F9 accepted; F10 exact original ninth-gamma positive determinant anchor

Date 2026-10-31 PDT. Branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## F9 qualification accepted

- [Run #41265483779](https://github.com/etblink/math/actions/runs/41265483779) SUCCESS, attempt 1, job `124727312559`, exact tested SHA `7ceb2e7abda114a1a4fb6bd4b941969222e3836d`.
- F9 original source `SU2BFSSPairedSpin9V10HF9GeneratorDeterminantMagnitudeProbe.lean`, Git blob `44493c4d9b72de2d2d84725768f8e2572ac91ed4`. Pinned Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; accepted F8 rebuild, fresh F9 warning-as-error compile, three independent exact declaration types and root axiom whitelist all PASS. Exactly `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.
- Accepted `gammaNineRealLinear_det_sq16` proves `det(Γ(v))² = Q(v)^16` for the original nine-source gamma16 linear map; `gammaNineRealLinear_det_eq_pow8_or_neg` proves the exact two magnitude-sign alternatives `det(Γ(v)) = Q(v)^8 ∨ det(Γ(v)) = -Q(v)^8`. `source9CliffordUnitsGammaDetHom_generator_two_sign` transfers the alternatives to genuine invertible original Clifford vector generators via qualified F8. Neither sign globally established.
- [Immutable artifact #13067083826](https://github.com/etblink/math/actions/runs/41265483779/artifacts/13067083826), SHA-256 `15a948b9e7cd036c9940e6e20eab02063d12948a307590e352156e53068ebb2f`, not expired at review.

## F10 — real basis anchor CANDIDATE

The frozen original `SU2RealGammaProbe.lean` (blob `b9b8192055c70f0d001d7982669b9823c55562ed`) explicitly defines gamma matrices as integer signed permutations transported to real entries. Its ninth original gamma `gamma (8 : Fin 9)` uses identity permutation with diagonal coefficients `[+1]^8, [-1]^8`. Consequently the concrete 16-by-16 determinant is `(-1)^8 = +1`. This is an **original-source**, not replacement-gamma, expected identity.

F10 tests three exact Lean declarations:
1. `originalGamma8_eq_diagonal`: precise equality of original gamma8 with `Matrix.diagonal (fun i : Fin 16 => if i.val < 8 then 1 else -1)`.
2. `originalGamma8_det_one`: determinant of genuine gamma8 equals +1 using the pinned `Matrix.det_diagonal` identity, not a guessed sign.
3. `gammaNineRealLinear_axis8_det_one`: determinant of the actual source gamma linear map evaluated at ninth coordinate unit vector is +1.

The proof is **UNQUALIFIED until full strict F10 run**. This concrete axis certificate is necessary for an explicit orientation-sign anchor but INSUFFICIENT to determine sign on every vector or every `spinGroup source9Quadratic` element. Next source obligation would require transitivity/similarity of arbitrary nonzero gamma vectors, a validated continuity argument, or an independently proved generator formula; do not silently infer any of them.

## Research discipline

Preserve original V10H red gates `#41257058496` and `#41257744030` (recursive nested character and bad group projection), F4 Gate1 red `#41260509990` (subgroup identity coercion), F5 Gate1 red `#41261931766` (preflight comment false positive), all previous green qualification records. No changes to accepted sources, compiler/recursion/heartbeat limits, pinned Lean/Mathlib, original paired-Fock 48-label permutation, default branch or external upstream. Global SO48, Spin48 lift/cover, source continuity and BFSS physical predictions remain OPEN.
