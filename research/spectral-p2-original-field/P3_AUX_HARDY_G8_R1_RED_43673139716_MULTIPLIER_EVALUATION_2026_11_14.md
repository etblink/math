# HARDY-G8 R1 — verified RED at original multiplier evaluation

[Strict #43673139716](https://github.com/etblink/math/actions/runs/43673139716), attempt1, tested `2a0da05bd7718c1fcd3781701e2bcd559da72254`, job132687383145. Verdict: RED_UNQUALIFIED. G7 #43670114014 remains accepted.

## Evidence

Preflight160 pins PASS, manifest SHA256 `7c2cecad39753cb3358fca83de8ea07017c1198a7a86a36d8e035fd7006d7440`; Lean4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Accepted generic helper1 and new original derivative product-rule helper1 both build/fresh-check PASS with standard axioms. Cold native source build FAILS at G8 source39:58, unsolved goals. No fresh source or independent native consumer step ran and no final scope receipt exists. Three initial source declarations report standard axioms; derivative bridge and two dependent roots report consequential sorryAx. No recursion-depth error occurs.

Artifact14145745730,21580 bytes, SHA256 `1be311f0891bc7520c0b94d3af931b472b31c2eec2b9c2787ff0726803e604a4`, independently downloaded/rehashed. [Complete durable evidence](diagnostics/P3_AUX_HARDY_G8_R1_43673139716_evidence.zip).

## First causal residual

After the existing finite-map/product-rule simplification, the left principal term is the sum of Y(X) scalar-multiplying theta applied to Df(X). The right principal term still contains theta applied to smoothMultiplier(Y)(Df)(X); the correction sums already match. Source42:25 reports unused map_smul because the scalar multiplication has not yet been exposed. The missing source evaluation lemma is AlgebraData.smoothMultiplier_apply, already used in accepted G7 evaluation.

The residual is a proof-normalization omission, not a native recursion or a demonstrated counterexample to the derivative identity. Whole G8 remains unqualified. Do not report the cold build or native controls as passed.

## Controlled next decision

[R2 preregistration](P3_AUX_HARDY_G8_R2_PRE_GATE_EXPLICIT_MULTIPLIER_EVALUATION_2026_11_14.md) inserts only AlgebraData.smoothMultiplier_apply before retained map_smul. Source statements, other proofs, helper and native consumer remain fixed. Workflow changes only expected source hash. No resource increase or original physics change.

The roadmap review still favors finishing this bounded algebra package; physical Spin9/charge energy-domain audit is the highest forward-research priority. This compiler error does not justify moving to regulator limits or topology. Full original charge/tau identity, norm/physical sector/Hardy/fidelity and spectral results remain open.
