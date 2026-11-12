# P3-D4 qualified; P3-D5A source-exact Hilbert columns pre-gate (2026-11-12)

**Branch:** `integration/bfss-unified-research-20261108`. **Status:** D4 GREEN, D5A CANDIDATE pending its own strict green.

## D4 acceptance

- Run: https://github.com/etblink/math/actions/runs/43302095754
- Exact tested commit: `247c8a2ecc4538555eaf5493093b5620537ccd26`, attempt 1, result completed/success.
- Cold build and independent consumer passed all 65 pins in Lean 4.34.1 with Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Qualified source `P3D4OriginalFockCrossPairingColumns.lean`, Git blob `a645bd50b11324f218b76ad4bc07c20b320d4a01`; independent consumer `ed25e8f07d4d4438285e9ea03df0c380260137fd`.
- The two original-Fock theorems `originalFockTrace_star_mul_eq_sum_cross` and `originalFockTracePairing_eq_sum_columns` printed only `propext`, `Classical.choice`, `Quot.sound`; verified by strict gate.
- Evidence artifact `13983296629`, SHA-256 `8c12672637d6ef046cbdb61c0905ca760b052922aa5905f327115f746ae8eef7`.
- Prior reds #43298557973 and #43298762479 were workflow-only (stale consumer-import assertion; stale D3 cold-build target). Their preserved memos are immutable; no new mathematical D4 source edits were necessary.

## Bounded D5A candidate contract

- Define an **exact linear equivalence** from the genuine original source `Fermion 2 →L[ℂ] Fermion 2` into `PiLp 2 (fun _ : ι => Fermion 2)`, using the accepted D3 columns plus pinned Mathlib `WithLp.linearEquiv`.
- Prove the column values are `T (b i)`, and the source OP1A/D4 original trace-star pairing exactly equals `PiLp.inner_apply` of finite Hilbert columns.
- Independent consumer tests exact original source evaluations, inverse reconstruction, and arbitrary cross pairing, with a separate import.
- Reuse the full **65 previous pinned blobs byte-identically**, append only D5A source and consumer blobs (67 total). New workflow cold-build target, output olean, source-path and consumer-import correspond exactly. Retain artifacts, allowed-axiom gate, Lean 4.34.1 and pinned Mathlib.
- No `InnerProductSpace` instance on the **operator-norm** endomorphism type: it is NOT the HS norm, and a silent norm change would invalidate the source. This gate gives inner-product preservation into Hilbert columns algebraically, NOT an isometric equivalence from the original operator-norm carrier.
- Next analytic work after D5A green: identify separately named HS operator carrier if required, finite product `L²` exchange using pinned `MeasureTheory.memLp_piLp_iff`, then actual SU2 left-output gauge fixed subspace and original closed-Hamiltonian graph/form transport. No spectral existence claim.

**First-error protocol:** on RED first distinguish blob preflight, Lake dependency closure, Lean definition/type error, consumer warning, or axiom report before changing mathematics; never broaden recursion or heartbeat.
