# G12 R3 — carry over accepted typed complex zero proof

November 15, 2026 Pacific. REGISTERED_NOT_EXECUTED. Commit before source edits. Full-gate predecessor: G12 R2 RED #43730966120, exact `2eea49ab254b0c328e130b5a646bf881acd7d19d`. Required diagnostic D0 R2 accepted #43734601883, exact `5e0836ea1923c8f153bd2b3a0d9c491ebcecabf9`; complete acceptance/evidence committed before this contract. G11 remains the last accepted full gate.

Only replace the failed off-color branch in originalKineticTauDerivativeFermion_eq_bilinear:

```lean
  · intro A _ hAB
    rw [ite_eq_right (Ne.symm hAB), zero_smul]
```

with the exact typed originalOffColorZero proof pattern accepted by D0:

```lean
  · intro A _ hAB
    rw [ite_eq_right (Ne.symm hAB)]
    exact _root_.zero_smul ℂ (M.theta β B * M.theta δ A)
```

All six source statements, the operator definition, every other proof byte, the existing coefficient helper and full native consumer statements/proofs/donor reports remain fixed. Both D0 sources and workflow stay accepted and byte-identical. No diagnostic import, new theorem or model is added. Main workflow changes only the explicit source blob pin. Preserve Lean4.34.1/Mathlib pins, warning-as-error, standard axioms, all166-pin/helpers1+3+1/source6/native12/all12 controls, final scope exclusions and all resource bounds.

The accepted diagnostic demonstrates that this explicit complex zero-action proof works for original carriers; identical printed lemma types do not support a namespace-shadowing claim. The exact cause of the earlier untyped rewrite mismatch need not be asserted to test this minimal source repair.

Before publication verify exact single-branch source delta; fixed declarations, consumer/helper/diagnostic bytes; workflow pin-only delta; hashes/imports/root/example counts; YAML/bash/five Python blocks/literal preflight and auditor rejection fixtures; and checkpoint guarded reopening only after D0 acceptance plus this committed contract. No local Lean is available; static checks do not qualify G12.

On green, independently audit/preserve complete strict source/native receipts and qualify only the ordered pointwise derivative Fock bilinear. Then preregister actual smooth-core rotation and tau norm. On red, preserve complete first-causal evidence; if the same color-zero boundary recurs, return to an isolated source-shaped comparison before any full retry. A new native boundary must receive its own bounded diagnosis, with repeated native conversion isolated before full retry. No unchanged retry, warning suppression, removed control or resource escalation.

D0 acceptance permits this bounded experiment after preregistration; it does not itself qualify full G12. Physical Spin9/covariance, energy/domains, sector Hardy/fidelity and spectral claims remain separate; physical symmetry/energy-domain audit stays highest forward research.
