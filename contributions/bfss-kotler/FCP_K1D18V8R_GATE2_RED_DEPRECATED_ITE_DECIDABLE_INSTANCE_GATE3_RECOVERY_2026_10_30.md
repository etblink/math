# Project Lead — V8R Gate 2 RED: deprecated conditional reduction and Decidable-instance rewrite mismatch

**Local research date:** 2026-10-30 PDT; GitHub completed 2026-10-31T04:54:17Z. **Disposition:** `GATE2_RED_PRESERVED__GATE3_PENDING`.

## Exact red verification

- [V8R Gate 2 #41169903407](https://github.com/etblink/math/actions/runs/41169903407): `completed/failure`, attempt 1, exact tested SHA **`8838e6acd4f2ebd497b22e8e274aacc99e78fb2f`**, job **`124445403275`**.
- Candidate `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9NormalizedFourIndexStructureProbe.lean`, exact Git blob **`42c7a72271e3fdd67c976bfadf9626f4e5cb7f4f`**.
- Strict original-gamma/Fock-paired and Lean `v4.34.1`/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` pins passed. Pinned dependencies restored and accepted V8M/V8O/V8Q ancestors compiled successfully.
- First failed step: `Fresh compile exact V8R source with warnings as errors`; independent theorem-type/axiom audit skipped.
- Exact compiler findings:
  - `...NormalizedFourIndexStructureProbe.lean:44:17: error: `if_pos` has been deprecated: Use `ite_eq_left` instead`. The locked compiler treats deprecation as an error. It is not acceptable to suppress warnings.
  - `...NormalizedFourIndexStructureProbe.lean:54:6: error: Tactic `rewrite` failed: Did not find an occurrence of the pattern` for the `(1/4) • (if s = u then L_rt+L_rt else 0)` term even though apparently identical text was printed. The local `hterm (p : Prop)` was elaborated under `classical`, so its conditional may carry a different `Decidable p` implementation from source-native `SpaceIndex` equalities; this is a **plausible instance-level causal explanation** until the proposed correction is validated by CI.
  - Both candidate roots have a `sorryAx` in the red source `#print axioms` outputs because the bridge proof is unfinished. No V8R theorem is accepted.
- Preserved [red evidence artifact #13031270498](https://github.com/etblink/math/actions/runs/41169903407/artifacts/13031270498), name `bfss-v8r-original-paired-normalized-four-index-structure-8838e6acd4f2ebd497b22e8e274aacc99e78fb2f-1`, ZIP SHA256 **`4b62ad797f69485b0b40b3fd92ea2909482e15b9356db7e2f3df106263840c00`**, size 873 bytes.

## Bounded corrective experiment, preserving all mathematical statements

Original V8R Gate 1 #41169217908 failed because the proof split 16 equality cases and `ring` could not close residual conditionals; Gate 2 improved the proof to one helper but failed at compiler/dependent rewriting. The Gate 3 correction modifies exactly two proof details:

1. Remove the top-level `classical` and give the helper an explicit **native instance binder**: `have hterm (p : Prop) [Decidable p] (a b : SpaceIndex) : ...`. This lets `hterm (s = u) r t`, etc., use the actual decidability evidence of the native index equalities. A matching `rw` is now a testable compiler claim, not assumed success.
2. Replace deprecated `simp only [if_pos hp]` with **`simp only [hp, ite_true]`**, retaining the same typed true-case `change`, entrywise scalar arithmetic, and false branch `simp [hp]`.

The normalized `H_rs=-(1/2)•L_rs`, one-H-per-delta RHS, two theorem statements, their source label types, and all accepted gamma modules are unchanged. No source, linter, recursion, heartbeat, axiom or external project settings were weakened.

- Corrected V8R source blob **`46e02a38f6647458132039bc1f44b0358c9c4f44`**.
- Workflow source-pin-only blob **`1c1617718b64dacdd6f973c9fd145debf3d57393`**.
- Atomic fast-forward correction commit **`46421c2bfe3cdef3849475f507c3afc6af4e83b9`**, based on matching immediate parent's Git tree; complete diff shows **only the V8R Lean module and one workflow hash line changed**.
- [V8R Gate 3 #41170549275](https://github.com/etblink/math/actions/runs/41170549275) triggered on the corrected SHA. **PENDING**, not accepted until terminal successful source compile, exact tested blob, both independent theorem-type examples, two allowed-axiom declarations excluding `sorryAx`, and retained compiler/audit artifact digest.

## Cumulative lessons and project boundary

The V8J lint red involved unreachable `abel`; V8L lint red involved unused `simp` arguments; V8O red involved symmetric simp rewrite looping plus `sorryAx`; V8R Gate 1 involved incomplete conditional proof by uncontrolled expansion; V8R Gate 2 involved strict deprecation and potentially mismatched conditional typeclass instances. The better method is **typed, source-native, proposition-parametric small lemmas with explicit Decidable instances, nondeprecated rewrites, and exact-source strict CI**—not raising compiler limits or making global assumptions.

**V8A–V8Q: 37 accepted source-exact algebra roots. V8R: 0 qualified roots pending Gate 3.** No type-level Lie homomorphism, global Spin(9) group lift, original Majorana Fock implementation, gauge-covariance result, or BFSS spectrum has been proved. Keep frozen FCP, accepted Lean ancestors, `main` and upstream mathcommunity unchanged.
