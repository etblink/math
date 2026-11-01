# F10T acceptance, F10U negative central SO48 image candidate — 2026-11-01

**Branch:** research/fcp-k1d17-ancestor-cache-pilot-20261028. **Parent HEAD:** 01427cd704b8be245b28ab67fed6be69b481b31a.

## F10T accepted, source-exact

[Run #41306177061](https://github.com/etblink/math/actions/runs/41306177061) completed success at SHA 01427cd704b8be245b28ab67fed6be69b481b31a (attempt 1). Original gamma / K1D9 method pinned; Lean v4.34.1 and Mathlib rev d13f23b723b8a846827a245b89c10fc7d3f11612 pinned; accepted F10S rebuilt, F10T compiled with warnings as errors, and all four independently elaborated exact declaration types and axiom whitelists passed. Audit token: V10H_F10T_FOUR_SOURCE_SPIN9_CENTRAL_TYPES_AXIOMS_PASS. Allowed root axioms: propext, Classical.choice, Quot.sound, no sorryAx.

Evidence: [F10T artifact #13083691621](https://github.com/etblink/math/actions/runs/41306177061/artifacts/13083691621), ZIP SHA256 2a843b796fec94f56152cc2bc7369bb0d7632cf510b17ea738f4042a0de7c2cb.

Accepted declarations: source9_neg_one_mem_of_unitVector, source9_neg_one_mem, source9NegativeCentral, source9NegativeCentral_coe. The actual nine-dimensional quadratic form and Mathlib source Spin9 group are used; original 48-dimensional Spin48 membership is NOT substituted.

## F10U: CANDIDATE pending its own strict gate

Use accepted F10S conditional negative-scalar original SO48 action with accepted F10T actual source negative central member. Four bounded source-exact interfaces:
1. source9NegativeCentral_originalPairedSO48_image: original 48-label matrix is exactly negative identity.
2. source9NegativeCentral_originalPairedSO48_image_ne_one: source SO48 group element is nontrivial, witnessed by the actual original paired diagonal coordinate.
3. source9NegativeCentral_not_mem_originalPairedSO48_ker: witness is not in the kernel of the genuine source Spin9 → SO48 MonoidHom.
4. source9NegativeCentral_ne_one: the actual source Spin9 negative central element is not group identity.

Scope: an explicit non-kernel element, **not** a full source Spin9 kernel classification, faithful action, continuous map, Spin48 lift, topological covering, Fock implementation, gauge intertwiner, or BFSS spectrum. Original G1A paired label order is immutable. F10S Gate 1 red is preserved historically.

Gate requirements: exact source pins, Lean v4.34.1 / pinned Mathlib, no limit increases, warning-as-error fresh compile, four independent proposition type elaborations, declaration root-axiom whitelist, immutable SHA and compiler audit artifact. Never claim accepted before green. No main merge or upstream PR.
