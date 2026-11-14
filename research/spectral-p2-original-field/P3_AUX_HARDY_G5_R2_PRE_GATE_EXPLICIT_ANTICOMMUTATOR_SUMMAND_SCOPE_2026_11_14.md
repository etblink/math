# HARDY-G5 R2 prospective repair — explicit anticommutator summand scope

Date:2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT QUALIFIED.
R1 #43645016288 RED tested 6934c2af40193e6e9762a3e7d8f14566bcd4737e; preserve exact checkpoint before mutation.

## Fixed change

The intended preregistered expression is SUM[alpha] (V_alpha*tau_alpha + tau_alpha*V_alpha), with both terms under the same binder. R1's ungrouped syntax leaves alpha unbound in each second term (source65/75). Add explicit parentheses around the full additive summand in:
- originalPotentialTau_anticommutator_zero;
- originalPotentialTau_anticommutator_apply;
- the two corresponding native consumer examples.

Exactly four pairs of parentheses, with formatting only as needed. All operators, vectors, labels, factor order, zero conclusions and hypotheses fixed. These are previously ill-formed statements; the repair restores intended syntax rather than claiming equality of two already elaborated types. Proof bodies stay byte-identical. All other source/consumer bytes fixed, including twelve native controls. Workflow only expected source and consumer hashes. Keep frozen baseline f51357761243008201f97d9e0ef0cbefa87d0b06, donor/toolchain pins, report lists, warnings, autoImplicit=false and budgets.

## Recursion boundary and analysis

R1 source78 evaluation also reaches recursion. Its status after fixing malformed statements is untested; do not raise limits or silently alter the proof. If it persists, isolate the typed evaluation/congrArg boundary. A second related red triggers minimal diagnostic, not permutations. Static exact-delta/hash/root/YAML/bash/Python checks first; no local Lean.

Acceptance requires entire exact source and native consumer with six/eleven standard-axiom reports and all controls. Four clean R1 roots and abstract donor availability are insufficient. Scope remains pointwise original Fock coefficient-defined potential/tau cancellation; no literal Core charge equality, full smooth-core identity, physical Spin9/Hardy/fidelity, zero mode or gap promotion. Commit before R2 edits.
