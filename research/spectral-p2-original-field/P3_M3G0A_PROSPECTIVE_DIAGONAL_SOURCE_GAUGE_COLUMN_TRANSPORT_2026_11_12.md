# P3-M3G0A — prospective original SU(2) gauge diagonal-column transport receipt
**Recorded:** 2026-11-12 Pacific / 2026-11-13 UTC. **Status:** PROSPECTIVE RECEIPT ONLY; no M3 Lean source, independent consumer, strict workflow, or mathematical qualification has been staged by this receipt.
**Repository/branch:** `etblink/math`, `integration/bfss-unified-research-20261108`. **Read/receipt baseline:** `15318dd645f8c3ccff5a9b2f2737a1f87275581d`. Do not touch `main`, historical FCP, accepted M1/M2 mathematical files, or frozen Edition 0.7 internal monograph.

## 1. Observation, question, falsifiable thesis
- Observation: M2C0 gives a bounded, invertible complex-linear identification of **original operator-norm** `OriginalFockOperatorLp` with finite `PiLp 2` original Fock-vector `FullL2 2` output columns. M2C1 gives two-sided source norm comparisons, not an isometry.
- Historical source audit: exact original `L6G7U–Z` provides the *left-output* SU(2) action `fiberAction g ∘ bosonPullback g⁻¹`, original `FullL2 2` fixedness and a unitary group homomorphism. It is not merely abstract/proxy gauge data.
- Testable proposition: the diagonal genuine FullL2 action transports along the M2C0 continuous equivalence to a genuine **continuous-linear** group representation on the actual original operator-valued L² space. It has the claimed group, inverse and columnwise intertwining laws. This is *not yet* a proof of a basis-independent pointwise source-physical operator action.
- Falsifier: any ill-typed original source carrier, reversed `trans` orientation or `g*h` law, incorrect index/fiber action, missing a.e. field agreement needed later, or unqualified dependency prevents advancement.

## 2. Immutable evidence and exact current-source pins
| Dependency | Qualified/recovered evidence | Exact current blob |
| --- | --- | --- |
| Original BFSS `Core.lean`, `FullL2 2` | `FullL2 N := Lp (Fermion N) 2 (volume : Measure (Boson N))` | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` |
| M2C0 `P3M2C0OriginalFockOperatorLpColumns.lean` | strict [#43375482588](https://github.com/etblink/math/actions/runs/43375482588), SHA `548d7978779e0a9ca5a91e01fccb686a786640f1` | `db2bf9530b1fad0bd539a37cc7ef15fba798a409` |
| M2C1 `P3M2C1OriginalFockOperatorLpColumnNorm.lean` | strict [#43379713104](https://github.com/etblink/math/actions/runs/43379713104), SHA `88c0a1f5efef0418b12645cb05ff7eefac7e4fb2`; 96 pins, 9,210 cold jobs | `1b528ed3921173a00725ebf23507b24a63a872be` |
| Historical `L6G7U` | successful [#42095440280](https://github.com/etblink/math/actions/runs/42095440280), SHA `0ca22c72345f949c03bcdae8a44d30334e60c42c` | `8903dfae1caf144ec63e32d05e7cf1001d75e029` |
| Historical `L6G7V` physical fixedness | same historical acceptance, byte-comparison rechecked | `cd7f1dd791daa930f5fa5a0016c607abc40903cd` |
| Historical `L6G7W` norm preservation | same historical acceptance, byte-comparison rechecked | `26cebbbd7c13dde06347637245ee53abfa9e3ed9` |
| Historical `L6G7X` fermion group action | same historical acceptance, byte-comparison rechecked | `f5028f9cbbdca4a51470b05c6c2f98d56e900c7b` |
| Historical `L6G7Y` group law | same historical acceptance, byte-comparison rechecked | `a402183a963f4c334da93c32257941e1b92a0e62` |
| Historical `L6G7Z` `actualOriginalFullL2GaugeUnitaryHom` | same historical acceptance, byte-comparison rechecked | `7f42aab817da8061aa76b251e4e2ba7c3b8379ed` |

The original full-contribution run [#42095440280](https://github.com/etblink/math/actions/runs/42095440280) succeeded in the `source-package` job, including **Compile complete source graph and audit declaration axioms**, and produced artifact `13453906628`. Previous handoff reports 795 source targets (including L6G7U–Z as targets 256–261), 2,924 axiom audit reports and a 128-module L6G7Z transitive closure with five imported divergences outside it. The current pass independently reconfirmed the six listed L6G7U–Z blob SHA matches. The entire 128-module closure was **not independently recounted** in this receipt pass; preserve the earlier audit and recheck exact closure when constructing strict gate manifest.

**Mathlib:** Lean 4.34.1, `d13f23b723b8a846827a245b89c10fc7d3f11612`. `Mathlib/Analysis/Normed/Lp/PiLp.lean` at this exact revision contains `LinearIsometryEquiv.piLpCongrRight`, `piLpCongrRight_apply` and `piLpCongrRight_symm`. Do not substitute a later-library signature.

## 3. Original source types and minimal Lean gate
Let `ι` be a finite type, `b : OrthonormalBasis ι ℂ (Fermion 2)`, and
`C_b := originalFockOperatorLpColumnsEquiv b`.
- SOURCE DOMAIN (unchanged): `OriginalFockOperatorLp = Lp (Fermion 2 →L[ℂ] Fermion 2) 2 (volume : Measure (Boson 2))`.
- COLUMN CODOMAIN: `PiLp 2 (fun _ : ι => FullL2 2)`, definitionally the M2C0 codomain `PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 (volume : Measure (Boson 2)))`.
- SU(2) source representation: `FCP.BFSSSU2PhysicalDomainL6G7Z.actualOriginalFullL2GaugeUnitaryHom : GaugeGroup 2 →* (FullL2 2 ≃ₗᵢ[ℂ] FullL2 2)`.
- **First definition** `Delta_g : PiLp 2 (fun _ : ι => FullL2 2) ≃ₗᵢ[ℂ] PiLp 2 (fun _ : ι => FullL2 2)` via `LinearIsometryEquiv.piLpCongrRight 2 (fun _ => actualOriginalFullL2GaugeUnitaryHom g)`.
- **Second definition** `Gamma_b(g) := (C_b).trans (Delta_g.toContinuousLinearEquiv) |>.trans (C_b).symm`, with exact `≃L[ℂ]` type. Parenthesization/orientation must be checked in the first Lean preflight.
- FIRST NAMED THEOREMS: `C_b (Gamma_b(g) f) = Delta_g (C_b f)`; its component law `(C_b (Gamma_b(g) f)) i = U(g) ((C_b f) i)`; `Gamma_b(1)=id`, `Gamma_b(g*h)=Gamma_b(g) ∘ Gamma_b(h)`, and `Gamma_b(g⁻¹)=(Gamma_b(g))⁻¹`. A single `MonoidHom` packaging is optional *only if* these source laws and their named independent consumers qualify cheaply.
- **No isometry claim for `Gamma_b`** from continuous equivalence alone. The `Delta_g` isometry does not transfer the original operator norm via an arbitrary `≃L[ℂ]`.

Prefer an initial small interface theorem and one algebraic group law rather than a broad all-in-one action/physical proof. Import the exact historical L6G7Z module and accepted M2C0; M2C1 may be used for scoped norm bounds but is not logically necessary for the group action. Strict pins can include accepted manifest ancestors for provenance without overclaiming proof dependencies.

## 4. Deliberately separate follow-ups
- **M3G0B**: prove a.e. original source pointwise action `(Gamma_g f)(x) = (pairedGaugeData.fermion g) ∘ f ((pairedGaugeData.boson g⁻¹) x)` using the *left-output* action, original bosonic inverse pullback, and source `Boson 2` a.e. semantics. Prove independence of `b` and norm preservation only after this exact source identification. Do not replace the left output by operator conjugation.
- **M3G0C**: with L6G7V, prove `Gamma_b(g) f = f` for all `g` iff every actual original `FullL2 2` Fock output column is in `pairedGaugeData.physicalSpace`. This fixed-space theorem is not part of M3G0A.
- M3-W0 nonzero physical witness, M4 Spin(9) HS, M5 changed natural-domain Hamiltonian port, and M6–M8 physical spectral conclusions remain separate.

## 5. Mandatory independent consumer, manifest and strict STOP/GO
1. New source under `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/`, dedicated `P3M3G0A...` namespace and source file, with only the exact imports above. No edits to old imported sources.
2. Dedicated `lean/diagnostics/BFSSP3M3G0A...IndependentConsumer.lean`: check `OriginalFockOperatorLp` against the **actual** `Boson 2` operator norm and `FullL2 2` against `Fermion 2`; use `EuclideanSpace.basisFun (Fin (2 ^ (8 * colorDim 2))) ℂ` at least once without enumerating 2^24 basis elements; consume named statements; `#print axioms` on *each* source declaration.
3. Construct manifest as a **deduplicated path-to-blob dictionary** of the exact M2 source/consumer ancestry, historical L6G7Z full dependency closure, and new source/consumer. The earlier 96-pin M2C1 list and the reported 128-module L6G7Z list are **not disjoint** (at least `BFSS/Core.lean` is shared). **Do not claim 224 distinct existing pins**. Recount and confirm identical hashes for every repeated path before freezing; reject a path/hash conflict. Set precise new count only after regeneration and review.
4. Dedicated strict workflow scoped to the unified branch; exact version and blob preflight, source/consumer compilation with warnings treated as failures, cold dependency build, explicit root axiom allowlist **only** `propext`, `Classical.choice`, `Quot.sound`, preserved failure logs and immutable evidence artifact. If pinned source/consumer contract fails, STOP without promoting.
5. Respect the existing scientific-method protocol; no uncontrolled numerical experiment is needed for this purely formal transport candidate. If a novel Python experiment is introduced, prospectively register it first.
6. After a RED, preserve first causal failure and reject swapping in a generic gauge surrogate. After a GREEN, verify tested SHA, exact path/blob and independent consumer, then update **only** the canonical `BFSS_GATE_STATE.json` before beginning M3G0B. A historical green cannot qualify a new M3 theorem.

## 6. Project Lead disposition
**GO:** Stage only the M3G0A diagonal transport source/consumer and a fully deduplicated strict workflow *after this prospective receipt is committed and its content reviewed*. **HOLD:** mathematical acceptance, M3G0B/C, physical norm isometry and all Hamiltonian/spectral promotions until independent source-exact CI. Documentation commit alone is not mathematical qualification.
