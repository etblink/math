# Grok independent review — initial analytical report (historical, partly superseded)

> Research provenance: externally supplied independent mathematical review, 2026-11-07. The vector-line sign and claim that passing to Spin(8) deletes a torus circle are incorrect. See the subsequent corrected report and consolidated memorandum. Keep this historical text for negative knowledge.

---

The perpendicular-word characterization is true, and it does not need a separate eight-dimensional Clifford algebra. The qualified nine-dimensional Cartan theorem does not already prove it. Classical B4-to-D4 interlacing does not transfer until the source torus orientations are locked; a bare group isomorphism `K ≅ Spin(8)` is not enough.

Baseline used: [etblink/math@2b2b4b0](https://github.com/etblink/math/commit/2b2b4b0b3134606b7c54784a147aeae2a5072064) on `research/bfss-original-gamma-faithfulness-20261107`. Gamma-faithfulness run [42408460376](https://github.com/etblink/math/actions/runs/42408460376) is green there. The committed gate note still says “candidate” and contains no acceptance review. The six public theorem statements are treated as the compiler-green interface only. No Lean, CI, or repository change was made.

## 1. Perpendicular-word characterization

Let `Q = source9Quadratic`, the standard sum of squares on `V = (Fin 9 → ℝ)`. Let `e₈ = Pi.single 8 1` and

`W = {v | v 8 = 0} = e₈⊥`.

Let `K = {g ∈ spinGroup(Q) | R(g) e₈ = e₈}`, with `R` the qualified F10BP action. Let `P` be the set of source Spin elements whose Clifford value is `source9CliffordWord l` for a list of `Q`-unit vectors in `W` of even length. Then **`K = P`**. Every such element has a word of length exactly 8. This is a mathematical proof from the qualified source calculus plus Mathlib’s Cartan–Dieudonné theorem on the Euclidean 8-plane. It is not a Lean qualification.

`source9ToEuclidean` is the same-label `WithLp` equivalence, so orthogonality to `e₈` is vanishing of coordinate 8.

### `P ⊆ K` — no new Cartan theorem

Qualified `source9EvenUnitList_lift` sends an even `Q`-unit list to a source Spin element with that exact word and with vector action equal to the ordered product of native hyperplane reflections. A unit normal in `W` is Euclidean-orthogonal to `e₈`, so its Householder reflection fixes `e₈`. An even product does too. The same conclusion is the pair form already proved: one positive Clifford vector acts by minus a hyperplane reflection, so it sends `e₈` to `-e₈` when the vector lies in `W`; two such signs cancel. Odd length would leave `K`.

### `K ⊆ P` — the step C0-A3 does not supply

Let `A` be `source9SpinEuclideanIsometry g`. Qualified determinant transport gives `det A = 1`. If `g ∈ K`, then `A` fixes `E(e₈)`. Set `S = (ℝ·E(e₈))⊥`, an 8-dimensional Euclidean space. `A` preserves the orthogonal decomposition `Euc₉ = S ⊕ ℝE(e₈)` and acts as the identity on the line, so the restricted isometry `A_S` has determinant 1.

Apply Mathlib `LinearIsometryEquiv.reflections_generate_dim` on `S`, not on `Euc₉`. The resulting normals lie in `S`. Delete zero normals before testing parity, as in C0-A3: a zero normal is an identity factor and would make the sign `(-1)^length` meaningless. Each remaining unit hyperplane reflection has determinant `-1`, so determinant 1 forces even length. Length is already at most 8.

The ambient Householder reflection in the same normal restricts to the `S`-reflection and fixes `E(e₈)`. The ordered ambient product therefore equals `A` on `S` and on the line, hence on `Euc₉`, provided the list keeps Mathlib’s order. That order is prepend-on-induction, `φ = ρ * (rest)`, which is the order already matched by `source9EvenUnitList_lift`. Reversing the list produces the inverse orthogonal map and the two-sign fiber will miss `g`.

Pull the normals back by `E.symm`. They are original `Q`-units with coordinate 8 equal to 0. The even-list lift produces `h ∈ P` with the same vector action as `g`. Qualified F10CU, through `source9Action_eq_iff_two_sign_fiber`, gives `g = h` or `g = (-1) h`. Pad with pairs of `e₀ ∈ W` before negating the first factor, exactly as qualified `source9Spin_exact_eight_list`. Negation preserves `W` and `Q`. The empty-list and both central signs are covered because the padding vector is index 0, not index 8.

Thus no `CliffordAlgebra` of `W` is constructed. Words are products in the existing nine-dimensional algebra. An inclusion `Cl(W) ↪ Cl(V)` is a different and longer identification; it is not an `equivOfIsometry`, and it is not needed for `K = P`.

### Refutations that failed

- A bad factorization does not refute the existential claim. The identity is `H_u H_u` for `u = e₈`, with normals outside `W`, and it is also the empty word, or `(e₀ e₀)⁴`. Existence only requires one `W`-word.
- The strict stabilizer is `R(g)e₈ = e₈`, not `±e₈`. The negative coset has determinant `-1` on `W`, so it is not a product of an even number of `W`-reflections. Gamma covariance sends it to anticommutation with `γ₈`, which the green commutant criterion correctly excludes.
- The two-sign correction does not leave `K`. Both signs have the same vector action.
- Padding and sign absorption do not leave `W`, but only because the qualified padding vector is `source9CoordinateVector 0`.
- Pair order is not a free convention. It is fixed by `source9UnitVectorPairSpin_eq_native_hyperplane_pair`.

### The real obstruction to citing existing theorems

`source9Spin_sourceUnitCartan_le_eight` is only an existential statement over nine-dimensional normals. Its proof calls Mathlib on `Euc₉`. The algorithm would in fact choose normals in `S`: it takes a vector orthogonal to the fixed subspace, and that complement sits inside `S`. The statement does not record the invariant, and some other factorization need not. **Black-box reuse of C0-A3 is invalid.** The new content is the support-preserving, order-preserving restriction to `S`, followed by the already qualified lift, fiber, and padding.

## 2. What may be called Spin(8), and what may not

`K = P` is the source-exact stabilizer. Calling it Spin(8) requires three further identifications. Only the first is a definition; the other two are the actual branching bridge.

**Not required.** Mathlib `spinGroup` of `Q|W`, an inverse equivalence with a global Spin(8) model, F10X even-Clifford injectivity, a Spin(48) cover, or a Fock-vector lift.

**Required before interlacing is applied to source isotypics.**

1. **The same four circles, inside `K`.** For `j = 0,1,2,3`,
   `cⱼ(t) = source9PlaneSpinCurve (2j) (2j+1) t`.
   Both factors lie in `W`, so `cⱼ(t) ∈ K`. Qualified F10BI gives
   `cⱼ(t) = cos(t/2) + sin(t/2) e_{2j} e_{2j+1}`
   and gamma image `cos(t/2) I + sin(t/2) γ_{2j} γ_{2j+1}`.
   At `t = 2π` the value is `-1`, not `1`. At `t = 4π` it is `1`.

2. **One orientation identity. This is the hidden sign.** Qualified F10BS says the derivative of the vector-matrix curve at 0 is `coordinatePlane9 r s = E_rs - E_sr`. That sends `e_r ↦ -e_s` and `e_s ↦ e_r`, i.e. rotation by `-t`, not by `+t`. The spinor curve multiplies the `+i` eigenvector of `γ_r γ_s` by `e^{+i t/2}`. Define `εⱼ` from this source curve so that this spinor line has weight `+1/2` and the complex vector line `e_r + i e_s` has weight `-1`. A textbook sentence that assigns both plus signs to `e_r + i e_s` does not match this rotor. Simultaneous reversal of a plane flips that coordinate in both representations and is harmless after dominant coordinates are restored. A relative sign, or a triality swap of the vector representation with a half-spinor, changes the meaning of `λ₂` and is not harmless.

3. **Central characters, which separate the three 8-dimensional representations.** Let `ω = e₀e₁e₂e₃e₄e₅e₆e₇` in that order. The qualified reflection calculus gives `R(ω) = diag(-I₈, +1)`. In particular `ω ≠ ±1`, because those two act as the identity on vectors, and `ω ≠ -ω` by the qualified distinctness of the two-sign fiber.

| Element | Action on `(W, e₈)` | Gamma image |
| --- | --- | --- |
| `1` | `(+I, +1)` | `+I` |
| `-1` | `(+I, +1)` | `-I`, green `source9NegativeCentral_gamma` |
| `ω` | `(-I, +1)` | `-γ₈` |
| `-ω` | `(-I, +1)` | `+γ₈` |

The last two gamma images are an independent matrix calculation on the explicit signed-permutation gammas, not a Lean theorem: `γ₀⋯γ₇ = -γ₈` and `γ₀⋯γ₈ = -I`. They should not be cited as qualified. The vector column of the table is source calculus and is enough to keep the representations apart: on the vector representation `-1` acts by `+I` and `ω` by `-I`; on the gamma representation `-1` acts by `-I`.

`ω` commutes with every even `W`-word, because it anticommutes with each vector of `W` and therefore commutes with products of even length. So these four elements are central in `K`. That is the Klein center, seen inside the source group, still without constructing `Cl(W)`.

Green `source9SpinGamma_fixes_iff_commutes` rewrites `K` as the set of source elements whose gamma image commutes with `γ₈`. Qualified `originalGamma8_eq_diagonal` splits that commutant into the coordinate blocks `SpinIndex < 8` and `≥ 8`, each of cardinality 8. Commutation preserves the blocks. It does not identify them with half-spinors.

The same external matrix calculation shows that it does, for this explicit representation. The operators `Bⱼ = γ_{2j}γ_{2j+1}` satisfy `Bⱼ² = -I`, commute, and commute with `γ₈`. The joint eigenvalues of `-i Bⱼ` are all 16 sign patterns `s ∈ {±1}⁴`, each of rank one. The weight is `sⱼ/2`. The `+1` block of `γ₈` is exactly the odd-parity patterns; the `-1` block is the even-parity patterns. These are half-integral weights, not the vector weights `{±εⱼ}`. Hence neither block is the vector representation, and the two blocks are the two chiralities. Swapping the blocks flips the sign of `ν₄` only. The interlacing rule uses `|ν₄|`, so that swap does not change the exclusion inequality. Replacing either block by the vector representation would.

Irreducibility of each block under all of `K` was not reproved. Multiplicity-free torus weights make it a finite generation check, and it is classical once the torus is the standard one. It is not the lemma the general branching rule depends on.

## 3. What of B4-to-D4 actually transfers

The exclusion memorandum’s interlacing argument is a Weyl-alternant count for the standard embedding of root systems: positive roots `εᵢ±εⱼ` and, for B4, also `εᵢ`, with the stated dominant chambers. Its conclusion

`λ₁ ≥ ν₁ ≥ λ₂ ≥ ν₂ ≥ λ₃ ≥ ν₃ ≥ λ₄ ≥ |ν₄|`

matches the usual rule, including both half-integral lattices and both signs of `ν₄`. This audit did not re-expand every determinant identity. The argument is classical and can remain classical.

It applies to a source isotypic component only after the source torus is this torus. The deleted circle is a plane meeting axis 8, such as `(7,8)`. Its generator moves `e₈`, so it is absent from `K`. The four surviving circles are the D4 torus, and the deleted simple root is the short B4 root. That is the standard embedding, not a triality embedding.

A proof that exports only “`K` is some Spin(8)” does not license the inequality. Outer automorphisms of D4 permute the vector representation and the two half-spinors. The source objects that prevent that permutation are already present, if they are actually used:

- transverse vectors transform by `R|W`, on which `-1` is trivial and weights are integral;
- the 16 transforms by `S|K`, on which `-1` is `-I` and the weights are all `(±1/2)⁴`;
- both are computed on these same four source curves, with the sign in section 2.

No global Clifford equivalence is required for that comparison. A character computation or an abstract replacement spinor would not be a substitute for the sign check.

The operator-column bound `M = 12` is not a corollary of the stabilizer theorem. The explicit 16 spinor weights are consistent with the input used to derive `M = 12`, but the induced action on the original complex operator algebra is still not a source theorem. Compactness of the source group does not identify highest weights. Nothing here restores the false thresholds `M = 6` or exclusion for type `(24,18,0,0)` on operator columns.

## 4. Dependency map

| Input | State at `2b2b4b0` | Use |
| --- | --- | --- |
| `Q`, same-label Euclidean bridge, pair reflection calculus | Qualified, C0-A1 | `W`-normals fix `e₈`; pair order |
| Orientation `det R(g) = 1` | Qualified, C0-A2 | Even length on `S` |
| Nine-dimensional unit Cartan list | Qualified, C0-A3 | Technique and zero-removal only. Not a `W`-support witness |
| Even-list lift, F10CU fiber, exact-eight padding by `e₀` | Qualified, C0-A4a–c | Word, sign, length 8 |
| F10BI rotor and F10BS velocity | Qualified interfaces | Torus and orientation bridge |
| Gamma covariance and F10CU | Qualified | Already used by faithfulness |
| Six gamma-faithfulness theorems | CI green, run 42408460376; acceptance note not committed | Commutant form of `K`. The file itself says this is not a Spin(8) identification |
| `originalGamma8_eq_diagonal`, eight-and-eight multiplicities | In the faithfulness ancestor closure | Names the two 8-dimensional blocks |
| Mathlib `reflections_generate_dim` at `d13f23b` | External library theorem | Applied on `S`, in prepend order |
| `γ₀⋯γ₇ = -γ₈` and the 16 joint weights | External matrix calculation performed for this audit | Half-spinor check. Not Lean |
| `Cl(W)`, root datum, branching, operator action | Absent | Not implied by the rows above |

## 5. Smallest Lean gate

One equivalence, with no `Spin(8)` symbol and no new Clifford algebra:

```lean
source9Axis8Stabilizer_perpendicularWord (g : spinGroup source9Quadratic) :
  source9SpinVectorRepresentation g (source9CoordinateVector 8)
      = source9CoordinateVector 8
    ↔ ∃ w : Fin 8 → (SpaceIndex → ℝ),
        (∀ i, source9Quadratic (w i) = 1) ∧
        (∀ i, w i 8 = 0) ∧
        (g : CliffordAlgebra source9Quadratic)
          = source9CliffordWord (List.ofFn w)
```

The proof must rerun Cartan–Dieudonné on `S` or thread the fixed-space invariant through the existing induction. It must not rewrite C0-A3’s statement. Gamma faithfulness is not an import of this algebraic gate.

Independent consumers:

1. Identity and `-1` satisfy both sides, with explicit `e₀` words.
2. `e₀e₁` satisfies both sides; `e₀e₈` satisfies neither and sends `e₈` to `-e₈`.
3. `c₀₁(t)` satisfies both sides for every `t`. `c₀₈(t)` does not, except at periods where it is `±1` and the word can be rewritten inside `W`.
4. Negating one vector of a perpendicular word stays inside the witness set.
5. A `W`-word’s reflection product fixes `e₈`, tested on the easy direction alone.
6. Regression: the old exact-eight theorem still permits a nonzero 8th coordinate for a general source element. Do not strengthen it.
7. Regression, not a new proof: green commutant criterion at `v = e₈`, including the already specified pairs `e₀e₁` and `e₀e₈`.
8. Optional and separate: `ω` fixes `e₈`, lies in neither central sign, and `R(ω)` acts as `-I` on `e₀`.

Axiom policy stays `propext`, `Classical.choice`, `Quot.sound`. A red build is a qualification failure, not a counterexample to section 1. A witness list whose reflection product is the inverse, or a parity test taken before zero removal, falsifies the formalization even if the mathematics is true.

## 6. What stays classical

Keep classical, and do not encode yet: the Weyl-alternant interlacing proof; maximality of this four-plane torus; half-spinor irreducibility; the oscillator identification `Symⁿ(ℂ⁸⊕ℂ⁸)`; and the whole-sector exclusion argument, under an explicit hypothesis that its `εⱼ` are the source circles of section 2. The finite identity `γ₀⋯γ₇ = -γ₈` can be a later `decide` certificate if the half-spinor blocks are promoted to source theorems. It is not part of the stabilizer gate.

New Lean that is actually justified is narrow: the perpendicular-word equivalence, then one orientation consumer relating F10BS’s `E_rs - E_sr` to F10BI’s `γ_r γ_s / 2`. A second Clifford algebra, a root-datum library, or another numerical weight census would not discharge the transfer.

No physical coercivity, closed-domain identity, or eigenvalue existence is proved or claimed.
