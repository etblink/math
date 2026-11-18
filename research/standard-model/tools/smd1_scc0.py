#!/usr/bin/env python3
"""SM-D1-SCC0: exact *finite* counterfactual witness comparison.

Scope: source-independent, standard-library prototype. Comparing explicitly
supplied categorical predictive distributions is NOT comparing a model with
observations, deriving a physical model, or performing a statistical fit.
No theorem or physical content is imported from NFC/SCC.
"""
from __future__ import annotations

from dataclasses import dataclass
from enum import Enum
from fractions import Fraction
from itertools import combinations, product
from typing import Mapping, Sequence


class Verdict(str, Enum):
    SEPARATED = "SEPARATED_ON_RECORDED_MARGINAL"
    SAME_MARGINALS = "EQUIVALENT_ON_RECORDED_MARGINALS"
    UNKNOWN = "UNKNOWN_NOT_PREDICTED_OR_UNMAPPED"
    INVALID = "INVALID_OBSERVABLE_OR_PROTOCOL"
    JOINT_REQUIRED = "JOINT_LIKELIHOOD_REQUIRED"
    UNIFORMLY_SEPARATED = "ALL_FINITE_SCENARIO_PAIRS_SEPARATED"
    OVERLAP = "AT_LEAST_ONE_PAIR_SAME_ON_RECORDED_MARGINALS"


class Status(str, Enum):
    PREDICTED = "PREDICTED"
    NOT_PREDICTED = "NOT_PREDICTED"
    MISSING_PHYSICAL_MAP = "MISSING_PHYSICAL_MAP"


@dataclass(frozen=True)
class Witness:
    observable_id: str
    protocol: str
    unit: str
    outcomes: tuple[str, ...]
    dependence_group: str | None = None

    def __post_init__(self) -> None:
        if not self.observable_id or not self.protocol or not self.unit:
            raise ValueError("witness requires observable, protocol and unit")
        if not self.outcomes or len(self.outcomes) != len(set(self.outcomes)):
            raise ValueError("witness needs distinct nonempty outcomes")


@dataclass(frozen=True)
class Distribution:
    """Exact rational categorical *marginal*. Not a measurement or likelihood."""
    weights: tuple[tuple[str, Fraction], ...]

    def __post_init__(self) -> None:
        labels = [k for k, _ in self.weights]
        if not labels or len(labels) != len(set(labels)):
            raise ValueError("invalid categorical outcomes")
        if any(not isinstance(v, Fraction) or v < 0 for _, v in self.weights):
            raise ValueError("weights must be nonnegative exact Fractions")
        if sum((v for _, v in self.weights), Fraction(0)) != 1:
            raise ValueError("probabilities must normalize exactly")

    def as_map(self) -> dict[str, Fraction]:
        return dict(self.weights)


def deterministic(outcomes: tuple[str, ...], actual: str) -> Distribution:
    if actual not in outcomes:
        raise ValueError("actual outcome absent")
    return Distribution(tuple((x, Fraction(int(x == actual))) for x in outcomes))


@dataclass(frozen=True)
class Prediction:
    observable_id: str
    protocol: str
    unit: str
    status: Status
    distribution: Distribution | None = None
    provenance: str = ""
    reason: str = ""

    def __post_init__(self) -> None:
        if self.status == Status.PREDICTED:
            if self.distribution is None or not self.provenance or self.reason:
                raise ValueError("a prediction requires provenance and distribution")
        elif self.status in (Status.NOT_PREDICTED, Status.MISSING_PHYSICAL_MAP):
            if self.distribution is not None or not self.reason:
                raise ValueError("unavailable predictions need a reason, no distribution")
        else:
            raise ValueError("unknown prediction status")


@dataclass(frozen=True)
class Scenario:
    name: str
    predictions: Mapping[str, Prediction]

    def __post_init__(self) -> None:
        if not self.name:
            raise ValueError("scenario must have an identity")
        for key, value in self.predictions.items():
            if key != value.observable_id:
                raise ValueError("prediction key and observable identity differ")


@dataclass(frozen=True)
class Family:
    name: str
    scenarios: tuple[Scenario, ...]

    def __post_init__(self) -> None:
        if not self.name or not self.scenarios:
            raise ValueError("model family must have scenarios")
        if len(set(s.name for s in self.scenarios)) != len(self.scenarios):
            raise ValueError("scenario names must be distinct")


def _check_witnesses(witnesses: Sequence[Witness]) -> None:
    keys = [w.observable_id for w in witnesses]
    if len(set(keys)) != len(keys):
        raise ValueError("duplicate observable IDs")
    if not keys:
        raise ValueError("empty witness set cannot justify comparison")


def compare_scenarios(
    left: Scenario, right: Scenario, witnesses: Sequence[Witness]
) -> Verdict:
    """Exact equality/separation of selected *marginal* distributions.

    When multiple observables share a declared dependence group, refuse a
    joint inference: marginal inputs alone do not specify their joint law.
    """
    _check_witnesses(witnesses)
    groups = [w.dependence_group for w in witnesses if w.dependence_group]
    if len(set(groups)) != len(groups):
        return Verdict.JOINT_REQUIRED
    unequal = False
    unknown = False
    for w in witnesses:
        a = left.predictions.get(w.observable_id)
        b = right.predictions.get(w.observable_id)
        if a is None or b is None:
            unknown = True
            continue
        if any(p.protocol != w.protocol or p.unit != w.unit or
               p.observable_id != w.observable_id for p in (a, b)):
            return Verdict.INVALID
        if a.status != Status.PREDICTED or b.status != Status.PREDICTED:
            unknown = True
            continue
        assert a.distribution is not None and b.distribution is not None
        if set(a.distribution.as_map()) != set(w.outcomes) or \
           set(b.distribution.as_map()) != set(w.outcomes):
            return Verdict.INVALID
        if a.distribution.as_map() != b.distribution.as_map():
            unequal = True
    # Never upgrade partial/missing predictions to complete comparisons.
    if unknown:
        return Verdict.UNKNOWN
    return Verdict.SEPARATED if unequal else Verdict.SAME_MARGINALS


def compare_families(
    left: Family, right: Family, witnesses: Sequence[Witness]
) -> Verdict:
    """Strong separation requires EVERY finite scenario pair to differ."""
    _check_witnesses(witnesses)
    results = [
        compare_scenarios(a, b, witnesses)
        for a, b in product(left.scenarios, right.scenarios)
    ]
    for obstruction in (Verdict.INVALID, Verdict.JOINT_REQUIRED):
        if obstruction in results:
            return obstruction
    if Verdict.UNKNOWN in results:
        return Verdict.UNKNOWN
    if Verdict.SAME_MARGINALS in results:
        return Verdict.OVERLAP
    assert all(r == Verdict.SEPARATED for r in results)
    return Verdict.UNIFORMLY_SEPARATED


def minimal_separating_families(
    left: Family, right: Family, witnesses: Sequence[Witness]
) -> tuple[tuple[str, ...], ...]:
    """All inclusion-minimal finite witness families, not necessarily unique.

    A lack of complete predictions, or unknown joint dependence, yields no
    certified family; it is NOT a finding of observational equivalence.
    """
    _check_witnesses(witnesses)
    if compare_families(left, right, witnesses) != Verdict.UNIFORMLY_SEPARATED:
        return ()
    minima: list[tuple[str, ...]] = []
    for size in range(1, len(witnesses) + 1):
        for subset in combinations(witnesses, size):
            ids = tuple(w.observable_id for w in subset)
            if any(set(m).issubset(ids) for m in minima):
                continue
            if compare_families(left, right, subset) == Verdict.UNIFORMLY_SEPARATED:
                minima.append(ids)
    return tuple(minima)


def hypercharge_arithmetic(q: Fraction, u: Fraction, d: Fraction,
                           l: Fraction, e: Fraction) -> tuple[Fraction, ...]:
    """Independent rational evaluation of the four SM-Y0 input polynomials.

    Assumes the same stated single-family Weyl fields and multiplicities.
    This is NOT a theorem of full quantum gauge-anomaly cancellation.
    """
    return (2*q + u + d, 3*q + l,
            6*q**3 + 3*u**3 + 3*d**3 + 2*l**3 + e**3,
            6*q + 3*u + 3*d + 2*l + e)


def smy0_counterfactual() -> tuple[tuple[Fraction, ...], tuple[Fraction, ...]]:
    """Change only Q_L hypercharge; all four other charges remain fixed."""
    u, d, l, e = -Fraction(2, 3), Fraction(1, 3), -Fraction(1, 2), Fraction(1)
    return (hypercharge_arithmetic(Fraction(1, 6), u, d, l, e),
            hypercharge_arithmetic(Fraction(0), u, d, l, e))
