# SM-D1-SCC3B0 R1 — original strict consumer rational-decide RED

**2026-11-18 | R1 NATIVE RED, UNQUALIFIED.** Original provider CI [#44413642677](https://github.com/etblink/math/actions/runs/44413642677), exact tested commit `9e1c1015d35699bed47396716678c66d1e24b37e`, job `135188075994`.

Original source `lean/OAI/MathematicalPhysics/StandardModel/Contrib/Kotler/SMD1SCC3B0FiniteRationalTotalVariation.lean` blob `8417daf98449b51d45b18951bd389cb3bd777405`; consumer blob `a6484a8cfeeef722d69539a524a4a2b0b79ee3ac`; original workflow blob `d74f7e980ab7974a21e7805c9b1dacfce98cba52`.

**Preflight / pins / cold original source:** PASS. All **seven source theorem reports** passed with only `propext`, `Classical.choice`, `Quot.sound`, and no `sorryAx`. The original source itself did not fail.

**First causal failure:** standalone independent consumer proof checking. Its `by decide` tactics could not kernel-reduce rational finset sums in the three normalization obligations (lines 22, 29, 36) or the two total-variation value examples (lines 63, 66). This left failed elaborations and made three downstream consumer theorem `#print axioms` reports show `sorryAx`; the consumer and full gate are **NOT qualified**.

**Original provider artifact:** id `14479586372`, ZIP 2,611 bytes, SHA-256 `6934aaea446f9d149c91446bcec3bc89f8f5e31a79cf02a83ae8dd7071063715`. Original strict RED must be preserved as provider ZIP, full job transcript, immutable manifest and checksums; never equate a successful source with a qualified full gate.

**Bounded R2 repair:** keep all definitions and statements, seven source theorem proofs and source blob unchanged. Replace the five consumer `decide` proof steps with `norm_num [Fin.sum_univ_succ]` and explicit `norm_num [totalVariation, Fin.sum_univ_succ, ...]` arithmetic rewrites. Retain source+consumer strict options, timeouts, six mutated auditor controls and all accepted anchors. Update exact consumer blob assertion only. If the explicit arithmetic rewrite fails natively, diagnose rather than weakening statements.

**Scientific scope:** exact finite rational mathematical difference only; no real-world measurement, experiment, model-specific prediction, sampling significance, likelihood, BFSS validation, or NFC SCC transfer. Full SM-D1 still PROSPECTIVE_UNSTAGED.
