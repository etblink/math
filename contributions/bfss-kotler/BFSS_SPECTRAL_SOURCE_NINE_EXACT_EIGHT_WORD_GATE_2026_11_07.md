# C0-A4c: exact eight-factor words in the original source Clifford algebra

Status: **candidate; unqualified** until its dedicated complete strict run
and retained evidence pass review. Parent is the exact C0-A4b tested commit
`e0687c52c39c3e632784c67deab4716c9e3011e4`; the previous
[run #42371904867](https://github.com/etblink/math/actions/runs/42371904867)
qualifies signed words only.

## Exact proposed result and proof

`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineExactEightWord.lean`
imports the qualified signed-word source and the pinned native
`Mathlib.Data.List.OfFn` API. Its final target is:

For every original `g : spinGroup source9Quadratic`, there is
`w : Fin 8 → (SpaceIndex → ℝ)` with `source9Quadratic (w i) = 1` for every
i and with `(g : CliffordAlgebra source9Quadratic)` equal to the ordered
original Clifford word of `List.ofFn w`. The external sign is eliminated.

Eight public roots in `FCP.BFSSSourceNineExactEightWord` are proposed:

| Root | Intended content |
| --- | --- |
| `source9UnitPairPadding` | Explicit list of n identical unit-vector pairs |
| `source9UnitPairPadding_length` | Padding length is exactly 2n |
| `source9UnitPairPadding_all_unit` | Padding preserves the original Q-unit condition |
| `source9UnitPairPadding_word` | Its original Clifford word is exactly one |
| `source9CliffordWord_append` | Appending lists multiplies Clifford words in the same order |
| `source9CliffordWord_neg_head` | Negating the first vector negates the full word |
| `source9Spin_exact_eight_list` | Every literal source Spin element equals an eight-entry original Q-unit word |
| `source9Spin_exact_eight_word` | The witnesses use the natural ordered `Fin 8` family |

Given the qualified even list of length 2k at most eight, append 4-k pairs
of the original Q-unit coordinate vector at label zero. The resulting
word is unchanged and has exactly eight entries. Only then handle the
negative sign by negating its first entry. Original quadratic negation
preserves Q, and linearity of the original Clifford embedding gives the
word sign. Length eight excludes the empty-list branch. Thus both empty
initial source signs are handled without negating a nonexistent vector.

The final conversion uses the native `List.ofFn_get` equality, verified
against Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`.
It preserves order and does not make a continuous choice of words as a
function of g. The source quadratic form, coordinate labels, Clifford
embedding and Spin carrier remain unchanged.

## Strict source and consumer boundary

`lean/diagnostics/BFSSSpectralSourceNineExactEightWordIndependentAudit.lean`
has ten independent consumers. They consume the six padding/word interfaces,
both full existence statement types and the actual positive and negative
central source cases as eight-factor words. All eight public roots are
reprinted in the independent consumer.

The dedicated workflow is
`.github/workflows/bfss-spectral-source-nine-exact-eight-word-strict.yml`.
Its separate manifest pins **163 inputs**: 125 unchanged original modules,
six already accepted source modules, two candidates and thirty controls.
The exact imported closure has **133 cold compiler objects**. Expected
strict output is **79 exact reports** and **eight completion markers**.
All accepted spectral sources are freshly compiled under strict options;
original source blobs still match preserved parent
`4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e`.

Only `propext`, `Classical.choice` and `Quot.sound` are allowed. Nonzero
compilation, diagnostics, recovery/foreign axioms, inventory or hash
mismatches, and missing/duplicate markers reject acceptance. All ten
consumer proofs must compile; named root reports and markers alone cannot
certify failed unnamed examples. Complete proposed inputs, logs and receipt
are retained on success and failure for fourteen days in Actions.

Lean 4.34.1, all 42 package revisions, default proof budgets, strict linting
and no-BFSS-proof-cache policy remain unchanged. Local pin/closure checks,
ten adversarial validator tests, YAML parsing and Bash syntax checks pass
before publication. Local Lean cannot start, so source and consumer compiler
validation remains the dedicated CI's responsibility.

## Next separate topological gate

After qualification, define the fixed eight-input source Spin word map
using four actual ordered F10BH pairs. Prove its Clifford value equals the
same ordered word and use the existential theorem to prove actual source
surjectivity by subtype extensionality. These finite formulas avoid
continuous witness selection.

Prove compactness of the original Q-unit parameter space via the explicit
same-label L2 equivalence, and continuity of that fixed map in the existing
F10BF/F10BG PBW topology. Neither a word existence theorem nor a map into
SO(9) alone proves source compactness. Original PBW topology, rather than
a replacement compact group topology, is mandatory.

No source compactness, covering, Fock/gauge implementation, physical closed
domain, branching, coercivity or spectral-existence conclusion is admitted
by this candidate. The original branch and upstream PRs remain untouched.
