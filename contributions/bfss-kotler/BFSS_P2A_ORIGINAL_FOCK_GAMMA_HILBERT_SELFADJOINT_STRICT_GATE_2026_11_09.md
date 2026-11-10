# BFSS P2a — Original Source48 Fock Hilbert self-adjointness qualification

**Prepared:** 2026-11-09, after accepting OP3-C6C
**Branch:** `integration/bfss-unified-research-20261108`
**Frozen accepted parent:** `c100639972cfee5d4ea7bb788726a3b910303752`
**Source status:** Existing original exact `SU2BFSSSource48FockGammaSelfAdjointProbe.lean` remains **byte-for-byte unchanged** at Git blob `98889cb8607ccc64091165fbca585acb898b9ddc`.
**P2a status:** CANDIDATE pending a **new** strict CI gate with independent original-carrier consumer.
**Toolchain:** Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Purpose

Fresh strict qualification of two original-source proofs:
1. `FCP.BFSSSource48FockGammaSelfAdjoint.sourceNormalizedGamma_selfAdjoint (p : Source48Label)`: the original `√2` normalized 48-label Majorana is physically Hilbert self-adjoint.
2. `FCP.BFSSSource48FockGammaSelfAdjoint.sourceGammaRealLinear_selfAdjoint (v : Source48Vector)`: the active original real-linear Majorana operator is physically Hilbert self-adjoint **for all** real source vectors.

The proof is not changed, redefined, or generalized under an independent substitute representation. The P2a independent consumer checks both source declarations, plus the accepted OP3-C6C `originalFockGammaRealLinear_eq_activeGammaRealLinear` bridge to the original M3I donor for all real source vectors. Its imported source and consumer must compile cold under actual pinned `Fermion 2 →L[ℂ] Fermion 2` and original `Source48Vector`.

## 2026-10-27 first red and exact forensic lesson

Historical [Run #40595038658](https://github.com/etblink/math/actions/runs/40595038658), source commit `ee4b9b2478f6172a7b1571eb8d081a509300cd55`, **FAILURE**. Its exact source hash, original normalized gamma hash, scalar bridge and source real-linear gamma hashes passed preflight; pinned Lean/Mathlib and source ancestry compiled; the target source file compiled and printed **both expected exact axiom reports with only `propext`, `Classical.choice`, `Quot.sound`**. The verifier itself crashed in Python `re.findall` with `re.error: unbalanced parenthesis at position 47`, from an incorrectly escaped regex embedded in a YAML shell/Python heredoc. Thus the red is **a script parsing error after successful Lean elaboration**, not a failing Lean self-adjointness proof. Nonetheless a complete green source/independent-consumer strict gate was absent; the source is not accepted by inference from the diagnostic output.

**Repair philosophy:** do not modify the original Lean proof or its `set_option maxHeartbeats 320000`. Instead build a new independent original-carrier strict workflow with correct Python regex literals (one backslash in raw regex, verified against the actual frozen source), an independently typechecked consumer, and an exact two-root axiom collector with reports from BOTH source and consumer. Keep warnings-as-errors, forbid `sorryAx` and additional axioms, and retain source bytes and diagnostics. New proof files may not increase the resource budget.

## Accepted C6C context and exact qualification receipt

[Run #42728268316](https://github.com/etblink/math/actions/runs/42728268316), tested commit `675bd7b90bf481848f905a2eba610f704c47ada3`, job `129539411206`, completed **SUCCESS**. 37 frozen source/consumer Git blob pins passed; pinned cold build; independent consumer and exactly two allowed-axiom root reports passed. [Artifact #13724446609](https://github.com/etblink/math/actions/runs/42728268316/artifacts/13724446609); GitHub-reported archive SHA256 `48346c7ea692f41e41a56c82d5ecb153fbc116abea751ed31712a7643ba54a7f`, not independently downloaded.

C6C proves equality `originalFockGammaRealLinear = sourceGammaRealLinear` as exact original real-linear Fock operator maps, and exact source Spin(9) automorphism covariance on all active normalized Majoranas. This remains **algebraic operator covariance**, independent of the physical adjoint proof being qualified here.

## Frozen inputs and acceptance controls

Reuse the **37 exact frozen source+consumer Git blob pins** of the accepted C6C gate; add four input blobs absent from that manifest: original normalized `Source48` Fock gamma `7abc03723b3111e4a03389b722054e50d6a9bf30`, original real-to-complex continuous operator scalar bridge `a02f767ebf1f569302e27676b8d426850db37af1`, original self-adjointness proof `98889cb8607ccc64091165fbca585acb898b9ddc`, and the new independent P2a consumer (**41 pins total**). Preserve Lean/Mathlib versions, full source/historical source closure, no hidden original Fock carrier change and no increased imported source proof budget.

Cold build both C6C and the unchanged P2a source, then independently compile the original proof file and new P2a consumer with `-DautoImplicit=false -DwarningAsError=true`. A Python strict audit should check exactly the two source and two consumer root reports, allowing only `propext`, `Classical.choice`, `Quot.sound`; reject `sorryAx`, `Lean.ofReduceBool`, unknown identifiers, compiler errors, unexpected warnings or extra roots, and retain exact commit/pin manifest, logs and typed receipt.

**GREEN → ACCEPT only P2a:** both physical Hilbert self-adjointness facts, their all-real-source-vector carrier and C6C donor crosswalk, **not** the assertion that every original Fock-operator Spin(9) automorphism preserves the adjoint.

**RED → STOP and inspect the first causal log error:** repair only a real source-exact type/interface or workflow issue. The historical parser failure must not be replayed, and a new parent/source change must not be disguised by a pin update.

## P2b forward target, intentionally excluded

For the already-qualified original Fock-operator `AlgEquiv` action `α_g`, prove
```
α_g (star T) = star (α_g T)  for every T : Fermion 2 →L[ℂ] Fermion 2.
```
A valid extension argument must handle real self-adjoint generator covariance, complex-conjugate scalar adjoint, products (reversed order), and the source-exact generation of all operators via M3I. Do not assume that `AlgEquiv` is automatically `StarAlgEquiv`. In pinned Mathlib, `CliffordAlgebra.star_ι` gives **negative** odd generators, unlike the actual physically self-adjoint `sourceGammaRealLinear` values. If P2b eventually proves the physical property, only then package through `StarAlgEquiv.ofAlgEquiv`.

The next independent central-sign, Hilbert–Schmidt, gauge, original physical charge and spectral gates stay open. No unitary vector lift, center parity or mass-gap conclusion is claimed.

## Evergreen provenance

The broader research roadmap remains in `contributions/bfss-kotler/BFSS_OP3_POST_C6_PHYSICAL_STAR_CENTER_GAUGE_FORM_RESEARCH_MEMORANDUM_2026_11_09.md`. The P0 audit also verified independent historical strict green receipts for OP1/OP2a/OP2b/OP2c and F10U/F10V; D2B28 Hamiltonian qualification remains to be independently established before use.
