# BFSS M4 — source gamma incidence normalizer, exact finite rank 39

**Date:** 2026-11-16 Pacific. **Single branch:** `integration/bfss-unified-research-20261108`. **Status:** finite source-gamma-*entry* calculation independently recomputes the canonical 39-dimensional normalizer. It is NOT a source-qualified Lean theorem, full physical Hamiltonian stabilizer, or global Fock-vector Spin(9) action.

## Source provenance and new experiment

I inspected literal [`SU2RealGammaProbe.lean`](https://github.com/etblink/math/blob/integration/bfss-unified-research-20261108/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean), exact Git blob **`b9b8192055c70f0d001d7982669b9823c55562ed`**, containing `FCP.BFSSGamma9.perm`, `sign`, and `gammaInt`:
```text
gammaInt a i j = if perm a i = j then sign a i else 0.
```
These are the nine signed-permutation `16×16` real source gamma matrices described by source four-factor words `JIIJ, JIJX, JXJZ, JZJZ, JJIZ, JJXX, JJZX, XIII, ZIII`. I transcribed their nine literal `perm` and `sign` rows into [the source-gamma rank probe](BFSS_M4_incidencenormalizer_source_gamma_rank_probe_2026_11_16.py), independently of the [octonionic canonical control](BFSS_M4_incidencenormalizer_canonical_rank_probe_2026_11_16.py). The matrices passed the exact integer Clifford anticommutator `γ_iγ_j+γ_jγ_i=2δ_ij I_16` and symmetry checks.

Form the same 27 skew matrices `Y_{Ia}=γ_I⊗L_a` with the standard integer `ε_{abc}` color adjoint matrices, and compute the exact integer normalizer constraint `M=stack_i[(16I-U^TU) ad(Y_i)]` in the 1,128 real skew coordinates. `UU^T=16I_27`.

| Exact finite check | Value |
| --- | ---: |
| `M` rows × columns | 30,456 × 1,128 |
| `rank(G=M^TM) mod 97` | 1,089 |
| `rank(G) mod 101` | 1,089 |
| `rank(G) mod 103` | 1,089 |
| `rank(G) mod 1009` | 1,089 |
| 36 source `γ_iγ_j⊗I_3` plus 3 `I_16⊗L_a` | 39 independent directions |
| Exact `M Z` | Zero |
| Real infinitesimal normalizer nullity | 39 |

The modular lower bound on rational rank and the 39 exact independent real kernel generators imply rank exactly 1,089, nullity 39. This source-gamma entry result agrees with the independent octonionic control. No floating eigenvalue threshold or assumption of a source/canonical change-of-basis matrix is needed for this *matrix-span* dimension count.

## Still-open physical/source interface

- The gamma entries are **literally transcribed** from the named Lean source blob, but this Python experiment does **not** check compiled `AlgebraData 2` against a frozen native consumer, or prove the *original* `Source48Label` reindexing through `pairedColorSpinEquiv`. Because a simultaneous basis permutation preserves the Lie-normalizer dimension, color-major versus paired-index order is not a dimensional obstruction; the actual index transport remains an explicit source theorem obligation.
- The result classifies the infinitesimal normalizer of the 27-dimensional Yukawa coupling *span*, **not** all BFSS Hamiltonian symmetries. Preserve constraints from the nine bosonic kinetic fields, quartic potential, SU(2) Gauss law, original charge domains and supercharges. It neither generates 1,128 conserved charges nor proves the ambient Spin(48) symmetry is physical.
- Scientific next step: verify the 27 matrices are literally the original BFSS `gamma × epsilon` interaction coefficients with matching index/sign orientation, then formulate the full boson-fermion coupled stabilizer and independent source-exact Lean acceptance gate. Keep `M4-LB1C1` as immediate proof priority; do not promote this experiment ahead of its strict native proof.
