# RHOPF-P9C1B0 R1 — exact RED CI audit filename mismatch

**Date:** November 19, 2026 (UTC and US Pacific).
**Original strict run:** [#44517493380](https://github.com/etblink/math/actions/runs/44517493380), attempt 1, **RED**.
**Exact tested commit:** `ad4a366531af261acd4051aecfe855b9d3aee668`.
**Status:** native and independent Lean declarations compiled; final audit script failed. Do **not** promote R1 as a strict CI GREEN.

## Exact evidence

Source/hash/declaration preflight passed and Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration passed. The accepted original P9C0/P9C1A and F10AE dependencies built successfully. The original P9C1B0 source itself compiled under `-DwarningAsError=true`; the separate Lean consumer also compiled under warning-as-error. All six native theorems and six consumer axiom reports contain **only** `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.

The sole failing workflow step was the final *Python report parser* in the independent-consumer step, which attempted to read nonexistent
`$RUNNER_TEMP/rhopf-p9c1b0/native-relational-projection-and-axioms.log`.
The native step actually wrote
`$RUNNER_TEMP/rhopf-p9c1b0/native-relational-trace-and-axioms.log`.
The former name was carried over from P9C1A during workflow construction. The Python audit exited `FileNotFoundError`. No Lean theorem failed.

The original [artifact #14526846872](https://github.com/etblink/math/actions/runs/44517493380/artifacts/14526846872) was downloaded independently. ZIP SHA-256 matched GitHub's digest `ef852af30dc36dbc3b778f5b7ded1552346e7af24625445fb83b59b2300cbaa9`; archive contains exact-tested commit and both complete original native/consumer axiom logs.

## Bounded repair and strict acceptance rule

R2 repairs **only** that one filename reference in the existing P9C1B0 strict workflow. It does not change the original gamma source, either Lean theorem/consumer file or their Git blobs, the pinned toolchain, resource limits, axiom whitelist, original independent integer consumer, or physical claims. Re-run strict CI at a new exact commit, verify downloaded new artifact and twelve native/consumer reports, and only then promote.

P9C1A strict GREEN remains accepted. The currently established *within R1 compiled Lean artifacts* include original projector trace exactly four and projector nonzero, but **R1 remains workflow RED**. A native Lean theorem `Matrix.rank P=4` and source selected Hopf-coordinate equality still require separate bounded gates. Preserve P9A1B R1/R2/D0 REDs.
