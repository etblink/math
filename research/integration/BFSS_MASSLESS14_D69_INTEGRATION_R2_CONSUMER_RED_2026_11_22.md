# Massless14 × D69 unified integration candidate R2 — strict independent-consumer RED

**Disposition: INTEGRATION UNQUALIFIED. First native original-source build PASSED; new independent integration consumer failed on a Type/Prop declaration error.** This is the first original Lean RED in this candidate's new consumer, but *not* a RED for any accepted donor source, and not a mathematical counterexample.

## Original independent tested evidence

Original [run #45053314310](https://github.com/etblink/math/actions/runs/45053314310), job `137303003193`, attempt 1, exact tested commit `c96eb46a02133ddb702265bf316a5734ceb4ef91`. Original [artifact #14767042939](https://github.com/etblink/math/actions/runs/45053314310/artifacts/14767042939), six original files `cache.log`, `environment-sha256.txt`, `native-source.log`, `preflight.log`, `strict-axioms.log`, and `tested-sha.txt`. Independent ZIP CRC `testzip()==None`; archived tested SHA equals `c96eb46a02133ddb702265bf316a5734ceb4ef91`; computed SHA-256 `5d0c1fdce5ae8939d40c49f3225698d02e1f6c7a5486cb9a2f6488992b581d4a` equals the original GitHub artifact digest.

The restored full Git checkout fixed R1's preflight failure. Both original `BFSS_MASSLESS14_D69_CANDIDATE_SOURCE_INTEGRITY_PASS` and `BFSS_MASSLESS14_D69_ORIGINAL_DONOR_PIN_PREFLIGHT_PASS` are in the archive. Pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASS. Original 14-source and D69 *native imported joint build* **PASS: 9,179 jobs**, including exact accepted D0e1d and D69 roots, whose native axioms use only `propext, Classical.choice, Quot.sound`.

The separate new `lean/diagnostics/BFSSMasslessUnified14AndD69IndependentAudit.lean` original source blob `86c2ff8f60e1c27919c5c9de800bb42bf8b865d8` FAILED at line 43:

```
error: type of theorem `FCP.BFSSMasslessUnified14Independent.originalGammaQCanonicalProjectivizationHomeomorph` is not a proposition
  Quotient relationalSourceQUnitCircleOrbitSetoid ≃ₜ Projectivization ℂ (EuclideanSpace ℂ (Fin 2))
```

The preceding `originalPairedMasslessDomainDenseAndGraphClosed` theorem compiled and printed only allowed axioms. The second declaration used `theorem` to build a *`Homeomorph` structure*, which is a Type rather than Prop, although it had been incorrectly authored as a theorem. `#print axioms` on that malformed declaration reported no axioms, **not an accepted proof**. This is an error in newly written consumer syntax; not a failure of the original D69 Homeomorph, not evidence of a physical Hopfion, and not a reason to alter any of the original 14 Lean donor files or frozen topology source.

## Bounded R3 candidate correction

Make only:
1. In **independent integration consumer**, change `theorem originalGammaQCanonicalProjectivizationHomeomorph :` to `noncomputable def originalGammaQCanonicalProjectivizationHomeomorph :` while keeping its exact type and right-hand side and all other source bytes identical.
2. Update that consumer SHA pin to `6700db01eb4d23c75190aba9ddaa37645c05f841` and append its R2 provenance in candidate manifest; new candidate manifest blob `203e563abfd1a4dc43ce390f9248ca4fd4f7a8a4`.
3. Adjust **strict workflow preflight** to expect exactly one theorem and one `noncomputable def`, keep both exact `#print axioms` roots, and add this immutable RED diagnostic path to the frozen candidate diff allowlist.

All 14 accepted source Git blobs, D69 source, accepted original BFSS donors, axiom allowlist, independent checker, original R1 RED diagnostic, unified target, research branch and `main` remain unchanged. No merge. Any R3 qualification requires **original exact tested run/commit**, 14-source+D69 native joint build and *both* independently compiled consumer roots, exact axiom reports, six-file original ZIP with independent CRC/SHA, and a separately checked target HEAD.
