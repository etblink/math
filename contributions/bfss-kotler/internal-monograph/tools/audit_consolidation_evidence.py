#!/usr/bin/env python3
"""Offline tree/receipt reconciliation, not a Lean proof or CI-result oracle."""
import hashlib
import json
from pathlib import Path
import subprocess

M = Path(__file__).resolve().parents[1]
R = M.parents[2]
atlas = json.loads((M/'THEOREM_ATLAS.json').read_text())
frozen = json.loads((M/'THEOREM_ATLAS_0_7_FROZEN.json').read_text())
audit = json.loads((M/'EDITION_0_8_EVIDENCE_AUDIT_2026_11_16.json').read_text())
assert atlas['records'][:38] == frozen['records']
assert len(atlas['records']) == 59 and len({x['id'] for x in atlas['records']}) == 59
assert len(audit['run_metadata']) == 21
def tree_blob(path):
    return subprocess.check_output(['git','rev-parse','HEAD:'+path],cwd=R,text=True).strip()
for x in audit['pinned_objects']:
    assert tree_blob(x['path']) == x['sha'], x['path']
    p = R/x['path']
    if p.is_file():
        b=p.read_bytes(); got=hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()
        assert got == x['sha'], 'working source differs: '+x['path']
by_run={x['run_id']:x for x in audit['run_metadata']}
by_workflow={x['run_id']:x for x in audit['tested_workflow_metadata']}
for x in atlas['records'][38:]:
    assert tree_blob(x['receipt_path']) == x['receipt_blob_sha']
    if x['evidence_status']=='INTEGRATED_STRICT':
        m=by_run[x['strict_run_id']]
        assert m['status']=='completed' and m['conclusion']=='success'
        assert m['tested_sha']==x['source_snapshot_commit']
        assert by_workflow[x['strict_run_id']]['tested_workflow_blob']==x['workflow_blob_sha']
    else:
        assert x['id']=='E08-P0A' and x['evidence_status']=='PENDING_STRICT_GATE'
print('ED08_EVIDENCE_RECONCILIATION_PASS 38 frozen + 21 dated records;',len(audit['pinned_objects']),'tree pins; 21 saved run metadata records')
print('No fresh Lean compilation or independent scientific referee review is asserted.')
