# V7Q Gate 1 failure: natural-number parity bridge; bounded Gate 2 recovery

Project Lead negative-knowledge handoff, 2026-10-30 UTC. Truth and reproducibility over green-count optimization.

## Gate 1 immutable FAILURE
- [Run #41092016430](https://github.com/etblink/math/actions/runs/41092016430) attempt 1, tested SHA 813b34c7cea3c9053c964a07813421591494146e, completed failure at 2026-10-30T16:54:41Z; failed job 124188047089.
- Source blob 78da9b1220de53de9eff6c5474892797a0cb8214; retained compiler evidence artifact 12995411230, digest sha256:47e0cab20e2cb7fdc221bf620f997e3cc855073b0d8fdf86a1ef21cfc154aea4.
- Exact 155-declaration source pins/lexemes, pinned Lean/Mathlib dependencies and accepted 37-module / 81 sealed ancestor roots passed. Fresh warning-as-error source compilation FAILED, independent 155-root type and axiom audit SKIPPED.
- Earliest error V7Q source line 77:63: unsolved natural number equality 1+(1+tail.length)=2+tail.length. Secondary error line 81:8: heven : Even (tail.length+2) but expected Even tail.length. Line 78:14 and 78:43: unused Nat.add_assoc/Nat.add_left_comm simp arguments promoted to errors. The failing root's sorryAx is due to incomplete elaboration, NOT accepted mathematics.
- Pinned Mathlib/Algebra/Ring/Parity.lean even_add_two is in a Ring section and does not target the natural-number list length. Nat.even_add provides the exact natural parity reduction. The source action, Spin group multiplication, reflection ordering and accepted V7O/V7P algebraic bridge did not report compiler errors. No mathematical counterexample inferred.

## Minimal Gate 2 correction (CANDIDATE)
- Replaces ONLY the arithmetic proof lines 77-81 of the one new V7Q theorem, keeping exact statement, inductive structure, and genuine original Spin witnesses unchanged.
- Prove the length identity by simp only [List.length_cons] followed by omega. Prove the tail evenness by rw [hlen] at heven and simpa [Nat.even_add] using heven. This targets the actual Nat parity, not the ring-only even_add_two.
- New source Git blob b1391eccabb4df44f983e6565c495e37f87ec232. Exact pinned source blob check updated in .github/workflows/bfss-kotler-k1d18v7q-original-source-even-list-spin-word-strict.yml. No other workflow verification requirement changed.
- Strict Gate 2 still requires 46 fresh warning-as-error modules, 155 independent exact declaration type/axiom roots, 81 accepted sealed ancestor roots, original source hash pins, Lean 4.34.1, Mathlib SHA d13f23b723b8a846827a245b89c10fc7d3f11612, only propext/Classical.choice/Quot.sound, no sorryAx and no raised proof limits or linter changes.
- Gate 2 is NOT accepted until full terminal green exact SHA and independent compiler/axiom audit. If red, preserve tested SHA, first diagnostic, source blob and artifact in a separate handoff.

## Unproved research boundary
- V7P accepted. V7Q even-list genuine source Spin word is currently UNQUALIFIED. Original sourceSO-to-Euclidean transport injectivity, sourceSO generation, unconditional Spin48 surjectivity, global Spin9 and BFSS spectral claims all remain unproved.
- No changes to main, canonical FCP, accepted theorem sources or upstream community.