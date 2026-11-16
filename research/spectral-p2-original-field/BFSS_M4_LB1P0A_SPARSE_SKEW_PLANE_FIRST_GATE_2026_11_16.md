# BFSS M4-LB1P0A — exact source 48-label skew-plane first microgate

**Date:** 2026-11-16 Pacific. **Status:** staged, not yet qualified. **Branch:** `integration/bfss-unified-research-20261108`. Parent accepted [LB1L2 #43937204884](https://github.com/etblink/math/actions/runs/43937204884), blob `b4012951a26aa7573db513adab3d7ce27396db7e`, qualified on actual `Fermion 2` Fock operators.

P0A intentionally proves **only original 48-label real-matrix geometry**. Definition on unchanged `Source48Label`:

```text
E^(ij)[p,q] = (if p=i and q=j then 1 else 0)
             - (if p=j and q=i then 1 else 0)
```

Two source theorems: entrywise `E[p,q] = -E[q,p]`, including coincident indices, and native `E.transpose = -E`. Separately compiled independent consumer checks both as imported compiled theorems. No closed form `K(E)=½ Γ_i Γ_j` is claimed. No full original bivector Lie bracket, global Spin9, original SU2 Gauss 16-charge domain or spectral theorem is claimed. The complete P0 plan is recorded in [forward design](BFSS_M4_LB1P0_ELEMENTARY_SKEW_PLANE_BRIDGE_FORWARD_RESEARCH_2026_11_16.md).

The strict workflow pins the exact P0A source+consumer bytes and all original LB1L2/LB1C1/LB1C0/LB1S/LB0/source-gamma/Lean/Mathlib sources. Requires cold native source build, explicit `-DwarningAsError=true` source audit, independently compiled consumer, four standard-axiom reports, no sorryAx/errors/unallowlisted warnings and preserved artifact. No source rewrite, resource increases, synthetic gamma or main-branch modifications.

**Next after P0A GREEN only:** isolate the sparse two-term contraction to prove `K(E^(ij))=½ Γ_i Γ_j` for `i≠j`, with correct real-smul-to-complex coefficient, and source-exact independent consumer. Stop on first RED; diagnose and retain exact failure. Full production LB1L0 remains unqualified.
