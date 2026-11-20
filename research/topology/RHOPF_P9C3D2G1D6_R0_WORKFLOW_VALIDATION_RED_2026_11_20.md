# RHOPF-P9C3D2G1D6 — R0 invalid workflow configuration preserved

**Date:** 2026-11-20 (Pacific). **Disposition:** REJECTED_WORKFLOW_CONFIG_RED, **not a Lean proof attempt**.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Initial implementation:** `297f49f21c3881004b55273cb695ad70bc2c3b6b`.  
**GitHub Actions run:** [#44769236274](https://github.com/etblink/math/actions/runs/44769236274), concluded failure **with zero jobs**, so no artifact or native/independent Lean compilation exists.

## Root cause and remediation

The first D6 workflow YAML was corrupted during scripted substitution of an embedded Python source-import assertion: the JavaScript replacement interpreted the `$'` text from the Python regex as a replacement directive, inserted an unintended suffix and duplicated the job block. GitHub's workflow parser consequently rejected it before any job started. The original invalid workflow bytes remain in Git history at `297f49f21c3881004b55273cb695ad70bc2c3b6b`.

The repair discards the duplicated tail and restores the complete exact source-import assertion. Assertions confirm only one job, one signed-permutation/source-integrity preflight, one artifact upload, exactly two declared imports and the new source/consumer Git blob pins. The accepted G1D5 source and F2 source, and the new D6 Lean proof itself, are unchanged. No artifact exists for R0 because GitHub launched no steps.

The corrected D6 CI is unqualified until successful original source-native and independent imported-consumer checks, with strict axiom reports and independently verified artifact ZIP checksum. Do not count GitHub's R0 failure as evidence for or against the mathematical freeness theorem.
