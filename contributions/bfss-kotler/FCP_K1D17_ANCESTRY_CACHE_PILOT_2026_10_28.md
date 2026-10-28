# BFSS K1D17 — accepted-ancestry cache qualification pilot

**STATUS: PILOT NOT YET EMPIRICALLY QUALIFIED.** This is an owner research workflow experiment, **not** a new mathematical theorem or a replacement for source-exact strict qualification. Base owner checkpoint: `research/fcp-k1d17-isometry-laws-20261028@10848c058a5bf0c0f3ca7b554289089ef937ecdb`, after independent K1D17 acceptance. No change to `main` or upstream.

## Why run this pilot

[Accepted K1D17 strict run #40649929983](https://github.com/etblink/math/actions/runs/40649929983) (job `122687372133`) took **13m58s** elapsed and freshly rebuilt all 78 ancestor roots plus three K1D17 roots. This exact gate compiles **37** source modules holding 81 declarations; the program's wider tally of 64 qualified contributor modules must not be conflated with this 37-module cache closure. Toolchain bootstrap / Mathlib cache download and repeated ancestor compilation both contribute; there are no measured warm-cache savings yet.

## Historical FCP lessons reused

FCP successful gates restored previously qualified `.olean` files under keys pinned to source ancestry and the immutable Lean/Mathlib environment, validated nonempty prerequisite objects, exact source identity, root names/types and permitted axioms, then compiled the new target freshly. Cache paths must match byte-for-byte between restore and save; omitted parent objects cause false cache misses. Historical failures include sibling-branch cache invisibility, missing transitive `.olean` imports, disk exhaustion during large restores, and pre-compiler TLS failures. The cache is a performance aid, not an acceptance decision.

## Bounded implementation under test

- Owner branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
- Workflow: `.github/workflows/bfss-kotler-k1d17-qualified-ancestor-cache-pilot.yml`, pinned cache action `actions/cache/restore` and `actions/cache/save` at `0400d5f644dc74513175e3cd8d07132dd4860809` (v4.2.4).
- Auditor: `contributions/bfss-kotler/tools/qualify_fcp_k1d17_cached_ancestry.py`, exact Git blob `ca97ad005f75fc270942d034772871471933c7b3`.
- Cache key: `bfss-fcp-k1d17-source-accepted-ancestors-v1-389ecdcc-lean4341-d13f23b-Linux-X64` on a matching runner; exact workflow expression also keys by `runner.os` and `runner.arch`. No prefix restore keys. Restrict to this specific source-qualified K1D17 checkpoint and exact branch.
- Identical restore/save path: `lean/.lake/build/lib/lean/OAI` (compiled owner source imports/objects plus JSON receipt inside the same tree). Cache deliberately does **not** include enormous Mathlib dependency archives or replace `lake exe cache get`.
- On **cold miss**: independently rebuild all 22 original ancestry modules, K1D3–K1D4, and K1D5–K1D17, using all their preexisting strict source-hash/axiom validators. Inspect every source hash, receipt, 37 nonempty `.olean` objects, 81 declaration roots, and rerun an 81-root source-type/axiom import audit. Seal a manifest with the exact object SHA-256 hashes, source blob hashes, root axiom lists, pinned toolchain, Mathlib SHA, OS/architecture, branch, source-accepted SHA and seed run ID. **Save only if every cold step, verifier and seal succeeded**.
- On **warm exact hit**: independently verify all source blob identities including the frozen manifest and accepted verifier chain; verify exact Lean 4.34.1/Mathlib revision, 37 nonempty cached objects and their SHA-256 against the cache's sealed receipt; run fresh `#print axioms` and `#check @` on all **81** accepted names; require unchanged root lists, permitted axioms only, and zero `sorryAx` or Lean source errors. If the receipt is absent, corrupt, altered, mismatched or any proof fails, **fail closed**, do not count the cache. This audit imports cached objects and is not claimed to be a new source recompile.
- On **future theorem gates**, still compile every new declaration freshly warning-as-error, generate nonempty new `.olean` and compare full root types and declaration-level axiom reports; never accept a theorem from a cache hit alone.

## Important limitations and safety boundaries

GitHub Actions cache access is **branch-scoped**. A cache created here is not guaranteed restorable on a sibling K1D18 research branch, even with the same key. Do not restructure branch policy or claim cross-branch savings until a cold/warm same-branch test has succeeded and the desired reuse path has been verified. Do not modify public `main` just to share caches.

The sealed SHA-256 manifest checks internal cache consistency, **not an independent cryptographic attestation** against a malicious writer able to poison a GitHub cache on the same trusted branch/key. Its trust boundary is the owner-controlled, source-pinned successful GitHub Actions cold build, plus strict warm verification. Keep branch write access limited and do not consume untrusted PR caches.

If the cache is too large or restoration slower than ancestor recompilation, reject it as a performance optimization while preserving the benchmark. If saving fails due to GitHub cache limits, preserve the red infrastructure finding rather than weakening mathematical checks. Large Mathlib/Lean cache remains a separate, later disk-space-controlled experiment.

## Acceptance and benchmarking plan

1. **Cold run** on the new branch must show `FCP_CACHE_PILOT_COLD_STRICT_RECEIPTS_PASS modules=37 roots=81`, `FCP_CACHE_PILOT_COLD_SEAL_PASS modules=37 roots=81` and a successful cache-save confirmation. Preserve all source/compiler/axiom logs, exact workflow tested SHA, emitted artifact and elapsed time.
2. Trigger a **second identical-workflow run on the same branch** after the first completes successfully; require the exact cache hit, `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`, all root types/axioms and cache receipt hash checks. Compare cold/warm elapsed and step times. No new mathematical roots are added by either pilot run.
3. Decide whether to adopt, refine or reject cache use for subsequent strict source gates based on demonstrated savings and the actual branch visibility model. Retain a fresh cold-build qualification gate for provenance and after any accepted source/pin changes.

Owner procedural directive also remains: **explicit typed / structure-field bridges before any raised Lean elaboration limits**. Nothing in this cache pilot changes that rule or admits determinant +1, an SO(48) target, image surjectivity, covering, global Spin(9) or BFSS spectral claims.
