# BFSS W0C0 R2 — first GREEN-evidence archiver diagnostic RED

- Archiver [#44196763215](https://github.com/etblink/math/actions/runs/44196763215), job 134440146621, tested commit `f789f36d9f5f6cd9e9a4ed688feea33570d6df83`: **RED, preservation-harness only**.
- Original strict source/consumer theorem [#44192981282](https://github.com/etblink/math/actions/runs/44192981282) remains **GREEN** and unpromoted; no new Lean build was attempted by the archiver.
- Preflight source, consumer, accepted W0B2B evidence, W0C0 R1 and two R2 setup-RED archives passed. Provider-original ZIP download, exact digest, CRC, six theorem axiom reports, strict marker, and original complete job log were checked before the final assertion.
- Failure at preservation Python line 68: `assert b"sorryAx" not in complete`. GitHub echoes the auditor code in the job transcript, including its literal `sorryAx` rejection test. This is **not** `sorryAx` occurring as a source/consumer theorem axiom. Those six reports were separately parsed and accepted.
- Corrective action: remove the unscoped full-transcript substring check, retain source/consumer no-sorryAx axiom audit and provider-integrity checks; relaunch original evidence preservation using the same strict run and artifact. Original R2 Lean source blob `96d3b63d08413f880d1adf0cef8b8e291f7b9453` and consumer `fe9136065179d706c60871ae16e02b8f60e1b189` unchanged.
- The complete original failed archiver Actions log is Git-pinned alongside this note. STOP: do not promote W0C0 merely because an archiver is running or because the native theorem is GREEN. 
