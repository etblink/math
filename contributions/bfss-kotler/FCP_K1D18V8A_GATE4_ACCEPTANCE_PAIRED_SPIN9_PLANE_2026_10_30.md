# Project Lead — K1D18V8A Gate 4 accepted: original paired Spin(9) plane algebra

**UTC:** 2026-10-30, final accepted run completed 2026-10-30T23:09:18Z.

**Disposition:** `ACCEPTED_2_SOURCE_EXACT_LEAN_ROOTS__NOT_A_GLOBAL_SPIN9_LIFT`

## 1. Immutable success certificate

- [Strict Gate 4, run #41141833097](https://github.com/etblink/math/actions/runs/41141833097), **completed/success**, attempt 1.
- Tested exact Git commit `08d5d1f00649b87077c2ee9c697a435121eee1bd` on `research/fcp-k1d17-ancestor-cache-pilot-20261028`; job `124357697216` **completed/success**.
- Tested Lean source module: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9PlaneGeneratorProbe.lean`, immutable source Git blob **`02b8e54464b0aea151c96cefd316a86270cf8871`**.
- Workflow pin checked `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, actual source geometry `65db1f822b86bfbf400957a0aaa94784d6cb7a39`, actual paired-theta crosswalk `f3a2b41f902a20f6fe237ecce18dd7e869e9c45e`, original gamma file `b9b8192055c70f0d001d7982669b9823c55562ed`, and the V8A candidate Git blob.
- Source / toolchain preflight **PASS**; pinned dependency restore **PASS**; original paired theta/gamma/source48 ancestors `lake build` **PASS**, log says `Build completed successfully (8950 jobs)`. **Do not misreport this as 8950 new theorem roots or 8950 newly compiled V8A modules**.
- Fresh `lake env lean -DwarningAsError=true` of exact new V8A source **PASS**. Exactly two `#print axioms` declarations printed, both within allowed axioms. New V8A `.olean` generated.
- Fresh independent audit import and two **Lean `example` witnesses of exact original-label theorem statements** **PASS**. Independent two `#check` and two `#print axioms` **PASS**. Exact validator terminal marker:
  ```text
  K1D18V8A_EXACT_TWO_ROOT_TYPES_AXIOMS_PASS
  ```
- Both roots printed `[propext, Classical.choice, Quot.sound]` only. No `sorryAx`, no permissive proof limits.
- Retained [artifact #13019281445](https://github.com/etblink/math/actions/runs/41141833097/artifacts/13019281445), name `bfss-v8a-paired-spin9-plane-08d5d1f00649b87077c2ee9c697a435121eee1bd-1`, zip SHA256 **`130cf8bc16518c8f2b2c7db8dc25b96b6c04ecd2e713d1b82de5507b44824fab`**, size 956 bytes, stores compiler and independent audit logs.

## 2. Exact accepted theorem roots and mathematical boundary

Namespace `FCP.BFSSPairedSpin9Plane`:

1. `originalPairedPlane_transpose (r s : SpaceIndex) (hrs : r ≠ s)` proves
   ```lean
   (originalPairedPlane r s).transpose = -(originalPairedPlane r s)
   ```
2. `originalPairedPlane_sq (r s : SpaceIndex) (hrs : r ≠ s)` proves
   ```lean
   originalPairedPlane r s * originalPairedPlane r s =
     -(1 : Matrix Source48Label Source48Label ℝ)
   ```

Source `Source48Label = Fin 24 × Fin 2` and the original `pairedLabelEquiv` are unchanged. `originalPairedPlane` transports the **doubled** gamma plane matrix `-(gamma r * gamma s)` on each of three colors from `ColorIndex 2 × SpinIndex` to **the true native paired-Fock source labels** via the actual paired label equivalence. It uses Mathlib's `Matrix.reindexRingEquiv`; there is no unproved identification with color-major basis. Its infinitesimal Lie normalization would be `(1/2) • originalPairedPlane`, with the established sign conventions; the two accepted roots are for the doubled plane.

## 3. Negative knowledge preserved

| Attempt | Original immutable run | First causal failure | Action |
|---|---|---|---|
| Gate 1 | [#41137852252](https://github.com/etblink/math/actions/runs/41137852252) | unsupported `ᵀ` notation parser error; candidate module red | fixed only explicit `.transpose` source usage, not theorem |
| Gate 2 | [#41138786968](https://github.com/etblink/math/actions/runs/41138786968) | Python expected `theoremName :`, ignoring binders; fresh Lean passed | corrected validator strategy |
| Gate 3 | [#41139797455](https://github.com/etblink/math/actions/runs/41139797455) | Python expected fully qualified pretty-printed `OAI.BFSSQuantum.SpaceIndex`; Lean prints `SpaceIndex` | removed textual pretty-printing dependency entirely |
| Gate 4 | [#41141833097](https://github.com/etblink/math/actions/runs/41141833097) | none | terminal green, acceptance |

The [three-gate causal review](FCP_K1D18V8A_THREE_GATE_CAUSAL_REVIEW_AND_VALIDATOR_RECOVERY_2026_10_30.md) and two prior exact-red audit files remain authoritative. The Gate 4 validator **keeps independent kernel-checkable Lean propositions** and requires exact axiom-name reports, and no longer guesses Lean namespace abbreviations from string formatting.

## 4. New status and next proof obligations

**Accepted:** 2 source-indexed algebraic roots. The V7Z original Spin(48) / original SO(48) quotient equivalence remains separately qualified and unchanged.

**Not accepted, not inferred:** a full Spin(9) Lie bracket representation or its normalizations, full SO(9) spatial B-tensor covariance, gauge commutation, continuous Spin(9) or Spin(48) topological representation, covering/path lift, original Fock-global group action or full physical BFSS spectral/Hamiltonian theorem.

**Next source-exact research:** isolate an exact original-label `K48(r,s)` commutator identity, or its action on the actual original paired 48×48 B tensors, with the factors of 2 fixed at the **source gamma** level. Start with source-level gamma Clifford calculations and a source-equivalence transport lemma, then one bounded theorem. Preserve the exact fixed nonzero tensor counterexample (native paired values versus naive untransported color-major values 1 versus 0) as a negative control. Do not launch a fresh CI gate before a typed, genuinely missing theorem and valid proof strategy are identified.

**Repository controls:** no edit to earlier accepted modules, source FCP or `main`, no upstream PR without owner authorization. This record is documentary and does not change tested acceptance SHA.
