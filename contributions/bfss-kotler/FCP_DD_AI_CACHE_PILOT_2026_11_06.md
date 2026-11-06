# Accepted DD/AI ancestry cache pilot — 2026-11-06

Status: implemented; cold seed and warm trial pending. No new theorem roots.

The owner requests safe acceleration after [strict DP run 42209582510](https://github.com/etblink/math/actions/runs/42209582510), tested SHA `3522c86af4900f53d646ffc9042359684f7ce90f`, job `127864610712`, 14m05s. Its logs show approximately 4m13s environment restoration, 6m33s DD/AI ancestry rebuilding, 2m20s twelve fresh parent phases, and 24s DP source/audit. These are one-run observations, not predicted warm performance.

## Prior evidence and decision

Read the existing [K1D17 pilot](FCP_K1D17_ANCESTRY_CACHE_PILOT_2026_10_28.md), its sealed-cache verifier, warm K1D18A workflow, subsequent accepted A–I same-branch use, [dependency sizing rejection](FCP_PINNED_LEAN_MATHLIB_CACHE_SIZE_DECISION_2026_10_28.md), and the FCP evergreen at `cc608e2282e1b32bb11bbb64424e4775b28138e2` (blob `f5b53f680e7b3c119491be01306a33d83586bd9a`).

Retain the small accepted-object pattern: exact source/environment identity, complete transitive import closure, sealed object hashes, fresh import/root checks, and fresh new-target compilation. Preserve identical save/restore path contracts and same-branch visibility. Do not reuse the old 37-module cache key for a different closure. Do not cache the 12.09-GB toolchain/packages environment; Mathlib continues using its existing upstream cache. A missing cache must not force an infrastructure red when the original cold route is available.

## Frozen scope

The [manifest](FCP_DD_AI_CACHE_MANIFEST_V1.json) captures all 175 local OAI source modules reachable from the existing DD/AI Lake targets, plus 666 fully qualified declaration names and their actual permitted-axiom reports extracted from the successful DP job. Every source hash and every printed-root suffix/count was independently matched to the repository. The original source, proof bodies, dependency configuration, and accepted mathematical scope are unchanged.

Only these 175 `.olean` files are cached. They are legacy Lean modules without `module` headers, whose imports consume the ordinary `.olean`; no C output, Lake trace, compiler, package tree, candidate object, audit result, or parent object outside this closure is cached. In particular, DE–DJ and DK–DP remain fresh. AI belongs to the closure but its existing later fresh parent compilation also remains unconditional.

Pin the complete toolchain file, Lake manifest and lakefile, original DD consumer audit, each transitive source blob, actual Lean 4.34.1 runtime, every installed git dependency HEAD (including Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`), Linux/X64, repository, and owner research branch. The manifest and verifier bytes enter the exact cache key. No prefix restore keys are allowed.

The identical cache save/restore path is `lean/.lake/bfss-dd-ai-cache-v1`. The bundle has a separate `objects` tree and JSON receipt recording all object sizes/SHA-256 hashes, manifest/verifier hashes, compiler output, platform, branch, accepted baseline run/SHA, and cold seed run/SHA. The uncompressed object payload must not exceed 128 MiB. Missing, extra, empty, linked, changed or mismatched entries fail closed before installation. Restored files are checked before copying into an empty active OAI build tree.

## Cold and warm controls

On a miss, execute the original two-target Lake build with the original timeout and propagated exit status. Preserve its full log and compare all 666 reports with the frozen successful inventory. Freshly import all 175 modules, run `#check @` and `#print axioms` for every named root under explicit autoImplicit=false and warnings-as-errors, and freshly compile the unchanged full DD independent consumer audit. Require exact names/axiom sets, permitted axioms only, no sorryAx or Lean diagnostics, and nonempty objects. Stage and seal only this accepted ancestor bundle.

On an exact hit, validate all source and environment identities and the complete sealed file inventory before installation. Then perform the same fresh 666-root import check and full DD consumer audit. This is imported accepted-object revalidation, **not** fresh source compilation and not independent rechecking of every serialized proof term.

Both paths then execute all twelve existing fresh DE/DF/DG/DH/DI/DJ/AI/DK/DL/DM/DN/DO phases, fresh DP compilation, and full DP independent consumer audit without changes. All 133 existing pins, 105 parent reports, 24 DP source reports, 135 DP consumer examples, 24 DP audit reports, axiom whitelists, diagnostic guards, compiler flags, timeouts and retained evidence remain. Only the workflow's shell-block census changes from 17 to 20 to account for added infrastructure blocks; its fourteen embedded Python validators remain.

Save only after the entire strict gate passes. A failed candidate or audit cannot publish a new bundle. The saved staging bundle is separate from the active build tree, so later fresh compilations cannot modify it. Ordinary misses use the cold route; corrupt hits stop, preserve diagnostics, and are not silently accepted or resealed. Manual workflow input `cold_build=true` bypasses both restore and save for future cold provenance checks.

This retains the old trust boundary: owner-controlled successful GitHub Actions cold builds and trusted branch writers. A self-contained receipt is an integrity check, not a cryptographic signature against a malicious writer able to replace both bytes and receipt. No untrusted PR event is consumed, no new mathematical acceptance arises from a hit, and no default branch, FCP, or upstream publication is changed.

## Local validation and acceptance rule

All source closure hashes and all 133 original pins pass. YAML parsing, every shell block through bash -n, all fourteen embedded Python programs through ast.parse, executed original syntax/scope preflight, and replay of the 666 successful ancestry reports pass. All fourteen original fresh parent/candidate/independent-audit step objects are byte-identical to the accepted workflow. Eleven adversarial structural tests pass, covering consistent receipt, same-size corruption, missing/extra/empty objects, symlinks, oversized payload, wrong environment/provenance/source pin, and missing/duplicate/unapproved/recovery reports. Fixture bytes are not Lean evidence. No local Lean compiler is available; real cold/warm compilation remains decisive.

The cold run must finish green, print `DD_AI_CACHE_COLD_SEAL_PASS` and `DD_AI_CACHE_FRESH_IMPORT_AUDIT_PASS modules=175 roots=666`, retain all original strict results, report measured payload size, and successfully save its exact key. The second identical-key same-branch run must finish green, show an exact hit and `DD_AI_CACHE_WARM_REVALIDATION_PASS`, freshly repeat all required audits and candidate phases, and preserve receipts/logs. Compare elapsed and step times before claiming savings. If performance does not improve, retain the evidence and remove adoption of the cache. Original DP theorem acceptance remains tied to run 42209582510 regardless of the pilot outcome.
