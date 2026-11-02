# Project Lead — F10AV Gate 1 preflight false negative and workflow publication incident

**Date:** 2026-11-01 Pacific / 2026-11-02 UTC  
**Repository:** `etblink/math`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** Engineering causal review only. No new mathematical theorem is accepted here.

## Unchanged mathematical authority

- Qualified original gamma exhaustive native pair Lie-bracket predecessor: F10AU, strict [run #41372474729](https://github.com/etblink/math/actions/runs/41372474729), exact tested SHA `0fab538e626080cc97136755b645dc8372424741`.
- F10AV *candidate* original gamma coefficient `LinearMap` source SHA `d6c89c147c0c1e4527e9d70412394aebff9b691e` at `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10AVOriginalGammaCoordinateLinearMapSkewImage.lean`.
- Target is a source-native skew (9×9) to original gamma skew (16×16) image proof. It does **not** claim arbitrary bracket preservation, a LieHom, global Spin(9) integration, original Spin(48) lifting, Fock action, or BFSS physical/spectral content.
- Frozen Lean `v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; source and proof obligations are unchanged by the workflow repairs.

## Red #1: F10AV Gate 1 is a Python preflight false negative

[Run #41375113865](https://github.com/etblink/math/actions/runs/41375113865), exact commit `181f4587808100c21ffc2ae8ccb3b5ccdbc38b4b`, fails in **step 3**, before dependency restoration and before Lean compilation, with `AssertionError: coordinateToOriginalGammaLinearMap`.

The workflow's `s.count('#print axioms '+n)==1` uses an unanchored substring. The short name `coordinateToOriginalGammaLinearMap` appears as a prefix of seven different longer `#print axioms` lines; its exact declaration line appears once. Similarly, `coordinateToOriginalGammaLinearMap_coordinatePlane` appears as a prefix twice. All eight requested declaration names have exactly one *full-line* `#print axioms` occurrence.

**Causal classification:** validator false negative; not a theorem refutation, not a Lean kernel failure.

**Prospective repair contract:** use `len(re.findall(r'(?m)^#print axioms '+re.escape(n)+r'[ \\t]*$',s))==1` for each named root; retain the separate total count, independent exact-type Lean audit, per-declaration axiom whitelist, original-source pins, and full warnings-as-errors compile.

## Red #2: publication-time replacement expansion malformed the workflow

An initial workflow-only repair was committed as [`09062f34`](https://github.com/etblink/math/commit/09062f34d189f0ceda5d493c2174f0ed36c89fcf). [Run #41376229127](https://github.com/etblink/math/actions/runs/41376229127) was rejected before a runnable workflow job.

The publication helper invoked JavaScript `String.replace(old, replacementString)` where the replacement contained the literal regex suffix `$'`. In JavaScript replacement strings, `$'` is a special substitution for the entire *post-match suffix*, which duplicated workflow content and truncated the inserted Python line. This was **not** a Lean failure, and the malformed commit is not accepted.

**Prevention:** use the replacement-callback form `String.replace(old, () => replacementString)` or another literal-safe string replacement. Before publishing, compare old/new lines, assert precisely one changed line, assert expected content length, and review the resulting GitHub diff. Do not use unescaped substitution strings carrying `$'`.

## Corrected Gate 2 execution

Workflow-only corrective commit [`6f8cf820`](https://github.com/etblink/math/commit/6f8cf82093ca1cd756d3e6cf15bdafb4ecf6677f) reconstructs the intact original workflow from the known predecessor and replaces **exactly one line**. Source remains unchanged. The corrected workflow blob is `9c1f294126d04ff7c7ed5ee1c4bc7bcee4e727e0`.

[Run #41376326160](https://github.com/etblink/math/actions/runs/41376326160) at exact tested commit `6f8cf82093ca1cd756d3e6cf15bdafb4ecf6677f` has already passed the source/ancestry preflight and proceeded to dependency restoration at this record's creation. **It has not yet received full F10AV qualification in this record.**

## Required qualification before promotion

A terminal successful gate must show: (1) frozen source and toolchain pins; (2) accepted F10AU and V9F ancestry rebuild; (3) fresh F10AV `lake env lean -DwarningAsError=true` compilation; (4) independent Lean elaboration of all eight exact declaration types; (5) declaration-level axiom reports restricted to `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`; (6) exact tested SHA, job logs, and retained artifact identity/hash.

Do not conflate a green workflow with a stronger theorem statement; do not promote any original source global Spin(9) or BFSS physical theorem from this gate. Earlier red runs remain immutable negative engineering evidence.
