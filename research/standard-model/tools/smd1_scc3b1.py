#!/usr/bin/env python3
"""SM-D1-SCC3B1: typed exact-marginal judgment, distinct from likelihood.

A qualified SCC0 comparator is imported unchanged as a *data model*.
This successor returns orthogonal assessments instead of a priority-ordered
single verdict. Exact rational categorical differences are mathematical;
NO experimental evidence, physical prediction map or sampling likelihood
is supplied or calculated here.
"""
from __future__ import annotations

from dataclasses import dataclass
from enum import Enum
from fractions import Fraction
from itertools import product
from typing import Sequence

from smd1_scc0 import Family, Scenario, Status, Witness


class ExactDifference(str, Enum):
    WITNESS_PRESENT = "KNOWN_EXACT_DIFFERENCE_ON_VALID_MARGINAL"
    COMPLETE_AGREEMENT = "AGREEMENT_ON_ALL_VALID_DECLARED_MARGINALS"
    UNDETERMINED = "NO_KNOWN_DIFFERENCE_WITH_UNAVAILABLE_OR_INVALID_MARGINAL"


class ProtocolIntegrity(str, Enum):
    VALID = "ALL_EXAMINED_PRESENT_PREDICTIONS_WELL_TYPED"
    INVALID = "ONE_OR_MORE_OBSERVABLE_PROTOCOLS_INVALID"


class PredictionCompleteness(str, Enum):
    COMPLETE = "ALL_DECLARED_PREDICTIONS_PRESENT"
    PARTIAL = "ONE_OR_MORE_DECLARED_PREDICTIONS_UNAVAILABLE"


class JointLikelihood(str, Enum):
    NOT_ASSESSED = "NO_JOINT_LIKELIHOOD_INFERRED"
    REQUIRES_EXPLICIT_JOINT = "DECLARED_DEPENDENCE_REQUIRES_EXPLICIT_JOINT"


@dataclass(frozen=True)
class Judgment:
    exact: ExactDifference
    integrity: ProtocolIntegrity
    completeness: PredictionCompleteness
    joint: JointLikelihood
    positive_witnesses: tuple[str, ...]
    valid_marginal_tv: tuple[tuple[str, Fraction], ...]
    unavailable: tuple[str, ...]
    invalid: tuple[str, ...]
    experimental_evidence: str = "NO_EXPERIMENTAL_INFERENCE"

    @property
    def complete_typed_comparison(self) -> bool:
        return (self.integrity == ProtocolIntegrity.VALID
                and self.completeness == PredictionCompleteness.COMPLETE)


@dataclass(frozen=True)
class FamilyJudgment:
    pairs: tuple[tuple[str, str, Judgment], ...]
    fully_typed_and_complete: bool
    uniformly_exact_separated: bool
    experimental_evidence: str = "NO_EXPERIMENTAL_INFERENCE"


def exact_total_variation(a: dict[str, Fraction],
                          b: dict[str, Fraction],
                          outcomes: tuple[str, ...]) -> Fraction:
    """Conventional half-L1; caller validates identical outcome alphabet."""
    return sum((abs(a[x] - b[x]) for x in outcomes), Fraction(0)) / 2


def compare_scenarios_v1(left: Scenario, right: Scenario,
                         witnesses: Sequence[Witness]) -> Judgment:
    """Compute local existential witnesses without inventing a joint law."""
    ids = [w.observable_id for w in witnesses]
    if not ids or len(ids) != len(set(ids)):
        raise ValueError("finite witness selection must be nonempty and unique")

    dependence_groups = [w.dependence_group for w in witnesses
                         if w.dependence_group is not None]
    requires_joint = len(set(dependence_groups)) != len(dependence_groups)

    positive: list[str] = []
    distances: list[tuple[str, Fraction]] = []
    invalid: list[str] = []
    unavailable: list[str] = []
    for witness in witnesses:
        key = witness.observable_id
        a = left.predictions.get(key)
        b = right.predictions.get(key)
        if a is None or b is None:
            unavailable.append(key)
            continue
        if any(p.observable_id != key or p.protocol != witness.protocol
               or p.unit != witness.unit for p in (a, b)):
            invalid.append(key)
            continue
        if a.status != Status.PREDICTED or b.status != Status.PREDICTED:
            unavailable.append(key)
            continue
        # SCC0 constructors enforce nonnegativity/normalization/provenance.
        if a.distribution is None or b.distribution is None:
            invalid.append(key)
            continue
        left_map = a.distribution.as_map()
        right_map = b.distribution.as_map()
        if set(left_map) != set(witness.outcomes) or set(right_map) != set(witness.outcomes):
            invalid.append(key)
            continue
        tv = exact_total_variation(left_map, right_map, witness.outcomes)
        if not (Fraction(0) <= tv <= Fraction(1)):
            raise AssertionError("normalized exact categorical TV outside [0,1]")
        distances.append((key, tv))
        if tv > 0:
            positive.append(key)

    integrity = (ProtocolIntegrity.INVALID if invalid else ProtocolIntegrity.VALID)
    completeness = (PredictionCompleteness.PARTIAL if unavailable
                    else PredictionCompleteness.COMPLETE)
    joint = (JointLikelihood.REQUIRES_EXPLICIT_JOINT if requires_joint
             else JointLikelihood.NOT_ASSESSED)

    if positive:
        exact = ExactDifference.WITNESS_PRESENT
    elif not invalid and not unavailable:
        exact = ExactDifference.COMPLETE_AGREEMENT
    else:
        exact = ExactDifference.UNDETERMINED
    return Judgment(exact, integrity, completeness, joint,
                    tuple(positive), tuple(distances), tuple(unavailable),
                    tuple(invalid))


def compare_families_v1(left: Family, right: Family,
                        witnesses: Sequence[Witness]) -> FamilyJudgment:
    """Uniform *exact marginal* separation requires each valid pair to differ.

    A missing or invalid pair blocks complete uniform certification; repeated
    dependence groups do not erase known marginal differences, and do NOT
    supply a joint statistical likelihood.
    """
    pairs = tuple((a.name, b.name, compare_scenarios_v1(a, b, witnesses))
                  for a, b in product(left.scenarios, right.scenarios))
    if not pairs:
        raise ValueError("nonempty cross-family comparison required")
    complete = all(result.complete_typed_comparison for _, _, result in pairs)
    uniform = complete and all(result.exact == ExactDifference.WITNESS_PRESENT
                               for _, _, result in pairs)
    return FamilyJudgment(pairs, complete, uniform)
