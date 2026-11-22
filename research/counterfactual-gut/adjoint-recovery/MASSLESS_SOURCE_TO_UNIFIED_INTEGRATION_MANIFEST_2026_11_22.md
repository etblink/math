# M0–M1c + D0a → unified integration: selective qualified-source manifest

**Created:** 2026-11-22 UTC. **Role:** Project Lead / reproducible integration handoff.
**Status:** PREPARED ONLY, not merged and not independently integrated/requalified on unified.
**Source branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.
**Target branch:** `integration/bfss-unified-research-20261108`. Current observed unified HEAD during manifest preparation: **`5ad0cf2da6b541ccd0cb5afd8d48b0f00cee6490`** (live branch; **recheck** before any candidate).
**Immutable qualified upstream:** Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
**Safety:** NEVER copy exploratory branch wholesale, rewrite the unified HEAD, delete red/negative corpus, alter the original BFSS source, or treat branch-local strict GREEN as integration CI GREEN.

## 1. Qualified source-only import allowlist — in dependency order

Relative prefix `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/`. Import bytes unchanged and preserve namespace/declaration names.

| Order | Exactly qualified source module | Git source blob SHA-1 | Original strict CI acceptance |
| --- | --- | --- | --- |
| 1 | `BFSSMasslessM0OriginalBracketNegationProbe.lean` | `948671c8173dd69bba380a1b08fd46c7b63efb57` | [#44988662078](https://github.com/etblink/math/actions/runs/44988662078), original ZIP #14740759009 sha256 `a15207dead7b70611b865cfd78be80324a767b548f2721c11c0942c4625ae858` |
| 2 | `BFSSMasslessM1aOriginalComplexQuantizerNormalization.lean` | `93e11616d37a3bfac44320e7518027d8883c6072` | [#44990226259](https://github.com/etblink/math/actions/runs/44990226259), original ZIP #14741553517 sha256 `0823d7b2bbf0f4f29d3f982721d2b6320dac3a6b2d796c3f36ecd6b65091d2b6` |
| 3 | `BFSSMasslessM1bOriginalRealFieldRestrictionConsumer.lean` | `fc2994f932cc13bbade9735f74a97390a4ea224d` | [#44990981706](https://github.com/etblink/math/actions/runs/44990981706), original ZIP #14742466124 sha256 `4d9da83a6155138acf5a1d19401ab7e7c7cf4389e6a61497b94580829ad6269b` |
| 4 | `BFSSMasslessM1cOriginalCoefficientDifferenceConsumer.lean` | `749992dec67bf4bca28ab957890191aeb8c78fb8` | [#44991923266](https://github.com/etblink/math/actions/runs/44991923266), original ZIP #14742706199 sha256 `441c50f313a1c68d3aa846b60fd71aec25a9b5d91f42f15a2dfd984c70b95cdd` |
| 5 | `BFSSMasslessD0aOriginalSmoothCoreLpAction.lean` | `1bf49640d543635313495c505a4a4dbc64583ae2` | [#44996343676](https://github.com/etblink/math/actions/runs/44996343676), original ZIP #14744651063 sha256 `3bd0106e8853e529bf7a38796f5a47c82d2e43715b5e1f88ad9088ffc7a761ad` |

D0a precise tested commit `82c1f4fac8eed17abae105e20596a68936890438`; original 8,998-job native PASS, four strict Lean roots with only `propext,Classical.choice,Quot.sound`, exact GREEN sentinel. Initial [#44996306030](https://github.com/etblink/math/actions/runs/44996306030) checkout-only CANCELLED before preflight is **not** a theorem RED.

**Import DAG:** M0 → M1a → M1b → M1c → D0a, with original `DeformedCharge` direct input to D0a, and original paired `SU2BFSSG1APairedThetaProbe` direct input to M1b. The dependent original source import closure is large but previously strictly tested. Copy **only these five** new Lean files; do not blanket copy `Contrib/Kotler`, `research`, or `.github/workflows`.

## 2. Already present and matching original donor sources

At target snapshot above, rechecked exact original donor bytes:

| Unified original source | Git blob |
| --- | --- |
| `Core.lean` | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` |
| `MixedEnergy.lean` | `cc00f5b2ce4bb1811162e4bf2d9c773a9779ef8e` |
| `DeformedCharge.lean` | `c27c913c44090100f0c714e3eb34e25205f4d2d3` |
| `FermionQuantization.lean` | `c6b72d030225c707ef54f5285a18a7a8175ee280` |
| `OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean` | `152204ef15a6569534e0503824a697cb9ae8e4ce` |

Earlier [full source reconciliation](./UNIFIED_MASSLESS_SOURCE_PHYSICAL_DOMAIN_RECONCILIATION_2026_11_21.md) checked 15 matching donor blobs across both branches at the then-current unified snapshot. Their matching status MUST be refreshed at actual integration time; nonmatching donors require source-semantic review rather than silently updating the pins.

## 3. Qualification required on future unified-based integration candidate

1. Fetch **current** unified HEAD and stop if it changes between baselining and candidate construction. Create a **new, named candidate branch from unified HEAD**, never overwrite unified directly. Do not pull the counterfactual branch's 229+ exploratory commits by wholesale merge.
2. Add **exact** five qualified source files by blob; record source branch, five blob SHA-1, original tested commits, original artifact IDs and SHA256 in a manifest checked into the candidate. Do not rename namespaces, alter proof text, copy failed D1F/D1S4 sources or modify original BFSS source.
3. Build only the selected D0a source module on the **candidate**. It imports the M0–M1c chain transitively. Run an **independent integration-specific strict warning-as-error** consumer with all source theorem/definition `#print axioms` roots and exact allowed axioms `{propext,Classical.choice,Quot.sound}`, no `sorryAx`, frozen original source and source hash assertions, pinned Lean/Mathlib, and original run artifact archival on both RED and GREEN.
4. Preserve **both** branch-local results and new integrated tested commit. Never promote integration based solely on the earlier research branch success. On RED preserve original first-causal log/ZIP; one diagnosed proof-only retry at most, two REDs STOP. Integrate only after green and source-specific independent consumer checks.
5. Preserve the scientific history: failed D1F R1–R3 and D1S4 R1/R2, M0 R1, M1a R1, D0a canceled checkout, numerical valley negative controls and counterfactual ledger CF-259–300. Import a **curated provenance index** rather than overwrite the unified canonical roadmap or dump unrelated research documents into it.
6. Only after the independent integrated gate qualifies and branch drift is rechecked, review a bounded PR targeting `integration/bfss-unified-research-20261108` (not `main`). Existing topology RHOPF CI must not be conflated with physical BFSS domain results.

## 4. Research boundary after integration

Accepted D0a proves `SmoothCore N ⊆ Dom(V)` **as a mathematical statement of each smooth input having a genuine `FullL2` output**. A named maximal `Dom(V)` submodule/partial complex-linear operator on all `FullL2` wavefunctions is not yet built. The genuinely missing next gate is well-definedness of the unbounded multiplication graph using original a.e. representatives, then its gauge **domain** preservation. Original `CovariantFields.GaugeData.deformedFermionField_covariant` already proves pointwise gauge covariance; do not prove it again. The original `P3M5BE0` Hamiltonian is closed/self-adjoint on its accepted natural domain, but D0a does not identify that H with a pointwise multiplier, prove a gap, normalizable Hopfion or SM.

**Project Lead holding decision:** Keep the five accepted source files in the counterfactual branch while work on the maximal `FullL2` graph is genuinely research-active. Reconcile to unified on a controlled candidate at a coherent checkpoint, **not** by prematurely merging unrelated exploratory branches. Preserve all source truth, positive/negative and failed evidence.
