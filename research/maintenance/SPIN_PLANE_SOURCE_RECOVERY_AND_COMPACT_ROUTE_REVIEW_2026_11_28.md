# Original spin-plane covariance — historical evidence recovery and compact-flow review

2026-11-28 Pacific; baseline `2e0bcc98de5514498cb6f03727a355e8f504260d`; pilot tested at `c9e970ba8dc58d1bca240b8edda1f91a491fae7f`. Maintenance retrospective only. No Lean, numerical experiments, CI dispatch, PR merge, or status promotion. The experimental RSKA branch remains isolated.

## Historical qualification recovered

Draft [PR #1](https://github.com/etblink/math/pull/1) contains source already byte-identical to canonical main. Its static draft description says port not yet qualified. Provider history shows [run #38120296827](https://github.com/etblink/math/actions/runs/38120296827) completed successfully on October 11 at `b9cd9e58ba41fcd9fe1860d6999dc40e3176e27d`, job 114413439724. Exact checkout, pinned Lean 4.34.1/Mathlib, Core/GammaWords compilation, source compilation and six axiom checks completed. All five tested/current source/toolchain/dependency blob pairs matched. The source workflow has no separately compiled consumer, does not enforce warnings-as-errors, and has no artifact upload step; no artifacts returned. Do not upgrade to INTEGRATED_STRICT, alter the draft PR or launch its workflow. Retain original decoded job log and exact extracted reports in [recovery record](SPIN_PLANE_SOURCE_RECOVERY_001.json). No change to the 370/372 original ZIP census.

The recovered module's historical source contract is the all-axis commutator and exact kinetic row identity. For distinct r,s, A=gamma_r gamma_s/2, B=E_rs-E_sr, sourceSpinPlane_comm_gamma_all gives [A,gamma_k]=sum_l B_lk gamma_l. sourceSpinKineticCoefficient gives gamma_k A^T - [A,gamma_k] = -A gamma_k, using the source variation. These are **already** formal source identities; no reason to repeat them as a new finite gamma check or new Lean gate. The source's exact branch/closure qualification remains historical.

## Compact-flow sign and interface audit

The prior November 25 global source covariance memo and November 28 minimal dependencies memo already state this argument. Rechecked Core.lean, SpinPlaneCovariance.lean, LB1S, LB1C1, G14, NAG3 and CSQ-F2 source signatures against those notes; this is a retrospective consistency review, not a new proof qualification.

* For row storage X (color by space), W(g)u(X)=V(g)u(X O(g)). Its composition convention is W(g)W(h)=W(gh); inverse pullback gives W partial_i W^-1=sum_j O_ji partial_j. The gamma row identity is sum_i O_ji gamma_i S^T = S^-1 gamma_j. For the potential, gammaTwo is the original antisymmetric product, so the corresponding two-index identity uses the same S^-1 on the left. Consequently the prior memo's charge coefficient S_(beta,alpha), not S_(alpha,beta), is consistent with T(e_alpha)=Q_alpha psi intertwining W T=T S.
* LB1S defines K(A) with factor 1/4 on normalized Majoranas; LB1C1 gives its column covariance. The repeated spin generator A=gamma_r gamma_s/2 has K=1/8 times gamma_r gamma_s contracted with normalized Majoranas, equivalently 1/4 contracted with original theta. This matches G14 exactly, including the orbital derivative X_r partial_s-X_s partial_r for W. No full Lie bracket or original covering identification follows from this review.
* NAG3's paired_native_core_closure and CSQ-F2 paired_core_closure_common_square give the exact literal-core closure and common square already qualified. Given core covariance, finite orthogonal mixing preserves the common form norm. Reuse these interfaces, rather than reopen ESA/common-square work. Full source-to-closed-domain covariance and bounded graph averaging are still analytical joins, not new verified declarations.
* SO3 surjectivity from the pilot is candidate support only. The existing actual gauge curve factorization and G4J source action remain the baseline gauge route. Do not reopen the previous RED coordinate-adapter solely to use the recovered IBI donor.

## Scientific and architecture decision

This is a real maintenance decision: the already qualified spin-plane source identities replace any proposed duplicate gamma/kinetic formalization, and the source-sign convention is consistent with the conditional compact-flow route. The remaining literal source-to-domain audit, G16 numerical join, actual trial/weighted graph and independent raw witness remain outstanding. No physical existence claim.

Atlas V7 omitted all six declaration names. The RSKA route view helped narrow the audit but the November 25 memo already named the donor; a direct memo/source/history search recovered its exact run. Do not claim independent discovery of the mathematics or a measured speedup. Keep the pilot at its existing head and do not merge. This recovery belongs to the canonical maintenance archive, not to an architecture-specific duplicate source tree. Continue the existing maintenance reference/qualification and selective workflow review, keeping the freeze in force.

