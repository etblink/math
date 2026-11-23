# GM5E7 R1 native charge localization and a fixed-ball mass test

November 23, 2026 · Original massless SU(2) BFSS · Unified integration

## Staged Lean statement

Let \(T\) be the original native sixteen-charge column and \(q(f)=\|Tf\|^2/16\) on the original gauge-invariant smooth core. For a finite real smooth gauge-invariant partition \(\sum_j\chi_j^2=1\), GM5E7 checks that each \(\chi_j f\) belongs to that core and that
\[
\sum_j q(\chi_j f)
  = q(f) + \frac12\sum_j\int_{\mathbb R^{27}}
       \|\nabla\chi_j(X)\|^2\,\|f(X)\|^2\,dX.
\]
The gauge step uses pointwise equivariance and the almost-everywhere semantics of the actual pullback and fermion action. The form step composes the existing smooth IMS identity with GM5B's original closed-column evaluation. The independent consumer uses two cutoffs on the literal paired SU(2) data. The localization identity is [strict-qualified in R2](BFSS_GM5E7_R2_ORIGINAL_GAUGE_CORE_LOCALIZATION_GREEN_ACCEPTANCE_2026_11_23.md).

## Analytic consequence to use when screening trial families

For a fixed \(R>0\), choose a smooth radial angle \(\theta_R\) equal to zero on \(\{\|X\|\le R\}\) and \(\pi/2\) on \(\{\|X\|\ge 2R\}\). This is smooth at the origin because it is constant there. Set \(\chi_R=\cos\theta_R\), \(\eta_R=\sin\theta_R\), with \(\|\nabla\theta_R\|_\infty\le C/R\). Both scalars are gauge-invariant since the native boson action is isometric. The two gradient squares sum to \(\|\nabla\theta_R\|^2\), so positivity of the exterior charge form gives
\[
\|T(\chi_R f)\|^2\le \|Tf\|^2+8C^2 R^{-2}\|f\|^2 .
\]
For a normalized sequence \(f_n\) in the original invariant core with \(\|Tf_n\|\to0\), assume there are fixed \(R,\delta>0\) for which a subsequence satisfies
\[
m_R(f_n)=\int_{\|X\|\le R}\|f_n(X)\|^2\,dX\ge\delta .
\]
The inner-cutoff sequence has original input norm at most one, uniformly bounded native charge norm by the displayed estimate, and first radial moment at most \(2R\). Apply [qualified GM5E5](BFSS_GM5E5_R2_ORIGINAL_WEIGHTED_GRAPH_COMPACTNESS_GREEN_ACCEPTANCE_2026_11_22.md) to these cutoff vectors, using constant core approximants, to obtain a strong subsequential limit of the inner cutoffs. Its norm is at least \(\sqrt{\delta}\). Pass to a further weakly convergent subsequence of the original normalized vectors with weak limit \(u\). The native charge graph is a closed linear subspace of the physical-input and charge-output product Hilbert space, hence weakly closed. The graph pairs converge weakly to \((u,0)\). Bounded multiplication by \(\chi_R\) is weakly continuous in the ambient Hilbert space, so the strong cutoff limit is \(\chi_R u\). Thus \(u\ne0\) and \(Tu=0\). The original Hamiltonian weak form used in [GM5E6](BFSS_GM5E6_R2_ORIGINAL_TIGHT_CORE_ZERO_MODE_GREEN_ACCEPTANCE_2026_11_23.md) puts the normalized \(u\) in the natural Hamiltonian domain with value zero.

The converse follows on this native graph as well. Given a norm-one zero mode, the exact graph-core approximation yields normalized smooth invariant approximants converging strongly in input with charges tending to zero. Choose a ball carrying positive mass of the zero mode. Strong input convergence preserves a positive lower bound in that ball after a finite prefix. This needs no first moment for the zero mode.

The fixed-ball test and its converse are mathematical deductions in this note. The current Lean gate checks the localization identity. Formalizing the fixed-ball criterion still needs an explicit bounded cutoff operator and the weak graph-limit argument.

## What to measure on the same candidate vectors

For a single fixed \(R\), track \(m_R(f_n)\) together with \(\|Tf_n\|^2/16\) after normalization. A certificate would show that the residual goes to zero while \(m_R(f_n)\) stays above a positive threshold. Reporting \(m_{R_n}\) for expanding radii would miss the distinction. The moving-annulus D1H family has \(m_R(f_n)=0\) eventually for every fixed \(R\). This makes it a concrete escape control. A single finite low-energy trial only bounds a variational quantity at that trial and leaves the limit unresolved.

The separate auxiliary singlet route weights the charge output and uses an overlap certificate. It still requires its original-source transfer. The fixed-ball route uses local mass of the input and the original native charge, so it supplies a distinct trial-state target without invoking that transfer. See the [auxiliary crosswalk](../spectral-p2-original-field/P3_AUX_R2_WEIGHTED_SUPERCHARGE_2026_PAPER_CROSSWALK_2026_11_13.md) and [Theorem B.2 of the preprint](https://arxiv.org/html/2611.09837v1#A2).
