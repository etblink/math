# BFSS W0B0 R2 — roadmap R1 guard failure and bounded checker repair

Date: 2026-11-17 Pacific. **ROADMAP CI RED, NOT NATIVE LEAN RED**.

[Roadmap #44109519454](https://github.com/etblink/math/actions/runs/44109519454) at tested `68ed5e35c7268951779d9d35aa4f87f59fee2b67` failed `BFSS_ROADMAP_CHECK_FAIL: W0B0 source/consumer or last-qualified W0A3 drift` during the checker. Source pins, W0A3 ancestor, and original R1 RED ZIP were not altered. The error arose because the W0B0 R1 pending checker branch still ran on R2 and hardcoded `attempt == R1` and old R1 source/consumer/workflow blobs; a separate valid R2 guard had been added but ran too late.

Bounded checker repair: change the R1-only condition from

```python
if a['gate'] == 'P3-M4-W0B0' and a['status'] == 'PENDING_STRICT_CI':
```

to

```python
if a['gate'] == 'P3-M4-W0B0' and a.get('attempt') == 'R1' and a['status'] == 'PENDING_STRICT_CI':
```

The separate R2 guard checks exact R1 original ZIP bytes, per-member digests, original complete source failure log, W0A4 stopped evidence, and reverse reconstructed R1 source Git blob hash. This change in checker does not modify mathematical source, independent consumer, theorem contract, axiom allowance, recursion budget, or W0A3 last qualification. Do not count this harness RED toward the two-analogous-native-source-RED stop. Original job log Git blob `2fcb88037d5d828a9ef0a553bb1496d1589556df` preserved at `research/quantum-information/diagnostics/BFSS_W0B0_R2_44109519454_ROADMAP_job.log`.

The live W0B0 R2 [strict #44109519633](https://github.com/etblink/math/actions/runs/44109519633) is independently testing the unchanged source `c67f30bb76a9990e508a8a050a8c3313e694bda7` and consumer `159c561d6e73e3c86959cd239deb10984064e92e` at the original tested SHA. The strict run's outcome must be independently verified; this memo claims no theorem qualification.
