# SM-D1-SCC3A — finite incidence and private-pair original Lean microgate

**November 18, 2026 | STAGED, UNQUALIFIED**

## Scientific scope

This is a finite total deterministic Boolean mathematical interface using qualified SCC1 and SCC2. Its source defines the set of ordered pairs covered by a finite witness family; proves this matches SCC2 uniform separation; proves that failure after deleting a witness is equivalent to a cross-family pair with equal predictions on every remaining witness; defines a *private pair* separated by the deleted witness and none of the others; and proves the private-pair characterization of deletion-minimality and global inclusion-minimality by reusing SCC2's qualified Mathlib-powered theorem.

The importing independent consumer reuses SCC2's original synthetic fixture: A contains model instances 0 and 1; B contains 2; Boolean true distinguishes (0,2), while false distinguishes (1,2). It exhibits the two private pairs and independently certifies inclusion-minimality by the new theorem. No physical data, real-world SM/BFSS prediction, uniqueness, optimality, likelihood, or unconditional NFC SCC theorem is assumed.

## Native contract

- New source: `lean/OAI/MathematicalPhysics/StandardModel/Contrib/Kotler/SMD1SCC3PrivatePairIncidence.lean`, 5 source theorem axiom checks.
- Importing independent consumer: `lean/diagnostics/SMD1SCC3PrivatePairIndependentConsumer.lean`, 6 theorem axiom checks and 2 examples. The importing SCC3 consumer independently reconstructs the finite SCC2-style toy fixture rather than attempting to import a diagnostics file as a library module. Explicitly cold-build the accepted SCC1 and SCC2 source imports before checking SCC3.
- Original cold build, `-DautoImplicit=false`, `-DwarningAsError=true`, native auditor with six adversarial mutants, only `propext`, `Classical.choice`, `Quot.sound` allowed, no `sorryAx` or unjustified axioms.
- Pin source/consumer, SCC2, original SCC1, SM-Y0, SM-D0, SCC0 evidence, SCC1 and SCC2 archived original ZIPs, 27 accepted BFSS anchors, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. No main-branch changes or side branch.
- Every RED and GREEN must retain original exact tested SHA, original CI ZIP and independent original job-log/CRC/SHA evidence. No acceptance until independent archival and ledger promotion.

## Open limits and future decisions

The source claims no finite-cardinality optimization, minimum cost, positive power or numerical separation margin. Inclusion-minimal can have many competing solutions. Empty model families lead to vacuous universal coverage; this algebraic possibility is not permitted to count as physical discrimination. SCC3B quantitative probability distribution distances and future statistical likelihood remain independent tasks. Full physical SM-D1 stays `PROSPECTIVE_UNSTAGED`; BFSS W0C2B2 stays `BLOCKED`.
