# Packed mask R1 RED / R2 explicit membership transport

Date 2026-11-25 Pacific. Branch integration/bfss-unified-research-20261108.

## R1 RED_UNQUALIFIED
Run https://github.com/etblink/math/actions/runs/45609727031 ; exact tested commit 7971bcb7733e0810a534917e194323f0f06d620e; job 139189801550. Checkout, frozen-source preflight and pinned Lean/Mathlib restoration passed. Sole native diagnostic at BFSSMSYPackedMask.lean:93:6: simp made no progress in decode_xor, non-toggled index and occupied-mode branch. Seven roots mem_decodeMask, decodeMask_injective, decodeMask_bijective, xorMask_bit, decode_and_low, popcount_low, source_even_mask_weight report only propext, Classical.choice, Quot.sound. decode_xor_source inherits sorryAx; independent consumer not reached. No resource-budget failure or promotion from failed gate.

Original artifact https://github.com/etblink/math/actions/runs/45609727031/artifacts/15018409894 ; independently downloaded, locally rehashed with Python, 8810 bytes, SHA-256 451f03f491dded77c827cf303e7be17c0ac186a02e43348e01de9edbd4ab9886 matches metadata. ZIP CRC clean, six members (cache.log, environment-sha256.txt, native-source.log, preflight.log, tested-blobs.txt, tested-sha.txt), tested-sha.txt matches exact commit and preflight sentinel verified. Full decoded original job log preserved. Original Actions ZIP expires 2026-12-25 UTC.

## R2 REGISTERED_NOT_EXECUTED
Pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 Mathlib/Data/Finset/Erase.lean: mem_erase has a ∈ erase s b ↔ a ≠ b ∧ a ∈ s. Mathlib/Data/Finset/Insert.lean: mem_insert has a ∈ insert b s ↔ a = b ∨ a ∈ s. Replace the two non-toggled-index branch simplifications in decode_xor with explicit forward/backward membership implications using these declarations and Ne.symm hik. Keep the toggled-index cases, seven clean roots, theorem statements, imports, independent consumer, frozen dependencies and strict workflow unchanged. This avoids reliance on simplifier matching of local disequalities. No kernel-budget changes. Local Lean unavailable; qualification pending strict CI and artifact audit. No odd inclusive-mask parity or physical promotion.
