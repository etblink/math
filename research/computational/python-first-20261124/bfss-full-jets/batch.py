"""Run exact scaled fixture jobs individually, preserve stdout/exit statuses."""
import subprocess,sys,itertools,json,time,os
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
D=Path(__file__).resolve().parent
args=sys.argv[1:3];fixtures=sys.argv[3:];workers=int(os.environ.get('JET_WORKERS','3'))
def run(s):
 d=''.join(s.split(','));path=D/f'jet_{d}_p8.json'
 if path.exists():return [s,'existing']
 t=time.monotonic()
 with (D/f'run_{d}.log').open('w') as f:
  r=subprocess.run([sys.executable,str(D/'scaled_jets.py'),*args,'8',s],stdout=f,stderr=subprocess.STDOUT,env=dict(os.environ,OPENBLAS_NUM_THREADS='1'))
 return [s,r.returncode,time.monotonic()-t]
with ThreadPoolExecutor(max_workers=workers) as p:
 for r in p.map(run,fixtures):print(json.dumps(r),flush=True)
