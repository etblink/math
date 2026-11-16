# Spin(9) abstract physical outline — R4 GREEN, nine independent theorem reports

**Local date:** 2026-11-15 Pacific (GitHub completed 2026-11-16 UTC).  
**Source branch:** `research/bfss-spin9-structural-outline-20261115`.  
**Acceptance:** `ABSTRACT_CONDITIONAL_OUTLINE_QUALIFIED` plus `ORIGINAL_FULLL2_TYPED_CONSUMERS_QUALIFIED`; **NOT** `ORIGINAL_BFSS_PHYSICAL_SPIN9_COVARIANCE_QUALIFIED`, not an unconditional BFSS supercharge theorem, and not spectral qualification.

## Exact immutable run

- [Strict workflow #43799204363](https://github.com/etblink/math/actions/runs/43799204363): `completed/success`, attempt 1, tested SHA `54d9f05ad803fac15fd7d956007694b95cb9f3c3`.
- GitHub Actions job `133074981586` (`pure-spin9-symmetry-with-original-FullL2-independent-consumer`); checkout, original source/Core/consumer/toolchain preflight, frozen Lean/Mathlib restoration, cold/consumer/auditor, and evidence upload **all success**.
- Original pins: Lean 4.34.1; Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`; exact source blob `90432decaa1ea0243aa3f3f573a68a534ffc113c`; independent `FullL2 2` consumer blob `af490d8363742a95c859202d2b70a9e1025c7740`; original `OAI.MathematicalPhysics.BFSS.Core` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
- Exact five immutable file/toolchain pin preflight: `BFSS_SPIN9_OUTLINE_EXPLICIT_DOMAIN_AND_AXIOM_PREFLIGHT_PASS`.
- Cold abstract source build `Build completed successfully (8924 jobs)`; **independently built original `OAI.MathematicalPhysics.BFSS.Core`**: `Build completed successfully (8924 jobs)`, `Core.olean` present.
- Six abstract declarations passed fresh `lake env lean -DautoImplicit=false -DwarningAsError=true`, plus three separate original-`FullL2 2` typed consumer declarations in a separate Lean invocation. All nine `#print axioms` reports restricted to `{propext, Classical.choice, Quot.sound}`, with no `sorryAx` or compiler `error:` in audited logs.
- Strict positive marker: `BFSS_SPIN9_TOP_DOWN_6_ABSTRACT_3_ORIGINAL_FULLL2_STRICT_GREEN`.
- [Evidence artifact #14195748377](https://github.com/etblink/math/actions/runs/43799204363/artifacts/14195748377), ZIP size 2,319 bytes, GitHub-reported SHA-256 `1df57bc8203ca64bb85ed70beb521b65c143744500a6b8c44633cf2d9161e1ec`. This is the uploaded ZIP digest reported by GitHub, not an independent local rehash.

## Precisely qualified mathematical content

Pure source module `BFSSSpin9AbstractPhysicalOutline.lean`:
1. `charge_norm_eq_of_spin_orbit`: group-orbit charge-output norm equality on an explicitly preserved common domain for a fixed singlet.
2. `charge_basis_norm_eq`: equal charge-output norms for sixteen source-shaped labels when their real spinor basis vectors lie in the same group orbit.
3. `charge_basis_sum_sq_eq_sixteen`: exact sixteen-term norm-square sum.
4. `charge_basis_sq_eq_average`: each individual squared norm equals the sixteen-charge average.
5. `charge_basis_sq_eq_average_of_sphere_transitive`: unit-sphere transitivity and unit-vector basis imply the preceding result.
6. `spin_preserves_gauge_fixed`: commuting *actual Hilbert-space* unitary representations preserve the actual gauge-fixed condition.

Independent source-shaped original `FullL2 2` consumer:
1. `sourceFullL2_singlet_charge_average`, independently typed on `OAI.BFSSQuantum.FullL2 2`.
2. `sourceFullL2_any_two_charge_norms`, independently typed on the same Hilbert carrier.
3. `sourceFullL2_gaugeFixed_spinStable`, separately typed on the same Hilbert carrier.

The abstract theorem is **an implication**, not an assertion that the required Spin(9) unitary, domain-preserving action or original BFSS charge covariance exists. Typing its consumer on `FullL2 2` certifies compatibility of the stated interfaces with the source Hilbert type; it **does not** instantiate the group representation or `Q` with original physical BFSS objects.

## Remaining original physical source obligations, priority-ordered

**P1 — physical representation:** construct/qualify genuine `Spin(9) →* (FullL2 2 ≃ₗᵢ[ℂ] FullL2 2)`, including correct Fock-vector implementer, true source bosonic pullback, group law, central signs and source algebraic covariance. Existing `OP3C4/OP3C6A/OP3C6C` supply Clifford and Fock-*operator-algebra* automorphism interfaces but not automatically a Hilbert unitary representation. The source `C48C0` matrix commutation is not yet physical unitary commutation.

**P2 — common domain and charge:** identify an actual common original charge domain `D` invariant under the proposed Spin(9) group and prove real-linear spinor-covariance for the original sixteen normalized supercharges. Native signs, normalization, CAR, and closed-domain equality must remain source-exact.

**P3 — spinor geometry and singlet:** independently qualify Spin(9) unit-sphere/basis orbit transitivity for the actual source real-16 representation (classical geometric fact is not itself a pinned Lean source theorem). Construct a **nonzero** Spin(9)-singlet within the gauge-fixed domain, or explicitly state any downstream result as conditional on its existence.

**P4 — energy/Hardy join:** identify the true original sixteen-charge averaged quadratic form with the regulated/current physical form on an appropriate core and through closure; prove required Hardy estimate and finite energy witness separately. Equal source-normalized charge norms alone do not prove a ground state, energy gap, fidelity lower bound or theory of everything.

**Decision:** keep the qualified abstract package frozen, and research only a **single physically meaningful P1 adapter** next, starting with the real original Fock operator-*automorphism to Fock-vector unitary/adjoint-preservation gap. Do not duplicate the already proved abstract six-theorem chain. Compare against the existing bottom-up equal-norm spinor-square-difference route, which may bypass a global Spin(9) physical unitary. Keep the incidence-to-octonions source bridge as a separate falsifiable construction, not an assumed prerequisite.

## Preserved negative history and branching

- R1 [#43796459069](https://github.com/etblink/math/actions/runs/43796459069): narrow imports omitted `NormedSpace`; [record](SPIN9_ABSTRACT_OUTLINE_R1_RED_43796459069_IMPORT_BOUNDARY_2026_11_15.md).
- R2 [#43797501515](https://github.com/etblink/math/actions/runs/43797501515): one `apply` auto-instantiation mismatch; five abstract theorem reports standard-only; [record](SPIN9_ABSTRACT_OUTLINE_R2_RED_43797501515_TRANSITIVITY_APPLY_2026_11_15.md).
- R3 [#43798301546](https://github.com/etblink/math/actions/runs/43798301546): abstract six source-theorem reports standard-only; missing `Core.olean` blocked independent consumer; [record](SPIN9_ABSTRACT_OUTLINE_R3_RED_43798301546_CORE_OLEAN_MISSING_2026_11_15.md).
- R4 qualifies exact source/consumer **bytes** at tested SHA above. This acceptance receipt is a documentation-only descendant and does not silently claim fresh qualification of its own later commit.
- No modification to `integration/bfss-unified-research-20261108`, the incidence-qualified draft PR #2, or `main`. No auto-promotion or historical evidence deletion.
