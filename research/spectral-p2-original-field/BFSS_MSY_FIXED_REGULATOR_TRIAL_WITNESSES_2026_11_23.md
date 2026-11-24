# Fixed-regulator trial witnesses for the original BFSS certificate

The first source existence certificate targets the 104-function witness. It uses active seed families S, Phi and H3, two projected Gaussian widths, and coefficients with common denominator 10^13. The [witness archive and verifier](../integration/evidence/msy-fixed-regulator-trial-witnesses.zip) carry the exact basis labels, coefficient vectors, dilations, and 256-bit companion-code checks. Archive SHA-256 is `a742ef298d4deca738d303fa5b45c8b5dc837a1eccba37e16071aa51d3a3762a`. The verifier binds the published state-file bytes and pin `96b19b1fef98486e43bc2527604966c86afd7ca7`. [Companion release](https://github.com/asmichel/SU2-BFSS/tree/96b19b1fef98486e43bc2527604966c86afd7ca7/variational)

| Trial size | Companion form at regulator one | Checked rational comparison | Lower bound conditional on source transport |
| ---: | ---: | ---: | ---: |
| 104 | 0.3643611475 | q₁ < 3/8 | F > 3.9% |
| 206 | 0.3321696830 | q₁ < 1/3 | F > 12.3% |
| 1,542 | 0.0089725410 | q₁ < 1/100 | F > 97.6% |

The screen optimized the fixed-regulator Rayleigh quotient on degree-restricted subspaces and selected width and seed deletions. A 275-function degree-six candidate at dilation 7/5 gave q₁ about 1.727. A 527-function degree-eight candidate at that dilation gave about 0.229. Lower degree and fewer terms are different search criteria, so the 104-term witness retains degree-eight covariants. Global minimality remains open. The final 104-term witness was rechecked after rational rounding.

The coarse existence margin has a rational proof. Since \(14<(15/4)^2\), the paper's constant satisfies \(\kappa<66/25\). Therefore \(q_1<3/8\) gives \(1-\kappa q_1>1/100\) using rational arithmetic alone. The sharper interval reported for the 104-term witness gives the 3.9% figure in the table. The smaller rational target is sufficient for the first proof.

The selected rows use 56 instances from S, 24 from Phi, and 24 from H3. In the pinned state, S is one constant tensor with 750 listed entries. Phi is `P_hat*Y(X)*S` and H3 is `((30*I-Ksp)/22)*Pi_3(C2)*Y(X)^3*S`. Both depend on S. This makes the native singlet proof for S and covariance of the generating operators higher-leverage checks than expanding the 104 rows separately. [Pinned state](https://github.com/asmichel/SU2-BFSS/blob/96b19b1fef98486e43bc2527604966c86afd7ca7/variational/results/optimized_state.json)

The [exact seed check](tools/bfss_check_msy_seed_s.py) expands those 750 orbit rows into 14,240 occupation masks and applies the companion's three color and 36 spatial generators directly over the fourth-degree cyclotomic field. Every residual vanishes. The squared length before the stored normalization is 1,144, and changing one vacuum coefficient is detected by the spatial (0,3) generator. This gives an exact control in the external basis for the later native singlet proof. Run it with the companion's `src` on `PYTHONPATH` and pass the pinned `optimized_state.json` as its single argument.

The operator route still requires the actual occupation map, gauge and sixteen-charge transport, weighted-domain membership of the witness, and the source Spin(9) singlet and spinor Hardy obligations. Use positive radial regulator one and the existing weighted graph and kernel comparison. The 1,542-term case remains available when the stronger fidelity target changes a research decision. The auxiliary estimate uses one trial. GM5E10 requires a sequence with vanishing charge residual and positive mass in a fixed ball. [MSY Appendix B](https://arxiv.org/html/2611.09837v1#A2) · [Original-source crosswalk](BFSS_ORIGINAL_PHYSICAL_GROUND_STATE_CROSSWALK_2026_11_23.md)
