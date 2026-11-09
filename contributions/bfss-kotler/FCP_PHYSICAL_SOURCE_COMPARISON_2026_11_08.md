# FCP physical-domain source crosswalk — November 8, 2026

**Compared source:** `etblink/Foundational-Convergence-Program@beeb331836bb13a92c275f06f61337a6b97c0ada`
**Unified baseline:** `etblink/math@8ba20e2a1cb870523bbb00b986bb249187045795`

This report compares `507` FCP physical-domain Lean files against the two Kotler Lean source directories on the integration branch. 176 source filenames were not present, 330 matched a different Git blob, and 1 matched byte-for-byte. See `FCP_PHYSICAL_SOURCE_CROSSWALK_2026_11_08.json` for exact source blobs, destination paths and families.

**Do not conflate blob difference with mathematical difference.** The upstream import process rewrites imports, and at least one sampled Hamiltonian proof also changes a local instance declaration. Even a byte-identical source has to pass current dependency and consumer checks before mathematical acceptance in the unified tree.

**Highest-value unported original paths for the current Fock/Spin/physical-form problem:**
- S3A–S3I: original gamma plane rotations, Majorana CAR commutators, Fock-plane generator skewness, gauge-compatible finite flows.
- S3K0–S3K1: true source full-L² action and gauge-physical-space preservation.
- S3L0–S3L5: original source charge covariance and kinetic/cubic transport (large dependency family; do not bulk-port without building an import closure).
- S1/S1V52: original Spin(48) and color-gauge antecedents.
- D2B29: positive closed-form trial vector, explicitly **not** a positive eigenvalue theorem.

**Immediate reusable technique:** Compare original S3C source commutator against the later F1A theorem on literal original CAR carriers; reuse S3F adjoint reversal and finite-sum proof shapes for F1B, but do not assume equivalent declarations or gate status. Audit exact closed physical-domain interfaces before importing S3K/S3L.

No module imported automatically into the active Lean build. No old branch, historical proof, or workflow is modified by this report.
