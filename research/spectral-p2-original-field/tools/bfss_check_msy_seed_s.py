"""Exact occupation-basis generator check for the MSY constant seed S."""
import argparse
import hashlib
import json
from fractions import Fraction
from itertools import combinations, permutations
from math import lcm
from pathlib import Path

import numpy as np

from bfss.fock import Q8, apply_word
from bfss.model import MODEL

PINNED_STATE_SHA256 = "63b335d2fd0f802ab97ae17ff3f76fade0b202ce02fa769018f6b067c9561c3c"


def check(path: Path):
    state_bytes = path.read_bytes()
    assert hashlib.sha256(state_bytes).hexdigest() == PINNED_STATE_SHA256
    state = json.loads(state_bytes)
    seed = next(s for s in state["seeds"]["seeds"] if s["name"] == "S")
    assert seed["monomials"] == [[0, 0, 0]]
    mask_coeff = {}
    for fields, scalar in seed["tensors"][0]:
        value = Q8.from_json(scalar)
        assert value.c[1:] == (0, 0, 0) and value.c[0].denominator == 1
        for ordered_fields in set(permutations(fields)):
            mask = sum(field << (6 * j) for j, field in enumerate(ordered_fields))
            assert mask not in mask_coeff
            mask_coeff[mask] = int(value.c[0])
    masks = np.array(sorted(mask_coeff), dtype=np.int64)
    coeff = np.array([mask_coeff[int(m)] for m in masks], dtype=np.int64)
    assert masks.size and np.any(coeff)

    def residual(operator, vector):
        denom = lcm(*(x.denominator for scalar in operator.terms.values() for x in scalar.c))
        scaled_terms = {
            word: tuple(int(x * denom) for x in scalar.c)
            for word, scalar in operator.terms.items()
        }
        # Bound each integer coefficient and the worst possible sum before
        # doing array arithmetic on exact scaled integers.
        scale_bound = sum(max(map(abs, coeffs)) for coeffs in scaled_terms.values())
        assert int(np.abs(vector).max()) * scale_bound < 2**63
        bins, values = [], []
        for word, coeffs in scaled_terms.items():
            targets, sign, valid = apply_word(word, masks)
            bins.append(targets[valid])
            values.append((sign[valid] * vector[valid])[:, None] * np.array(coeffs, dtype=np.int64))
        unique, inverse = np.unique(np.concatenate(bins), return_inverse=True)
        result = np.zeros((len(unique), 4), dtype=np.int64)
        np.add.at(result, inverse, np.concatenate(values))
        return int(np.count_nonzero(np.any(result,axis=1)))

    gauge = [("G", a, b, g) for (a, b), g in MODEL.color_generators.items()]
    spatial = [("R", i, j, MODEL.spatial_generator(i, j)) for i, j in combinations(range(9), 2)]
    nonzero = [(k, i, j, residual(g, coeff)) for k, i, j, g in gauge + spatial]
    nonzero = [x for x in nonzero if x[3]]
    assert not nonzero, nonzero
    perturbed = coeff.copy()
    perturbed[0] += 1
    assert residual(MODEL.spatial_generator(0, 3), perturbed) > 0
    norm_num = sum(int(v)**2 for v in coeff)
    print(f'{len(seed["tensors"][0])} orbit rows, {len(masks)} occupation masks')
    norm_sq = Fraction(norm_num, int(seed["denominator"]) ** 2)
    assert norm_sq * Fraction(state["seeds"]["norm"]) == 1
    print(f"S squared length before the state normalization: {norm_sq}")
    print('3/3 color and 36/36 spatial generators annihilate S over Q(zeta_8)')
    print('Perturbed vacuum-coefficient control detected by spatial plane (0,3)')


if __name__ == "__main__":
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("state", type=Path)
    check(parser.parse_args().state)
