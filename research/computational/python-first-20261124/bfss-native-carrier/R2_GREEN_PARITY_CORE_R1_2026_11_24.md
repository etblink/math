# Native transitions R2 qualified; general parity core R1 staged

Date 2026-11-24 Pacific. Branch integration/bfss-unified-research-20261108.

## Native transitions R2 — GREEN_QUALIFIED
Run https://github.com/etblink/math/actions/runs/45546916877, exact tested commit 2de90c905e539228af662e252046ed6081aced99. Frozen preflight and pinned Lean 4.34.1 / Mathlib PASS; native build 8972 jobs; independent consumer PASS; all five source and two consumer axiom roots contain only propext, Classical.choice, Quot.sound. Required GREEN sentinel confirmed in original job log. Artifact https://github.com/etblink/math/actions/runs/45546916877/artifacts/14992187156 independently downloaded and SHA-256 checked, 8026 bytes, digest 1745e590541f101cadd98038520c58b12274d1a48677e5175c163ce333c40d62. Seven members, matching tested SHA. Full original job log preserved alongside this note. R1 evidence also rehashed, unchanged. No physical domain or ground-state promotion.

## General singleton parity core R1 — REGISTERED_NOT_EXECUTED
Pinned Mathlib GroupTheory/Perm/Fin.lean provides Fin.cycleRange_symm_zero, Fin.cycleRange_symm_succ, Fin.sign_cycleRange; Data/Finset/Sort.lean provides orderEmbOfFin_unique and orderEmbOfFin_compl_singleton_eq_succAboveOrderEmb. Avoid introducing inversion-count machinery or proving the sign of a cycle from scratch.

Two general roots: sign_of_strictMono_succ uses uniqueness of an increasing enumeration of the complement of the initial image, hence the permutation is the inverse of Fin.cycleRange at that image; orderRank_eq_card_filter identifies the rank of an element in a Finset order isomorphism with the cardinality of its strict lower subset. Independent consumer checks inverse cycles and a nonconsecutive set (rank 2 of ambient mode 4).

After qualification, bind the literal Mathlib Set.powersetCard.permOfDisjoint to these lemmas: apply the definition on each sum injection; transport Fin (1+n) to Fin (n+1) without changing sign; prove tail monotonicity and first-image rank; remove singleton from the strict lower filter. Then derive sign in the original source sortSign and creationCoefficient and transport arbitrary coefficients by F1. No enumeration of 2^24 occupations; no physical result assumed. This is a deliberately bounded core, not yet the literal singleton sign theorem. Local Lean unavailable; strict CI controls qualification.
