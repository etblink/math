# GM4A initial-source-pin mismatch — detected before qualification, 2026-11-22

- GM4A initial candidate commit: `ef52314b2c4d115a3cc4937781cd3eb7624e95be`, workflow [run #45078747924](https://github.com/etblink/math/actions/runs/45078747924). **No mathematical theorem qualified at that commit.**
- Post-push read-only pin comparison of every frozen upstream file showed exactly **one mistaken workflow source-blob SHA**: `BFSSGM3COriginalMasslessGraphTwoSidedGaugeInvariance.lean`.
- Incorrect workflow expected blob: `55216ef04bd96c2cfd024329026c749e89c97321`. Original actual frozen Git blob verified by `fetch_file`: `83c862bee0398f128b43b8cd30d1136984ab1162`. All eight other source blob pins matched their fetched source bytes.
- Root: transcription error in the **new CI preflight manifest**. No source Lean theorem, original evidence, GM3C GREEN or proof assumption was altered.
- Bounded correction: update only this hash in the workflow and preserve this diagnostic note on the *same* unified integration branch. The workflow's `cancel-in-progress` may cancel the initial run; do not misreport that as mathematical RED, do not claim GM4A strict GREEN without its own native and independent consumer report.
- Positive inherited evidence: GM3C strict [#45076208150](https://github.com/etblink/math/actions/runs/45076208150) remains qualified, original artifact [#14776525836](https://github.com/etblink/math/actions/runs/45076208150/artifacts/14776525836), SHA-256 `1b424421c62621a1e461f9f66784663ac03b1bd795afc3cb795b78b6d2183548`.
