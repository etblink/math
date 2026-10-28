# FCP BFSS — pinned Lean and Mathlib dependency-cache sizing decision

**2026-10-28 · PROJECT LEAD DECISION: DO NOT SEED AN ENTIRE DEPENDENCY CACHE.**

This is an evidence-backed **negative optimization decision**, not a theorem, axiom qualification, change to the accepted source ancestry or a failure of formal mathematics. Existing owner proof workflows remain unchanged.

## Provenance and method

- Owner repository: `etblink/math`.
- Source/cached-proof research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
- Immutable measurement workflow commit: `0c6d2e52431cda761cf1b8c66be8cf54ee018bd9`.
- [Green Actions run #40657131188](https://github.com/etblink/math/actions/runs/40657131188), job `122710796678`; terminal `completed/success`.
- Measurement workflow: `.github/workflows/bfss-kotler-pinned-dependency-size-only-diagnostic.yml`.
- Source locks: Lean `leanprover/lean4:v4.34.1`; Mathlib exact SHA `d13f23b723b8a846827a245b89c10fc7d3f11612`; 42 entries in the owner's Lake manifest.
- The normal, uncached setup was executed, including `lake exe cache get`; the diagnostic used `du -s -B1` for real occupied file-system bytes and `du -sb` for apparent logical file bytes.
- **No GitHub Actions dependency cache was saved, restored, overwritten, or even provisioned in this diagnostic**. No new mathematical declarations were made or accepted. The tiny previously qualified K1D17 81-root source ancestry cache was untouched.

## Measured result

| Candidate directory or component | Physical occupied bytes | Apparent bytes | Notes |
| --- | ---: | ---: | --- |
| `~/.elan/toolchains/leanprover--lean4---v4.34.1` | 3,114,196,992 | 3,068,313,612 | Pinned compiler toolchain |
| `~/.elan` entire directory | 3,127,681,024 | 3,081,766,558 | Contains toolchain; not additive |
| `lean/.lake/packages` all | 8,978,558,976 | 8,442,229,148 | 42 locked packages; may contain caches and source |
| `lean/.lake/packages/mathlib` | 7,765,274,624 | 7,312,825,073 | Subset of all packages |
| `lean/.lake/packages/mathlib/.lake/build/lib` | 6,508,859,392 | 6,137,756,306 | Subset of Mathlib; mainly compiled objects |
| `lean/.lake/packages/mathlib/.lake/build` | 7,114,620,928 | 6,687,655,740 | Subset of Mathlib; includes compiled lib |
| Owner `lean/.lake/build/lib/lean/OAI` | not present in this run | — | Expected: no owner source cache was restored |
| **Pinned toolchain + all Lake packages** | **12,092,755,968** | **11,510,542,760** | Sum of disjoint directories; approximately **12.09 GB / 11.26 GiB physical** |

These are **uncompressed disk-occupancy** figures, **not** zstd compressed GitHub Actions archives; no compression-ratio or restoration-speed claim follows. The Mathlib paths are nested and must not be added to the total again.

The diagnostic printed `DEPENDENCY_DIAGNOSTIC_LAKE_CACHE_GET_SECONDS 177`. That timer encompasses the `lake exe cache get` invocation, including any on-demand pinned Lean toolchain installation and dependency operations invoked by Lake; it is not a separate measurement of Mathlib-only network transfer. `DEPENDENCY_DIAGNOSTIC_ELAN_BOOTSTRAP_SECONDS 0` covers only the initial elan bootstrap script, **not** Lean's subsequent toolchain installation. In the log, toolchain download started after Lake was invoked. The complete Actions run spanned approximately 7 minutes 15 seconds, including other runner and checkout stages.

## Negative optimization decision

**Do not use `actions/cache` to save entire `~/.elan`, entire `lean/.lake/packages`, or the whole `.lake` tree.** Even Mathlib's compiled library directory alone occupies 6.51 GB physically. GitHub's default repository cache allocation is 10 GB, with cache eviction, and is unrelated to the much smaller accepted source ancestry cache. The effective compressed archive size and warm restore duration remain unmeasured. Seeding a possibly gigantic archive merely to learn whether it helps would be a risky, costly experiment, not a sound optimization.

Mathlib **already has a source-hashed upstream binary cache**, fetched via `lake exe cache get`; a second cache is useful only if its trusted cache restoration can actually outperform this existing route while preserving exact compiler, Mathlib and all transitive dependency identities. The existing K1D17 37-module/81-root sealed-object cache has already demonstrated exact-key warm source-axiom revalidation and is therefore retained.

A smaller targeted future pilot may become reasonable only after a separate, cheap design review identifies a specific **small** reproducible component with clear size limits and measures a projected benefit. Candidates could include precisely pinned compiler archives or narrowly selected dependent objects, but none has been qualified for caching here. Do not alter source hash pins, admitted axiom lists, warning-as-error compiler checks, independent proof compilation, branch trust boundaries, or external publication restrictions to accommodate an optimization.

## Outcome and successor instruction

**Accepted facts:** size-only CI successful, dependency footprint quantified, source-cache path left intact.

**Rejected experiment for now:** entire environment save/restore pilot.

**Research accounting:** zero new theorem roots, zero changes to accepted source and proofs, no `main` merge, no community upstream PR.

Preserve this as actionable negative knowledge: **measure cache storage and branch access before introducing an optimization**. Prefer continuing the formal mathematical research over repeated multigigabyte cache experiments absent evidence they will pay for themselves.
