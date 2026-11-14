# TD-C1A R4 — bounded F13/F18 historical provenance audit

**Date:** November 13, 2026 Pacific. **Verdict:** SOURCE PROVENANCE PARTLY RECOVERED; STRICT QUALIFICATION NOT RECOVERED. No F13/F18 theorem is newly admitted as a dependency. Current integration snapshot inspected: 454fad941b2b4b7e8bc54014420ad83087914a2d.

## Exact source inventory

The actual paths lie under lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/ and have the SU2BFSSPhysicalDomain prefix.

| Source | Current Git blob | Declared new root |
| --- | --- | --- |
| L9E5F13 | `778cb87de23a6743876fdcd92610633e7f6dfc6f` | originalNativeSixteenSpinFock_unitary_majorana_covariance |
| L9E5F18A | `08c84ad6792a88af1540ce8d5e5e509869431559` | originalNativeSixteenFock_pairedTheta_right_covariance |
| L9E5F18B | `bde9ac2a17406d80a1301a2d2bcb0dbfe7f864e0` | originalNativeSixteenFock_source_vector_covariance |
| L9E5F18C | `1535651a4f57feb6b9177dc9c2a220f07faa2fc1` | originalNativeSixteenFock_sourceGaugeHom_identification : |

F13 explicitly says STAGED ONLY / NOT KERNEL QUALIFIED, NO CI, and names F12 as pending. F18A says prospective/unqualified. F18B and F18C explicitly prohibit acceptance without preceding exact-source kernel and axiom audits. These are historical source comments, not proof that a later qualification never occurred.

F18A is an additional required bridge omitted from the abbreviated R4 candidate list: F17's native pairedTheta conjugation plus F11 unitarity give right covariance, F18B evaluates on vectors and converts source real coefficients, and only F18C invokes S1H uniqueness. F18B also consumes F15's native group hom. The prospective branch has a larger source/qualification closure than simply importing F18C.

## Recovered import chronology

1. Current F18C path history on the integration branch points to **22c83740d7e53b6e76051144f04e132ddd0663bf**, initial source import on November 8. Its committed navigation note contributions/bfss-kotler/UNIFIED_INTEGRATION_SOURCE_IMPORT_2026_11_08.md identifies source snapshot **contribution/bfss-lean-v040-20261105@fa00aa36e770ca516f57b41f5b02229a5033d50f**.
2. That note says 468 missing Lean files were copied as identical Git objects, 30 existing files were retained, and the import confers **no new Lean qualification**. Historical qualification attaches to exact original commits and requires separate consumer-closure verification.
3. Fetching the literal F18C path at **fa00aa36e770ca516f57b41f5b02229a5033d50f** independently returns blob **1535651a4f57feb6b9177dc9c2a220f07faa2fc1**, identical to current integration bytes.
4. F18C path history at that older snapshot points to **43468ce4a49634af50ca49b1fbe05ee4a23e1fc3**, titled “Add complete physical-operator comparison dependency sources.” This is another source import; no original exact strict run is supplied by the recovered metadata. Its commit endpoint returns 300 file entries and is not a complete inventory of that large commit.

## Bounded receipt search and limits

- Current .github/workflows inventory: 447 files; filename screening for f13, f18, l9e5, native.*fock and s1h found no match.
- Older fa00aa36 snapshot workflow inventory: 2 files; the same screening found no match.
- Commit-message search for F18 across etblink/math and etblink/Foundational-Convergence-Program returned no match. Default-branch code search in FCP for the exact F18C declaration also returned no match.
- These searches are bounded and do **not** establish historical absence. Workflows could have different names, live on other branches, or have been deleted. No FCP source or branch was modified.

**Unrecovered acceptance fields:** original tested SHA, actual workflow/consumer source hashes, completed source+consumer+allowed-axiom GREEN, exact root set and evidence artifact for each required donor. Until recovered or independently requalified, classify these as SOURCE-PRESENT / QUALIFICATION-UNKNOWN, not accepted original gauge identification.

## Project Lead decision

Continue the direct original G4E/S1J operator-interface probe #43546806160 at 454fad941b2b4b7e8bc54014420ad83087914a2d. It avoids making native Spin48 identification a new prerequisite. F13/F18 remain candidate donors for a separate future audit, with exact original import origins now recorded.

A successful focused probe only permits preparing the unchanged original TD-C1A theorem for full strict qualification. M5BF0 and G0B2 remain accepted; TD-C1A remains RED_UNQUALIFIED. No gauge projection, physical Spin9 lift, spectral or unification conclusion follows from copied source.
