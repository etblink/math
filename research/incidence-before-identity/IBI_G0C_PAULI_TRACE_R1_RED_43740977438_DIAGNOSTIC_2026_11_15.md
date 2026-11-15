# IBI-G0C Pauli trace — R1 RED diagnostic, preserved

**Date:** 2026-11-15 Pacific.
**Research branch:** `research/bfss-incidence-unified-20261114`.
**Verdict:** RED_NOT_QUALIFIED; no G0C or surjectivity acceptance.

- [Strict run #43740977438](https://github.com/etblink/math/actions/runs/43740977438) at exact tested commit `df1ec4b0d14b0ad882b0ad1b8127f44933a3ca6e`; job `132893853905`.
- Checkout and source-contract preflight passed. Pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored. The original G3A dependency compiled, but the first new G0C module did not.
- Concrete Lean parser failures: `IBIG0CPauliTrace.lean:31:29` and `:47:29`, both `unexpected token 'ᴴ'; expected ')', ',' or ':'` at unscoped postfix conjugate transpose. The resulting declarations depended on `sorryAx`; no source theorem or consumer accepted.
- Independent consumer was NOT reached. Any claim of R1 passing independent consumers or axiom checks is false.
- [Diagnostic artifact #14172339201](https://github.com/etblink/math/actions/runs/43740977438/artifacts/14172339201), GitHub-reported ZIP SHA256 `98acbb7059a4db9d7197edd625da6d2d599a2f8a903a4109fa16ae79aeba7956` (not independently downloaded/rehashed).
- Repair hypothesis: avoid scoped `ᴴ` notation. Use the exact upstream spelling `.conjTranspose` in both source and consumer, without changing theorem contracts, imports, or source donor. Regenerate strict workflow content pins.
- Stop after another analogous failure rather than making blind repeated proof or theorem-contract changes. Source normalization proof and SO(3) surjectivity remain formally open.
- No changes to unified integration or main.
