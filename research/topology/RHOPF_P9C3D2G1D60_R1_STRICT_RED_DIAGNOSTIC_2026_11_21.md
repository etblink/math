# RHOPF-P9C3D2G1D60 R1 — strict RED: function expression rewriting in quotient continuity proofs

**Pacific date:** 2026-11-21. **Disposition: STRICT RED — D60 NOT QUALIFIED.**

Original [run #44974880082](https://github.com/etblink/math/actions/runs/44974880082), job `137062425753`, attempt 1, tested SHA `4615ac215065f02377bb7d7202120a1e3f45164e`.

## Independently archived original RED evidence
Original [artifact #14736275437](https://github.com/etblink/math/actions/runs/44974880082/artifacts/14736275437) independently downloaded. Actual ZIP SHA256 `6d7baa6b67e82bc45a7622daa3e1afc6951e355e45259bd3ba0b0d7ef01554e5` independently computed and matched GitHub original artifact digest. ZIP `testzip() == None`, exactly five intact archived files, embedded `exact-tested-commit.txt` equals `4615ac215065f02377bb7d7202120a1e3f45164e`. Native original log extracted and inspected.

Original Gamma9 frozen source SHA/contract PASS, independent signed-permutation integer fixture PASS, Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, 9,107 dependency jobs PASS. D60 original native compilation fails at lines 83 and 98: `Type mismatch: After simplification, term hComp has type Continuous (fun x => standardOrbitClass (H x)) but expected Continuous (fun x => E.toFun (sourceOrbitClass x))`, and similarly `Continuous (fun y => sourceOrbitClass (H.symm y))` vs expected `Continuous (fun y => E.invFun (standardOrbitClass y))`. Attempts `simpa only [Function.comp_def, hPoint] using hComp` did not rewrite under functional extensionality. Both named D60 declarations report `sorryAx` due hard compilation errors. Independent imported consumer SKIPPED. No mathematical homeomorphism qualified.

## Bounded R2 repair
Keep the theorem signatures, underlying accepted D58 `Equiv`, hSource/hStandard `Topology.IsQuotientMap` instances, D48 `Homeomorph`, hComp and hPoint proof statements and all imports unchanged. Replace only two failed `simpa only [Function.comp_def, hPoint] using hComp` lines with (a) `hFun : (fun x => E (class x)) = (fun x => class (H x))` and symmetrical inverse equation, both by `funext hPoint`; (b) `change Continuous (fun x => E (class x))`, `rw [hFun]`, `exact hComp`. This converts the previously verified pointwise equality to exact function equality before transport of continuity. Only update exact frozen D60 source blob pin in strict workflow. Independent imported consumer remains byte-identical.

No axiom relaxation, altered original Gamma9 accepted source, fake phase, quotient topology replacement, or `main` changes. R2 needs exact original artifact hash+commit+ZIP verification, original source native and independent imported consumer with two allowed axioms reports each. R1 artifact and diagnostic are immutable negative knowledge.
