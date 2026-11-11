# NORM-0B first strict red — source addition/zero finite sums

**Record date:** 2026-11-10 Pacific. **Tier:** STRICT RED; REPAIRED SOURCE CANDIDATE, NOT QUALIFIED.

**Exact failed run:** [#42958105950](https://github.com/etblink/math/actions/runs/42958105950), tested commit `eb25f089e8849650ad8fda05813d06ad05204c50`, job `130317921159`, concluded red at 2026-11-11 04:30:48 UTC. Strict `NORM0B_ORIGINAL_106_BLOB_CLOSURE_PASS` reached; all 106 exact Git pins, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, and previously qualified original BIL-0C/VLY-0B/JOIN-0A import builds succeeded. The new NORM-0B source **failed** and the separately compiled independent consumer was never reached. Artifact ID `13827759337`; ZIP SHA-256 `07d26caf64cf75e53014faf6683770c253fa134886876f8e650cb1f4456754d5`.

**First two causal source errors:**
- Line 32: `originalColorQuadratic_add` unfolded to the correct double sum but `simp only [originalColorQuadratic, Matrix.add_apply, Complex.ofReal_add, add_smul, Finset.sum_add_distrib]` stopped at `∑αβ ((↑J+↑K) • Fαβ) = (∑αβ ↑J • Fαβ) + (∑αβ ↑K • Fαβ)`; both `add_smul` and `Finset.sum_add_distrib` were reported **unused**. This is the same nested big-operator rewrite failure pattern recorded in B2's six reds, now under addition rather than negation.
- Line 48: `originalColorQuadratic_zero` simplification left `∑αβ (0:ℂ) • Fαβ = 0` unresolved.
- The already source-compiled `originalColorQuadratic_real_smul` printed ONLY `propext`, `Classical.choice`, `Quot.sound`. Other NORM-0B axiom outputs included `sorryAx` as a consequence of proof elaboration failure and MUST NOT be promoted.

**Bounded source-only repair (new proof architecture, no mathematical change):** Source path `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0BOriginalFockQuadraticRealLinearGramSum.lean` moves from blob `3cd8218b5b9a5aa0c3075bc96907245def0a8a9f` to `5b90c5d460288ce9bce68ed4c3ac54559f5b5889`.
1. Local typed real source Fock operator family `F α β = ∑ A : ColorIndex 2, pairedTheta α A * pairedTheta β A` using exact frozen original pairedTheta.
2. Explicit `change` to the genuine original BIL-0C definition and **three `calc` stages**: entrywise `Matrix.add_apply`, `Complex.ofReal_add`, and fully supplied `add_smul`; then an inner `Finset.sum_add_distrib` by `Finset.sum_congr`, then an outer `Finset.sum_add_distrib`. Each stage isolates a definite equality and its exact Lean arguments.
3. The zero proof explicitly changes to `∑αβ (0 : ℂ) • Fαβ = 0`, followed by `simp only [zero_smul, Finset.sum_const_zero]`. Avoid broad `simp` that did not normalize the original source.
4. Leave the source already compiled real-scalar theorem, the private generic induction, the original 81-term Gram expansion, and all declaration names/axiom audit roots unchanged.

**Frozen integrity:** NORM-0B strict workflow changes from blob `4d3397fc9a417d0138e0a51c1600a8a70ec99c18` to `0821371d8cb8fc99df5fb9af461b51c753ed2053`. Exactly **ONE** source pin changes among **106** exact Git pins; all **104 accepted NORM-0A ancestry blobs** remain untouched, as does original NORM-0B consumer blob `fca47c1d976aaced0f1a9720a1ed457d16039910`. No original physical Fock, gamma or Hamiltonian redefinition, no source FullL2 multiplier, and no upstream modifications.

**Stop rule:** This is a candidate fix not locally Lean-compiled; only a fresh exact full source+independent consumer strict GREEN can qualify NORM-0B. If red, inspect the first numbered new error and fix that atom, preserving this first source red and the 106-blob ancestry. The NORM-0C uniform bound and NORM-0D physical FullL2 measurable multiplier remain unstarted.
