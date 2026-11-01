# V10H-F5 Gate 1 RED — preflight incorrectly scanned source documentation

Date: 2026-10-31 PDT. This is retained NEGATIVE EVIDENCE, not a proof or Lean error.

- [F5 strict run #41261931766](https://github.com/etblink/math/actions/runs/41261931766), job 124716785627, tested commit `2106c86fea8b5f4662940238b404827e25d55067`, attempt 1, completed failure.
- Source hash/toolchain guards passed. The Python preflight stopped with `AssertionError` at line 12: `assert 'Matrix.detMonoidHom' not in s`. This rejected a harmless and valuable **historical failure description** in the F5 file header, line 8: `the nested composition Matrix.detMonoidHom.comp (...)`. There were **zero executable references** to `Matrix.detMonoidHom`. Lean installation, qualified F4 rebuild, fresh F5 compilation and five independent declaration/axiom checks were all SKIPPED; **F5 is unqualified**.
- The exact source git blob `47e13c108393146c2ebb699237edb1414564d34d` remains unchanged. [Artifact #13064923957](https://github.com/etblink/math/actions/runs/41261931766/artifacts/13064923957), digest SHA256 `1eb91ac09f7409d147456659f001929ca8240cdec96d282c3dfe803975585cbc`, nonexpired at inspection.
- Original V10H Gate1 red #41257058496 and Gate2 red #41257744030 reflect unrelated elaboration failures on deeply composed determinant characters. They and the F4 Gate1 red #41260509990 remain preserved.

## Bounded repair

Change **only the strict workflow**, leaving the source, mathematical statements, earlier accepted dependencies, and compiler options untouched. Calculate `executable=re.sub(r'/\\-.*?\\-/', '', s, flags=re.S)` for the fixed pinned source with **nonnested** block comments; assert that no unhandled `/-` remains, then apply both forbidden-import/forbidden-nested-character checks and the existing no-sorry/admit/axiom/limit checks on `executable`. Keep exact Git blob checks, five names, five `#print axioms`, and the entire downstream strict warning-as-error/independent audit gates.

The simple comment remover is valid for the **exact current nonnested source only**; it is not a full Lean lexer. Nested comments must fail closed or require a proper scanner. A green preflight alone cannot qualify F5. Qualification requires strict compilation, five exact elaborations and source axiom whitelist `[propext, Classical.choice, Quot.sound]`, no `sorryAx`.

## Protected scope

F1–F4 remain accepted. F5 remains a candidate. No conclusion that the verified orientation subgroup H equals the whole source Spin9 group; no global unconditional SO48, no topology/continuity, no Spin48 lift and no Fock/physical BFSS claims. No main/upstream push or pinned version/resource changes.
