# SM-D1-SCC2 forward research — identifiability, finite witness design, and measurement sensitivity

**2026-11-18 | FORWARD RESEARCH ONLY. Not a qualified gate or new physical prediction.**

## Live checkpoint context

SM-D1-SCC1 R1 native strict RED at tested commit `fe34844d7c67e2d9520cc77d458516573137ddc0`: 14 source theorems compiled; standalone warning-as-error rejected linter.unnecessarySimpa at line 109; independent consumer was not reached. Exact cause and limits preserved in `SMD1_SCC1_R1_ORIGINAL_NATIVE_LINTER_RED_2026_11_18.md`. R2 source at commit `963546220631a1b75229425d1aa860577ee011bc` replaces that single proof line (`simp at hx`) and repins the strict workflow. Do not claim R2 qualification until original native, consumer and axiom audits are independently verified and archived.

## Main mathematical opportunities (no SCC theorem transfer)

1. **Observational equivalence is relative to a witness family**: `AgreesOn p S a b` forms a reflexive, symmetric, transitive relation for deterministic predictions. A potential subsequent exact Lean gate may construct the corresponding `Setoid` and quotient, provided no physical-model identity is inferred from equivalence classes.
2. **Uniform separation must quantify over pairs of admissible scenarios**: `∀ a∈A, ∀ b∈B, ∃w∈W, p(a,w)≠p(b,w)`. One separated selected pair cannot certify the whole family. A shared scenario immediately obstructs it; more importantly, *distinct* scenarios with the same predictions on W also obstruct uniform separation. The latter should become an explicit negative witness.
3. **Witness minimality for whole families is the nontrivial case.** The existing SCC1 `DeletionMinimal` applies to a *single pair* and is typically witnessed by a singleton; the scientifically interesting task is `UniformDeletionMinimal p A B S`, where two or more observables can be jointly required to cover different pairs. Do not call a minimal family unique. Prove an explicit two-witness non-singleton minimal fixture.
4. **Potential Mathlib reuse**: current public Mathlib docs expose `Finset.minimal_iff_forall_erase` under `Mathlib.Order.CompleteLattice.Finset`, provided the property is monotone upward under inclusion. `UniformlySeparates` is monotone, but the lemma must be source-checked at our pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` before importing. Do not move to category theory or general Zorn machinery when a finite lemma and deletion tests suffice.
5. **Explicit unknown state**: `Option Bool` prevents `none = none` from being misclassified as observational agreement. Further negative controls should ensure that missing mapping and missing numerical likelihood remain distinct deficiencies.
6. **Finite probability distributions are the next useful mathematical step**. A finite vector of rational probabilities gives equality/non-equality of predictive marginals; total variation `TV(P,Q)=1/2 ∑ |P_i-Q_i|` gives a nonnegative quantitative separation and is strictly positive exactly when the finite probability vectors differ. An exact mathematical distance is **not** an empirical significance, sensitivity or a physical measurement. Mathlib has `PMF` constructors (potential reuse); introducing heavy probability infrastructure before a typed finite lemma has proven useful would be premature.
7. **Finite versus continuous families**: an exact inequality for every pair is not automatically bounded away from zero for infinite parameter sets. Example: model-family A has Bernoulli success probability `x∈(0,1]`; family B has probability zero. Every chosen A point differs from B but their total-variation infimum is zero as `x→0+`. A uniform positive separation requires additional assumptions (e.g. quantitative margin, suitable compactness plus continuity and disjoint closed prediction images). The present SCC1 gate does not state such a continuous-family result.

## Experimental interpretation: structural versus practical identifiability

- Structural identifiability concerns whether noise-free model outputs can determine parameters/variants under specified observation maps; practical identifiability additionally depends on sampling, measurement noise, nuisance parameters and the likelihood. See Raue et al., *Bioinformatics* 25 (2009), https://pubmed.ncbi.nlm.nih.gov/19505944/ and related reviews.
- Model discrimination can be posed as design selection maximizing an information or risk criterion (KL divergence, mutual information, likelihood-based criteria) under parameter uncertainty, including adversarial nuisance refitting. See https://pmc.ncbi.nlm.nih.gov/articles/PMC8924111/ and https://cran.r-project.org/web/packages/optedr/vignettes/optedr-kl.html . These methods are external precedents, not results of NFC/SCC.
- A joint probability distribution must be supplied for correlated observable combinations. Different marginals imply different joint laws, but identical marginals do not establish identical joint laws; an independence assumption requires external justification. JUNO solar mixing and mass-squared splitting are derived from a shared analysis.
- Information-theoretic quantum distinguishability is a possible QIT bridge *only after* actual density operators and physical measurement maps exist: trace distance controls optimal binary state-discrimination performance (Helstrom–Holevo). See https://www.nature.com/articles/s41534-025-00980-8 . No BFSS-state-to-SM-measurement bridge is presently qualified.

## Concrete Standard Model control worth future symbolic use

Neutrino oscillations are insensitive to a common offset of all squared masses. If `m_i² → m_i²+c`, then every `Δm_ij²` is unchanged. A suitably defined kinematic electron-neutrino observable satisfies `m_β²=∑ |U_ei|² m_i²`; with row-normalization `∑ |U_ei|²=1`, the same shift sends `m_β²→m_β²+c`. This is a precise **conditional symbolic distinction** between two observation maps, not an absolute-mass measurement or model-derived value. Consult the PDG neutrino review and original KATRIN experimental sources before any comparison to a real bound: https://pdgweb.lbl.gov/2025/reviews/rpp2025-rev-neutrino-mixing.pdf .

## Priority order after SCC1 acceptance

A. Add a family-level observational-equivalence counterexample and finite **uniform deletion-minimal** witness selection with two necessary witnesses. Prefer Mathlib's exact pinned finset lemmas when verifiable.

B. Add finite rational categorical distribution equality and TV positivity as a separate source/consumer microgate; permit explicitly joint distributions where covariance is known, but never assume product likelihoods.

C. Model experimental design and identifiability only after supplying versioned model predictions, parameter/nuisance domains, units, fixed protocols, covariance and physical maps. Do not assign scores to BFSS, NFC, Spin(10), or other candidates without calculations.

**Governance**: single unified integration branch; preserve all original RED/GREEN evidence and current 27 accepted BFSS anchors; SM-Y0 and SM-D0 unchanged; complete SM-D1 remains prospective until physically qualified.
