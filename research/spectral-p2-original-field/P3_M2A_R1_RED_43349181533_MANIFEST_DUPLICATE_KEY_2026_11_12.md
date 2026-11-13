# P3-M2A strict R1 first causal RED — duplicated manifest paths
**Date:** 2026-11-12 Pacific / CI 2026-11-13 UTC
**Status:** RED / UNQUALIFIED, no M2A Lean theorem tested.
**Exact run:** https://github.com/etblink/math/actions/runs/43349181533 (attempt 1)
**Tested SHA:** `979c0573cb1b908cd8365ecfde28887dc89b8b2a`
**Job:** `131635780370`, artifact ID `14003566048`.

The strict workflow failed at the first **81-pin preflight** with `AssertionError: 79`. The 81 textual `pins={...}` entries were parsed by Python as only 79 unique dictionary keys, because cloning the B4B workflow had renamed its two **historical accepted B4B** manifest paths to M2A paths, then appended two new M2A source/consumer blobs under the same keys. Python overwrote the original B4B entries. This is **workflow generator/provenance error**, not a source theorem failure. Lean toolchain restoration, cold build and axiom audit did not execute, so no claim about M2A proof success/failure is supported by R1.

### Bounded repair
Restore the historically accepted B4B source path `P3D5B4BOriginalFockL2ColumnEquiv.lean` with Git blob `a0243e653c21c72693dc9484c868851eee1295dc`, and original B4B consumer path with blob `fec0d06457a1d6f928401a2fe7aba0a1bcd1bb8a`; keep the two new M2A source/consumer entries `1d05f5dcd5f6df6b6bad7359f03850e2965c1b1f` and `098897960a993f87b5b6eed6275cc643940b5f0b`. Verified **81 unique pins** after replacement. **No Lean source, consumer or mathematical statement changed.** Repeat the independent strict workflow on the new SHA and record its real result; no green is inferred. M1 B4B remains accepted at its earlier exact run.
