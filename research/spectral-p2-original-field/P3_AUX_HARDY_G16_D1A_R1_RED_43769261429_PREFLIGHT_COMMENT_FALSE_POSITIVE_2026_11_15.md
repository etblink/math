# G16 D1A R1 — RED_UNQUALIFIED, comment-only preflight false positive
**2026-11-15.** [Run #43769261429](https://github.com/etblink/math/actions/runs/43769261429), attempt 1, job 132981260874, tested `78f374f740fb391d7c19a26bffd391858a76f0d5`, failed before Lean or toolchain restore. Source and independent consumer never compiled in this attempt, hence no new gamma Frobenius theorem was qualified or disproved.

## First-causal boundary
The CI log has `AssertionError` at Python preflight `<stdin>` line 59, mapping to:
```python
assert "originalHardyY" not in src and "originalHardyY" not in control
```
The exact source contains that term only inside its opening explanatory comment: `Source exact; no originalHardyY, no coefficient quadratic, no Hardy sector.` The source has precisely one `/-! ... -/` block and the remainder contains no `originalHardyY` reference; the consumer also contains none. The intended mathematical guard was thus tripped by a *negative-scope comment*, not a disallowed Lean dependency. Prior hash/ancestor/import-closure checks reached this assertion without reported errors. This conclusion was independently reproduced from fetched source and workflow bytes; the R1 log itself does not print the expression.

## Failure artifact
[GitHub 2-file archive](https://github.com/etblink/math/actions/runs/43769261429/artifacts/14184015528), ID 14184015528, 304 bytes. Independent download/re-hash SHA256 **aa20f4c3b2cc9b9e30872e43f20ccc33ebd2a871cb2d8a581fc07b1f2cc89792** matched the GitHub digest. Entries: `preflight.log` (empty, SHA256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855) and `tested-sha.txt` (SHA256 6df15f0bbc6d523272d6c7d1dabb3114385023d6b051bf49baef635fd0b5bfb2). Full artifact is external, not embedded in Git history; preserve a long-lived copy before expiry.

## Frozen candidate and recovery rule
Source blob `3956f0a3f62164a0ae1245beb0c0f07e034e60cb`, consumer `f3e6866f90f282f19a347bc6c2ffd288f43585d0`, workflow `e465c0429a22f3ef1fa48c058403dfbe091998da`. Preregister [R2](P3_AUX_HARDY_G16_D1A_R2_PREREG_PREFLIGHT_COMMENT_GUARD_2026_11_15.md) before any replacement. Change **only** preflight so the `originalHardyY` exclusion applies to actual source code after the sole comment, not to that comment. Freeze both Lean files, all source/donor/G15/D0 hashes and the toolchain, warnings and resource budgets. A fresh R2 strict build, native consumer and independent artifact audit remain required. G15 is last accepted full gate; G16 D0 remains accepted diagnostic only.
