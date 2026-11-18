# SM-D1 — model-to-observable comparison protocol: source-exact predictions, no assumption of success

**2026-11-18. Forward research / prospective gate only — NOT qualified, no CI staged.** Program motivation: what is actually true about nature? No theory is preferred a priori. We must confront every candidate with the same observations and rigorously distinguish **lack of a prediction** from either confirmation or falsification.

**Already separately qualified:**
- [SM-Y0 R1](SMY0_R1_QUALIFIED_SOURCE_CONSUMER_ACCEPTANCE_2026_11_18.md): given a one-family chiral SM charge ledger, conventional rational anomaly coefficients cancel; a changed charge fails. This neither derives nor validates any physical framework.
- [SM-D0 R1](SM_D0_R1_QUALIFIED_EMPIRICAL_LEDGER_ACCEPTANCE_2026_11_18.md): as-of-2026-11-18 **ten** primary-source curated quantities/limits, original source titles/dates/conditions, strict integrity/mutation audit and independent archived evidence. Its ledger is NOT a world average or a combined fit.

## The essential scientific distinction

**A correct mathematical theorem is not automatically an observable prediction.** A model must connect an original mathematical construction to a physical field or scattering state, define observables and energy regime, derive the quantity under stated assumptions, and supply an uncertainty budget. Without this, a near-match to a measurement is not evidence of explanatory success.

Every model entry must first be assigned an explicit **comparison status**, with no automatic numeric score:

| Status | Meaning | Permitted interpretation |
|---|---|---|
| \`NOT_PREDICTED\` | No derivation of the named observable exists in the specified model version | Neither pass nor fail; unmet explanatory requirement |
| \`MISSING_PHYSICAL_MAP\` | Mathematical object exists but lacks a qualified map to the observed field and 4D regime | Do not compare its numerical value to experiment |
| \`NOT_APPLICABLE\` | Model explicitly disclaims the physical sector or energy scale | Not a confirmation; record reduced explanatory scope |
| \`WRONG_OBSERVABLE_OR_CHANNEL\` | Prediction uses wrong convention/units or proton final-state | Invalid comparison, no score |
| \`COVARIANCE_OR_LIKELIHOOD_REQUIRED\` | Prediction/measurement uncertainties are correlated, non-Gaussian or asymmetric | Cannot infer a sigma significance from displayed errors |
| \`COMPARABLE_WITH_UNCERTAINTY\` | Same observable with source-exact mapping, consistent units and applicable uncertainty treatment | Compute only approved residual and document assumptions |
| \`IN_TENSION_UNDER_STATED_ASSUMPTIONS\` | Model prediction and measurement are inconsistent under an explicit defensible statistical test | Evidence against specified model assumptions/parameters, not automatically the whole model family |
| \`COMPATIBLE_UNDER_STATED_ASSUMPTIONS\` | Specified model calculation is not rejected by selected measurements | Consistency is not confirmation, and not proof of uniqueness |

A model must **not** receive \`COMPARABLE\`, \`COMPATIBLE\`, or \`IN_TENSION\` status from a qualitative label (\`Spin(10)\`, \`SU(5)\`, \`BFSS\`) or an accidental dimension count.

## Prediction schema to request from any candidate

Each prediction should be a new, versioned, independently citable record containing:
1. \`model_id\`, exact version/source and **frozen** assumptions, including all external input parameters and their provenance.
2. \`observable_id\` from SM-D0's ten exact identifiers and **same physics channel**, units and extraction conventions.
3. Proof or derivation provenance for the claimed map from the candidate variables to 4D physical observable, with original mathematical interfaces distinguished from phenomenological model assumptions.
4. \`predicted_central\`, explicit quantity units, uncertainty distribution/covariance, parameter correlations, treatment of theory and experimental systematics, and the model's permitted parameter range.
5. Statistical treatment and decision threshold if any, plus exact source of a likelihood or independent validation calculation.
6. \`comparison_status\` default \`NOT_PREDICTED\` until all required fields exist, and a prose \`limitations\` field describing non-covered sectors.

This protocol does **not** create fabricated prediction records for BFSS, Spin(10), NFC, the Standard Model itself, or other alternatives. No original model currently has an automatically populated score in this memo.

## When a residual is legitimate—and when it is not

Suppose one theory predicts \(p\pm\sigma_p\) and an **independent** measurement reports \(m\pm\sigma_m\), both uncertainties reasonably Gaussian, symmetric and correctly propagated. A *diagnostic*, not a full global model score, is

\[
z=(p-m)/\sqrt{\sigma_p^2+\sigma_m^2}.
\]

If errors correlate, the denominator for the difference must account for covariance:

\[
\mathrm{Var}(p-m)=\sigma_p^2+\sigma_m^2-2\,\mathrm{Cov}(p,m).
\]

For source-specific limits (e.g. \(\tau/B(p\to e^+\pi^0)>2.4\times10^{34}\) years at 90% CL), no Gaussian \(\sigma\) is supplied. A model predicting a lower partial lifetime for the **same channel** may conflict with the published bound under its experimental assumptions, but a defensible exclusion needs the specified limit's statistical interpretation/likelihood. A bound on \(p\to e^+\pi^0\pi^0\) cannot be swapped into the two-body channel.

**Known correlation traps in our current ledger:**
- JUNO's \(\sin^2\theta_{12}\) and \(\Delta m^2_{21}\) originate from one reactor analysis: not independent.
- CMS 2026 inclusive Higgs \(\mu\) fit used \(m_H=125.38\) GeV, while CMS's newer Higgs mass result reports \(125.065\pm0.088\) GeV. Treating them as independent same-assumption fits is unjustified.
- CMS 2026 W mass cannot be declared the uncontroversial world average, especially in view of inter-experiment tensions.
- A 95% CL direct **muon EDM** limit is not the 2025/2026 muon magnetic \(g-2\) measurement.

## Immediate comparative research decisions

**Track A — actual original finite SU(2) BFSS:** qualified original Clifford/Fock, Lie action, and symmetry results supply mathematical structure. As of this snapshot they do **not** yield a source-qualified 4D chiral Standard Model spectrum, Higgs mass, JUNO neutrino observables, W mass, or channel-specific proton lifetime predictions. That is \`NOT_PREDICTED\` / \`MISSING_PHYSICAL_MAP\` for our audited interfaces—not a claim BFSS is physically wrong.

**Track B — candidate Spin(10) chiral 16 representation:** the five-mode exterior / Clifford construction and \(16=1+10+5\) branching may reproduce *representation-theoretic bookkeeping* when a genuine subgroup action is proved. No proton decay, neutrino, Higgs or Yukawa prediction follows until couplings, field content, symmetry breaking and parameters are specified. All ten D0 observables remain \`NOT_PREDICTED\` for the generic bare representation alone.

**Track C — established Standard Model and effective field theory:** as a tested framework it can produce some observable relationships, but many quantities (e.g. Higgs mass and Yukawa inputs) are **empirically fixed parameters**, not parameter-free predictions. Comparing a fitted input with the same input data must not be advertised as independent confirmation.

**Track D — geometry, AQFT, QIT and other frameworks:** judge by the same typed physical maps, spectrum/interaction assumptions, domains and quantified predictions. Preserve negative results and reasons why a mathematical feature does *not* transport.

## Gate design (not yet authorized to mark accepted)

- An independent SM-D1 typed JSON schema and validator could require status semantics and refuse a non-null numeric significance for \`NOT_PREDICTED\`.
- Negative controls: wrong decay channel, swapped EDM/magnetic moment, wrong mass unit, erased JUNO ordering, an uncited model prediction, missing covariance, and use of an experimental fitted input as an allegedly parameter-free prediction.
- An initial gate should **not** calculate any physics prediction or move the BFSS canonical anchor state. It tests only safe formatting and decision classification on illustrative deliberately labelled *synthetic fixtures*.
- Any future real scientific comparison requires genuine source model calculations. We should not invent them to make a validator turn GREEN.

**Scientific conclusion:** SM-Y0 gives necessary consistency math; SM-D0 gives curated empirical inputs; SM-D1 must be a rigorous **bridge and rejection filter**, not a permission slip for unfounded unification claims. The objective remains to discover what is true, even if it contradicts our prior preferred line of research.
