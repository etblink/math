# Project Lead — V9L Gate 1 RED: defect left opaque to finite-sum linearity, Gate 2 typed repair

**Research date:** 2026-10-31 PDT. **Disposition:** `V9L_GATE1_FAILED_SOURCE_PROOF__GATE2_STRICT_PENDING`. **Accepted ledger remains 66** algebraic theorem roots (through V9K).

## Exact failed run and evidence

- [V9L Gate 1 #41210376985](https://github.com/etblink/math/actions/runs/41210376985), terminal **completed/failure**, exact tested SHA **`2e7fc99199c40a348d55e88e69a92437207d8d59`**, job **`124563937079`**.
- Candidate source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9BracketDefectPlaneSkewExtensionProbe.lean`, Git blob **`0f4d5f81d3bc36afe1ecc2d026437679cf2ebf1a`**.
- Original paired-Fock gamma/label source-hash pins **PASS**, exact Lean v4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore **PASS**, accepted V9K and V9F source ancestor compilation **PASS**.
- Fresh `-DwarningAsError=true` V9L source proof **FAILED**. The exact remaining goal at source line **48:13**:
```lean
coordinateToPairedBracketDefect (coordinatePlane9 r s)
  ((1 / 2) • ∑ t : SpaceIndex, ∑ u : SpaceIndex,
    (B t u) • coordinatePlane9 t u) = 0
```
- At lines 49–51, `simp only [map_smul, map_sum, heval, coordinateToPairedBracketDefect_coordinatePlanes, smul_zero, Finset.sum_const_zero]` reported five **unused simp arguments** (`map_smul`, `map_sum`, `coordinateToPairedBracketDefect_coordinatePlanes`, `smul_zero`, `Finset.sum_const_zero`). **Cause:** final calc step exposed the original two-argument defect, not the typed real-linear slice. `map_smul` and `map_sum` cannot rewrite an unapplied defect function as though it were a `LinearMap`. The former `heval` did not rewrite the defect into the map in the required direction.
- Incomplete source `#print axioms` reported **`[propext, sorryAx, Classical.choice, Quot.sound]`**, confirming that the proof is **NOT** qualified. Independent fresh theorem specialization **SKIPPED** after source compilation red.
- [Preserved Gate 1 compiler artifact #13045848852](https://github.com/etblink/math/actions/runs/41210376985/artifacts/13045848852), name `bfss-v9l-original-paired-bracket-defect-plane-skew-2e7fc99199c40a348d55e88e69a92437207d8d59-1`, ZIP SHA256 **`9ef259ba6cb207c982b49c64e8004fb1ff2875e2ad067fbd70ad7914cf6718ae`**, size **926 bytes**. The red is a mathematical proof elaboration failure, not an infrastructure failure.

## Corrective Gate 2, source and workflow SHA pinned atomically

Retain exactly the same theorem statement:
```lean
theorem coordinateToPairedBracketDefect_plane_skew_right
    (r s : SpaceIndex)
    (B : Matrix SpaceIndex SpaceIndex ℝ)
    (hB : B.transpose = -B) :
    coordinateToPairedBracketDefect (coordinatePlane9 r s) B = 0
```
The proof now:
1. Defines typed `L : Matrix SpaceIndex SpaceIndex ℝ →ₗ[ℝ] Matrix Source48Label Source48Label ℝ := coordinateToPairedBracketDefect_rightLinear (coordinatePlane9 r s)`.
2. Derives `hzero (t u) : L (coordinatePlane9 t u)=0` **by the accepted V9K theorem**, no new axiom.
3. Uses `change L B=0` to expose the exact real-linear map **before** rewriting V9F skew-spanning.
4. Uses only `map_smul`, `map_sum`, `hzero`, `smul_zero` and `Finset.sum_const_zero` to reduce the typed finite ordered-pair sum to zero.

Changes limited to the proof body of the *new V9L candidate* plus corresponding source blob hash in the V9L strict workflow. No alteration to theorem statement, original paired carrier, source native labels, accepted ancestors, pinned toolchain, lint settings, timeouts or proof limits.

- Corrected V9L source Git blob **`9de00df800da7c62c2340ed995df90780969798a`**, strict workflow Git blob **`430715ba41616a37b75cb4e1fac971304454dfd7`**.
- Atomic normal fast-forward commit **`3be1a80ff584d06e2c1f04180eb8e15efb58e227`**.
- [V9L Gate 2 #41211386788](https://github.com/etblink/math/actions/runs/41211386788), exact tested SHA **`3be1a80ff584d06e2c1f04180eb8e15efb58e227`**, **pending strict verification** as of this audit record.

**No acceptance or root increment prior to terminal clean source compilation, independent theorem specialization, allowed declaration-level axiom dependencies and preserved ZIP digest.** Once/if Gate 2 qualifies, it would bring the ledger to **67**. It does not, by itself, establish `D(A,B)=0` for arbitrary skew A,B: a separately independently checked first-argument spanning extension is still needed. No LieHom, global Spin(9) lift or BFSS physical/spectral claim inferred.

Preserve this Gate 1 red as an implementation lesson: when a proof applies finite-sum homomorphism laws, the goal must be explicitly typed as a linear-map evaluation. Do not disable unused-simp lints, raise proof limits, blur Fock basis indexing, change frozen FCP, touch `main`, or open upstream community PRs without owner authorization.
