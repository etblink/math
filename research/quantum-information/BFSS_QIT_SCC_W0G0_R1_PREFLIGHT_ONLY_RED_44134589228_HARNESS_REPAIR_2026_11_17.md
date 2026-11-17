# BFSS × QIT × SCC — W0G0 R1 preflight-only RED and bounded harness repair

2026-11-17 Pacific. **HARNESS_ONLY RED — NO LEAN SOURCE TESTED.** W0B0 R2 is last qualified GREEN; original W0B1 R1/R2 induction architecture remains STOPPED.

## Exact failed preflight

- Original strict [run #44134589228](https://github.com/etblink/math/actions/runs/44134589228), job 134220543984, tested commit `a7d236bb340637230d87718ba36470c1c5a4742d`.
- Generic source blob `ff4f7f2a123e5b554ef08f09bffbcd9eec0c1a32`; independent consumer `b1e2d8077f798c4b9526ddb61b9a50b58c093474`; original W0G0 workflow blob `47195e1970e94dc51d73ed232b7252757e7b560b`.
- Preflight Python assertion line 9 failed because generated raw regex was double-escaped (`\\b` instead of `\b`) and therefore failed to count source theorem roots. Independently, roadmap [run #44134588860](https://github.com/etblink/math/actions/runs/44134588860) was RED at `W0G0 generic source/consumer proof boundary changed` for analogous over-escaped regex.
- Toolchain restoration and cold Lean source/consumer/auditor were **NOT RUN**, and therefore W0G0 has no source qualification and no source failure. This does not count as one of the two allowed native source failures.

## Original provider archive and complete negative evidence

- Original [artifact #14350907997](https://github.com/etblink/math/actions/runs/44134589228/artifacts/14350907997), 389 bytes SHA-256 `68fe1a129f566cdedbb36283dc217bb95c337ca1be1be97215b97c9aeecf866b`; Git blob `49bfe05f74a3afa2a167e45d4b178438c2c8390b`, path `research/quantum-information/diagnostics/BFSS_M4_W0G0_R1_44134589228_PREFLIGHT_RED_evidence.zip`.
- Provider original ZIP has only `preflight.log` (88 bytes SHA `e0d9d3195371114369f8765b5def811d8f14635e9ccee87f725914291e6d6b51`) and `tested-commit.txt` (41 bytes SHA `9ad9948276cc6dd53912c9179a5bd1de54b84791f182ab521cf3ee1c321aaf18`). The absence of `cold-source.log` is expected since compilation never started.
- Full original job log 28,713 bytes, SHA-256 `c92c83c50938e8b918992af4ea69700cc6b502af1e61f12218b48e79e289b74a`, Git blob `7881bc0df7d4eeae68619a87fd0893a797e90456`; evidence manifest blob `0d15093773a1e970776f171b6f9bee9b199b6b7a`. Original ZIP, full log, checksum manifest preserved by independent [run #44135186106](https://github.com/etblink/math/actions/runs/44135186106) **GREEN** after a separate archiver-only assertion mismatch in [#44134937718](https://github.com/etblink/math/actions/runs/44134937718) **RED**. The archiver repair did not change original run bytes.

## Frozen bounded correction

Repair **only** the Python escaping in the W0G0 strict workflow and its canonical roadmap guard: raw regex word boundaries, whitespace, brackets, and Python string newline escapes must use a single backslash in the generated Python source. Preserve source and consumer Git blobs byte-identical. Re-pin the changed workflow blob in `BFSS_GATE_STATE.json`, workflow guard and roadmap and independently recheck both W0B1 original STOP evidence and W0G0 original harness RED. Do not bypass or weaken any assertion, import original BFSS source into generic module, increase limits, change accepted donors, or mutate `main`.

Run the fixed strict W0G0 gate as R1 harness repair (original source R1 has not run) and independent roadmap. The next complete original-native proof attempt will provide the first mathematically meaningful W0G0 qualification result.
