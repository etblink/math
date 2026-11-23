# GM5E8 R1 original zero mode from persistent overlap

November 23, 2026 · Unified integration · [GM5E8 R2 strict qualification](BFSS_GM5E8_R2_ORIGINAL_PERSISTENT_OVERLAP_ZERO_MODE_GREEN_ACCEPTANCE_2026_11_23.md)

## Qualified statement

Let \(T\) be the original closed sixteen-charge column, \(H=T^\dagger T/16\) the original normalized Hamiltonian, and \(f_n\) a sequence in the original gauge-invariant smooth core. Assume \(\|f_n\|_2\le1\) and \(\|Tf_n\|\to0\). If one fixed physical vector \(w\) and one \(\delta>0\) satisfy \(|\langle w,f_n\rangle|\ge\delta\) eventually, the conclusion is a nonzero physical vector in the natural domain of \(H\) with \(Hu=0\). The standalone Lean consumer checks the original paired SU(2) core, charge column and Hamiltonian.

The proof uses the Hilbert product of the physical input and native charge output. Write \(K\) for the closed graph of \(T\). If \(K\) contains no nonzero horizontal vector \((u,0)\), the first-coordinate image of \(K^\perp\) is dense in the input Hilbert space. Indeed, any vector orthogonal to that image makes \((u,0)\) orthogonal to \(K^\perp\), so \((u,0)\in K\) by closedness. Approximate \(w\) within \(\delta/2\) by the first coordinate \(a\) of a fixed pair \((a,b)\in K^\perp\). Orthogonality gives \(\langle a,f_n\rangle=-\langle b,Tf_n\rangle\), which tends to zero. The overlap error is at most \(\|w-a\|\|f_n\|<\delta/2\), contradicting the eventual overlap lower bound. The native Hamiltonian weak form then passes the resulting horizontal graph vector to the original operator domain.

## Bridge from the fixed ball

The [GM5E7 localization analysis](BFSS_GM5E7_ORIGINAL_GAUGE_CORE_LOCALIZATION_GATE_2026_11_23.md) bounds the native charge and first radial moment of \(\chi_R f_n\), where \(\chi_R\) equals one in the fixed ball and vanishes outside the ball of radius \(2R\). If a positive fraction of the probability stays in the fixed ball, [GM5E5](BFSS_GM5E5_R2_ORIGINAL_WEIGHTED_GRAPH_COMPACTNESS_GREEN_ACCEPTANCE_2026_11_22.md) yields a subsequence \(\chi_R f_{n_j}\to v\) strongly with \(v\ne0\). Test it against \(v\). Real bounded multiplication gives
\[
\langle \chi_R v,f_{n_j}\rangle
=\langle v,\chi_R f_{n_j}\rangle\longrightarrow\|v\|^2 .
\]
The orthogonal projection of \(\chi_R v\) onto the closed physical space gives a physical test vector with the same overlaps on \(f_{n_j}\). The fixed-overlap theorem then applies to that subsequence. This joins local compactness to the original zero mode without a weak subsequence construction for the uncut inputs.

GM5E8 checks the overlap-to-zero-mode implication. The cutoff-to-overlap step is currently an analytic deduction. A trial-state certificate still has to supply a charge residual tending to zero and either a fixed test overlap or a fixed-ball mass bound for the same normalized vectors.
