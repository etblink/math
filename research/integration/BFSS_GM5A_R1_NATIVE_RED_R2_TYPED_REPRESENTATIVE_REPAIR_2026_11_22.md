# GM5A R1 native failure and R2 repair

[Run #45092440735](https://github.com/etblink/math/actions/runs/45092440735) failed on exact commit `7d91dbec6ac65d5b2265b76ebd47af540d0a8b28`, job `137424801177`. The frozen-source preflight and the pinned Lean 4.34.1 and Mathlib setup passed. The final native build target, job 9105 of 9105, failed before the independent consumer could run.

The first Lean error was `maximum recursion depth has been reached` at line 39, column 2 of `BFSSGM5AOriginalPhysicalMasslessCorePairing.lean`. The `change` tactic tried to expose the lifted physical input and the complex quantizer in the same pointwise definitional equality. The core input declaration printed the three standard axioms. The dependent pairing and energy declarations printed `sorryAx` because the proof failed. GM5A R1 is unqualified.

The [original CI ZIP](https://github.com/etblink/math/actions/runs/45092440735/artifacts/14782114587) is preserved [in this branch](evidence/gm5a-r1-original-red.zip). Its 14,166 bytes match the provider and job-log SHA-256 `6e3ff669af577a205f4de441d614d768e6da95d8d8433126afb12efefb107bc0`. All six members passed the ZIP CRC check. The embedded tested SHA and the three tested Git blobs match the Git tree of the exact run.

| Tested file | Git blob |
| --- | --- |
| Lean source | `21970c2652ebf62940ea5965ec4ae502731e673f` |
| Independent Lean consumer | `73d8fabc72aec8412e8696a7c0484b83b66ce654` |
| Strict workflow | `e4309723ca2e78d79076407b840007b8a0c5ee2d` |

R2 first proves the pointwise formula for an arbitrary original smooth core vector using the `coreToL2_ae` representative equality and the existing real-field restriction. It then rewrites the lifted input at the `FullL2` level before applying that formula. The public theorem statements, independent paired consumer, workflow, source pins, axiom checks, and Lean resource limits are identical to R1.

R2 requires a new strict build, independent consumer result, and evidence audit. The qualified GM4B2 result remains the current accepted result on this track.
