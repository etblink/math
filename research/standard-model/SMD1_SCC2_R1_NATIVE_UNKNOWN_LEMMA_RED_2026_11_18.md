# SM-D1-SCC2 R1 original native RED — unavailable empty-membership lemma

**2026-11-18 | ORIGINAL R1 RED, NOT QUALIFIED.**

- Original strict run: https://github.com/etblink/math/actions/runs/44406382070
- Exact tested commit: `8e7a22baea868f3fa6803d29abb60c8c14b6e1e2`; original job `135162601737`.
- Original artifact: `14476880464` (GitHub provider ZIP, 1825 bytes), SHA256 `ea2cfc0030438239b17ce83a32ff49cb7c3f6385fa999ae2c43652079186c547`.
- Original source blob: `3fd8fe33536c243829479428e97f992a3bb0942c`; original workflow blob `e6beb6c54396994e59a2527308b9015b2f643ba1`.
- Checkout, pinned source and legacy evidence preflight, Lean 4.34.1 and pinned Mathlib restoration **PASS**.
- Cold source failed at `SMD1SCC2FamilyMinimalWitnesses.lean:70:8` with **unknown constant `Finset.not_mem_empty`**. In the printed axiom reports, `empty_witnesses_blocked` included `sorryAx` because elaboration failed. The other source theorem reports appeared, but strict source was not qualified and independent consumer did not run.
- The exact repair is *one proof line*: replace `exact Finset.not_mem_empty w hw` with `simp at hw`, using direct contradiction of membership in the empty finset. Update strict workflow's exact source-blob pin and leave all mathematical statements, consumer bytes, resource limits, original SCC1 and earlier acceptance evidence untouched.
- Original R1 failure remains a negative knowledge asset; never infer that source or consumer qualified from partial axiom reports. Independent archival of original provider artifact and complete job log should precede final SCC2 acceptance.

**Scope firewall:** finite mathematical witness covers only; no physical prediction, continuous parameter result, experimental likelihood, or imported NFC SCC theorem.
