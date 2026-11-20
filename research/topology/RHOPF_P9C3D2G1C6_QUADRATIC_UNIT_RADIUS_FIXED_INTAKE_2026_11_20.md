# RHOPF-P9C3D2G1C6 — original Q-unit radius and fixedness strict intake

**Pacific date:** 2026-11-20.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Qualification status:** UNQUALIFIED until native original source and independently imported consumer strict GREEN.

## Accepted source context

G1C5 strict [#44698572921](https://github.com/etblink/math/actions/runs/44698572921), exact tested `14ab7c82d3fa6892346ac3808caa7bafc23fe868`, accepted at commit `b3fcf9b1506a106bc2f1cc8c61d3bc3aaa91da1a`. G1C5 certifies `r(x)^2 = Q(x)` and `Q(r(x)⁻¹ • x) = 1` for all nonzero source-coordinate x. G1C0 establishes the actual source Gamma9 projector range continuous linear real-four model; G1C1/C2/C3/C4 establish source-transported Q positivity, Q continuity, radius continuity/positivity and exact quadratic homogeneity.

## New bounded native proof obligations

Four exact declarations in the same source, with one separately imported consumer per declaration:
1. `relationalRangeCoordinateDotSelf_zero : Q(0)=0`, directly by accepted scalar quadratic homogeneity with `t=0`.
2. `relationalRangeCoordinateDotSelf_one_ne_zero : Q(x)=1 → x≠0`, using the first theorem and `0≠1`.
3. `relationalRangeCoordinateRadius_eq_one_of_dotSelf_eq_one : Q(x)=1 → r(x)=1`, by the accepted radius definition and pinned `Real.sqrt_one`.
4. `relationalRangeCoordinateInvRadius_smul_fixed_of_dotSelf_eq_one : Q(x)=1 → r(x)⁻¹ • x = x`, by replacing r with one and simplifying.

These are algebraic inverse-side facts only. A later bounded gate must construct continuous radial normalization on the source nonzero coordinate subtype, its inverse, and separately compare its Q-unit level set with the standard **dot-one real-four sphere**. It is incorrect to assume an arbitrary coordinate equivalence is isometric or a Pi sup-norm sphere is the standard Euclidean sphere. No standard `S³` homeomorphism or Hopf action/quotient or physical Fock implementation is claimed here.

## Strict workflow acceptance

Exact frozen BFSS/Gamma9, projector/Circle and source-qualified G0A/B/C, G1A/B/C0/C1/C2/C3/C4/C5 original hash pins, source-independent Gamma9 integer fixture, new native and consumer exact blob pins; pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; `-DwarningAsError=true` native and independently imported consumer, strict axiom allowlist limited to `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`; original CI ZIP SHA256 independently checked against upload log and embedded exact tested commit. No proof-budget increase, alternate projector, original mathematical source rewrite, history deletion or change to `main`.
