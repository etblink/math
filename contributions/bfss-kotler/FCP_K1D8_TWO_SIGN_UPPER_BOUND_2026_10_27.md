# K1D8 — original Spin(48) kernel two-sign upper bound

**STATE: CANDIDATE. NO INDEPENDENT OWNER CI YET; 54 modules accepted.**

Research branch: `research/fcp-k1d8-two-sign-upper-bound-20261027`. Accepted ancestor: `research/fcp-k1d7-scalar-coeff-20261027@fc7476d1a03136503fea22a1739cd6e1c00b35f1` (acceptance documentation only after source-tested `617639e3d168d913a1db22624124d8c1066b6c0e`). The accepted 54 scoped contributor modules have 55 selected strict declaration roots. K1D7 [run 40620376673](https://github.com/etblink/math/actions/runs/40620376673) passed strict compiler and axioms verification of the original scalar-injectivity and real-coefficient-square-one theorems.

## Mathematical objectives

Candidate Lean file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D8OriginalSpin48TwoSignUpperBoundProbe.lean`; exact Git source blob `5625c0d7d90dab6fd87230791520b6fe2bbb9cb6`.

1. `FCP.BFSSS1V52K1D8.originalSourceSpin48_trivialAction_scalar_coefficient_two_signs`: obtain the real coefficient `c` and its genuine Clifford scalar representation from accepted K1D7, use `(c-1)(c+1)=c*c-1=0` and real-field no-zero-divisors to prove `c=1 ∨ c=-1`.
2. `FCP.BFSSS1V52K1D8.originalSourceSpin48_trivialAction_clifford_one_or_neg_one`: prove the original source trivial-action Spin element has exact Clifford value `1` or `-1`.

These theorems give **only a kernel upper bound in the original Clifford algebra**. They do not prove `-1` belongs to the actual `spinGroup source48Quadratic` subtype, or that it acts trivially, or show both signs are distinct within the subtype. The group-level kernel equality/two-sheet claim is **NOT YET ADMITTED**, even if K1D8 qualifies.

## Strict source gate

`.github/workflows/bfss-kotler-k1d8-two-sign-upper-bound-owner-strict.yml` builds with pinned Lean 4.34.1, original Mathlib SHA `d13f23b723b8a846827a245b89c10fc7d3f11612`, and independently recompiles the accepted 22-module ancestry / 47 roots; K1D3/K1D4 / 2 roots; K1D5 / 2 roots; K1D6 / 2 roots; K1D7 / 2 roots. It then runs the source-pinned `contributions/bfss-kotler/tools/qualify_fcp_k1d8.py` verifier (blob `7f8c4e6a2a893dc3ba85048f873b3df8021aaa47`), compiling this candidate to a fresh `.olean`, demanding the two exact `#print axioms` reports, accepted axioms only `propext`, `Classical.choice`, `Quot.sound`, no source warnings/errors or sorry/axiom declarations, and fresh theorem-type evidence. Preserve compiler logs and output artifacts.

**Acceptance rule:** a green *terminal* GitHub job on the exact tested commit, independently inspected, is necessary for accepting the module and raising the scoped count from 54 to 55. Inconclusive or red outcomes remain negative evidence, not mathematical acceptance.

## PR and governance

`main`, prior owner acceptance checkpoints, and `mathcommunity/oai-math-revised` remain untouched. A future upstream PR requires explicit owner approval, a clean branch from then-current community `main`, a minimal qualified theorem/dependency closure rather than the entire research history, and disclosure of substantial automated assistance. No upstream PR is opened by this research step.
