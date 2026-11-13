# P3 auxiliary radial sixteen-charge operator — source-exact research contract

**Date:** 2026-11-13 Pacific. **Owner:** BFSS Project Lead. **Classification:** RESEARCH ONLY / NO NEW LEAN QUALIFICATION / CANDIDATE-NEUTRAL.
**Branch:** `integration/bfss-unified-research-20261108`; last observed HEAD `04b4739f9a92effc5603314f2b0fac54ce50c17e`.
**Last qualified mathematical gate:** P3-M5BF0, exact strict [run #43498649514](https://github.com/etblink/math/actions/runs/43498649514), tested `f2499980b808b6c9ddf2c6093f5b88ebff8b825f`. Roadmap consistency [run #43502002575](https://github.com/etblink/math/actions/runs/43502002575) succeeded on the checkpoint commit. No M5BG0 theorem or auxiliary gate has been promoted. No `main` edits authorized here.

## 1. Scientific observation and source boundary

Michel–Scheinpflug–Yin, *99.9...% of the SU(2) BFSS ground state*, submitted 2026-11-06, [arXiv:2611.09837v1](https://arxiv.org/abs/2611.09837), use the auxiliary quadratic form
$$
q_{\mathrm{aux}}(\psi)=\frac1{16}\sum_{\alpha=1}^{16}\|R Q_\alpha\psi\|^2,
\qquad R(X)^2=\sum_{a,i} X_{ai}^2,
$$
with a positive auxiliary gap on **gauge-invariant Spin(9)-singlet states**, even though the original physical BFSS Hamiltonian has continuum extending to zero. Their coefficient `kappa=(36+8*sqrt(14))/25` and resulting fidelity estimate require their Spin(9) representation/Hardy and supersymmetry arguments, not merely closedness.

Do not equate the paper's `Q_alpha`, radial units, closed form, complete SU(2) physical representation, or auxiliary Hamiltonian to our source *until a separate exact convention and domain crosswalk is proved*.

Current original source types:
- `Boson 2 = EuclideanSpace R (SpaceIndex × ColorIndex 2)` (27 real coefficients), `Fermion 2`, `FullL2 2` in [Core.lean](../../lean/OAI/MathematicalPhysics/BFSS/Core.lean), Git blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
- `E=pairedGaugeData.physicalSpace`, **original gauge-invariant physical** Hilbert subtype; `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)`; `T=originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData : E ->ₗ.[C] K`. Construction and closedness in [H5E8AY](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe.lean), blob `a9f27a48852ac570aedc8e0ab88d683250e6b138`. Exact graph rebased to native original source in [M5BF0](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.lean).
- `H=(1/16) T†T` with **natural adjoint-square domain**, self-adjoint and dense, accepted in [M5BE0](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BE0OriginalNativeHamiltonianPort.lean), [run #43493125150](https://github.com/etblink/math/actions/runs/43493125150).
- This document **does not** assert that `H` has a nonzero eigenstate, zero mode, positive gap, or ground-state approximation.

## 2. New abstract operator theorem — mathematical proof, NOT yet Lean-qualified

Let `T:D(T) subset E -> K` be a closed linear operator between Hilbert spaces; let `W:D(W) subset K -> K` be a closed multiplication operator by a measurable real function `w(X) >= epsilon > 0`, acting **coordinatewise on all sixteen full-L2 outputs**. Suppose its bounded everywhere-defined inverse `B=M_(1/w):K -> K` satisfies
`B(Wy)=y` on `D(W)` and `W(By)=y` for all `y in K`; in particular `Range(B) subset D(W)`.

Define the **maximal composition**
$$
D(S)=\{u\in D(T):Tu\in D(W)\},\qquad Su=W(Tu).
$$

**Proposed abstract result:** `S` is closed and `ker S=ker T` (no boundedness-above requirement for `w`).

Proof obligation in the native graph: if `u_n -> u` and `Su_n -> z`, boundedness of `B` gives `Tu_n = BSu_n -> Bz`. Closedness of `T` yields `u in D(T), Tu=Bz`. The right-inverse identity `W(Bz)=z` yields `Tu in D(W)` and `Su=z`. The kernel equality uses `WTu=0 iff Tu=0` and `0 in D(W)`.

**Important:** This argument *needs the actual right-inverse and multiplier domain identities*, not only the inequality `w>=epsilon` written informally. These identities are standard for full-L2 multiplication by `w` but are **not yet instantiated in the source's actual `PiLp` output type**.

## 3. Density bridge discovered in original source — substantial reuse

There is a stronger existing theorem chain than merely `Dense D(T)`:

1. [D2B10C](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe.lean), blob `7b116f1efa2dd62cc5188b3ff2d2cf38ecd7bd9a`, proves `G.coreNormClosure = G.physicalSpace` at `N=2` via **source Haar average**, not an assumed gauge representation.
2. [H5E8AZ](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8AZOriginalPhysicalChargeDomainDensityReductionProbe.lean), blob `b69166ba7b1118e3542ba826e73aa4f95f575c3c`, proves `originalMinimalPhysicalHilbertChargeColumn_core_mem_domain`: an original invariant `SmoothCore` element is in the *actual* physical charge-column natural domain, and identifies its graph output with the original compactly supported charge vector.
3. [H5E8BA](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BAOriginalPhysicalChargeUnconditionalDensityProbe.lean), blob `3ab254088e3fa2aea7622807b6b10e7eabc6fc8a`, joins them to prove `originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional`. [M3W0D0](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3W0D0OriginalNonzeroPhysicalChargeDomain.lean) reuses it at original paired source, strict GREEN [#43484147197](https://github.com/etblink/math/actions/runs/43484147197).
4. [Core.lean](../../lean/OAI/MathematicalPhysics/BFSS/Core.lean) defines `SmoothCore` as compactly supported smooth test functions, and `M.charge : SmoothCore N ->ₗ[C] SmoothCore N`: each supercharge **preserves compact support**.

For `w_epsilon(X)=sqrt(R(X)^2+epsilon^2)`, `epsilon>0`, local boundedness on any compact support ensures `w_epsilon M.charge_alpha f` is L2 for each original invariant smooth `f`. **Therefore the native invariant smooth core is a candidate dense subset of `D(S_epsilon)`.** The source-level obligations still to discharge are:
- Define `R` with the original source `EuclideanSpace` norm/coordinate convention, and construct `W_epsilon` on the **exact** `PiLp 2` output with correct AE equivalence classes.
- Prove source core graph output equals original `T` action in `K` and that multiplying it by `w_epsilon` is L2, using compact support of `M.charge alpha f` and finite spin index.
- Transport the already-qualified `G.coreNormClosure = G.physicalSpace` to dense `D(S_epsilon)`, rather than promoting `Dense D(T)` alone (that weaker statement by itself does *not* imply weighted-domain density).
- For correspondence to the paper, show radial multiplication is gauge- and Spin(9)-equivariant, with exact conventions and genuine Spin(9) singlet space.

The available density chain is a *source theorem and proof-reuse opportunity*. The *weighted* density theorem is **not yet proved in Lean**.

## 4. Positive regularization and domain stability

Define `R(X)=||X||` provisionally, subject to the source/paper convention audit, and
`w_epsilon(X) = sqrt(R(X)^2+epsilon^2)`.
Then `w_epsilon>=epsilon` and `1/w_epsilon` is bounded; `w_epsilon` need not be bounded above.

For every positive `epsilon`, the maximal composition domains are the **same**:
$$
D(S_\varepsilon)=D(T)\cap\{u: R T u\in K\}=:D_*,
$$
because `R <= w_epsilon <= R+epsilon` pointwise and `Tu` is already L2 on `D(T)`.
On this common domain, the corresponding closed quadratic forms satisfy exactly
$$
q_\varepsilon(u)=\tfrac1{16}\|S_\varepsilon u\|^2
=q_R(u)+\varepsilon^2 q(u),\quad
q_R(u)=\tfrac1{16}\|RTu\|^2,\quad
q(u)=\tfrac1{16}\|Tu\|^2.
$$
No source physical gap follows from `q_epsilon >= epsilon² q` because `H` itself has no assumed positive gap.

Once `D_*` is proved dense, every `S_epsilon` is densely defined and closed. Standard closed-operator Hilbert-space theory then gives a self-adjoint nonnegative `H_epsilon=(1/16) S_epsilon† S_epsilon` with `ker H_epsilon=ker S_epsilon=ker T=ker H`. The exact Lean constructors, type class instances and normalization still need source-qualified implementation.

## 5. Unregularized weight — separate mathematical milestone

At `epsilon=0`, `S_0=M_R T` on `D_*` need not be closed merely because `T` is closed: `1/R` is no longer bounded. On `D_*`, `ker S_0=ker T` if `R>0` almost everywhere (for the original non-atomic 27-dimensional Lebesgue volume, the origin is null), **conditional on an explicit AE-injectivity proof**.

However, closing `S_0` or the `q_R` form could change the domain and potentially its kernel. The `epsilon -> 0` limit is *not* an automatic consequence of the regularized family. Keep operator closability, identification of the closure, kernel control and any strong-resolvent limit as independent obligations. Do not treat regularized kernel equality as proof for the limiting auxiliary Hamiltonian.

## 6. Distinguish operator construction from the paper's gap

The paper's actual `H_aux` is the closed realization of its weighted supercharge form, symbolically `(1/16) Σ Q_alpha R² Q_alpha`; for the appropriate common test domain its form is `(1/16) Σ ||RQ_alpha psi||²`. Equality of closed operators/forms between our candidate and the paper requires a physical Fock/supercharge/radius/domain identification, not just syntactic resemblance.

The paper's auxiliary positive gap is **restricted to gauge-invariant Spin(9) singlets** and uses supercharge anticommutators, Spin(9) representation theory, a Hardy-type estimate in a spinor sector, and a regularized resolvent `(H+delta)^(-1)`. Nothing here establishes those conditions for current source. In particular:
- kernel preservation != existence of a nonzero zero mode;
- positive auxiliary gap != positive gap of original physical `H`;
- `H_epsilon` for positive epsilon != unregularized `H_aux`;
- smooth compact support in `E` != already-proved density of Spin(9)-singlet compactly supported test vectors;
- earlier [SpectralWeightedClosureCompactness.lean](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralWeightedClosureCompactness.lean) (strict [#42320696105](https://github.com/etblink/math/actions/runs/42320696105)) gives **conditional weighted wavefunction compactness** and does not directly prove an output-weighted charge gap or density.

## 7. Decision / bounded next experiments (all presently UNSTAGED)

**R0 — output multiplier contract:** exact original `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)`; positive unbounded radial `W_epsilon`, bounded right-and-left inverse `B_epsilon`, domain identities and AE equality; independently consume `Core.lean` with original test functions.

**R1 — abstract closure/kernel contract:** instantiate the graph argument with accepted original `T` (`H5E8AY`/M5BF0), `W_epsilon` and `B_epsilon`; show closedness and kernel preservation. Include exact original native source consumer and permitted-axiom audit.

**R2 — physical dense domain:** join D2B10C → AZ/BA and source charge compact support to prove `Dense D(S_epsilon)` in literal `pairedGaugeData.physicalSpace`; prove common positive-epsilon domain `D_*`. Do not substitute ambient `FullL2` density.

**R3 — auxiliary square:** construct and qualify `H_epsilon=(1/16)S_epsilon†S_epsilon`, exact natural domain, self-adjointness and kernel identity with M5BE0 physical `H`. No asserted spectrum beyond that.

**R4 — zero regularization and singlet bridge:** audit closability of `S_0`/form `q_R`; separately audit source Spin(9) action, singlet domain density, exact superalgebra and paper convention equality. Study the Hardy/resolvent proof only after these distinctions are explicit.

**Gate discipline:** staged source/consumer/checker with SHA pins -> strict CI -> receipt with tested commit, axiom-root check and actual proposition -> acceptance. Do not count this memo as qualification and do not advance M5BG0 solely to satisfy momentum. Preserve every red with first causal reason. Do not mutate historical theorem bytes or `main`.

## 8. Source / reading anchors

- [Michel–Scheinpflug–Yin 2026-11-06, arXiv:2611.09837](https://arxiv.org/abs/2611.09837), especially Sections II–III and Appendix B.
- [Original BFSS Core.lean](../../lean/OAI/MathematicalPhysics/BFSS/Core.lean), source `SmoothCore`, original charge `SmoothCore -> SmoothCore`, original `Boson` and `Fermion` carriers.
- [AY closed physical charge graph](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe.lean).
- [AZ original core membership](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8AZOriginalPhysicalChargeDomainDensityReductionProbe.lean); [D2B10C physical core density](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe.lean); [BA joining theorem](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BAOriginalPhysicalChargeUnconditionalDensityProbe.lean).
- [M5BE0](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BE0OriginalNativeHamiltonianPort.lean) and [M5BF0](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.lean) exact accepted original native model.
