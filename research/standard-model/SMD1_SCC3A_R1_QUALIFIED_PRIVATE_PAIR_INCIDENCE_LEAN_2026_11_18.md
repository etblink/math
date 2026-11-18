# SM-D1-SCC3A R1 — private distinguishing pair / incidence-cover Lean gate qualified

**2026-11-18 | ACCEPTED: original native mathematical formalization only.**

## Original strict-source evidence and independent verification

- Original native strict GREEN: https://github.com/etblink/math/actions/runs/44410857114
- Exact tested commit: `2dbedefbc206dee493a003fefb90352e8aab62b9`; job `135178286697`.
- Provider artifact `14476464291`, 2,581 bytes, SHA-256 `a5cc8125065db49f74745bd4f1c8327a90cbf2737474378cb5aec3d08a45f31e`.
- Source: `lean/OAI/MathematicalPhysics/StandardModel/Contrib/Kotler/SMD1SCC3PrivatePairIncidence.lean`; source blob `e7e737fa6877a85ef2bc216e3adb7fb63e12f485`.
- Independent consumer: `lean/diagnostics/SMD1SCC3PrivatePairIndependentConsumer.lean`; blob `6756ffcbad4c4066d359bf038cf39bf31b49565f`.
- Original strict workflow blob: `8cf4430c063549be0e83dde8e06729a4364dd8f5`.
- Pinned Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Cold 3,094-job build GREEN, original five source theorem `#print axioms` reports PASS, six independent consumer axiom reports PASS, two original Lean examples PASS, six adversarial negative-auditor mutants rejected. No `sorryAx`; only `propext`, `Classical.choice`, and `Quot.sound` in the audited axiom sets.

## Independent archive of the *original* artifacts

Original preservation run [#44411950638](https://github.com/etblink/math/actions/runs/44411950638) GREEN; exact archive commit `7d1b9e3c69616e8d6d75035c605c7580327ea27f`.

These files are Git-pinned under `research/standard-model/evidence/`:

- `SMD1_SCC3A_R1_44410857114_ORIGINAL_STRICT_GREEN_evidence.zip`
- `SMD1_SCC3A_R1_44410857114_ORIGINAL_complete_job.log`
- `SMD1_SCC3A_R1_44410857114_ORIGINAL_STRICT_GREEN_evidence_manifest.json`

Original artifact ZIP SHA-256 `a5cc8125065db49f74745bd4f1c8327a90cbf2737474378cb5aec3d08a45f31e`, original complete-job transcript SHA-256 `58d31d3b337f8dbf66c77aad264bf9149a13a0f7a57575803e2d1bd8df5e0d27`, manifest Git blob `927d8ebfb7f12c7de6f727ca1cecbb2b79504cc6`. The archive verifier checked original run, job, tested SHA, provider ZIP digest, six ZIP members, source/consumer axiom order and allowed-axiom lists, six mutated-negative auditor cases, and complete job transcript.

## Exact qualified theorem ceiling

The accepted original source proves five theorems:

1. `uniform_iff_pairwise_cover`: uniform model-family separation is equivalent to covered cross-family ordered pairs.
2. `deletion_failure_iff_uncovered_pair`: failure after removing a witness is equivalent to a cross-family pair indistinguishable on all remaining witnesses.
3. `uncovered_pair_yields_private`: given original coverage, such a pair is necessarily distinguished by the removed witness.
4. `uniform_minimal_iff_private`: deletion-minimal separation is equivalent to coverage plus one private pair per retained witness.
5. `inclusion_minimal_iff_private`: qualified SCC2/Mathlib inclusion minimality agrees with that same private-pair certificate.

Independent consumer source reconfirms the two-observation toy fixture with explicit private pairs `(0,2)` for `true` and `(1,2)` for `false`, with negative incidence examples.

**Critical precision:** `S` is finite but `A` and `B` need not be finite in the generic theorem. A *finite incidence matrix* is available only when the model families are also finite. A private pair establishes indispensable inclusion-minimality, **not** the fewest or cheapest measurements, likelihood sensitivity, experimental discriminating power, an unconditional SCC/NFC result or physical confirmation of any framework.

## Preserved predecessor claims and open physics frontier

Accepted original SCC1 and SCC2 claims and original RED/GREEN artifacts remain separately traceable. The SM-Y0 mathematics, SM-D0 empirical constraints, SCC0 executable methodology, and 27 accepted original BFSS anchors are unchanged. W0C2B2 remains **BLOCKED**. Full SM-D1 remains **PROSPECTIVE_UNSTAGED**.

**Next bounded direction:** consider SCC3B: finite rational categorical predictive distributions and total-variation positivity, including a strict distinction between a valid positive marginal witness, unknown predictions and unavailable joint likelihoods. That gate must be qualified independently before any claim about model statistics. Actual source-derived particle-physics predictions and external measurement comparison remain unproved.
