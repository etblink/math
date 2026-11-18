# SM-D1-SCC3B1 R1 — orthogonal predictive-status comparator independently qualified

**2026-11-18 | ACCEPTED: source-exact independent Python methodology only.**

## Original strict result

- [Original independent strict run #44416698450](https://github.com/etblink/math/actions/runs/44416698450) GREEN, exact tested commit `a32b94ed2356cc34cc249b2f0bf0478394d5fa69`.
- Original job `135198782235`; provider artifact `14480091397`, original ZIP SHA256 `b5a448bc43c17edb38c5b9c3a9539e5411d75eac4bfcee8920b3802a48380d5f`.
- New immutable independent tool `research/standard-model/tools/smd1_scc3b1.py` blob `f395234389956eff23512055f23e659066869eb9`.
- Independent adversarial tests `research/standard-model/tests/test_smd1_scc3b1.py` blob `b4903d31f2268f244f90b80c9ebe120e06ec932c`.
- Original workflow blob `75697b0d0cf9105f73e7db437cced59a0fcc3bda`.
- Exact previous accepted SCC0 tool blob `95569dffd88af133df3dd56d23e1f61ca8c4a207` **unchanged**; the original **24 regression tests** all GREEN.
- New **15 independent adversarial tests** and **seven separate negative input controls** all GREEN; the workflow verified original SCC1/SCC2/SCC3A/SCC3B0 archived evidence and all original 27 BFSS accepted anchors.

## Independent preservation of original GREEN

- [Archive run #44417161740](https://github.com/etblink/math/actions/runs/44417161740) GREEN, archive commit `9140444ebdb9bb2f063ff788f121d5df806d371a`.
- Original ZIP, full complete job log and SHA-256/CRC manifest, under:
  - `research/standard-model/evidence/SMD1_SCC3B1_R1_44416698450_ORIGINAL_STRICT_GREEN_evidence.zip`
  - `research/standard-model/evidence/SMD1_SCC3B1_R1_44416698450_ORIGINAL_complete_job.log`
  - `research/standard-model/evidence/SMD1_SCC3B1_R1_44416698450_ORIGINAL_STRICT_GREEN_evidence_manifest.json`
- Manifest Git blob `af966d77292ac6d2719ef2229fa375ad520e7522` and original complete-job transcript SHA256 `ba0269f4a783e40801e8e543ba62ddc4be23461168e1cc8ff4114a6becea2442`.

## Why the successor was needed

The **old**, qualified SCC0 comparator returns `UNKNOWN` when some selected prediction is absent, even when a different valid marginal is already known to differ; it returns `JOINT_LIKELIHOOD_REQUIRED` for a repeated dependence group before checking exact individual marginals. Those verdicts were intentionally cautious for *complete statistical inference*, but obscure logically established **existential exact differences**.

The new successor deliberately separates:

- `exact`: `WITNESS_PRESENT`, `COMPLETE_AGREEMENT` only on a complete valid declared selection, or `UNDETERMINED`.
- `integrity`: independently flags incompatible identities, protocols, units or outcome alphabets.
- `completeness`: independently flags partially unavailable predictions and missing physical maps.
- `joint`: flags `REQUIRES_EXPLICIT_JOINT` for declared correlated groups, otherwise `NOT_ASSESSED`; **neither** outcome licenses an independent product likelihood.
- `experimental_evidence`: always `NO_EXPERIMENTAL_INFERENCE`.

One positive exact marginal witness is retained even when another selected prediction is absent or correlation data are incomplete. However, a **fully certified family-level uniform conclusion** still requires every enumerated cross-family pair to have a valid known separating marginal and a fully typed/complete selected comparison. An invalid unrelated observable may coexist with a known local positive witness, but blocks the global certificate.

Concrete adversarial controls include different joint laws with identical one-dimensional marginals, invalid units or outcomes, missing physical maps, positive-plus-missing, positive-plus-dependence, source-old-versus-new result expectations and finite-family counterexamples.

## Mathematically honest ceiling

This is independently tested **Python**, not a new Lean theorem. Exact rational categorical TV computations are consistent with accepted SCC3B0 mathematical foundations, but no Lean ↔ Python equivalence theorem has been asserted or qualified. A nonzero marginal predictive distance proves different ideal predictive laws; it does not establish a finite-sample separation rate, experimental likelihood, physics-derived model prediction, or the success/failure of a physical theory. SCC0 accepted bytes and historical behavior remain preserved.

## Review boundary — return to physical inference

SCC3B0 and SCC3B1 complete the **planned narrow mathematical/decision semantics boundary**. The next task should be a **read-only model-to-observable feasibility review**, using the already curated SM-D0 empirical ledger to select one concrete Standard Model-sensitive observable and explicitly list:

1. The standardized measurement definition, units and protocol.
2. The baseline Standard Model prediction/source-derived formula and any admissible extension assumptions.
3. The predicted value/distribution for candidate BFSS/NFC or other models, if any: if not derived, record `MISSING_PHYSICAL_MAP` rather than extrapolate.
4. Experimental likelihood/covariance, nuisance parameter space and comparison method; if unavailable, record `JOINT_LIKELIHOOD_REQUIRED` or `UNKNOWN`.
5. A bounded falsification/negative-control test with a stop condition.

No additional abstract formalism should be undertaken merely to accumulate GREEN gates. Focus on empirical truth, preserve negative knowledge and accept a model-independent unknown when predictions do not exist.

Full physical SM-D1 remains `PROSPECTIVE_UNSTAGED`; BFSS W0C2B2 remains `BLOCKED`, and 27 accepted BFSS anchors unchanged.
