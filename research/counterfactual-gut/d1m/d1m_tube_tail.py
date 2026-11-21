#!/usr/bin/env python3
"""D1M exact Gaussian/chi-square tail comparison for fixed SVD tube cutoff."""
import json, math
from pathlib import Path
from scipy.stats import chi2

def bound(r,alpha=math.sqrt(2),kappa=.5):
    cutoff_chi2=alpha*kappa*kappa*r**3/2
    exact=chi2.sf(cutoff_chi2,16)
    chernoff=min(1.,2**8*math.exp(-cutoff_chi2/4))
    return {'r':r,'chi2_16_transition_threshold':cutoff_chi2,
            'exact_Gaussian_transition_probability':exact,
            'provable_chernoff_upper_bound':chernoff}

if __name__=='__main__':
    result={"source_Gaussian_frequency_alpha":math.sqrt(2),"fixed_tube_kappa":.5,
     "transition_definition":"||Y|| >= kappa*r/2; Y Gaussian iid variance=(2*alpha*r)^-1",
     "bound":"P(chi2_16>=x) <= 256 exp(-x/4), x=alpha*kappa^2*r^3/2",
     "records":[bound(r) for r in (8.,10.,12.,20.)],
     "status":"exact distribution and Chernoff inequality, no source SmoothCore or complete form proof"}
    p=Path(__file__).with_name('d1m_tube_tail_results.json')
    p.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
