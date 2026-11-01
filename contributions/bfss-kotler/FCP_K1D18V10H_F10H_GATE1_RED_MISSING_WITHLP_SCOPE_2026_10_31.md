# F10H Gate1 RED — original real spectral eigenvector source namespace gap

Date: 2026-10-31 PDT. Authorized research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## CI outcome — preserve negative evidence

- [F10H Gate1 run #41273184444](https://github.com/etblink/math/actions/runs/41273184444) **completed FAILURE**, attempt 1, job `124749974243`, exact tested SHA `37f0acf7f58079cced88a63e42036493e1d38ecf`, F10H source Git blob `da4a0ca3d35a925f717d6097e2cb588633b717f1`.
- [Immutable job artifact #13069484495](https://github.com/etblink/math/actions/runs/41273184444/artifacts/13069484495), SHA-256 `da4379cd56b865ab3508ad02eda63fb1dbac05a358dc0e6d009f8fdeac1fb895`.
- Original gamma, F9, F10E/F10F/F10G qualified ancestors, toolchain Lean 4.34.1 and Mathlib pinned `d13f23b723b8a846827a245b89c10fc7d3f11612` exact source/hash preflight PASS. Pinned dependency restoration PASS. Qualified F10G ancestor rebuild PASS. Fresh F10H `-DwarningAsError=true` compiler FAIL at **source line 55, column 11**: `error(lean.unknownIdentifier): Unknown identifier \`ofLp_eq_zero\``. The two F10H theorem axiom prints included `sorryAx`; independent original two-declaration type/axiom audit was SKIPPED. No other compiler failure was reported. F10H **UNQUALIFIED**.

## Provenance check and bounded repair

The pinned Mathlib `Mathlib/Analysis/Matrix/Spectrum.lean` itself has `open WithLp` before the `IsHermitian` namespace and uses **exactly** `(ofLp_eq_zero 2).ne.2 (hA.eigenvectorBasis.orthonormal.ne_zero i)` to produce the original real eigenvector's nonzeroness. Our candidate copied that formula but omitted `open WithLp`, so the parser cannot resolve the namespace-qualified theorem.

Repair **only** by opening the public module namespace `WithLp` after `open Matrix`. Do not change either original F10H theorem statement or proof body, source eigenvector, accepted ancestor, pinned library, solver/time limits or independent verification. Update the strict gate's candidate Git source hash and its mandatory preflight to include `open WithLp`, and rerun warning-as-error and exact two-declaration/axiom audit.

The source-endpoint/namespace mismatch is a known historical failure class: source exactness includes names and namespaces, not only mathematical intent. A successful namespace repair would prove the per-index real eigenvalue square and eigenvalue nonzeroness for the original `SpinIndex = Fin16`, **not** eight/eight multiplicities nor determinant +.

## Open and frozen scope

Accepted F1–F9, F10E, F10F, F10G untouched. Private-table F10 Gate1 #41266215820, Gate2 #41266892206, Gate3 #41267510559, F10D parser #41268424166 remain preserved as red, unqualified. F10E initial deprecation #41269330982 and F10F initial matrix-entry simp #41270798888 remain red, subsequent gates were accepted. Original paired-Fock order and 48 real labels unchanged.

No `sorry`, `admit`, `native_decide`, added axioms, changed source gamma, altered parent commit, compiler-limit escalation, main/upstream publication or physical BFSS spectral inference. Det Gamma(v) = +Q(v)^8, global Spin9 orientation, original SO48 and Spin48 lift/cover remain **OPEN** until separately verified.
