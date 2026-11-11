# BFSS NORM-0B third strict red — scalar-zero failed; derive zero by additivity

**Date:** 2026-11-10 Pacific. **Evidence tier:** strict RED and bounded repair candidate; NOT yet source+consumer Lean qualified.

## Exact failed execution

[Strict NORM-0B #42962539629](https://github.com/etblink/math/actions/runs/42962539629), tested exact commit `e4c9b9ac540b65d95513f9126f56dc412cea12c8`, job `130332218500`, concluded red at 2026-11-11 05:13:34 UTC. All **106 Git source/consumer pins** and pinned toolchain checks passed; original accepted BIL-0C/VLY-0B/JOIN-0A ancestry compiled. The new `originalColorQuadratic_add` three-stage proof and `originalColorQuadratic_real_smul` both compiled with ONLY `propext, Classical.choice, Quot.sound`.

**First and only causal source error:** line 76 in `originalColorQuadratic_zero` for the previous repair:
```lean
  simpa only [zero_smul, Complex.ofReal_zero] using
    (originalColorQuadratic_real_smul (0 : ℝ) (0 : GammaMatrix))
```
The compiler printed a **type mismatch after simplification**: the provided theorem still had type `originalColorQuadratic 0 = 0 • originalColorQuadratic 0`, not target `originalColorQuadratic 0 = 0`. In the original continuous linear map carrier, this tactic did NOT simplify the right-hand `0 • originalColorQuadratic 0` to the operator zero. Do not treat the scalar expression as automatically reducing under the current pinned simplifier. The downstream 81-term Gram expansion `#print axioms` included `sorryAx` ONLY because zero elaboration failed; independent consumer was not run. An unrelated existing source `simpa` linter note was not a causal failure.

**Forensic receipt:** artifact ID `13830452469`, ZIP SHA-256 `31b50677912e207b9be13532b1c5d04db435813c1148159ae02d868b61bd9222`.

## Alternative bounded repair: additive cancellation, no zero scalar simplifier

Use the now twice separately cold-compiling `originalColorQuadratic_add` on the literal original complex-linear `Fermion 2` Fock operator carrier. The input real zero matrix satisfies `0+0=0`, so `Q(0)=Q(0)+Q(0)`. Cancellation in the operator additive group gives `Q(0)=0`, without the problematic `0 •` normalization:
```lean
theorem originalColorQuadratic_zero :
    originalColorQuadratic (0 : GammaMatrix) = 0 := by
  have h :
      originalColorQuadratic (0 : GammaMatrix) +
        (0 : Fermion 2 →L[ℂ] Fermion 2) =
      originalColorQuadratic (0 : GammaMatrix) +
        originalColorQuadratic (0 : GammaMatrix) := by
    simpa only [add_zero] using
      (originalColorQuadratic_add (0 : GammaMatrix) (0 : GammaMatrix))
  exact (add_left_cancel h).symm
```
This uses source addition + additive cancellation, not a new CAR lemma or a change of representation. The `simpa only` normalizes ordinary additive zero in the REAL source matrix and COMPLEX operator additive group, not scalar multiplication. The exact statement is unchanged.

**Hashes / frozen boundary:** prior failed source blob `f37b2420306bf56aa62bc96f0a93abacd161ef9c`; new uncompiled source candidate `78cf0db748fc7d98bcd1f6c2629d75742c6d8097`. Prior workflow blob `399dbdd4d0bcf38edcbf94237924683b612bf5f9`; candidate workflow blob `e293a0f22df1dbd6c782089a7255b6c0bf174622`. Exactly **one source hash** changes among the 106 manifest pins; 104 previously qualified ancestor blobs, independent NORM-0B consumer `fca47c1d976aaced0f1a9720a1ed457d16039910`, successfully compiling addition and scalar proofs, original 81-term Gram theorem, axiom roots and workflow settings remain untouched.

**Status:** A new strict cold run is REQUIRED to qualify Q-zero and the dependent Gram expansion and independent consumer. On red, inspect first exact compiler diagnostic, not summary strings or downstream failed-elaboration `sorryAx`. NORM-0C fixed-B normalized operator bound and NORM-0D actual FullL2 multiplication remain downstream future objectives.

**Negative methodological knowledge:** A zero-scalar law may fail to normalize through an elaborated continuous-linear-map scalar action even when real-linearity is proven; an independently compiled additive identity plus cancellation can avoid that elaboration interface entirely.
