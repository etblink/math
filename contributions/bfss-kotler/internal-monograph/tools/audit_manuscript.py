#!/usr/bin/env python3
"""Offline, fail-closed structural audit for the BFSS internal monograph.

Checks text structure, internal references, atlas status invariants, and
selected fixed-source scientific distinctions. It does NOT check Lean proofs
or certify mathematical truth. No network services are used.
"""
from __future__ import annotations
import json
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAIN = (ROOT / 'main.tex').read_text(encoding='utf-8')
TEX = sorted(ROOT.rglob('*.tex'))
SOURCE = '\n'.join(p.read_text(encoding='utf-8') for p in TEX)
ATLAS = json.loads((ROOT / 'THEOREM_ATLAS.json').read_text(encoding='utf-8'))
FAIL = []
PASS = []

def check(condition: bool, label: str):
    (PASS if condition else FAIL).append(label)

check(len(TEX) == 22, '22 TeX source files (master, 17 chapters, 4 appendices)')
for i in range(1, 18):
    hits = list((ROOT / 'chapters').glob(f'ch{i:02d}_*.tex'))
    check(len(hits) == 1 and f'\\input{{chapters/{hits[0].stem}}}' in MAIN,
          f'Chapter {i:02d} exists and is imported once')
for f in ['appendices/theorem_atlas', 'appendices/historical_lineage', 'appendices/notation_normalization',
          'appendices/negative_knowledge']:
    check(f'\\input{{{f}}}' in MAIN, f'{f} included in master')

labels = re.findall(r'\\label\{([^}]+)\}', SOURCE)
refs = re.findall(r'\\(?:eqref|ref|pageref|autoref)\{([^}]+)\}', SOURCE)
count = Counter(labels)
check(all(n == 1 for n in count.values()), 'Every LaTeX label is unique')
check(set(refs) <= set(labels), 'All LaTeX refs resolve to existing labels')
# Whole-book regression checks for developing Edition 0.7.
environment_errors = []
for tex_path in TEX:
    stack = []
    source_text = tex_path.read_text(encoding='utf-8')
    for token in re.finditer(r'\\(begin|end)\{([A-Za-z*]+)\}', source_text):
        action, environment = token.groups()
        if action == 'begin':
            stack.append(environment)
        elif not stack or stack.pop() != environment:
            environment_errors.append(f'{tex_path.name}: unexpected {environment}')
    if stack:
        environment_errors.append(f'{tex_path.name}: unclosed {stack!r}')
check(not environment_errors, 'All TeX environments are properly nested')
check('Edition 0.7 development checkpoint' in MAIN and 'Edition 0.6.1' in MAIN,
      'Master distinguishes current v0.7 draft from historical compiled v0.6.1')
check('Throughout this working manuscript' in MAIN,
      'Reader contract describes an unfinished working monograph')
check('not} an independent mathematical peer review' in MAIN and
      'physical spectral result' in MAIN and 'LaTeX{} build' in MAIN,
      'Current reader contract distinguishes a completed build from mathematical review')
for required in [
    'prop:bounded-l2-multiplier',
    'eq:source-complex-car',
    'eq:physical-core-form-agreement',
    'prop:source-cover-descent',
    'prop:original-parity-grading',
    'prop:su2-phase-cancellation',
    'prop:linear-field-core-bound',
    'prop:weighted-domain-bridge',
    'prop:normalized-class-multiplier',
    'prop:color-sphere-half',
    'prop:physical-color-direction',
    'op:external-susy-projector',
    'prop:color-quadratic-120',
    'prop:twisted-projective-gamma',
]:
    check(required in count, f'Edition 0.7 mathematical anchor {required}')
check((ROOT / 'EDITORIAL_CONVERGENCE_AUDIT_2026_11_11.md').exists(),
      'Edition 0.7 whole-manuscript audit record is present')

check('\\chapter{Formalization and Qualification Atlas}' in SOURCE and SOURCE.count('\\paragraph{\\texttt{') >= 38,
      'Printed theorem atlas contains all 38 records')
check('app:atlas' in labels, 'Printed source atlas has chapter label')
check('\\usepackage{xurl}' in MAIN,
      'Long Lean paths have active line-breaking support')
check('\\texttt{invariantCore\\_equivariant}' in
      (ROOT / 'chapters/ch05_gauge.tex').read_text(encoding='utf-8'),
      'Source invariant-core identifier is properly TeX escaped')
check('labelwidth=\\linewidth' not in
      (ROOT / 'appendices/historical_lineage.tex').read_text(encoding='utf-8'),
      'Historical timeline labels cannot overflow left margin')
check('chapter{Source-Exact Notation and Normalization Audit}' in SOURCE,
      'Normalization appendix contains mathematical exposition')
check('\\chapter{Scope, Physical Context, and the Research Problem}' in SOURCE,
      'Chapter 1 is substantive and imported')

records = ATLAS['records']
ids = [r['id'] for r in records]
status = set(ATLAS['status_vocabulary'])
check(len(records) == 38 and len(set(ids)) == 38, '38 unique frozen theorem atlas records')
check(all(r['evidence_status'] in status for r in records), 'Atlas statuses belong to accepted vocabulary')
check(all(r.get('strict_run') for r in records if r['evidence_status'] == 'INTEGRATED_STRICT'),
      'All integrated strict records link exact run receipts')
check(all(r['id'] in ids for r in records), 'Every atlas record has a unique ID')
check(ATLAS['snapshot_commit'] == 'd4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5',
      'Primary mathematical source snapshot unchanged')
by_id = {r['id']: r for r in records}
check(by_id['H-03']['evidence_status'] == 'HISTORICAL_STRICT',
      'Hamiltonian identity remains historically qualified, not silently ported')
check(by_id['G-04']['evidence_status'] == 'HISTORICAL_STRICT',
      'Gauss joint-kernel theorem historically qualified and indexed')
check(by_id['N-05']['evidence_status'] == 'PENDING_STRICT_GATE',
      'NORM0D D1-B representative transport not silently promoted')
check(by_id['C-01']['evidence_status'] == 'ANALYTICAL_CONDITIONAL',
      'Operator-valued oscillator exclusion is conditional')
check(by_id['O-05']['evidence_status'] == 'OPEN_PROOF_OBLIGATION',
      'Original positive-eigenpair theorem remains open')
check('\\frac1{16}' in SOURCE and '\\tfrac12' in SOURCE,
      'Both original charge-form and kinetic normalizations are discussed')
check('m+12' in SOURCE and 'm+6' in SOURCE,
      'Operator and physical-vector weight thresholds kept distinct')
check('\\mathbb R^{27}' in SOURCE and '2^{24}' in SOURCE,
      'Correct bosonic and Fock dimension conventions retained')
check('eleven-dimensional' in SOURCE and 'large-$N$' in SOURCE,
      'BFSS large-N conjectural interpretation is separated from fixed SU2')
check('not' in (ROOT / 'UNIFICATION_RESEARCH_CHARTER.md').read_text().lower(),
      'Unification research remains explicitly bounded')

print(f'PASS {len(PASS)}/{len(PASS)+len(FAIL)} offline editorial checks')
for label in FAIL:
    print('FAIL:', label)
if FAIL:
    sys.exit(1)
print('This structural check is NOT an independent Lean or mathematical proof audit.')
