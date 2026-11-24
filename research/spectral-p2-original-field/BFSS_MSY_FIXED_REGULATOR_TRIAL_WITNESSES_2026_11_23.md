# Fixed-regulator trial witnesses for the original BFSS certificate

The first source existence certificate targets the 104-function witness. It uses active seed families S, Phi and H3, two projected Gaussian widths, and coefficients with common denominator 10^13. The [witness archive and verifier](../integration/evidence/msy-fixed-regulator-trial-witnesses.zip) carry the exact basis labels, coefficient vectors, dilations, and 256-bit companion-code checks. Archive SHA-256 is `a742ef298d4deca738d303fa5b45c8b5dc837a1eccba37e16071aa51d3a3762a`. The verifier binds the published state-file bytes and pin `96b19b1fef98486e43bc2527604966c86afd7ca7`. [Companion release](https://github.com/asmichel/SU2-BFSS/tree/96b19b1fef98486e43bc2527604966c86afd7ca7/variational)

| Trial size | Companion form at regulator one | Checked rational comparison | Lower bound conditional on source transport |
| ---: | ---: | ---: | ---: |
| 104 | 0.3643611475 | q₁ < 3/8 | F > 3.9% |
| 206 | 0.3321696830 | q₁ < 1/3 | F > 12.3% |
| 1,542 | 0.0089725410 | q₁ < 1/100 | F > 97.6% |

The screen optimized the fixed-regulator Rayleigh quotient on degree-restricted subspaces and selected width and seed deletions. A 275-function degree-six candidate at dilation 7/5 gave q₁ about 1.727. A 527-function degree-eight candidate at that dilation gave about 0.229. Lower degree and fewer terms are different search criteria, so the 104-term witness retains degree-eight covariants. Global minimality remains open. The final 104-term witness was rechecked after rational rounding.

The operator route still requires the actual occupation map, gauge and sixteen-charge transport, weighted-domain membership of the witness, and the source Spin(9) singlet and spinor Hardy obligations. Use positive radial regulator one and the existing weighted graph and kernel comparison. The 1,542-term case remains available when the stronger fidelity target changes a research decision. The auxiliary estimate uses one trial. GM5E10 requires a sequence with vanishing charge residual and positive mass in a fixed ball. [MSY Appendix B](https://arxiv.org/html/2611.09837v1#A2) · [Original-source crosswalk](BFSS_ORIGINAL_PHYSICAL_GROUND_STATE_CROSSWALK_2026_11_23.md)
