# BFSS M4 QTC0D R1 — thin original Fock tensor adapter pre-gate contract

Date: 2026-11-16 Pacific. **PRE-GATE CONTRACT, NOT A QUALIFIED ORIGINAL-SOURCE THEOREM.** Only branch `integration/bfss-unified-research-20261108`. `main` is out of scope.

## Qualified inputs

- **QTC0A** strict [#44001621836](https://github.com/etblink/math/actions/runs/44001621836), accepted source blob `b0b519e46566856e100bf6aa882f9fcdf37d397e`: exact conditional original Fock weighted quadratic Leibniz expansion on `Fermion 2 →L[ℂ] Fermion 2`, normalization `1/4`.
- **QTC0C** strict [#44016807302](https://github.com/etblink/math/actions/runs/44016807302), accepted source blob `9448c9a47c605cb6aba2cfc798ae28a0213c9411`: three source and three independent consumer standard-only roots establishing abstract ordered-word coefficient identity `Σa[p,i]b[i,j]•w[p,j]+Σb[i,j]a[p,j]•w[i,p]=Σ(ab+baᵀ)[r,s]•w[r,s]` for arbitrary complex module. Original provider exact artifact #14299581585, SHA-256 `1a95148f7dc41086683592b670257734c7726f0fff0929e4b59930a65ffefa0e`, archived with full job log.
- Stopped direct original Fock **QTC0B R1** [#44012367725](https://github.com/etblink/math/actions/runs/44012367725) and **R2** [#44014529416](https://github.com/etblink/math/actions/runs/44014529416) remain RED. Never import QTC0B as a donor, reuse its unproved theorems, edit its historical blobs, or launch an unchanged QTC0B R3.

## One bounded adapter

On actual `Op := Fermion 2 →L[ℂ] Fermion 2` and `w i j := x i * x j`:

1. A **left local scalar/product adapter** only changes `Σ_{i,j} b_{ij}•((Σ_p a_{pi}•x_p)*x_j)` into `Σ_{i,j,p} (a_{pi}b_{ij})•(x_p*x_j)`. The local manipulations `Finset.sum_mul`, `Finset.smul_sum`, `smul_mul_assoc`, `smul_smul`, and typed coefficient-only `congrArg` already compiled without complaint in the R2 source.
2. A **right local scalar/product adapter** changes `Σ_{i,j} b_{ij}•(x_i*(Σ_p a_{pj}•x_p))` into `Σ_{i,j,p} (b_{ij}a_{pj})•(x_i*x_p)`. The prior R2 source's local `Finset.mul_sum`, `Finset.smul_sum`, `mul_smul_comm` and `smul_smul` steps compiled.
3. Apply the **already-qualified QTC0C** combined coefficient theorem *once* at `w i j = x_i*x_j`. This replaces BOTH failed direct matrix reindexing and the failed `add_smul` rewriting from QTC0B. No `Matrix.transpose_apply` or global `rw [mul_comm]` on Fock expressions.
4. Apply existing QTC0A `originalFock_quadratic_covariance_expanded`; retain the factor `(1/4:ℂ)•` and all original ordered products untouched. Main proposed root: `[T,Q_x(b)] = Q_x(ab+b a.transpose)` under an **explicit hcov** assumed for generator commutators. Second skew-a corollary requires only `a.transpose=-a` and gives `Q_x(ab-ba)` for arbitrary b.

## Verification and no-claim boundary

Two source roots, two separately importing consumer roots, Fin0/1/2/3 and nonskew E00 checks (seven total), standard-only printed axiom reports, strict source cold build, independent consumer, pinned Lean 4.34.1 and Mathlib `d13f23b7...`, negative auditor fixtures, original provider ZIP preservation on green OR red. Strict workflow pins QTC0A and QTC0C source, consumer, manifests, and original ZIPs plus stopped QTC0B red ZIPs. New source may NOT import the stopped QTC0B. No new axioms, `sorry`, `admit`, `unsafe`, resource increases, non-source coefficient-basis substitution, or edits to accepted proof files.

If source fails, preserve exact first cause, tested commit and provider-original artifact before any revision. Two analogous source failures trigger a new architecture review; no unbounded retries. **No QTC0D acceptance until strict GREEN and independent artifact rehash, six roots are not required (two+two only), consumer and source both qualified.**

QTC0D remains **conditional original Fock quadratic covariance**, not the original real-source `K(A)` implementer nor a complete `so(48)` bracket. QTC1 real/complex source normalization, QTC2 exact source-`K(A)` commutator, physical-domain Spin(9), Hamiltonian symmetry, and fixed-positive-regulator BFSS Hardy/resolvent/ground-state fidelity remain unproved.
