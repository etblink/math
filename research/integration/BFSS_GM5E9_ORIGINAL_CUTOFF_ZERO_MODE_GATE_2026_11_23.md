# GM5E9 R1 original zero mode from a localized core sequence

November 23, 2026 · Unified integration · [GM5E9 R1 strict qualification](BFSS_GM5E9_R1_ORIGINAL_CUTOFF_ZERO_MODE_GREEN_ACCEPTANCE_2026_11_23.md)

## Qualified statement

Let \(T\) be the original closed sixteen-charge column and \(H=T^\dagger T/16\) its original normalized Hamiltonian. Consider original gauge-invariant smooth-core states \(f_n\) with \(\|f_n\|_2\le1\) and \(Tf_n\to0\). Fix one real smooth gauge-invariant multiplier \(\chi\). Put \(g_n=\chi f_n\) using [GM5E7's original invariant-core cutoff](BFSS_GM5E7_R2_ORIGINAL_GAUGE_CORE_LOCALIZATION_GREEN_ACCEPTANCE_2026_11_23.md). Assume uniform upper bounds on \(\|g_n\|_2\), \(\|Tg_n\|\), and \(\|\sqrt{\|X\|}\,g_n\|_2\), and a strictly positive lower bound on \(\|g_n\|_2\). The conclusion is a nonzero physical vector on the natural domain of \(H\) with \(Hu=0\).

[GM5E5](BFSS_GM5E5_R2_ORIGINAL_WEIGHTED_GRAPH_COMPACTNESS_GREEN_ACCEPTANCE_2026_11_22.md) applied with constant core approximants gives a strongly convergent subsequence \(g_{n_j}\to v\ne0\). Choose one index \(k\) with \(\langle g_{n_k},v\rangle\ne0\), possible because these inner products tend to \(\langle v,v\rangle\) as \(k\to\infty\). The fixed test vector \(w=\chi g_{n_k}\) belongs to the physical smooth core. The original core inner-product integral gives
\[
\langle w,f_{n_j}\rangle
=\langle \chi g_{n_k},f_{n_j}\rangle
=\langle g_{n_k},g_{n_j}\rangle
\longrightarrow \langle g_{n_k},v\rangle .
\]
The absolute value of the overlap stays above a positive constant eventually, so [GM5E8](BFSS_GM5E8_R2_ORIGINAL_PERSISTENT_OVERLAP_ZERO_MODE_GREEN_ACCEPTANCE_2026_11_23.md) applies to the uncut subsequence. All cutoff multiplications in this proof act on smooth-core vectors. This version does not require extending \(\chi\) to a bounded \(L^2\) operator or projecting a vector onto the physical Hilbert space. The independent consumer spells out the actual paired native charge operator for both sequences.

## Fixed-ball application

The remaining source adapter is to obtain the cutoff norms from physical hypotheses on \(f_n\). For a radial angle partition with \(\chi=1\) on \(\|X\|\le R\), \(\chi=0\) on \(\|X\|\ge2R\), and \(|\chi|\le1\), a ball mass lower bound \(\int_{\|X\|\le R}\|f_n(X)\|^2\,dX\ge m>0\) supplies \(\|g_n\|_2\ge\sqrt{m}\). The input bound gives \(\|g_n\|_2\le1\), and \(\|\sqrt{\|X\|}\,g_n\|_2^2\le2R\). [GM5E7's exact IMS identity and localization analysis](BFSS_GM5E7_ORIGINAL_GAUGE_CORE_LOCALIZATION_GATE_2026_11_23.md) give a uniform bound on the localized charge using the fixed partition's bounded gradient and the original charge bound. When the ball mass bound holds only along a subsequence, the same argument applies after choosing that subsequence.

These estimates specify the remaining Lean bridge from a fixed-ball lower bound to the qualified criterion. A concrete trial family must still demonstrate vanishing native charge while retaining positive mass in the same ball. The moving-annulus family is an escape control because it eventually has zero mass in each fixed ball.
