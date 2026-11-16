# Spin(9) abstract physical outline R2 RED — exact sphere-transitivity proof application failure

Date: 2026-11-15 Pacific / 2026-11-16 UTC.  
Branch: `research/bfss-spin9-structural-outline-20261115`. Status: **RED_UNQUALIFIED**.

## Qualified observations, no physical promotion

- Strict [run #43797501515](https://github.com/etblink/math/actions/runs/43797501515) **RED**, tested commit `14213bf3e60e224da25e41d254b154f096895755`; native job `133069565184`.
- Original full Hilbert/core and toolchain five-pin preflight **PASS**; restored Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` **PASS**; cold full Mathlib build reached the abstract proof at job **8924/8924**.
- First causal error in `BFSSSpin9AbstractPhysicalOutline.lean:144:4`: `ψ : D` provided where proof of `∀ g : G, U g ↑ψ = ↑ψ` expected. The subsequent `145:2` error is `No goals to be solved`. This is Lean `apply` tactic auto-instantiating the `ψ` binder, leaving different goals than the scripted bullets expected.
- The other **five abstract theorem axioms** printed as only `[propext, Classical.choice, Quot.sound]`, without `sorryAx`; the sixth `charge_basis_sq_eq_average_of_sphere_transitive` included `sorryAx` because its proof body failed. Full abstract build RED; original `FullL2 2` consumer was not executed.
- Original abstract source Git blob `19af0550a75319db13dde569a38932c79b74b030`; independent consumer blob `af490d8363742a95c859202d2b70a9e1025c7740`; unchanged original core `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
- [Evidence artifact #14195182679](https://github.com/etblink/math/actions/runs/43797501515/artifacts/14195182679), GitHub artifact ZIP SHA-256 `4db6b22bee4a457cbb92eb63c2adc8ea1b83549e8301ae9bb580a85c6b2b1558`, size 1463 bytes.

## One bounded R3 source repair

Hold six theorem statements, all other five proof bodies, original `FullL2 2` independent consumer, toolchain/source pins and timeouts fixed.

Replace **only** the final theorem's `apply` plus four brittle tactic bullets by an explicitly typed intermediate
`hTrans : ∀ j k : Fin 16, ∃ g : G, spin g (basis j) = basis k`, deduced from `hSphere` and `hUnit`, then invoke the prior theorem via a single explicit `exact charge_basis_sq_eq_average ... hTrans ψ hSinglet i`.

Do not alter hypotheses or weaken the theorem. Expect six plus three independent `#print axioms` reports, standard-only axioms and no `sorryAx`, and a native original `FullL2 2` consumer. A new different native elaboration failure triggers a new first-causal diagnosis, not speculative proof expansion. Original SU2/Spin9 physical unitary/domain/charge covariance and fidelity obligations remain open.

R1 evidence [#43796459069](https://github.com/etblink/math/actions/runs/43796459069) remains preserved. No changes to unified integration, draft IBI PR #2, `main` or incident corpus.
