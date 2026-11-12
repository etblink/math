# D5-B3 accepted — first live-roadmap checkpoint test (2026-11-12)

The new repository BFSS control system was tested in its FIRST operational loop:

1. Read root `BFSS_ACTIVE_ROADMAP.md` and `BFSS_GATE_STATE.json` from the active integration branch, not an earlier chat note.
2. Discovered active gate `P3-D5B3`, expected candidate commit `c143acd0b485d18474ceada0b3c5b64a1d7d62c0`, and pending strict run [#43325774438](https://github.com/etblink/math/actions/runs/43325774438).
3. Independently verified run `43325774438` **completed SUCCESS** attempt 1 at that same SHA. All steps succeeded; 75 source/consumer blob pins and toolchain lock passed; exactly **9,181 cold-build jobs** succeeded; independent consumer passed; named declaration axiom audit passed with only `propext`, `Classical.choice`, `Quot.sound`.
4. Accepted source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3D5B3OriginalFockL2ColumnIsometry.lean`, Git blob `e17a6e5d174ba9362d9dc201b07d88bec723c18d`, and unchanged independent consumer blob `ca560ddfe3b5494dcad5560f9c7fa715a5ab918a`.
5. Evidence artifact `13993603128`, sha256 `73cbaa4ad80e68b3f28acb1bdd0c7e5cbe2b748a47984559414645ba485e62a9`.
6. The previous causal red [#43322309537](https://github.com/etblink/math/actions/runs/43322309537) was an internal Lean `whnf` reduction timeout at original massive Fock type, **not** a contradiction. Generic-first proof of `LinearMap.isometryOfInner` at abstract Hilbert types made the exact same theorem compile without heartbeat changes. The failed consumer symbols and sorryAx were cascading. Preserve this as usable *negative procedural knowledge*.
7. Promote precisely five named D5B3 declarations to accepted status; **not** surjectivity, isometric equivalence, true SU2 physical fixed-space covariance, original closed H graph, eigenpairs, or a mass gap.

## Next decision and exit test

**M1 remains active.** Next bounded proof gate is **P3-D5B4A coordinate assembly and surjectivity**, separately from B4B equivalence. Given a finite family `v : PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)`, construct `f : Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ` from `fun x => WithLp.toLp 2 (fun i => (v i) x)`. Use accepted `MemLp.of_eval_piLp` / `memLp_piLp_iff` and `MemLp.toLp`; prove each projected column equals `v i` with accepted D5B0 a.e. application and `Lp.ext`. Then use `originalFockL2ColumnsIsometry_apply` to identify the range. Prefer a generic finite-carrier lemma before source specialization; avoid unfolding original Majorana structure.

**B4B** can apply pinned Mathlib `LinearIsometryEquiv.ofSurjective` only after B4A is qualified.

## Tested system feature

The first roadmap watchdog passed [run #43329226093](https://github.com/etblink/math/actions/runs/43329226093) at root-control commit `69880296f819d28af7a044cb687b2c77ffa72269`. This checkpoint revision is *committed BEFORE opening the next mathematical gate*. The control files are pointers and decisions; strict source proof receipts remain the mathematical authority.
