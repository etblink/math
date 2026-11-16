# BFSS M4-LB1L0 D1 R1 RED — workflow filename mismatch before source compilation

**Date:** 2026-11-16 Pacific. **Branch:** `integration/bfss-unified-research-20261108` only. **Status:** operational diagnostic setup RED, NOT a Lean mathematical result.

- [D1 R1 #43923809697](https://github.com/etblink/math/actions/runs/43923809697) completed failure at commit **`dcc6a78777d3661cfe7ee450e9b0cd16fbbac673`**, job **`133497790862`**.
- Checked-out source Git blob was **`4f0358a84d3f79300d5ad077230878803fd200b1`**, actual path `lean/diagnostics/BFSSP3M4LB1L0D1GeneralizedAtomNativeProductBridge.lean`. The workflow accidentally expected `lean/diagnostics/BFSSP3M4LB1L0D1TypedAtomNativeProductBridge.lean`; that latter path does not exist.
- **First-causal failure in exact hash preflight**: `git hash-object --no-filters lean/diagnostics/BFSSP3M4LB1L0D1TypedAtomNativeProductBridge.lean` -> `fatal: could not open ... No such file or directory`, Python `subprocess.CalledProcessError`, exit code 128. Cache restore and Lean diagnostic never ran. **Do not count as evidence for or against the generalized-atom proof.**
- [D1 workflow path-only correction](https://github.com/etblink/math/commit/86c898450abcfb362c8caaed1e3b2f9ee24d185b) committed as **`86c898450abcfb362c8caaed1e3b2f9ee24d185b`**, workflow blob **`1cb9006b9ad780a32b65ea1b2db0ea83754bffb5`**. Exact D1 proof source **unchanged**, accepted LB1C1 and all original donors unchanged. [D1 corrected run #43923947361](https://github.com/etblink/math/actions/runs/43923947361) was launched; it must independently pass frozen byte/toolchain checks and two standard-axiom diagnostic reports before any architectural qualification.
- Preserve prior [D0 mathematical diagnostic RED #43921140661](https://github.com/etblink/math/actions/runs/43921140661) separately: unlike D1 R1's missing file, D0 actually reached Lean and failed at native calc recursion line 68. The failed production LB1L0 R1/R2 source remains unchanged and unqualified.

No `main` write, branch deletion or history rewrite. No global Spin9 or physical/spectral theorem inferred.
