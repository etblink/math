# D1K1A — Literal source Fock seed, original GaugeData transport and strict gate

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.
**Launch/tested commit:** `225e837b98f3d8e34e11ff1f68835a05fe2af109`.
**GitHub Actions:** [run #44947732882](https://github.com/etblink/math/actions/runs/44947732882), initially observed **in progress**, not adjudicated GREEN.
**Disposition:** candidate original-carrier Lean + independent consumer + strict workflow, **not compiled/qualified at report creation**.

## Frozen boundary and evidence inventory

| Artifact | Exact Git blob | Purpose |
| --- | --- | --- |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1K1AOriginalFockSeedGaugeTransport.lean` | `6b02eab449044a19ae7927c18fb518f390b20636` | Explicit Gamma8-signed orbital wedge in actual original 24-mode algebra, `fockAlgebraToBFSS` transport, three source GaugeData targets |
| `lean/diagnostics/BFSSD1K1AOriginalFockSeedIndependentConsumer.lean` | `02c22779489034e1f2f4718e7a0c914ee124630e` | Independent exact `pairedGaugeData` consumer with three axiom printouts |
| `.github/workflows/bfss-d1k1a-original-fock-seed-gauge-strict.yml` | `9ff4fa745ecb24b1a325ddb4e9253def5197b60d` | Pin checks, cold Lean build, source+consumer axiom checks and artifact preservation |

The candidate imports only the original compiled `SU2BFSSG4JExactGaugeDataAssemblyProbe`, which already brings in source G1A/G4A/G4B/G4E definitions. `sourceGamma8Sign j` reads the actual `pairedAlgebraData.gamma 8` diagonal on the even member of original spin pair `j`, not an invented sign table. The occupied orbitals are `(c†_{j1}+i s_j c†_{j2})/sqrt2` in the exact source `Orbital 23` convention, multiplied by an **ordered** `List.ofFn` product in `Space 23` (noncommutativity retained). `sourceFockSeed` lives in actual `Fermion 2`.

The three bounded source roots:

1. `sourceColorOrbit_eq_originalGauge`: the actual `pairedGaugeData.fermion g` on the seed equals G4A's exterior action transported by `fockAlgebraToBFSS`.
2. `sourceColorOrbit_mul`: color orbit respects original SU(2) multiplication with no color transpose or replacement representation.
3. `sourceColorOrbit_norm`: original Fock norm is preserved by source gauge unitary.

An independent consumer restates all three on original `Fermion 2`, and outputs source+consumer axioms. Only `propext`, `Classical.choice`, `Quot.sound` are permitted; `sorryAx`, syntax/elaboration errors, unapproved axioms and missing consumer results cause RED. Source pins: Core `9882359...`, FermionQuantization `c6b72d...`, G1A `152204e...`, G3B `3cdf867...`, G4A `141fbe7...`, G4E `7247844...`, G4J `e20c76f...`; toolchain Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Acceptance ceiling

Even if D1K1A qualifies, it does **not** prove that this exterior product has norm exactly one or is nonzero; nor the four-plus/four-minus sign count, full stabilizer invariance, SU2 color-`S^2` descent, spatial Spin48 rotor smoothness, Berry identity on typed source, direct massless expectation or a Gauss-physical `SmoothCore 2` trial. Those are separate D1K1B+ atomic gates. Do not infer (q[\Psi_R]\to0), zero essential spectrum, a hopfion, or a GUT.

**Stop rule:** inspect exact tested commit, first causal failure, native source, independent consumer and allowed axiom reports before promoting or making any repair. No blind R2 on a RED. Keep D1F R1/R2/R3 negative knowledge preserved. No mutation to main or live RHOPF; isolated branch only.
