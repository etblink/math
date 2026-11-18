# BFSS × QIT × SCC W0C2B0M R1 — first CI preflight-only RED, exact evidence and bounded harness repair

Date: 2026-11-17 Pacific. **HARNESS_PREFLIGHT_RED_UNQUALIFIED; NOT A NATIVE LEAN RED.**

The new complex-only original Fock coefficient source/consumer was atomically staged at `55175988156ac97e075d091ddfd1cc4cfac1a54e`, following frozen mathematical contract `d66d9e52602e937063a9a47685d1a0223160f19f`. The independent roadmap [#44251761290](https://github.com/etblink/math/actions/runs/44251761290) was **GREEN**, confirming canonical checkpoint coherence.

Original strict [#44251761371](https://github.com/etblink/math/actions/runs/44251761371), job `134623909530`, tested commit `55175988156ac97e075d091ddfd1cc4cfac1a54e`, original workflow blob `c730b0a7294e41d4edcb1145d2958c01061a4135`, **failed at its preflight before toolchain restoration and before source or independent consumer compilation**. The checkout succeeded, original two-file artifact upload succeeded, Lean restoration and native source step were skipped. Provider artifact `14403608294` was 392 bytes with SHA-256 `176992321525e4ce947ef720e8e5c7c91bef09a41ada9d9fad9866d1e2e069a3`.

**Exact first-causal error:** Python preflight line 30 asserts

```python
re.findall(r"(?m)^import ", source) == ["import"] * 2
```

and the next consumer check analogously expects `["import"]`. A regular expression including the trailing space returns `"import "`, not `"import"`. The source contains the correct two imports, and the independent consumer contains the correct one import. Repair **only** those two expected string literals, retaining the exact same regex and import counts. No mathematical source or consumer changes, no weakened axiom policy, no resource-limit escalation or retried stopped real-source W0C2B0 architecture.

Independent original evidence-preservation [#44252181709](https://github.com/etblink/math/actions/runs/44252181709) **GREEN**; commit `32c118701944b6beaafdac83695abbcfb052e3b4`. Git-pinned original provider ZIP `research/quantum-information/diagnostics/BFSS_M4_W0C2B0M_R1_44251761371_PREFLIGHT_RED_evidence.zip` blob `c1874bd132ee5962454a85c6380e2be204b4596d`; full original Actions transcript `BFSS_W0C2B0M_R1_44251761371_complete_job.log` blob `a8532cd1ca1c3bc29e1c9a547f8f98e26769abb2`; SHA-256/member CRC manifest `BFSS_W0C2B0M_R1_44251761371_PREFLIGHT_RED_evidence_manifest.json` blob `30fb623f207fcfc3d521a9522435dac80050d15b`. ZIP and full log checks were performed in the separate write-enabled archiver, not inferred from CI badge color.

**Qualification remains unchanged:** W0C2A R1 (#44213315719) last accepted, 24 original anchors, original W0C2B0 R1/R2 *native* REDs archived, original full bivector Lie bracket and all-48 gamma centrality unproved. W0C2B0M R1 strict must now run with the corrected harness, and only a native source+consumer+axiom GREEN followed by independent evidence preservation and a post-acceptance roadmap GREEN can qualify it. Do not count this harness RED toward the two-comparable-native-RED stop rule.
