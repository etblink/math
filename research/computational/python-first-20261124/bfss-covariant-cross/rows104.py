"""Pinned companion row metadata export, validated against witness labels."""
import json,sys
from pathlib import Path
D=Path(__file__).resolve().parent
w=json.loads((Path(sys.argv[1])/'trial-104.json').read_text());rows=json.loads((Path(sys.argv[1])/'rows56.json').read_text());
for seed,starts in [('Phi',[(35,88,141),(459,512,565)]),('H3',[(1064,1148,1176),(1092,1232,1260)])]:
 for width,ss in enumerate(starts):
  for start,e,n in zip(ss,[(0,0,0),(1,0,0),(0,1,0)],[6,4,2]):
   for p in range(n):rows.append({'label':start+p,'seed':seed,'power':p,'exponents':list(e),'width':width})
for r in rows:r.setdefault('seed','S')
rows.sort(key=lambda r:r['label']);assert [r['label'] for r in rows]==w['labels']
(D/'rows104.json').write_text(json.dumps(rows,indent=2)+'\n')
