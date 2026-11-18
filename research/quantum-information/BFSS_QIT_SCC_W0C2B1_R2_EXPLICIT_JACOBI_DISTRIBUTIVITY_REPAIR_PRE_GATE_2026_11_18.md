# BFSS × QIT × SCC — W0C2B1 R2 frozen explicit Jacobi distributivity repair

Date: 2026-11-18 Pacific. **R2 DESIGN ONLY; NOT QUALIFIED.** Unified integration branch only, `main` untouched.

## Original first causal native RED

Original strict [W0C2B1 R1 #44263755514](https://github.com/etblink/math/actions/runs/44263755514) **NATIVE SOURCE RED**, job `134663119955`, tested commit `7f60d7f305d1862434781ff75fa19ff5f4bac900`. Source-exact preflight, pinned Lean 4.34.1/Mathlib restoration PASS; original source compilation FAIL; independent consumer never executed. The first and only source error was at `P3M4W0C2B1OriginalFockJacobiCovarianceAction.lean:54:51`: `noncomm_ring` left an unsolved normalized sum in the true noncommutative Jacobi identity. Source theorem reports `originalFock_commutator_sum` and `originalFock_commutator_weighted_sum` had only accepted axioms; `originalFock_commutator_jacobi` and its dependent `originalFock_commutator_covariance_bracket` both reported `sorryAx` due the unfinished Jacobi tactic.

This is **the first native RED** in W0C2B1's new original Fock Jacobi architecture. It is not a harness RED, not an independent consumer RED, and not the older separately stopped real-coefficient W0C2B0 architecture.

R1 original mathematical Git blobs, now immutable: source `db15340dfb46eea78c20549bb6d1616dd99f302b`, importing independent consumer `76f5071b847245fe4173b0dde8205c8b69173b5d`, strict workflow `a7e7b89896f5f447ec88f0c548d222be54a5fdee`.

Original provider artifact `14409612451` is 3,658 bytes with SHA-256 `a0b6dfdd17dfdeceed8483f486e9bd98850bb187033fab457fbb1291f261d8ec`. Independent exact evidence-preservation [#44266245618](https://github.com/etblink/math/actions/runs/44266245618) **GREEN**, commit `8bf6e1d8c2992a972d6c76fbd1bc9a712f413b1a`, after verifying run/steps and downloading the original three-file ZIP, complete Actions job transcript, each ZIP member SHA-256/CRC and original source failure.

Git-pinned original negative evidence under `research/quantum-information/diagnostics/`:
- `BFSS_M4_W0C2B1_R1_44263755514_NATIVE_RED_evidence.zip` blob `98b23994b080a087d77d8317a4758a774f0f1ef2`;
- `BFSS_W0C2B1_R1_44263755514_complete_job.log` blob `5e96a9c57152a876ae5e772fcca7a462aa91ac1c`, original downloaded log 93,295 bytes SHA-256 `cce9b3383d3701982b31510d242c69f13f5572e3368c0351e148b7b48d4d17bc`;
- `BFSS_W0C2B1_R1_44263755514_NATIVE_RED_evidence_manifest.json` blob `fcc701f35202253b973c6dc1e48fe2e199554d76`.

## Exact R2 mathematical scope

Keep all four theorem statements **identical** and preserve the true original carrier `Op := Fermion 2 →L[ℂ] Fermion 2`:

1. finite-sum commutator linearity;
2. complex scalar-weighted finite-sum commutator linearity;
3. Jacobi on the original bounded noncommutative operator algebra;
4. conditional coefficient-matrix covariance Lie closure with two *explicit* covariance hypotheses.

Use distinct new files `P3M4W0C2B1OriginalFockJacobiCovarianceActionR2.lean`, `BFSSP3M4W0C2B1OriginalFockJacobiCovarianceIndependentConsumerR2.lean`. Their namespaces follow the same `R2` naming; previous R1 files remain unchanged. Reuse the original exact QTC0A, W0C2B0M and W0C2B0N qualified donor sources without modification.

Only replace the failed local Jacobi proof:

```lean
-- R1 failed
  noncomm_ring
-- R2 bounded repair
  simp only [sub_mul, mul_sub, mul_assoc]
  abel
```

This is the same distributivity, associativity, additive-normal-form architecture used successfully in accepted `P3M4LB1L2AbstractOriginalFockCovarianceLeibniz.lean`, Git blob `b4012951a26aa7573db513adab3d7ce27396db7e`. It does not assume commutativity, alter the theorem statement, or enlarge Lean resources. It remains **unproved until original strict CI passes**. The original R1 `noncomm_ring` failure is preserved as useful evidence of tactic fragility on negated original operator products.

## Strict controls and decision rule

Pin exact R2 source and consumer Git blobs, this contract, original R1 blobs and native RED archive/log/manifest, qualified 26-anchor predecessor W0C2B0N (native GREEN #44260119108, preserved #44261708018, accepted commit `814b6a6c06d2dedc190c5f3f463c633a1a79da1a`, post-acceptance roadmap #44262068152 GREEN), qualified W0C2B0M, QTC0A and LB1L2. Keep original Source48 skew K(A) LB1C1 and W0C2A donor provenance immutable.

R2 must run a new isolated strict workflow with true original `Fermion 2` source cold Lean build, 4 source axiom reports, 4 independently importing consumer reports, 4 original-carrier controls, 6 negative auditor mutants, `-DwarningAsError=true`, and only accepted `propext, Classical.choice, Quot.sound` axioms. No `sorry`, `admit`, artificial alternative model, warning suppressions, larger recursion/heartbeat limits, or new source identities. Workflow output must include original provider ZIP artifact for both GREEN and RED.

On original strict GREEN, independently preserve the exact provider ZIP + full Actions log + per-member SHA-256/CRC in Git, then promote 27th accepted anchor and require independent post-acceptance roadmap GREEN. If another **comparable native source RED** occurs, preserve it and STOP this precise architecture at two native failures; redesign rather than attempt unchanged R3. Harness-only/preflight failure is classified separately and does not advance the mathematical stop count.

## Claim ceiling

This gate concerns purely algebraic original Fock commutator/Jacobi and conditional covariance, not proof of original gamma centrality or unconditional `[K(A),K(B)]=K(AB-BA)`. The all-48 Majorana defect-centrality source join `W0C2B2` is **PROSPECTIVE_NOT_STAGED**. Spin(9) group action, physical gauge/parity observables, ground state, spectral gap, mass gap and SCC operational capacity remain unproved.
