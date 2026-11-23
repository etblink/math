# GM5E5 R1 independent consumer RED and bounded R2 repair

[GM5E5 R1 #45126329908](https://github.com/etblink/math/actions/runs/45126329908) tested commit `42db5bd85f43f7471331fd690fe008539ef290a9`, attempt 1, job `137531376515`. Frozen source and consumer preflight passed. The pinned Lean 4.34.1 and Mathlib restoration passed. The native build completed all 9,151 jobs. The theorem `FCP.BFSSGM5E5.weightedNativeGraph_totallyBounded` reported `propext`, `Classical.choice`, and `Quot.sound`.

The standalone independent paired SU(2) consumer failed at line 19:33 with `Unknown identifier coreToL2`. The missing consumer theorem at line 31:14 is downstream of that elaboration failure. The strict GREEN sentinel was not emitted. GM5E5 remains unqualified.

The qualified GM5E4 consumer brought `OAI.BFSSQuantum.AlgebraData` into scope. R2 explicitly names `OAI.BFSSQuantum.AlgebraData.coreToL2` at the single failing occurrence in GM5E5. This is the source definition used for the same input limit in GM5E4. R2 preserves the theorem statement, all other independent consumer inputs and checks, the source proof, dependencies and workflow. Qualification requires a new strict GREEN on the exact R2 bytes.

The [original provider artifact #14796995405](https://github.com/etblink/math/actions/runs/45126329908/artifacts/14796995405) is also preserved as an [unmodified ZIP](evidence/gm5e5-r1-original-red.zip). Its 17,327 bytes have SHA-256 `fd3165629a6da342afbf81104a505075195eed5a483f2c3985991b6b3b4b772b`, matching metadata and the original upload log. All seven members passed CRC. The embedded tested SHA, tested blobs and environment digests match the checkout. The [manifest](evidence/gm5e5-r1-original-red-manifest.json) records member hashes and links the [complete job log](evidence/gm5e5-r1-original-red-complete-job.log).

| Tested file | R1 Git blob |
| --- | --- |
| Native source | `fd39e85e5d7c2d6009c53416072ba23b7440a81f` |
| Independent consumer | `0724a035bb43029396d3bbeb4c56c0fd6be85c58` |
| Strict workflow | `f9b9eb5542aed24195fe905dbf579d30d0c341e3` |
