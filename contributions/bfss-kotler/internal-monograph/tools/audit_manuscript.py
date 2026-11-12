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

check(len(TEX) == 21, '21 TeX source files (master, 17 chapters, 3 appendices)')
for i in range(1, 18):
    hits = list((ROOT / 'chapters').glob(f'ch{i:02d}_*.tex'))
    check(len(hits) == 1 and f'\\input{{chapters/{hits[0].stem}}}' in MAIN,
          f'Chapter {i:02d} exists and is imported once')
for f in ['appendices/historical_lineage', 'appendices/notation_normalization',
          'appendices/negative_knowledge']:
    check(f'\\input{{{f}}}' in MAIN, f'{f} included in master')

labels = re.findall(r'\\label\{([^}]+)\}', SOURCE)
refs = re.findall(r'\\(?:eqref|ref|pageref|autoref)\{([^}]+)\}', SOURCE)
count = Counter(labels)
check(all(n == 1 for n in count.values()), 'Every LaTeX label is unique')
check(set(refs) <= set(labels), 'All LaTeX refs resolve to existing labels')
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
