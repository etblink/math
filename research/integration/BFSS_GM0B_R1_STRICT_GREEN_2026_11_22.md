# GM0B R1 — original massless finite-Fock pointwise SU(2) covariance STRICT GREEN

**Qualified** by [run #45063336191](https://github.com/etblink/math/actions/runs/45063336191) (attempt 1), EXACT tested unified commit `b5bf3db6dc0ad7aea4d0216b998006a8f8c46be0`.

- Original frozen source and independent consumer preflight **PASS**; Lean **4.34.1**, Mathlib **d13f23b723b8a846827a245b89c10fc7d3f11612**.
- Original source native build **9,076 jobs PASS**. Axiom reports for both `FCP.BFSSGM0B.originalMasslessQuantizer_gauge_covariant` and `FCP.BFSSGM0B.pairedOriginalMasslessQuantizer_gauge_covariant`: only `[propext, Classical.choice, Quot.sound]`.
- Independent strict source-exact consumer `FCP.BFSSGM0BIndependent.pairedSourceMasslessFockPointwiseGaugeCovariant`: **PASS**, exact same allowed axioms, no `sorryAx`/Lean errors; sentinel `BFSS_GM0B_SOURCE_EXACT_INDEPENDENT_STRICT_GREEN`.
- [Original artifact #14770264654](https://github.com/etblink/math/actions/runs/45063336191/artifacts/14770264654), 10,920 bytes, independently downloaded ZIP SHA-256 `eda48e2632c0e8748fb17a3895f0619389ca78e9a6b8b9bc669e1a2eb96e1233`; ZIP CRC PASS; exact `tested-sha.txt` and six original logs inspected.
- Exact scope: `G.fermion g (Q x v) = Q (G.boson g x) (G.fermion g v)` for original massless quantizer `Q = M.quantizeFrequency (masslessSourceFrequency M ...)`, for arbitrary genuine `GaugeData`, specialized to paired SU(2) 48-Majorana Fock. Derived by composing original `G.deformedFermionField_covariant` and M1b massless h=1,m=0 exact field identity; no re-expansion of theta.
- **Not proved:** a.e. massless FullL2 action covariance, maximal-domain preservation, graph covariance, physical Gauss fixedness, self-adjointness, spectrum, Gamma9 coupling or physical Hopfion. GM1A is a new strict source candidate to address only the first obligation.

**Branch policy:** append-only integrated commit on `integration/bfss-unified-research-20261108`; main untouched.
