# HARDY-G3 R1 prospective gate — actual original Y derivative contraction

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT QUALIFIED.
G2 R3 #43634684249 accepted first at 64718d564f311b914e629e8bae536327b053ee1f. No new G3 proof source yet.

## Observation, review and hypothesis

The accepted G2 trace theorem cannot determine transverse coefficient1/56. Appendix B.7 of arXiv:2611.09837v1, re-read at https://arxiv.org/html/2611.09837v1, supplies a second, derivative contraction. This gate tests it on the literal accepted source Y and actual Boson2 coordinate directions. Two plane directions contribute1/16 each; seven transverse directions contribute1/56 each, giving1/4. The source matrix derivative is a genuine fderiv, not an assumed formal derivative.

Reviewed existing OAI baseline 64718d564f311b914e629e8bae536327b053ee1f (same original OAI bytes as prior a5b8ffcda7c267bfdc224fee49d7f1f04c4cdc88). Core 9882359ced78b0a3bd7e2f057974bd0a031b3e60, GammaWords d12051e70de679f5458dbd456667a32c7b407ce4, G2 952890f8056c2b115d69a03c08c39762210c1a0b, G1 6a019c9111b384e73a05de7b776ac9e5a83c7eb7, G4J e20c76fb22bc09d16dbcd8657333227cb34ed1ea. Pinned Mathlib sources read: ContinuousLinearMap Basic smulRight and its application; FDeriv.Linear protected fderiv/hasFDerivAt; EuclideanSpace.proj/coe_proj and nondeprecated PiLp.single_apply.

Construct YCLM from existing continuous-linear coordinate projections smulRight fixed original gamma matrices. This avoids proving continuity by coordinate expansion or inventing a new matrix model. Prove pointwise YCLM equality to accepted Y; transfer the native continuous-linear derivative. Independently compute finite basis values using accepted Y definition and gamma squares/anticommutation, then sum all nine directions. Private scalar/matrix algebra helpers may support the five public roots without changing G2 bytes.

## Fixed five-root contract

- originalHardyYCLM
- originalHardyYCLM_apply
- originalHardyY_fderiv
- originalHardyY_basis_contraction
- originalHardyY_derivative_contraction

For every original M:AlgebraData2, plane i!=j, A:ColorIndex2 and X:Boson2:
1. YCLM M i j A : Boson2 ->L[Real] GammaMatrix is assembled from literal coordinate projections and fixed1/16,1/56 terms.
2. YCLM M i j A X = accepted originalHardyY M i j X A.
3. fderiv Real (fun Z => originalHardyY M i j Z A) X = YCLM M i j A.
4. SUM[k:Fin9] gamma_k * originalHardyY M i j (EuclideanSpace.single(k,A)1) A = (1/4) • (gamma_i gamma_j).
5. SUM[k] gamma_k * (fderiv Real (fun Z => originalHardyY M i j Z A) X (single(k,A)1)) = same1/4 product.

Source lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG3OriginalYDerivativeContraction.lean; namespace FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction, importing accepted G2 only. Consumer lean/diagnostics/BFSSP3AuxHardyG3OriginalYDerivativeContractionIndependentConsumer.lean plus native G4J; workflow .github/workflows/bfss-p3-aux-hardy-g3-original-y-derivative-contraction-strict.yml.

## Scientific test, controls and falsifiers

Independent variables: all original M, coordinates X, plane/color labels and actual coordinate directions. Dependent variables: complete source/native consumer, five/ten report order. Twelve native examples: literal FullL2 anchor; CLM action and additivity; actual fderiv; finite basis and derivative contractions; base-point zero; swapped plane sign; first plane-axis derivative1/16; transverse ninth-axis derivative1/56; normalized reverse-gamma trace probe4 and rejection of incorrect doubled probe8. Construct concrete native color zero explicitly by Fin value/proof, and close numeric propositions before decide. These preserve G1/G2 negative knowledge.

Falsifiers: wrong1/16 or1/56 derivative/basis coefficient, omitted transverse directions, wrong gamma/plane order, surrogate derivative, source/core substitution, failed native control, warning/axiom or source closure drift. Constant/linear identities alone do not suffice without the final actual fderiv contraction. The transverse control is necessary because G2 trace alone cannot see1/56.

Freeze all existing transitive OAI bytes to reviewed baseline 64718d564f311b914e629e8bae536327b053ee1f; explicit Core/GammaWords/G1/G2/G4J pins. Lean4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, same budgets/warnings, cold original source+G4J, fresh warning-as-error source and full independent consumer. Exact donor reports:
- FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalHardyY
- FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalHardyY_trace
- FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_square_trace
- OAI.BFSSGamma.gamma_sq
- OAI.BFSSGamma.gamma_anti

## Analysis, decision and stop line

Static source/blob/root/YAML/bash/Python checks first; no local Lean installed. Qualification only after full original source/native consumer and five/ten standard-axiom reports, all twelve controls, measured manifest and artifact review. Preserve first causal red. After two related failures isolate the smallest CLM/finite-sum boundary, not proof permutations or weakening.

This is a matrix coefficient derivative identity. It does not prove the source tau/charge anticommutator, tau CAR norm, physical Spin9, closed generators/domains, individual Q squared, Hardy/fidelity, zero mode or gap. Commit this prospective record before new G3 source mutation.
