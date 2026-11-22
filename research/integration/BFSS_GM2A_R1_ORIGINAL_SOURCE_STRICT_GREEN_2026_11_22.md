# GM2A R1 — exact original massless maximal domain gauge preservation STRICT GREEN

**Qualified** by [strict run #45070954807](https://github.com/etblink/math/actions/runs/45070954807), attempt 1, original exact source tested unified commit `8a43be8ea27ea6a21b338f7022c24a0d8184c04e`.

- Exact original frozen source/preflight **PASS**; Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Native original source **9,081 jobs PASS** and all three native GM2A axiom reports accept only `[propext, Classical.choice, Quot.sound]`.
- Independent strict imported paired SU(2) original Fock maximal-domain consumer PASS, same allowed axioms; `BFSS_GM2A_ORIGINAL_SOURCE_DOMAIN_INDEPENDENT_STRICT_GREEN` sentinel; no `sorryAx`/Lean errors.
- [Original artifact #14773872963](https://github.com/etblink/math/actions/runs/45070954807/artifacts/14773872963): independently downloaded ZIP, 11,243 bytes. SHA-256 **`58adfecb42d2c5dd04c5271737e480ca049fd391ed9b1c25f1894a8dd3c1dd59`**, all entry CRCs valid. `tested-sha.txt` matches exactly, original native and consumer audit inspected.
- Mathematical scope: `originalMasslessDomain_gauge_mem` establishes `ψ∈D(Q) → G.fiberAction g (G.bosonPullback g⁻¹ ψ)∈D(Q)` for original source GaugeData, including the paired 48-Majorana SU(2) Fock instance; the proof transports `MemLp` through original measure-preserving boson and isometric Fock actions, then through qualified GM1A a.e. identity.
- **Not established by this gate alone:** operator-output intertwining, algebraic closed-graph preservation, equality of domains (unless explicitly derived with inverse action), physical fixedness, self-adjointness or spectral/Hopfion results.
- Separate bounded GM3A strictly tests original source Fock partial-multiplier output equality as original `FullL2` a.e. equivalence classes, using qualified GM1A/GM2A and source D0c0 `originalMasslessMultiplier_ae`; no surrogate or theorem promotion without new CI evidence.

**Governance:** only unified branch, append-only qualification record and independent GM3A candidate; never modify main.
