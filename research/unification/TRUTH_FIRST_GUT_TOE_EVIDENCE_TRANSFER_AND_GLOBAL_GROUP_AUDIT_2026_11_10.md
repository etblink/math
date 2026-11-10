# Truth-first unification feasibility — evidence transfer, global gauge groups and Spin(10) spinors

**Date:** 2026-11-10 (America/Los_Angeles)
**Disposition:** EXPLORATORY / CANDIDATE-NEUTRAL / NOT A LEAN THEOREM / NOT AN FCP CANONICAL PHASE
**Repository:** `etblink/math`, branch `integration/bfss-unified-research-20261108`
**Scientific purpose:** improve justified understanding of *physical reality*, not prove that BFSS (or a GUT, string theory, NFC, asymptotic safety, IKKT, or any other model) must be true.
**External source window:** bounded to specific primary/review references enumerated below; this separate feasibility packet does not expand or alter any previously frozen FCP framework-comparison source corpus.

## 1. Governing scientific contract and provenance

**We seek truth about reality. Preserve results, not theories.** This packet reuses the canonical `etblink/Foundational-Convergence-Program` truth-first rules and ten-layer comparison method, but it is **not** a new FCP comparison, registration, admission, empirical result, or alteration of its current `main` scientific state.

Canonical references:
- [FCP charter](https://github.com/etblink/Foundational-Convergence-Program/blob/main/FCP_CHARTER.md), [epistemic rules](https://github.com/etblink/Foundational-Convergence-Program/blob/main/EPISTEMIC_RULES.md), [comparison protocol](https://github.com/etblink/Foundational-Convergence-Program/blob/main/COMPARISON_PROTOCOL.md), [claim ledger](https://github.com/etblink/Foundational-Convergence-Program/blob/main/CLAIM_LEDGER.md), [current state](https://github.com/etblink/Foundational-Convergence-Program/blob/main/CURRENT_STATE.md).
- [BFSS current core](https://github.com/etblink/math/blob/integration/bfss-unified-research-20261108/lean/OAI/MathematicalPhysics/BFSS/Core.lean), [BFSS strict failure/reuse playbook](https://github.com/etblink/math/blob/integration/bfss-unified-research-20261108/contributions/bfss-kotler/BFSS_LEAN_PROOF_REUSE_AND_FAILURE_PLAYBOOK_2026_11_08.md), and [current C48 source handoff](https://github.com/etblink/math/blob/integration/bfss-unified-research-20261108/contributions/bfss-kotler/BFSS_C48C0_ORIGINAL_SPIN_GAUGE_48_COMMUTATION_HANDOFF_2026_11_09.md).

**Status ceilings at this source window:**
- The FCP current state reports zero independent framework-level EMP4 slots, no independently non-generic common structure recurring across multiple distinct framework families, and **no framework winner**. Its FCP-26 Stage 1 outcome did not justify an additional framework-level empirical Stage 2: remaining testability was model-, parameter-, or realization-level. These are *bounded review conclusions*, not universal no-go theorems or proof that future empirical discrimination is impossible.
- The original source-faithful SU(2) BFSS C48-0 and C48-0B matrix commutators/identifications are separately strict-qualified ([#42779878513](https://github.com/etblink/math/actions/runs/42779878513) and [#42787913738](https://github.com/etblink/math/actions/runs/42787913738)). The original Fock operator C48-1A0 is **only a submitted candidate**, [#42790623727](https://github.com/etblink/math/actions/runs/42790623727) in progress at this record; do not poll it as part of this parallel investigation.
- BFSS algebra and its `AlgebraData N` generic definitions do not imply four-dimensional physical GUT gauge symmetry, generations, observed gravity, cosmic dark matter, or a new quantum-gravity completion.

**Four explicit stop lines:**
1. A formally checked theorem is true *under its assumptions*, not automatically true *of nature*.
2. Matching dimensions, names (SU(2), SU(3)), centers, gauge algebras or Clifford structures does not imply the representations or physical degrees of freedom are identical.
3. Generic mathematics shared across theories does **not** earn non-generic convergence or independent physical-evidence credit.
4. Fitting already-known data is not an out-of-sample prediction. Use physical-realization bridges, dynamical stability, calibrated observables and held-out discriminators.

## 2. Transferable positive and negative knowledge

| Prior result or failure | Reusable content | Invalid inference / negative boundary |
| --- | --- | --- |
| BFSS exact group lifts and Spin central-sign tests | Require the actual global group and exact action on fermions, not merely a Lie algebra | `Spin(10)` spinor `16` cannot be assumed to descend to `SO(10)` |
| Original 48-label covariance and C48-0B actual-source equality | Source-index maps, operator action conventions, independent consumer, unit CAR normalization | 48 real BFSS Majoranas are **not** three generations of 16 complex four-dimensional Weyl matter |
| Full Fock Clifford algebra and positive sqrt(2) normalization | Exterior/Fock algebra and Clifford generator construction as proof *techniques* | Does not transfer any BFSS physical carrier or Hamiltonian to a GUT |
| BFSS spectral `M=6` Fock-vector vs `M=12` operator-fiber correction | Representation-sensitive bounds and adversarial counterchannels | Do not transfer a spectral cutoff to different carrier without proof |
| FCP recurrence/null-subtraction negative findings | Independent, non-generic and weaker-framework tests | Similarity does not establish unification, and no candidate is a winner |
| Physical-domain and continuity open obligations | Prove original operator domains, reduction and source-to-observable mapping | Algebraic covariance alone does not imply physical dynamics or measurements |

## 3. New feasibility test A — global `Z6` gauge quotient and exact charge congruence

A given local Standard Model gauge algebra does **not** fix the global gauge group. With appropriately normalized `U(1)` charge `n = 6Y ∈ Z`, the familiar local field multiplets admit the groups

```text
   G = (SU(3) × SU(2) × U(1)) / Gamma,
   Gamma in {1, Z2, Z3, Z6}.
```

[David Tong, *Line Operators in the Standard Model*, JHEP 07 (2017) 104](https://doi.org/10.1007/JHEP07(2017)104) establishes the global-group ambiguity and its significance for electric, magnetic and dyonic lines. The existence of a faithful `Z6` quotient on the known local matter does **not** empirically select that global form over the other admissible presentations.

Choose the proposed generator of `Z6`:
```text
 z = (omega_3 * I_3, -I_2, exp(i*pi/3))
```
where `omega_3 = exp(2*pi*i/3)`. On a multiplet with color triality `t ∈ Z3`, weak-center parity `p ∈ Z2`, and `n=6Y`, its representation has phase
```text
 exp(2*pi*i*(2*t + 3*p + n)/6).
```
The multiplet descends through the **full** `Z6` quotient precisely when

```text
 2*t + 3*p + n ≡ 0 (mod 6).
```

**Exact input convention:** left-handed Weyl matter `Q, u^c, d^c, L, e^c`, optional `nu^c`, and Higgs `H`. Triplet `t=1`, antitriplet `t=2`; weak doublet `p=1`; all hypercharges in ordinary SM `Y` normalization.

| Multiplet | `t` | `p` | `n=6Y` | `2t+3p+n` | Residue mod 6 |
| --- | ---: | ---: | ---: | ---: | ---: |
| `Q = (3,2)_(1/6)` | 1 | 1 | 1 | 6 | 0 |
| `u^c = (3bar,1)_(-2/3)` | 2 | 0 | -4 | 0 | 0 |
| `d^c = (3bar,1)_(1/3)` | 2 | 0 | 2 | 6 | 0 |
| `L = (1,2)_(-1/2)` | 0 | 1 | -3 | 0 | 0 |
| `e^c = (1,1)_1` | 0 | 0 | 6 | 6 | 0 |
| `nu^c = (1,1)_0` | 0 | 0 | 0 | 0 | 0 |
| `H = (1,2)_(1/2)` | 0 | 1 | 3 | 6 | 0 |

This is a necessary constraint for representations of **that** global quotient, not a universal requirement independently of the gauge-group choice.

**Two falsifying controls:**
- A hypothetical `(1,1)_(1/6)` has residue 1; it is not a representation of the *full* `Z6` quotient in this convention. It would not be excluded solely by the unquotiented product algebra.
- An additional vectorlike pair `(3,1)_(-1/3) ⊕ (3bar,1)_(+1/3)` has zero `Z6` residues **and** cancels its anomaly contributions. Thus quotient compatibility and anomaly cancellation alone **do not force precisely the Standard Model chiral particle content**.

**Physical promotion blocked:** The correct quotient, line-operator spectrum, additional particles and charge quantization must be selected via an actual physical source and testable phenomena; no empirical selection is claimed by the congruence.

## 4. New feasibility test B — Spin(10) spinor from exterior algebra

The actual chiral 16-dimensional spinor of the gauge group `Spin(10)` admits a familiar, exact algebraic construction using five complex fermionic modes:

```text
 S_plus  = Lambda^even(C^5) = Lambda^0 ⊕ Lambda^2 ⊕ Lambda^4
           dim 1 + 10 + 5 = 16
 S_minus = Lambda^odd (C^5) = Lambda^1 ⊕ Lambda^3 ⊕ Lambda^5
           dim 5 + 10 + 1 = 16
```

On restriction to the natural `SU(5)` subgroup, with fixed chirality/conjugation conventions,

```text
 16 -> 1 ⊕ 10 ⊕ 5bar.
```

This organizes one SM generation plus a gauge-singlet neutrino-type state; it **does not** determine three generations, Yukawa couplings, symmetry breaking, right-handed neutrino mass, or any physical spectrum by itself. See the [PDG Grand Unified Theories review (2025)](https://pdg.lbl.gov/2025/reviews/rpp2025-rev-guts.pdf), particularly its explanation of the 10d Clifford/exterior construction, and [spinorial SO(10) phenomenology discussion](https://academic.oup.com/ptep/article/2024/8/08C101/7687822).

**Global-group correction that matters:** The physically relevant irreducible spinor is a representation of `Spin(10)`, not of the bosonic rotation group `SO(10) = Spin(10)/{±1}`; the nontrivial kernel element `-1` acts as `-I` on spinors. `Spin(10)` has center `Z4`. This is directly analogous as a *proof-method warning* to the central Spin-sign obstructions in our original BFSS work, but the mathematical carriers are not identified.

**Negative knowledge:** The `1+10+5` dimension and the `48=3×16` numerical coincidence do **not** identify the SU(2) BFSS 48 real Majorana labels with three four-dimensional Spin(10) chiral spinors. A physical 3-generation result needs a mechanism such as a family index or stable zero-mode multiplicity and explicit Lorentz/chirality realization.

## 5. New feasibility test C — anomaly cancellation is necessary, not sufficient

For one left-handed Weyl generation `Q + u^c + d^c + L + e^c` (with `nu^c` optionally present), rational-exact arithmetic gives:

| Test | Exact coefficient |
| --- | ---: |
| `SU(3)^3` | 0 |
| `SU(3)^2 U(1)_Y` | 0 |
| `SU(2)^2 U(1)_Y` | 0 |
| `U(1)_Y^3` | 0 |
| `grav^2 U(1)_Y` | 0 |
| `SU(2)` global doublet parity (3 colored `Q` + 1 `L`) | 4 = even |

These are finite representation-theory consistency tests under the declared field list, not measurements. `nu^c` is gauge neutral in this table, and no nonzero neutrino mass is inferred.

**Negative control:** an extra vectorlike triplet-antitriplet pair contributes zero total perturbative anomalies and passes the `Z6` test; therefore anomaly-free + quotiented is not a uniqueness theorem for SM matter. A GUT candidate must additionally account for observed *chirality*, family number, masses, couplings, heavy states, decays and particle detection constraints.

## 6. Candidate-neutral discovery program — proposed gates

| Gate | Exact target | Why it is worth trying | Mandatory stop condition |
| --- | --- | --- | --- |
| `U-G0` Global gauge form | Actual global `G`, its kernel on matter and allowed line/bundle sectors | Distinguishes local-algebra lookalikes and exposes central-sign errors | Merely matching Lie algebras or electric multiplets |
| `U-G1` Chiral-spinor algebra | Formalize `Lambda^even C^5` and exact `SU(5)` branching in isolated Lean/math library | Transfers Clifford/Fock proof *methods* without importing BFSS ontology | `16`-dimensional vector alone used as a physical generation |
| `U-G2` Full anomaly ledger | Exact local and relevant global anomalies for complete claimed effective matter content | Cheap early rejection of false GUT constructions | Anomaly cancellation presented as uniqueness or dynamics |
| `U-G3` Mechanism for families | Derive integer net chiral index and its topological/physical stability from a named background | Distinguishes `three generations derived` from `three copies chosen` | Arbitrary flux/background selected to insert 3 without independent physical-selection rationale |
| `U-G4` Dynamics + observations | RG running, thresholds, neutrino mechanism, proton lifetime, gravitational correspondence, dark matter stability and cosmological consistency | Constrains candidates with held-out observables, not aesthetic score | Fitting away failed predictions via unfrozen tunable parameters |

**Physical constraints must use the latest independently verified datasets in any live gate.** As a concrete example of a potentially discriminating GUT observable, Super-Kamiokande's [October 26, 2026 two-pion search](https://doi.org/10.1103/frxr-pk3t) constrains two proton decay channels; the absence of a significant excess restricts models only through their *actual predicted branching ratios and partial lifetimes*. No candidate is excluded without that quantitative bridge.

**Gravity and dark matter are separate requirements, not automatic consequences of GUT symmetry.** A mathematically consistent Spin(10) multiplet does not produce general relativity, a metric, a viable dark-matter relic or cosmic expansion. A neutrino-like SM singlet is not automatically a cosmologically stable dark-matter particle. Such claims need genuine dynamics and empirical binding; no BFSS/IKKT matrix embedding has yet passed these tests in this project.

## 7. Reproducibility and governance

The self-contained stdlib Python checker is [`tools/global_group_exact_check.py`](tools/global_group_exact_check.py). It asserts the `Z6` congruence table, six anomaly/global-parity zeros, exterior-power dimensions, a forbidden-charge negative control, and a vectorlike allowed-but-nonunique counterexample. These are **exploratory calculations**: source code and independent mathematical review are necessary, and a passing script is not an accepted Lean theorem or a verified physical prediction.

For a future Lean gate, first find accepted Mathlib APIs for `ExteriorAlgebra`, `CliffordAlgebra`, `SpinGroup`, representation restriction and kernels. Prove a minimal exact group/representation lemma and independent consumer, then consider implementation in a candidate-neutral Lean module. Avoid introducing a global SO(10) spinor incorrectly or conflating the five-mode Spin(10) exterior model with the original 24-complex-mode SU(2) BFSS Fock module.

**Repository boundary:** This packet and helper script sit in `research/unification/` specifically to avoid pretending they are BFSS strict-accepted proofs or FCP canonical results. No FCP repo changed; no qualification manifest, Lean source, workflow or active BFSS gate changed. C48-1A0 remains a separate pending strict run whose result the user will relay.

**Next bounded read-only investigation:** Investigate whether the `Spin(10)` exterior-spinor construction plus observed SM anomaly/coupling structure places any genuinely nontrivial restriction on *three-generation selection*, rather than merely repackaging already supplied representations. Specifically compare Spin(10) branching, Pati–Salam, and independently sourced chiral-index compactification candidates under the same `U-G0..G4` questions. Record `NONFORCED` where neither chirality multiplicity nor family count is fixed.

## 8. Further investigation — Pati–Salam is an independent *calculation*, not independent evidence of Spin(10)

A second, very useful four-dimensional representation cross-check comes from the Pati–Salam route inside `Spin(10)`. The chiral `16` branches as

```text
Spin(10) -> [SU(4)_C × SU(2)_L × SU(2)_R]/Z2
  16 -> (4,2,1) ⊕ (4bar,1,2) = 8 ⊕ 8.
```

The quotient is the diagonal central `Z2` generated, in this subgroup presentation, by `(-I4,-I2,-I2)`: it acts as `(-1)(-1)=+1` on each of the two spinor summands. The kernel is *not* an arbitrary choice inferred just from the Lie algebra. Source context: [Baez and Huerta, *The Algebra of Grand Unified Theories*](https://arxiv.org/abs/0904.1556) discusses the non-injective lift `Spin(4) × Spin(6) -> Spin(10)`, and [*Geometry of Spin(10) symmetry breaking* (2024)](https://doi.org/10.1063/5.0210073) explains that properly aligned SU(5) and Pati–Salam subgroup structures intersect in the Standard Model gauge symmetry.

Given the **chosen** SU(4) breaking `4 -> 3_(B-L=+1/3) ⊕ 1_(B-L=-1)` and SU(2) right-isospin `T3R = ±1/2`, the hypercharge formula is

```text
Y = T3R + (B-L)/2.
```

This is source-standard Pati–Salam group theory, for example [*Fermion Masses and Mixing in Pati–Salam Unification* (2025)](https://academic.oup.com/ptep/article/2025/3/033B05/8051399). Exact rational re-evaluation:

| Left-handed field | `B-L` | `T3R` | Derived `Y` |
| --- | ---: | ---: | ---: |
| `Q` | `+1/3` | `0` | `+1/6` |
| `L` | `-1` | `0` | `-1/2` |
| `u^c` | `-1/3` | `-1/2` | `-2/3` |
| `d^c` | `-1/3` | `+1/2` | `+1/3` |
| `nu^c` | `+1` | `-1/2` | `0` |
| `e^c` | `+1` | `+1/2` | `+1` |

The six matches are reproduced in the exact-arithmetic checker alongside the Z6 and anomaly tests.

**Important negative knowledge:** The SU(5) route `16 -> 10 ⊕ 5bar ⊕ 1` and the Pati–Salam route `16 -> (4,2,1) ⊕ (4bar,1,2)` are two distinct **decompositions of the same Spin(10) representation**. Their agreement on observed Standard Model quantum numbers is a meaningful *internal cross-check*, but **not** two independent confirmations that Spin(10) describes reality. It fails the FCP independence test if counted as cross-framework foundational convergence: both results depend on the shared parent `Spin(10)` and selected embedding geometry. Likewise, agreement with already-known hypercharges is a successful reconstruction under chosen assumptions, not an out-of-sample prediction.

**Strongest positive transferable conclusion:** Fock/Clifford techniques, exact global central kernels, and representation restriction are general mathematical building blocks for comparing the SU(5) and Pati–Salam routes and checking for source-induced sign or matter-content mistakes. Formalizing the subgroup intersection and the actions of the exact kernels would provide reusable candidate-neutral Lean mathematics.

**Strongest remaining open physical question:** Which breaking, vacuum and dynamics (if any) are *selected by reality*, and what genuinely new consequences follow? The representations explain how one family **fits** a Spin(10) model, not why three generations exist, why SU(5)/Pati–Salam embedding is realized, why neutrinos have observed masses, why gravity exists, or what dark matter is.

**Recommended next falsification gate:** preregister identical representation and observable tests for these two subgroup routes and an explicit non-GUT null comparator. Do not double-count internal agreement, do not infer gravity/dark matter from gauge branching, and require a new discriminator (e.g. independently constrained decays, heavy intermediates or neutrino-sector predictions) that was not used to choose the representation.
