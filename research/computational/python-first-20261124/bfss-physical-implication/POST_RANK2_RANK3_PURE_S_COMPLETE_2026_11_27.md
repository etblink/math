# Rank-three pure-S derivative block complete

2026-11-27 Pacific. Classification: SURVIVED_FINITE_TESTS. No new Lean or CI work. CSQ-F2 R1 and completed rank-two fixture remain unchanged.

## Direct and covariance evidence

At diag(1,2,3), active cores [1,2,3,4,5,6], use the frozen seed 91c57e1f3f1e856a51bbc11dbb5a01ee9099ecc0, rank-three H3 anchor 54fcedb9dadb9ea5d5c76bb3d10615943c877955, direct engine b988dee1779f779bd0a5016ffd03c3f0b0211eaa and tangent engine 8e7f8588ba7b03f89687ee71f256984bb79b75b7. ZIP CRC and lengths verified for both inputs. Direct coordinates 00,01,03,11,22; tangent coordinates 02,10,12,13,20,21,23. For the twelve selected coordinates: 288 actions, 41 compiled/literal controls, no wide action/combine, maximum narrow bound 906441007104. Representative counts: 468 direct + 504 covariance-derived = 972 (36 ordered pairs). No double counting of holdouts.

[Independent transverse holdout receipt](local52_rank3_S_transverse_holdout_comparison_2026_11_27.json): E01 direct/tangent 72/72, E03 direct/tangent 72/72, E03/E04 direct null-axis holdout 72/72; no discrepancies. Exact component divisibility checked by tangent engine. These are contraction comparisons, not full vector equality or a new generic covariance theorem. Multiplicity six follows from SO(6) null-column stabilizer subject to source covariance; finite E03/E04 control supports it.

## Aggregate comparison

[Complete aggregate receipt](local52_rank3_derivative_S_complete_comparison_2026_11_27.json) combines two pinned partial aggregates (each pins six raw files), preserving direct and covariance provenance. Historical target bfss-full-jets/jet_123_p8.json blob 852fcd83dcf388877ef0821c6350a892dd6eaced. The correct rank-three historical nu axis mapping is identity, not the rank-two cyclic convention; prior 54-mismatch negative control remains preserved. Apply multiplicity 6 for column 3, 1 otherwise; beta minus sign and common half normalization cancellation. Compare raw numerators to historical times 330^2. All 36 tau, 36 beta, 108 nu matches pass (90 nonzero); 432 raw tau Hermitian checks pass; no imaginary residuals. Fresh separate scale-55 mass/Y engine 87ddebedf9149ffdb4a3b0c5b77da1095bf1bb97 produced [Euler control mass](local52_rank3_mass_S_square_euler_control_2026_11_27.json); all 36 contracted Euler identities (18 nonzero) pass with factor 36 and right degree. No errors. The two partial aggregate files and raw holdouts are retained; no replacement of historical source.

## Frontier

Rank-three coverage: 36/144 complete ordered pairs, 972/3888 representative slots (468 direct, 504 covariance), 180/720 aggregate entries. 108 pairs, 2916 slots and 540 aggregate entries remain. Next inspect mixed rank-three historical normalization and axes directly from their producer, replay low/middle Phi/H3 mixed squares with independent active/null transverse direct controls before using tangent reductions for the remaining higher cores. The full rank-three fixture, generic polynomial source identity, literal weighted integration, global Spin(9) covariance, trial admissibility and Hardy premises remain open. No physical fidelity or zero-mode promotion. Preserve all historical RED and GREEN evidence.
