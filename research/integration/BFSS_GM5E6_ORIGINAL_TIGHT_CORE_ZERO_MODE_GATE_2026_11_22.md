# GM5E6 R1 original tight smooth-core zero-mode criterion

**Status:** staged for strict Lean verification on unified integration. The inputs are a normalized sequence in the original gauge-invariant smooth core, the original sixteen-charge column tending to zero in its output Hilbert norm, and a uniform bound on the first radial moment of the same vectors. The conclusion is a norm-one vector in the natural domain of the original \((1/16)T^\dagger T\) with Hamiltonian value zero.

## Proof dependencies

Apply [qualified GM5E5 R2](BFSS_GM5E5_R2_ORIGINAL_WEIGHTED_GRAPH_COMPACTNESS_GREEN_ACCEPTANCE_2026_11_22.md) with a constant approximating sequence for each smooth-core trial vector. Norm convergence of the charges implies their range is bounded. Compactness gives a subsequence converging strongly in the original unweighted \(L^2\). Norm continuity gives norm one. The gauge fixed space and native charge graph are closed, so the limit belongs to the physical charge domain and has zero charge. The [original Hamiltonian weak-form equivalence](../spectral-p2-original-field/P3_M5BE0_R2_GREEN_43493125150_NATIVE_HAMILTONIAN_PORT_ACCEPTANCE_AND_BF_HANDOFF_2026_11_13.md) takes the zero right-hand side to natural-domain membership for the same Hamiltonian with value zero. The standalone consumer repeats the hypotheses and conclusion with the concrete paired SU(2) data. A later application to the whole intersection of the charge and weight domains would require its own joint-core theorem.

## Two candidate checks

**D1H moving annulus.** The [D1H prescreen](https://chatgpt.com/library?file_id=libfile_027bbc6306f88191a5f7427b5368f44d&account_id=personal) uses a radial cutoff supported at \(R<r_{\mathrm{svd}}(X)<2R\), where \(r_{\mathrm{svd}}\) is the largest singular value. The global source radius \(\rho(X)=\|X\|\) is the Frobenius norm and satisfies \(\rho\ge r_{\mathrm{svd}}\). For any normalized realization \(\psi_R\) of this ansatz,
\[
\big\|\sqrt{\rho}\,\psi_R\big\|_2^2
=\int \rho(X)\|\psi_R(X)\|^2\,dX \ \ge R.
\]
This obstruction to a bounded first moment follows from the support alone. It persists for every smooth Fock lift and every residual estimate with those supports. Pursue D1H as an escape test if the actual Fock lift, gauge constraint, and full charge estimate can be verified.

**Fixed, even profile under dilation.** An even smooth compactly supported scalar profile times a fixed gauge-invariant Fock vector is a simple class of physical trial states. On the original massless core, the fermion field is odd in \(X\), so its integrated contribution vanishes in this class. Under the norm-preserving dilation \(\psi_\lambda(X)=\lambda^{-27/2}\psi(X/\lambda)\), the normalized charge form is \(K\lambda^{-2}+P\lambda^4\), where \(K\) and \(P\) are the undilated kinetic and bosonic potential energies. A nonzero smooth normalized profile gives \(K>0\). The original SU(2) bosonic potential is a nonzero nonnegative quartic polynomial, so a nonzero smooth profile also gives \(P>0\). Minimizing over \(\lambda>0\) leaves the strictly positive value \(3\,2^{-2/3}K^{2/3}P^{1/3}\). Changing the scale of one such profile cannot produce a vanishing charge sequence. The argument leaves open more general shape changes or position-dependent fermionic polarizations.

These candidate checks are analytic deductions from the stated support and parity, with no new Lean qualification of the trial-state claims. A threshold-state construction must bind any proposed polarization to the actual gauge-physical smooth core and estimate the full charge residual and first moment on the same normalized vectors.
