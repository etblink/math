# Project Lead adjudication of independent Grok referee report

**Date (Pacific):** 11 November 2026.  **Edition:** 0.6 -> 0.6.1.
**Materials:** full user-provided referee report preserved verbatim next to this document; original monograph sources, original `Core.lean` and `DeformedCharge.lean` definitions, exact FCP Gauss source and handoff, and publicly accessible November 2026 arXiv abstracts/selected sections. No independent Lean compilation or full audit of the external preprints was performed.

## Disposition by finding

| Finding | Decision | Precise reason / revision |
| --- | --- | --- |
| F1 one-color slice bound | **Accept need for explicit proof; qualify claimed obstruction** | The book compressed the transition from a fiberwise oscillator exclusion to integrated physical coercivity. At fixed first color row `u`, the remaining two row coordinates transform orthogonally with unit Jacobian and do not generate angular `u`-derivative terms; the potential comparison and integrated kinetic lower bound have been exposed as a conditional smooth-core calculation. Exact original Pauli coefficient, measurable fiber projections, source-vector type/branching, gauge averaging and physical form-domain transport still remain open. No theorem qualification is promoted. |
| F2 oscillator/average coefficient | **Accept** | Print explicitly `2 sqrt(beta) (m+9) I >= sqrt(beta) (m+9) J` from `I >= J/2`. The `8 sqrt(3)` bound is only for the audit's original-coefficient candidate until source-field equality is established. |
| F3 valley packet | **Accept adversarial test; reject claim of constructed Weyl sequence** | A bounded-form-energy escaping family would contradict any uniform first-moment coercivity on its subspace, but the referee did not construct such vectors on the original physical domain. Even a bounded-form-energy sequence is NOT automatically a Weyl sequence without `||(H-E)psi|| -> 0`, normalized weak escape, and operator-domain control. No assertion about the full physical spectrum has been proved here. |
| F4 six-versus-twelve | **Accept** | `[-6,6]` is an infinitesimal CAR/Cartan implementer calculation; the actual source group lift and torus identification must precede using `lambda_2 > m+6`. The operator-valued input-dual threshold remains `m+12`. |
| F5 theorem/proof nomenclature | **Accept** | Reclassify major dependency/provenance-only mathematical reports as `Source account`, with a distinct rationale environment, reserving the conventional `Theorem`/`Proof` format for actual arguments. This is an editorial clarification, not a theorem-level downgrade of a qualified Lean statement. |
| F6 historical atlas and source links | **Accept** | Add the historically qualified L6H5E8AA Gauss theorem G-04 using FCP strict run `38994451291`, source blob `edb1567774ad3616ad9f8b6098ebd7604596191f`, tested commit `68eb2b1d`. Normalize source URLs to the frozen mathematical baseline where the inspected blobs are present; keep exact strict tested commits separate. |

## Literature discovery and impact (not a physical-proof transfer)

- **Kabir Bajaj and Henry W. Lin,** *Solving the SU(2) BFSS model*, arXiv:2611.14512v1 (submitted 10 Nov 2026), https://arxiv.org/abs/2611.14512. Its abstract and Section 4 report numerical positive-energy bound states; Section 4.1 advances an existence argument for infinitely many additional low-total-angular-momentum bound states and cites the earlier 5 Oct 2026 positive-eigenvalue work. This is a potentially important alternate route: analyze its asymptotic channels, representation labels, normalizability and source Hamiltonian identification before treating it as a rigorous source-matched theorem. Do not state that numerical evidence alone proves the existence claims.
- **Alexander Michel, Jaroslav Scheinpflug and Xi Yin,** *99.9...% of the SU(2) BFSS ground state*, arXiv:2611.09837v1 (submitted 6 Nov 2026), https://arxiv.org/abs/2611.09837. The authors present rigorous bounds for a variational state via an auxiliary operator with the same zero-mode space. They do not establish that the *original* BFSS Hamiltonian has a positive full-spectrum gap; their auxiliary gap must remain separate.

The monograph's statement **our source-exact positive eigenpair result remains open** is unchanged. That statement does not assert that no external authors have proved or claimed positive-energy bound states; avoid conflating project qualification with literature-wide status.

## Scientific follow-up decisions

1. Treat physical-sector source/closed form identification as non-negotiable.
2. Separate fixed-row (color) analytical slicing from the more ambitious source-Spin(9) isotypic exclusion. The first can be checked without moving-axis derivatives in `u`, but the latter needs a genuine physical vector representation.
3. Test both potential and fermionic source coefficient identities *before* choosing any numerical threshold.
4. Compare the positive-energy existence argument in arXiv:2611.14512 §4.1 with our original domain/sector framework; look for a shorter rigorous route and possible counterexamples to sector hypotheses. Do not transfer the external paper's mathematical claims into an accepted Lean status.
5. Preserve the original referee report unaltered, including its unverified statements, and record our adjudication explicitly rather than silently rewriting history.

**Governance:** Documentation only, no source physics modification, no Lean/CI gate, no unified-branch fast-forward, and no claim of independent human peer review.
