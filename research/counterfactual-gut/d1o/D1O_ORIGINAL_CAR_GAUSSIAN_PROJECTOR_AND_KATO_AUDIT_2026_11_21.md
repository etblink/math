# D1O — An original-carrier Gaussian projector and Kato-vector route to the physical smooth core

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`. **Source baseline inspected:** `0aa8a3114e8c78679410bc929d85fda61e99ee94` (D1N checkpoint).  
**Disposition:** Source-read **analytic construction**, exact local 3-mode SymPy identities, finite CAR numerical tests through 6 modes, and 6-mode parallel-transport tests. **No new Lean build, CI qualification, literal `SmoothCore 2` certificate, original normalized physical quadratic-form theorem, Weyl/essential-spectrum theorem, hopfion or GUT claim.**

## Executive finding

D1I–D1N left a source-carrier identification problem: the smooth Gaussian covariance was known, but its original `Fermion 2` vector was described by a spatial Spin(48) lift not yet constructed as a source-typed map. There is a shorter route. **Define the rank-one Gaussian projector as a polynomial in the literal original 48 source Majoranas.** Then the CAR itself fixes the Gaussian line, its smoothness, and its covariance under the already-existing source Fock gauge action. The remaining global *vector* phase can be addressed by finite-dimensional Kato parallel transport, using D1M's zero Berry curvature and positive SVD-deck holonomy. This does **not** replace source Lean proofs of the required projector, flat connection, or `TestFunction` construction.

### Exact original-source interfaces

- `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`: `Fermion 2 = EuclideanSpace ℂ (Fin (2^24))`; 27 real `Boson 2` coordinates; `SmoothCore 2` is compactly supported smooth `TestFunction` on boson configuration space; original `coreForm f = (1/16)∑_α‖coreToL2 (charge α f)‖²`.
- `OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean` blob `152204ef15a6569534e0503824a697cb9ae8e4ce`: `pairedTheta` on literal original `Fermion 2` with 48-label CAR `{θ_a,θ_b}=δ_ab` and irreducibility, with 8 paired spin blocks × 3 colors.
- `OperatorDependencies/SU2BFSSG3AAdjointColorRepresentationProbe.lean` blob `553869f1287c64893398c3b79c04fe010023bd08`: real color adjoint matrix `R(g)[output B,input A]` and its group law.
- `OperatorDependencies/SU2BFSSG4AExteriorGaugeActionProbe.lean` blob `141fbe74fc4883f686e05dbc702efb12c6fb8fab`, G4E blob `7247844122ab870d31e92903db4c2ab561f98112`, G4J blob `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`: original exterior second-quantized SU2 color gauge, unitary Hilbert transport into `Fermion 2`, and literal `pairedGaugeData : pairedAlgebraData.GaugeData` with `fermion_adjoint` covariance and exact G4E action.
- `GaugeCore.lean` blob `e4990dadf1d8bde849e351467282ab3f14989c3b`: `physicalSpace = ⋂_g ker(bosonPullback g − fiberAction g)`, and `invariantCore = physicalSpace.comap coreToL2`.
- `SpectralMasslessCoreFormIdentity.lean` blob `3a8dd27bb573e62c8f86b79b83e0ab96f391602a`: original massless source core-form identity, **only on** `SmoothCore`.
- `SU2RealGammaProbe.lean` blob `b9b8192055c70f0d001d7982669b9823c55562ed`: exact original Gamma9 signed-permutation real matrices, checked in D1M.

## 1. Original Majoranas define a polynomial Gaussian ray

Let `γ_a = √2 θ_a`, where `θ_a` denotes source `pairedTheta` relabeled by the original `pairedLabelEquiv` for `a=1,...,48`. Then `{γ_a,γ_b}=2δ_ab I`. Define the real skew covariance by `C_ab = (i/2)⟨[γ_a,γ_b]⟩`, equal to `i⟨γ_aγ_b⟩` when `a≠b`. On the SVD cover, reuse the **actual source-normalized** pure covariance

`C(u,n)=−Γ(u)⊗J(n) − J_pair⊗nnᵀ`, with `C²=−I_48`, `Cᵀ=−C`.

The Hermitian *flattened* quadratic fermion operator acting on the **literal** `Fermion 2` is

`H_C = −(i/4) ∑_{a,b=1}^{48} C_ab γ_a γ_b = −(i/2)∑_{a<b} C_ab γ_aγ_b`.

Because every real orthogonal complex structure can be put into canonical `2×2` skew blocks, the CAR gives (in the corresponding annihilator basis)

`H_C = ∑_{j=1}^{24}(N_j − 1/2)`.

Using the source's irreducible complex CAR carrier of dimension `2^24`, the possible eigenvalues are `−12+k` for `k=0,...,24` and the lowest `−12` is simple. Thus its **exact spectral projector**, without choosing a Spin(48) implementation, is the finite polynomial

`P(C) = ∏_{k=1}^{24} [((k−12)I − H_C)/k]`.

It has `P²=P=P†`, `tr P=1` and `P(C)` depends polynomially (therefore smoothly) on `C`. It is a **source-carrier mathematical recipe** requiring a Lean proof of the CAR normal form/eigenspace uniqueness before qualification. Crucially, a smooth rank-one projector is **not** by itself a globally smooth normalized section.

### Verification A — normalized CAR projector, 1–4 modes

The script `d1o_clifford_projector.py` constructs genuine Jordan–Wigner Fock operators for `m=1,2,3,4` (dimensions 2,4,8,16), generates nontrivial complex Slater orbitals, and checks the sign/normalization of `C`, `H_C`, all eigenvalues, the rank-one projector and equality with `|ψ⟩⟨ψ|`. Maximum `‖P−|ψ⟩⟨ψ|‖_F` is below `6×10^−16`, with allowed numerical rounding. No dense `2^24` array was used.

### Verification B — original 8-particle reference block identity, exactly in SymPy

`d1o_reference_blocks.py` evaluates the original source `Gamma8` spin-pair signs `s_j=(+,+,+,+,−,−,−,−)` as 3-complex-mode CAR blocks. For **both** `s=+1` and `s=−1`, it proves exactly (8×8 matrices):

- local covariance equals `−s I₂⊗J(e₀)−J₂⊗e₀e₀ᵀ` under **original** `(spin parity,color)` labels;
- the intended local occupied state `(c†_1+i s c†_2)|0⟩/√2` is the unique ground vector of the local flattened Hamiltonian at energy `−3/2`;
- the degree-three polynomial projector equals the exact occupied-state dyad, entry by entry;
- the color stabilizer quarter-turn character is `−is`, so all eight block characters combine to `exp(−iθ∑_j s_j)=1` at every angle. The adversarial all-plus pattern instead has `exp(−8iθ)`.

By fermionic CAR block factorization, the formal 24-mode reference ground is the **same eight-particle D1I source seed**, of energy `8·(−3/2)=−12`. This is an analytic deduction from exact local certificates, not a compiled original `Fermion 2` theorem. In particular it does **not** repair D1K1A R1's ill-typed `ColorIndex 2` numerals.

## 2. Gauge covariance from the original theta action, with no new representation

G4J's already-compiled `pairedGaugeData.fermion_adjoint` implements color rotations of the literal source `θ_a`. Write `T_g = I_16 ⊗ R(g)` on original real Majorana labels, with **output color rows**. The source covariance obeys

`C(u,R(g)n)=T_g C(u,n) T_gᵀ`.

CAR covariance then gives the mathematical operator identities

`U_g H_C U_g† = H_{T_g C T_gᵀ}` and `U_g P(C) U_g† = P(T_g C T_gᵀ)`.

These fix the line/projector gauge action **without an additional Spin(48) representation**. They do not fix the unit vector's phase; that is the next step.

### Verification C — actual exterior-power orientation and transposition control

`d1o_gauge_projector.py` implements `U(output,input)` on **three- and four-mode exterior Fock spaces**, and independently tests creation-operator covariance, the associated real-Majorana transform, `C` covariance, `H` conjugation, and `P` conjugation over 16 seeded examples. Max positive-case residual is below `3.3×10⁻15`. Intentionally transposing the color matrix produces at least `0.0506` Frobenius error on the covariance; this prevents silent acceptance of an orientation-reversed gauge implementation.

## 3. Smooth normalized vector by Kato transport, not arbitrary rotor phases

For any smooth path `C(t)` in the pure-covariance parameter space, `P(t)=P(C(t))` is smooth. Define `A(t)=[Ṗ(t),P(t)]` (anti-Hermitian) and solve the finite-dimensional ODE

`U̇(t)=A(t) U(t)`, `U(0)=I`.

Then `P(t)=U(t)P(0)U(t)†`, and `Ω(t)=U(t)Ω_*` is a normalized **Berry-parallel** vector in `ran P(t)`. This is an explicit construction with original-carrier operators, *conditional* on proving path-independent transport globally. Its curvature obstruction is `F(v,w)=i tr(P[∂_vP,∂_wP])`; D1K0/D1M's independent finite-dimensional trace arguments support `F=0` for the 48-Majorana family. Flatness must be proven source-typed before promotion.

The cover `S⁸×S²` is simply connected, so flat parallel transport defines a smooth global unit section there. Since `C(−u,−n)=C(u,n)`, the possible residual descent obstruction is one `±1` holonomy around the `Z₂` deck generator. D1M's exact 24-orbital occupied-subspace calculation gives **`+1`** for a representative deck path. Therefore, at the mathematical finite-CAR level, the vector can descend smoothly to the sign-identified rank-one-SVD base. G4J color conjugation preserves the connection. Coupled with the exactly trivial reference SO2 stabilizer character, this supplies the analytically required color-equivariant phase choice.

**Important:** The projector polynomial by itself does **not** prove Berry flatness or trivial deck holonomy; those are separate input facts from D1M. A global smooth section is not obtained by naive projection of an arbitrary *fixed* Fock vector, since that projection can vanish in some regions.

### Verification D — projector itself reproduces the Fock quantum metric

`d1o_projector_geometry.py` uses a **six-mode** (two Gamma8 source spin-pair signs ±, three colors each) reduced CAR model, dimensions 64×64. It compares direct projector derivatives with the Gaussian covariance formula `g=(1/16)tr(dCᵀdC)`. The spatial tangent gives `g=0.5`, each independent color tangent gives `g=1`; maximum finite-difference metric error `4.59×10⁻9`. Mixed Berry curvature is zero in the tested tangent directions. Its normalized reference two-particle vector matches the projector to `4.5×10⁻16`.

### Verification E — explicit Kato parallel transport and deck/color loops

`d1o_kato_transport.py` implements parallel transport numerically by normalized successive projection `Ω_{k+1}=P(C_{k+1})Ω_k/‖P(C_{k+1})Ω_k‖` on the same six-mode model. With 24,48,96 subdivisions, the representative deck loop `(u,n):(e₈,e₀)→(−e₈,−e₀)` has endpoint `P_final=P_start` and returns exactly to reference phase `+1` (within floating roundoff). A full color great-circle loop at fixed spatial direction also returns `+1`. These are useful **reduced-model** consistency checks and do not replace D1M's exact 24-mode deck certificate or a source Lean proof.

## 4. Consequence for physical smooth-core membership — analytical route, not a claim of completion

On the simple top-singular-value tube `X=r u nᵀ+Y` with `r>0`, `uᵀY=Yn=0` and `‖Y‖<κr<r`, the orientation quotient by `(u,n)∼(−u,−n)` is smooth. Assuming the projector-based global section has been rigorously transported and descended in the original carrier, define

`Ψ_R(X)=N_R χ(r/R) η(‖Y‖/(κr)) (√2 r/π)^4 exp(−√2 r‖Y‖²/2) Ω(u,n)`.

Its radial cutoff is supported on `R<r<2R`, its fixed tube cutoff is identically one near `Y=0`, and all cutoffs are flat at their endpoints. Therefore standard finite-dimensional differential geometry gives a compactly supported `C∞` section with a smooth zero extension to `R^27`, no south-pole spatial cutoff, and nonzero norm. Gauge covariance of `Ω` together with the source-invariant scalar gives the pointwise source condition `Ψ_R(G.boson(g)X)=G.fermion(g)Ψ_R(X)`; this would imply `coreToL2 Ψ_R ∈ G.physicalSpace` once implemented against exact source actions. The target Lean carrier is `SmoothCore 2`, and ultimately `pairedGaugeData.invariantCore`.

The source `massless_coreForm_energy` then offers the appropriate normalized form. D1N's conditional energy asymptotic is `K_global/R²+O(R^-5)+exp-small`, with `K_global=22.305853077497...`. **A source-typed zero-extension/core-membership theorem, the actual Gaussian projector/source-θ normal-form and a complete inherited bound for all derivative terms are still required** before asserting `q[Ψ_R]≤(K_global+o(1))/R²` in the original closed physical form. Formal operator-domain membership `Ψ_R ∈ Dom(H)` is stronger and not needed for a form-only argument; neither has been proved here.

## 5. Adjudication and next move

**Positive:** The source-carrier gap has a concrete, norm/phase-correct, polynomial workaround that bypasses implementing an independent spatial Spin(48) vector representation. It also gives the proper *projector* relation to original `pairedGaugeData` without relying on D1F massless operator identity.

**Negative:** This does **not** make D1K1A GREEN. It does **not** prove the projector polynomial and its rank-one spectrum in the original 24-mode Lean carrier, nor the 48-mode Kato holonomy/source smooth `TestFunction`, nor the final original Hamiltonian spectral theorem. Those are now sharply stated, independently falsifiable atoms. The D1F and D1K1A strict RED histories stay frozen.

**Recommended D1P:** Algebraically prove the full 48-Majorana projector's rank-one property and exact original gauge intertwining in the smallest possible *source-exact* standalone proof architecture; independently establish the Berry curvature/deck sign and the smooth quotient `TestFunction` construction. Use Python for adversarial preliminary checks and avoid triggering large Lean CI until the analytic proof details are complete. No change to original source, main or live RHOPF.
