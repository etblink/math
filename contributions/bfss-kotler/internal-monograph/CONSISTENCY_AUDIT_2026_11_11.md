# Edition 0.6 — cross-chapter mathematical consistency and onboarding audit

**Date:** 2026-11-11 (Pacific)  
**Review scope:** all 17 mathematical and prospective chapters, three LaTeX appendices, primary `Core.lean`/`DeformedCharge.lean` normalizations, 37-record source atlas, and historically qualified FCP → math evidence.  
**Scientific status:** internal editorial/source-logic audit. **No new Lean theorem or independent physical claim** is accepted here.  
**Source baseline:** `etblink/math@d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5`; monograph parent `75c589ecb65218bbd274416976270806b4979894`.

## Closed editorial findings in edition 0.6

| ID | Finding, check, and correction |
| --- | --- |
| E01 | **No scientific introduction:** Chapter 1 had three placeholder headings. Replaced with a complete expert introduction that defines the original fixed-SU2 research target, exact physical Hamiltonian provenance, positive point spectrum versus whole-space mass gap, three proof chains and explicit bridge obligations. |
| E02 | **Historical BFSS interpretation:** explicitly distinguished the 1997 Banks–Fischler–Shenker–Susskind *large-N* M-theory conjecture from the mathematical N=2 relative quantum system. Neither 9 spatial labels nor 27 configuration components is an asserted 11D spacetime identification. |
| E03 | **No source-exact notation appendix:** wrote one with primary `Core.lean` and `DeformedCharge.lean` normalization authority: theta CAR delta-one, spatial gamma CAR delta-two, gammaTwo half-commutator, source color bracket, ordered charge term, core form 1/16, kinetic term 1/2, and true L2 carriers. |
| E04 | **Vector/operator carrier confusion risk:** explicitly separated `Fermion 2`, `FullL2 2`, finite `End(Fermion 2)` and the auxiliary operator-valued L2. The proposed first Spin weight 6 (vector) and conditional bound 12 (endomorphism) are not interchangeable. |
| E05 | **Physical closed-domain bridge:** stated historical `H=(1/16)T†T` with its natural domain, distinguished the historical BA–BH acceptance from its current integration port, and distinguished that domain from weighted-gradient Sobolev triple closures. |
| E06 | **Auxiliary normalized field ambiguity:** source NORM0C's quadratic Gram numerator / `(1+trace)` remains different from the original unnormalized linearly growing fermionic field in the massless energy identity. Pointwise `MemLp` and representative-safe class output are not silently promoted into a new bounded continuous-linear `FullL2` multiplier. |
| E07 | **Pending proof optimism:** kept the atlas N-05 exact D1-B candidate at `PENDING_STRICT_GATE`; `#43095354808` was still queued when checked for this review. Current tree contains declarations, but that does not qualify the pending gate. |
| E08 | **Overbroad physical import:** the source 48-label Spin9/SU2 commutator, original operator-star and trace results do not alone construct a continuous source Fock-vector unitary, gauge-unitary fixedness, the sixteen-charge intertwiner, reducing-sector action, or a spectral theorem. |
| E09 | **Unification numerology:** full SU2 adjoint colors mix, so naive three gauge-invariant rank-one family labels fail; real spatial Spin9 and complex internal chiral Spin10 sixteen carry different physical meanings; Hopf eigenspace descent needs genuine gauge equivariance. All unification claims remain prospective. |
| E10 | **Negative knowledge access:** replaced empty appendix with scoped obstructions and operational failure classes (central sign, projective scalar ambiguity, operator vs vector weights, valleys, family labels, Hopf descent; separately template/API/linter CI errors). |
| E11 | **Broken internal refs/layout in first new compile:** corrected a missing Chapter 9 ref, replaced a too-wide conceptual equation, and shortened a running header and long source path. Final compilation resolves all labels and has zero overfull boxes. |
| E12 | **Stale companion files:** synchronized README, blueprint, editorial queue, build notes and atlas editorial metadata to edition 0.6 while retaining historical release records and 37 source-evidence statuses. |

## Retained hard mathematical boundaries

1. **Historical operator identity** (FCP BA–BH) is not current-source strict qualification after port rewrites without a new receipt. Its mathematical statement includes density, closed column, adjoint-square natural domain and weak form.
2. **Spin9 stabilizer geometry** is substantially qualified: compact/path-connected source axis stabilizer, two-fold original source covering, and `H ≃ SO8`. A source-bound vector-compatible Spin8 branching theorem on the relevant physical Fock state space is not automatically a consequence.
3. **Original Fock-operator star and trace** survive with exact original `End(Fermion 2)` carrier. `StarAlgEquiv` and Hilbert–Schmidt algebraic isometry do not produce a correctly normalized continuous global Fock-*vector* implementation.
4. **Original gauge action** on 48 labels and accepted one-sided gamma compatibility are not by themselves a proof of commuting gauge-implementing Fock unitaries or Hamiltonian covariance.
5. **Massless energy identity** is a qualified original source-generic core expression. The sharp `8√3‖X‖` unnormalized fermion estimate and the concrete high-type **physical** coercivity are still conditional/open as stated.
6. **First-moment compactness** is proved for generic smooth-core/weighted-closure assumptions. The physical Hamiltonian's form-domain embedding and moment/gradient estimates must be source-typed and newly proved before spectral promotion.
7. **Oscillator exclusion** with `λ₂>m+12` is conditional on the original operator-valued isotypic action and suitable Spin8 restriction. The potentially sharper `m+6` uses the *different* proposed original Fock-vector implementation and cannot be substituted.
8. **Positive point spectrum** in a reducing original physical sector remains open; it is not equivalent to a positive gap of the full spectrum. No unification, physical generations or gravity mechanism has been derived.

## Mechanical and visual checks

- `python3 tools/audit_manuscript.py`: **39/39 checks pass** (imported chapters and appendices, duplicate/missing labels, 37 atlas record IDs and status invariants, selected source normalization/qualification boundaries).
- Offline `latexmk -pdf`: **88 pages, zero LaTeX warnings, zero overfull lines, zero unresolved labels** after multiple local runs; original mathematical/Lean source and frozen CI unchanged.
- Rendered and visually inspected front matter, newly written Chapter 1, the FCP historical appendix, notation table, gamma/CAR equations and negative-knowledge appendix. No obvious clipping or overlap in the inspected pages.
- **Limit:** neither automated checks nor a local LaTeX build independently establish physical correctness, completeness of conventional proofs, a formal theorem, or the truth of any prospective physical interpretation. These are source-and-editorial review checks only.

## Outstanding peer-review queue before editorial fast-forward

- Independently inspect the displayed original supercharge, fermionic field and Pauli wedge identifications against exact concrete `AlgebraData 2` instance and source orientation; don't infer these from the generic energy identity alone.
- Independently review the full BA–BH natural-domain and weak-form exposition, including source imports changed during integration.
- Review exact source Spin8 intertwiner, active original Fock-vector lift and all sixteen charge covariance/domain consequences; these remain open mathematics.
- Verify in-depth the conditional oscillator exclusion proof and exact `λ`-sector nonemptiness against the *same* actual physical source.
- Future mathematical theorems and experiment-linked unification ideas must be added only with their own evidence status and new tested receipts.

**Project Lead decision:** Edition 0.6 is suitable as an **internal expert-onboarding review draft**, not as a mathematically final external monograph. Continue using the dedicated monograph branch. Do **not** fast-forward unified solely on a clean LaTeX build; require the owner/editorial review decision and reconciliation against any upstream branch movement first.
