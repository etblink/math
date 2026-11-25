# Coefficient carrier R1 RED / R2 implicit dimension repair

Date 2026-11-24 Pacific. Branch integration/bfss-unified-research-20261108.

## R1 RED_UNQUALIFIED
Run https://github.com/etblink/math/actions/runs/45556014646 ; exact tested commit 11f4ed0636e024e83a7c1afc6476d3ea0dcf3b5c; job 139008120896. Exact checkout, frozen-source preflight and pinned Lean/Mathlib restoration passed. Native build reports exactly one first-causal error at BFSSMSYCoefficientCarrier.lean:28:7: Function expected at fockCoordinates_apply ?m.125 ?m.126. The pinned FockNorm.lean declares variable {Q : ℕ}; fockCoordinates_apply has two explicit arguments (x : Space Q) and (A : Finset (Fin (Q+1))), not three. The additional placeholder is applied to an equality proof rather than a function. Four clean roots carrier_norm, occupationParity_erase, evenKet, oddKet report only propext, Classical.choice, Quot.sound. Remaining four roots inherit sorryAx from the failed coordinate recovery. Independent consumer not reached. No large-index resource failure was reported. No promotion from this failed gate.

Original artifact https://github.com/etblink/math/actions/runs/45556014646/artifacts/14996420495 ; independently downloaded and checked in Python, 8370 bytes, computed SHA-256 47762dac3539c0c941a250d4c4e5d1c784e617b2e2eac1919c64b21bccce1326 matches metadata. ZIP CRC clean, all six members present and tested-sha.txt exact. Full decoded original job log preserved alongside this memo. Original Actions ZIP expires 2026-12-25 UTC.

## R2 REGISTERED_NOT_EXECUTED
Replace only the erroneous application with (fockCoordinates_apply (Q := 23) ((fockCoordinates 23).symm c) A).symm. Bind the implicit dimension and both explicit arguments, following the literal pinned theorem signature. All statements, other proofs, independent consumer, frozen dependencies, workflow and strict settings unchanged. No local Lean compiler available; strict CI and independent artifact audit required. No physical qualification, normalized coefficient-side operator equality or packed-bit transport claimed.
