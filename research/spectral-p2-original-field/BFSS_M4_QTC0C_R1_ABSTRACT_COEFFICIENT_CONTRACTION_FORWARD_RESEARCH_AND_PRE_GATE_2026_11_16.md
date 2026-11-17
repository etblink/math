# BFSS M4 QTC0C R1 — abstract ordered-word coefficient contraction

Date: 2026-11-16 Pacific. **Pre-gate research, no Lean qualification.**

## Research inference

On the original Fock complex-linear operator carrier, QTC0A strictly qualified the Leibniz expansion [#44001621836](https://github.com/etblink/math/actions/runs/44001621836). Direct QTC0B reindex attempts [R1 #44012367725](https://github.com/etblink/math/actions/runs/44012367725) and [R2 #44014529416](https://github.com/etblink/math/actions/runs/44014529416) failed on Lean tactic matching, not on the algebraic identity. The source-direct route was stopped after these two related REDs. Both original ZIPs, logs and SHA-256 manifests remain committed. Do not stage an unchanged direct QTC0B R3.

The desired result is free of Fock/Clifford/topology. For any finite index `ι`, arbitrary additive commutative complex module `M`, ordered symbols `w : ι → ι → M` and completely unrestricted `a b : Matrix ι ι ℂ`:
```text
∑ i j p, (a p i * b i j) • w p j
     = ∑ p j, (a*b) p j • w p j

∑ i j p, (b i j * a p j) • w i p
     = ∑ i p, (b*a.transpose) i p • w i p

[sum of both triple expressions]
     = ∑ r s, (a*b + b*a.transpose) r s • w r s
```

The first identity is a finite sum permutation plus `Matrix.mul_apply` and `Finset.sum_smul`. The second is analogous, but the right coefficient is `b*a.transpose` with **no skew assumption**. The combined identity only uses `Matrix.add_apply`, `add_smul` and finite-sum addition. No commutation of `w_{ij}` occurs; the proof concerns module addition and scalar actions only.

The action `D_a(b)=ab+b aᵀ` is the infinitesimal congruence action of `GL` on rank-two covariant tensors, and reduces to `[a,b]` only if `aᵀ=-a`. It is the correct ordered-generator source rule, not an excuse to assert the original BFSS physical representation or global group action.

Independent exact-rational checks: 50 deterministic examples each at dimensions 1,2,3,4 (200 total), comparing every ordered-word coefficient of the two triple sums against `ab+b aᵀ`: no discrepancies. Deliberately non-skew `a=I`, `b=E₀₀` gives `2 E₀₀`, whereas `ab-ba=0`. Numerical checks are **not** theorem evidence.

## QTC0C R1 proposed verification

- One new standalone source import `Mathlib.Tactic` only; no original Fock/Clifford imports, no source-alias hiding; generic `M`, `[AddCommMonoid M]`, `[Module ℂ M]`.
- Three public source roots: left, right, combined coefficient contraction; three separate importing consumer roots. Consumer runs at `Fin 0`, `Fin 1`, `Fin 2`, `Fin 3` with arbitrary symbols and unrestricted matrices, plus explicit nonskew `I/E₀₀` controls. Independent source/consumer Lean compilation and `#print axioms` allowed only `propext`, `Classical.choice`, `Quot.sound`.
- All QTC0A accepted source/consumer/workflow blobs, original green ZIP and two QTC0B original RED artifacts and logs pinned in strict preflight. Preserve the existing `BFSS_GATE_STATE.json` stop on direct QTC0B R3 in historical ledger.
- Pinned Lean 4.34.1, Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; no `sorry`, `admit`, `axiom`, `unsafe`, resource escalation or proof of Fock adapter by editorial inference. Strict positive auditor + mutant negatives and original job evidence for every outcome.
- Acceptance requires full cold source and independent consumer GREEN with standard-only printed axioms; GREEN roadmap alone is not sufficient. First RED: archive exact provider original ZIP, full logs and source SHA before any changes. Second analogous failure: stop and reassess. No changes to `main`.

## Scientific payoff and ceiling

QTC0C alone gives a reusable theorem in finite-dimensional coefficient algebra. Its next consumer gate, *after qualification*, is a thin original Fock adapter combining QTC0A's frozen Leibniz expansion with `w i j := x i * x j` and the module theorem. That adapter must be verified against exact original carrier and must not alter the source normalization `1/4` or coefficient signs. QTC1 real-to-complex K(B), QTC2 native K(A) bracket, source physical-domain symmetry and original BFSS fidelity certificate remain **open**. QTC0C is a supporting branch, not a prerequisite to all spectral/fidelity routes. Revisit the fixed-positive-regulator Hardy/resolvent physical objective after the next qualified mathematical gate.
