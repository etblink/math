# Project Lead — V8I source-native L bracket transport and universal all-indices plan

**Research date:** 2026-10-30 PDT; CI reports may use 2026-10-31 UTC.

**Status:** V8H accepted at exact tested `030196c9f7dfb4b361e582fa290a4d6c804864ed`; V8I candidate and two CI launch attempts **NOT YET QUALIFIED** at time of writing. Never infer V8I theorem acceptance from a workflow trigger, the earlier accepted K identities, or finite arithmetic checks.

## Accepted ancestor evidence

- V8A original source 48-label skewness and square: 2 roots.
- V8B original distinct adjacent bracket, V8C four-distinct disjoint bracket, V8D orientation swap, V8E shared-right, V8F shared-left, V8G cross-right: 6 roots.
- V8H zero-diagonal `L` interface: 3 roots, [strict green #41160260904](https://github.com/etblink/math/actions/runs/41160260904), exact source blob `8aa93c41a83164e3a99eca139de477d82842d589`, artifact `13026937737`, SHA256 `a50e9bbf4dfcf1733073b33fa31c635db044e6aef6dc984ce4b56ba13f15da31`.
- **Total accepted V8A–H = 11**.

## Critical mathematical distinction

The original `K(r,s) = originalPairedPlane r s` uses the actual original paired-Fock 48-real index `Source48Label` and exact source `FCP.BFSSGamma9.gamma`. Its diagonal is `K(r,r)=-I` because `gamma_r^2=I`. Therefore **the universal so(9) bracket is false if one identifies raw K with a zero-diagonal antisymmetric coordinate basis**.

The accepted V8H interface is the literal original-label:
```lean
def L (r s : SpaceIndex) : Matrix Source48Label Source48Label ℝ :=
  if r = s then 0 else originalPairedPlane r s
```
(In the actual Lean source the name is `zeroDiagonalPairedPlane`, not `L`.) V8H certifies `L(r,r)=0`, `L(r,s)=K(r,s)` for `r≠s`, and `L(s,r)=-L(r,s)` with **no distinctness requirement**.

## V8I source-exact next bridge and immutable CI distinction

Candidate: `SU2BFSSPairedSpin9ZeroDiagonalBracketsProbe.lean` blob `d9c453029eed5ffba4d498bb333a9d5302261aa3`, defining **five proposed** typed roots on L: adjacent, disjoint, shared-right, shared-left, cross-right. Proof bodies each `simpa only [zeroDiagonalPairedPlane_of_ne ...]` from the corresponding separately strict-accepted K theorem.

- First attempted V8I [#41161039741](https://github.com/etblink/math/actions/runs/41161039741), workflow SHA `5af4dd80114c4842ac1b23c9fc2a6d1e9115aa38`. Its preflight source anti-admit regex was double-escaped; it still had source blob pins and strict independent axiom gates, but this is not the intended final validator.
- Corrected V8I [#41161070164](https://github.com/etblink/math/actions/runs/41161070164), workflow SHA `c9a2640d581a9a83a9943c04bc52aac5dc16ea3e`, fixes the anti-admit regex to use actual Python regex boundaries, no change to the proposed Lean source/theorem blob. The workflow uses immutable original gamma, V8A–H and source pin checks, fresh `-DwarningAsError=true` compilation and five independent kernel-type examples, plus exact name + allowed axiom audit and preserved artifact. **Full acceptance remains pending terminal green evidence**.
- Never call a queued/running job or preflight alone a passed strict theorem.

## Target universal bracket and fixed sign

Define the standard bracket `[A,B]=A*B-B*A` on source-original 48-label matrices. The **proposed** four-index algebra identity is:

```text
[L_rs,L_tu] =
    2 ( δ_(s,u) L_(r,t)
      - δ_(s,t) L_(r,u)
      + δ_(r,t) L_(s,u)
      - δ_(r,u) L_(s,t) )
```

Each `δ_(a,b)` means the *typed* `if a=b then 1 else 0` scalar. The first, second, third and fourth nonzero singleton cases reproduce respectively accepted shared-right `+2K_rt`, adjacent `-2K_ru`, shared-left `+2K_su`, cross-right `-2K_st`. Four distinct indices give zero.

**Independent negative/control test:** the actual pinned `SU2RealGammaProbe.lean` contains literal integer signed-permutation `perm` and `sign` tables for 9 symmetric 16×16 gammas. Computing `K_rs=-(gamma_r gamma_s)` for distinct `r,s` and zero for equal pair, then comparing 16×16 integer entries of the complete L bracket against the RHS for every ordered `(r,s,t,u)` in `(Fin 9)^4` found **6561 of 6561 matches, zero mismatches**. The 48-label construction is a common color identity/Kronecker extension and a genuine reindex equivalence. This finite arithmetic validates the proposed **sign and factor** but **does not establish** the Lean root, a group representation, or a physical result.

## Case structure needed in Lean — source-exact and bounded

1. Reduce `r=s` or `t=u` by the V8H diagonal theorem; the RHS must cancel in opposite-sign pairs. Do **not** try to use raw K on the diagonal.
2. Under `r≠s` and `t≠u`, isolate same-oriented `r=t ∧ s=u` and reversed `r=u ∧ s=t` pairs. Both brackets vanish by self-commutation or antisymmetric orientation; RHS terms vanish because they target diagonal L.
3. Exactly one shared endpoint: use the corresponding V8I transferred bracket, provided it passes strict qualification, and reduce other delta terms using explicit inequalities. Never assume implicit equalities between the native Fock basis and color-major order.
4. All four indices distinct: use V8I transferred disjoint bracket.
5. Only after cases are kernel-checkable: assemble one source-original four-index theorem using explicit real scalar/Matrix field bridges. Prefer `by_cases` / `simp [if_pos, if_neg]` with named equality hypotheses to deep unfolding or inflated maxRecDepth/maxHeartbeats.
6. Preserve exact theorem statement, independent checker of its type and declaration axioms, immutable tested Git SHA/source blob and red diagnostics. No universal `so(9)` claim before successful strict proof.

**Scope guard:** a universal matrix bracket, if ultimately qualified, would be an algebraic representation interface on the original 48-real space. It would **not alone** establish a Lie-group homomorphism, continuous global Spin(9)→Spin(48) lift, Majorana Fock operator action, SU2 gauge covariance, topological covering, or positive BFSS state.

**Owner governance:** no edits to accepted V8A–H blobs, FCP provenance, `main` or upstream mathcommunity; no external PR without explicit owner permission.
