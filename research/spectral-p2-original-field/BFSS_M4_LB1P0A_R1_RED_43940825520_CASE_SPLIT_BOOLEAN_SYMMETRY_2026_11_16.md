# BFSS M4-LB1P0A R1 RED — Boolean conjunction symmetry left unsolved cases

**Date:** 2026-11-16 (Pacific). **Authority/branch:** Project Lead, `integration/bfss-unified-research-20261108` only, main unchanged. **Status:** verified genuine Lean RED on the *P0A matrix-skewness proof*, NOT on the original Fock K(A) source, and NOT a kernel timeout.

## Exact immutable evidence

- [P0A R1 #43940825520](https://github.com/etblink/math/actions/runs/43940825520), completed failure attempt 1 at tested commit **`5b9981e0c720fad82253e16203d6772e2193c073`**, job **`133557561159`**. Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1P0AOriginalSource48SkewPlane.lean` original Git blob **`687982cf876424fa5b47f7a4617d2157eedc7247`**; independently compiled consumer `lean/diagnostics/BFSSP3M4LB1P0AOriginalSource48SkewPlaneIndependentConsumer.lean` original Git blob **`53da0ec8242c49cfb062257d71d5a22bd4c35500`**; original workflow blob **`9233126a23853de2a068277e2093d9fcf4fac79c`**.
- [Original artifact #14262818881](https://github.com/etblink/math/actions/runs/43940825520/artifacts/14262818881), 3,494 bytes, GitHub-reported archive SHA-256 `bb80b9715ae2d358219e40e6621f30f3497af2f19e8fe872d0645628431944de`; not independently rehashed.
- Exact source, accepted LB1L2/LB1C1/LB1C0/LB1S/LB0/gamma, consumer and frozen Lean **4.34.1** / Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`** preflight **PASS**. Frozen cache restoration **PASS**, the accepted LB1L2 source compiled. **[8963/8963] native P0A source compilation FAILED**, so neither the explicit source axiom pass nor independent consumer was reached.
- **First causal error:** `P3M4LB1P0AOriginalSource48SkewPlane.lean:34:46: unsolved goals`. The 16-way `by_cases` with `simp [...] <;> ring` failed to identify several conjunctions of equality propositions under swapped argument order; adjacent `Try this: ring_nf` lines are tactic suggestions, not the causal root. Under failed elaboration, both new source axioms prints contained `sorryAx`; **no P0A theorem accepted**.
- [Roadmap consistency #43940825315](https://github.com/etblink/math/actions/runs/43940825315) GREEN on original R1 commit, unrelated to Lean theorem acceptance.

## Bounded, mathematical no-content change repair

The original sparse plane is `E^(ij)[p,q] = (if p=i ∧ q=j then 1 else 0) - (if p=j ∧ q=i then 1 else 0)`, on the genuine `Source48Label` and real `Matrix` carrier. It is entrywise skew by swapping the two Boolean conjunctions, *without any case split*. Replace **only the proof body** of `originalSource48SkewPlane_entries_skew`:

1. `simp only [originalSource48SkewPlane]` expands the explicit sparse definition.
2. Introduce proposition equalities by `propext (and_comm)` for `(q=i∧p=j)=(p=j∧q=i)` and `(q=j∧p=i)=(p=i∧q=j)`.
3. `rw [h₁,h₂]`, then `ring` on the scalar `ℝ` subtraction identity `a-b=-(b-a)`.

Keep **all theorem statements, sparse `E` definition, transpose proof, independent consumer and accepted donors unchanged**. Update only P0A source Git blob pin in its strict workflow and append the immutable R1 diagnostic; preserve exact warning-as-error and 2+2 axiom gates.

R2 GREEN would accept **only** skewness of original 48-label elementary planes. It does not prove `K(E^(ij))=½Γ_iΓ_j`, `[K(A),K(B)]=K(AB-BA)`, group-level Spin9, physical gauge/charge domains, or any BFSS spectral statement. Maintain LB1C1 and LB1L2 strict GREEN acceptance.
