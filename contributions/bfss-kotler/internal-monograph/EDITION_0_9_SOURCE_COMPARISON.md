# Edition 0.9 source comparison

This companion is for a project lead or collaborator preparing the next source consumer. The editorial cutoff is unified integration at `9ee5c7a999531bd502b4ff076af278ba9be5353b`.

## Decision

On every original paired gauge-invariant smooth core vector, explicitly identify the expectation of the qualified physical massless multiplier with the real fermionic pairing in the original sixteen-charge identity. The conventional composition is given in Chapter 7. Its exact Lean statement requires a new consumer qualification. The comparison below identifies the dependencies and intended domain.

| Interface | Source or receipt | Exact use |
| --- | --- | --- |
| Historical S4B34 | [FCP #40461814814](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40461814814) | The signed fixed-fiber Pauli/Fock formula, on the paired data |
| Historical S4B35 | [Source imported by S4B36](https://github.com/etblink/Foundational-Convergence-Program/blob/fb27ba44a6c8688ace3d2627511400845bae004d/experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS4B35PairedSourceSmoothCoreEnergyProbe.lean) | The smooth-core coordinate energy with the fixed-fiber formula |
| Historical S4B36 | [FCP #40472176948](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40472176948) | The historical closed charge energy evaluated on the original embedded invariant smooth core. S4B34–36 are outside the selected unified Lean import closure. |
| Integrated massless energy | [Math #42325087575](https://github.com/etblink/math/actions/runs/42325087575) | The generic source core form at massless parameters. Instantiate at the named paired data. |
| M1b and D0a–D0c1 | [Target strict #45059474635](https://github.com/etblink/math/actions/runs/45059474635) | Fix the source real-restriction equality and almost-everywhere action of the original complex multiplier. |
| Native charge graph | [M5BE0](https://github.com/etblink/math/actions/runs/43493125150), [M5BF0](https://github.com/etblink/math/actions/runs/43498649514) | The native Hamiltonian uses the exact natural adjoint-square domain. The original charge graph rebase connects this form to the core. |
| Physical multiplier | [GM4A](https://github.com/etblink/math/actions/runs/45078834611), [GM4B1](https://github.com/etblink/math/actions/runs/45082278440), [GM4B2](https://github.com/etblink/math/actions/runs/45085548204) | Restriction of the multiplier to physical inputs, physical outputs, a dense domain, and a closed graph. The core inclusion is already used in the density proof. |
| Lower bound on concrete data | [P2-C2](https://github.com/etblink/math/actions/runs/43174015946), [P2-C4B](https://github.com/etblink/math/actions/runs/43249643884) | Exact growth with the finite source coefficient and smooth-core integrability. Check the concrete and paired data crosswalk before specializing this bound. |

1. For an original invariant smooth core vector, name its image in the original physical space and its memberships in both natural domains. Use the existing smooth-core domain and charge graph lemmas.
2. Use the named physical multiplier and its defining inclusion into ambient L². Apply the almost-everywhere action on the existing representative and substitute M1b at that point.
3. Use the real part of the complex L² inner product to identify the integrals. Keep the kinetic factor one-half and the charge factor one-sixteenth from the supplied source declarations. A small intermediate theorem for just the real pairing is sufficient if the full composition elaborates poorly.
4. Check the composed statement independently at the original paired data. A useful consumer may restate the core energy identity using the named physical multiplier and the exact domain witnesses, so it exercises both the field and the form.
5. Choose a wider-domain statement only when the intended use is clear. Extending separate terms to all of the completed charge-form domain requires estimates for those terms or convergence in an appropriate common domain. The native charge graph closure alone supplies charge-norm convergence.

## Chapter migration

| Edition 0.8 | Edition 0.9 |
| --- | --- |
| 1–6 | 1–6 |
| 7–9 | 8–10 |
| 10–11 | 11–12 |
| 12 | Bounded Gram section in Chapter 9 |
| 13–14 | 14 and 20. The certificate derivation moves to Chapter 13. |
| 15–17 | 16, 15, and 18 |
| New material | Chapters 7, 13, 17, and 19 |

The earlier chapter numbers in the Edition 0.8 atlas remain useful for the published historical PDF. The appendix's current claim index maps the November 22 qualifications to the corresponding chapters of this edition. A bibliographic or mathematical citation should resolve to the exact original source and receipt when available.
