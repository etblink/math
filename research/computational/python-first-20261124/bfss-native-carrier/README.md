# MSY source-native occupation bridge — R1 candidate, 2026-11-24 Pacific

Baseline: 531ee92e265f286cffea169212374814a1a77bd4, complete finite 104-row witness. Status: REGISTERED_NOT_EXECUTED for the Lean candidate; finite parity audit executed and passed. No physical claim qualified.

## Why this gate

The native G1A pairedTheta is built through F1 fockBFSSUnitary, not by assuming Fintype.equivFin equals numerical bit order. F3-B7 already gives the true creator and occupied annihilator action on occupationKet A. FockNorm.create_unoccupied_basis_signed identifies the exterior permutation but exposes only ±1 in its conclusion. This candidate exposes that specific permutation sign, supplies the vacant annihilator action, and derives both actual paired Majorana transitions. An independent consumer uses pairedAlgebraData.theta and checks both phase branches plus the last packed mode.

Pinned source: Core.lean, SU2FermionFockProbe, SU2FermionF2Probe, G1A, F3-B2, F3-B7, FockNorm (workflow preflight pins). Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, Mathlib/Order/Hom/PowersetCard.lean defines permOfDisjoint as the permutation mapping singleton-then-increasing-list order to increasing union order. For singleton {i} disjoint from A, the only inversions in [i] ++ sorted(A) are the elements a<i. Consequently its sign is (-1)^card(filter (fun a => a<i) A). Removal uses A.erase i, which has the same smaller-mode count. This is a mathematical derivation, not a Lean-checked parity theorem in R1. Source majorana1 is sqrt(2)/2 * i(creator-annihilator), so the phase differs by a minus sign between occupied and vacant cases. The computational t=√2 theta rule agrees with these conventions. No assertion about numeric native Fermion 2 coordinate enumeration.

## Independent parity audit

Run python audit_parity.py from this directory with the archived sibling bfss-seed-transport/source_seed_integer.npz (SHA256 131e703b19da9a1aea1e137dac45f451bbfc7f64374aff6619a46488410d5ff7). 19,136 support masks, squared norm 8,072,064. All 918,528 sign/phase comparisons against explicit permutation inversion counting passed. Omitting the exterior sign mismatches 436,352; reversing odd phase mismatches 459,264. This checks the finite support and models the pinned permutation; it does not execute Lean or formally identify all native coefficients.

## Qualification boundary and next action

R1 source and consumer must pass pinned native build, strict warnings, exact axiom roots, artifact integrity and success marker. No local Lean installation was available. A workflow run is requested by push, not a qualified result. If R1 passes, formalize the general singleton-sorting parity and coefficient-sum/occupation-carrier adapter. Then use the native gauge and Spin(9) infinitesimal actions and exact finite singlet evidence; do not identify Lie annihilation with global invariance without connectedness/generator coverage. Avoid a 2^24-square matrix or giant native-decide proof. Reuse original RAD-C3D-B graph membership and closedness for radial cutoff convergence; full source carrier, all-axis gauge/Spin singlet, charge and auxiliary Hardy/fidelity interfaces remain open.

Historical weighted systems and the complete 104-row finite threshold crossing remain unchanged.
