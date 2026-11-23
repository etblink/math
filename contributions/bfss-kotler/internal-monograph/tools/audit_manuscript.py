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

chapter_inputs = re.findall(r'\\input\{(chapters/[^}]+)\}', MAIN)
check(len(chapter_inputs) == 21 and len(set(chapter_inputs)) == 21,
      '21 unique chapter-section sources, including the embedded Gram section')
check(all((ROOT / (p + '.tex')).is_file() for p in chapter_inputs),
      'Every chapter-section source exists')
check(len(re.findall(r'(?m)^\\chapter(?:\[|\{)', '\n'.join(
      (ROOT / (p + '.tex')).read_text() for p in chapter_inputs))) == 20,
      '20 numbered chapters in the master')
check(len(TEX) == 26, '26 TeX files including the master and four appendices')
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
check('Internal research monograph --- Edition 0.9' in MAIN,
      'Master identifies the current internal edition')
check('future BFSS project' in MAIN and 'proof reuse' in MAIN,
      'Reader guide names the audience and gives reading paths')
check('9ee5c7a99953' in MAIN and 'Claim index for the November 22 snapshot' in SOURCE,
      'The edition declares its source cutoff and current claim index')
for required in [
    'prop:bounded-l2-multiplier',
    'eq:proposed-multiplier-energy',
    'sec:d69-projective',
    'ch:sm-benchmark',
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
      'Printed theorem atlas preserves the 38 historical records')
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
check(len(records) == 59 and len(set(ids)) == 59, '59 unique records: 38 frozen plus 21 dated additions')
frozen = json.loads((ROOT / 'THEOREM_ATLAS_0_7_FROZEN.json').read_text())
check(records[:38] == frozen['records'], 'Original 38 atlas records preserved unchanged')
check('eq:ed08-R' in count and 'eq:ed08-Hardy' in count and 'eq:ed08-certificate' in count, 'Conditional fidelity contract explicitly labeled')
check((ROOT / 'RESEARCH_ROUTE_MAP_2026_11_16.md').is_file(), 'Dated physical route comparison present')
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
