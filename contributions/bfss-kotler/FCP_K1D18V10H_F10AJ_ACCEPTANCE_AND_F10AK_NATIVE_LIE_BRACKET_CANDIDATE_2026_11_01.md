# F10AJ accepted; F10AK native so(16) ordered-chain bracket candidate

Date 2026-11-01. Authorized owner research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`. Parent SHA `e9094a2399c4c52853877bcd3c8e62c0e6a5b1f2`.

## F10AJ accepted exact native Lie-subalgebra bridge
[Strict run #41350070708](https://github.com/etblink/math/actions/runs/41350070708) SUCCESS at parent, attempt 1. Exact original gamma/F10E/F10AI source hashes, frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AI rebuild, warnings-as-errors compiler and THREE independently elaborated source-exact declaration/axiom audits passed. Marker `V10H_F10AJ_THREE_NATIVE_SO_BRIDGE_TYPES_AXIOMS_PASS`, only `propext`, `Classical.choice`, `Quot.sound`, no sorryAx. [Artifact #13101237975](https://github.com/etblink/math/actions/runs/41350070708/artifacts/13101237975), ZIP SHA256 `60a0e250bacfd086483b7ee5f578746da3409498552f44422efde44d57bc5b2b`.

F10AJ qualified: all original 36 canonical gamma pair products (a<b) are skew-symmetric, belong to the actual native `LieAlgebra.Orthogonal.so SpinIndex ℝ` (SpinIndex=Fin16), and are `LinearIndependent ℝ` there. This is NOT a LieHom or Lie algebra isomorphism.

## F10AK unqualified original gamma ordered-chain bracket scope
The pinned Mathlib Lie algebra bracket on associative matrices is the matrix commutator `x*y-y*x` (Mathlib/Algebra/Lie/OfAssociative.lean `LieRing.of_associative_ring_bracket`), inherited exactly by the native orthogonal LieSubalgebra (Mathlib/Algebra/Lie/Subalgebra.lean `LieSubalgebra.coe_bracket`). Test three source-defined declarations for all a<b<c, without altering source gamma tables:
1. Reverse word product: `(γbγc)(γaγb) = -γaγc`. Show through THREE original gamma anticommutations and γb²=1.
2. Matrix commutator: `(γaγb)(γbγc)-(γbγc)(γaγb)=2•(γaγc)` as exact ℝ-matrix identity.
3. Same identity in ACTUAL native so(16,R): `⁅source9OrderedGammaPairInSo(a,b), source9OrderedGammaPairInSo(b,c)⁆ = 2•source9OrderedGammaPairInSo(a,c)`.

The factor of 2 is the real matrix commutator normalization; it must not be guessed or hidden. Do not call this a full source so(9) LieHom: all bracket cases and the source `so(9)` basis-alignment map remain open. Full 256 even original gamma PBW word independence, Clifford injection, global Spin9/Spin48 lift, Fock action and BFSS physics remain open.

Strict gate pins original source gamma, F10E/F10AJ and candidate blobs, frozen Lean/Mathlib, rebuilds accepted F10AJ ancestry, fresh warnings-as-errors compiler, independently elaborates exact THREE types and root axioms, archives SHA/artifacts. No new axioms/admit/sorry, old source mutation, resource-limit increase or upstream PR/main merge. Gate 1 failure is evidence, not license to weaken theorems.
