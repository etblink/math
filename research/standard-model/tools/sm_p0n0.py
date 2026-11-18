#!/usr/bin/env python3
"""SM-P0N0: provenance-pinned neutrino Δm²21 physical-observable *intake*.

This module makes NO model-to-JUNO prediction. It recognizes an experimental
reported parameter and separately checks a simple mass-squared definition.
The 2026-06-10 59.1-day peer-reviewed JUNO result is a frozen provenance
record, NOT a current world average, global fit, or experiment likelihood.
The accepted BFSS and NFC theory work supplies no qualified physical map
to this JUNO observable. Never promote a fitted parameter into a prediction.
"""
from __future__ import annotations

import json
from dataclasses import dataclass
from enum import Enum
from fractions import Fraction
from pathlib import Path


JUNO_RECORD_ID = "juno_dm2_21_2026"
MIXING_RECORD_ID = "juno_sin2theta12_2026"
FROZEN_LEDGER_SCHEMA = "SM-D0_EVIDENCE_LEDGER/0.1"
FROZEN_DATE = "2026-11-18"
FIRST_JUNO_DOI = "https://doi.org/10.1038/s41586-026-10538-z"
MASS_SQUARED_UNIT = "eV^2"


class Ordering(str, Enum):
    NORMAL = "normal"
    INVERTED = "inverted"


class CandidateStatus(str, Enum):
    FIT_INPUT_NOT_PREDICTION = "FIT_INPUT_NOT_PREDICTION"
    MISSING_PHYSICAL_MAP = "MISSING_PHYSICAL_MAP"
    NOT_ASSESSED = "NOT_ASSESSED"


@dataclass(frozen=True)
class FrozenObservation:
    record_id: str
    value: Fraction
    error_minus: Fraction
    error_plus: Fraction
    unit: str
    reported_uncertainty_label: str
    source_url: str
    source_date: str
    source_status: str
    analysis_ordering: Ordering
    cofit_record_id: str
    covariance_status: str = "NOT_PRESENT_IN_FROZEN_LEDGER"
    likelihood_status: str = "NOT_PRESENT_IN_FROZEN_LEDGER"
    role: str = "EMPIRICAL_MEASUREMENT_NOT_MODEL_PREDICTION"


@dataclass(frozen=True)
class MassSquaredSpectrum:
    """Synthetic *squared* mass eigenvalues, never automatically predictions."""
    m1_sq: Fraction
    m2_sq: Fraction
    m3_sq: Fraction
    ordering: Ordering
    unit: str = MASS_SQUARED_UNIT

    def __post_init__(self) -> None:
        if not all(isinstance(x, Fraction)
                   for x in (self.m1_sq, self.m2_sq, self.m3_sq)):
            raise TypeError("use exact rational mass-square quantities only")
        if self.unit != MASS_SQUARED_UNIT:
            raise ValueError("mass squared inputs must use eV^2 (no silent conversion)")
        if min(self.m1_sq, self.m2_sq, self.m3_sq) < 0:
            raise ValueError("a physical squared mass cannot be negative")
        if not self.m1_sq < self.m2_sq:
            raise ValueError("solar Δm²21 convention requires m2² > m1²")
        if self.ordering == Ordering.NORMAL and not self.m2_sq < self.m3_sq:
            raise ValueError("normal ordering requires m1² < m2² < m3²")
        if self.ordering == Ordering.INVERTED and not self.m3_sq < self.m1_sq:
            raise ValueError("inverted ordering requires m3² < m1² < m2²")
        if not isinstance(self.ordering, Ordering):
            raise TypeError("mass ordering must be an explicit Ordering enum")

    def delta21(self) -> Fraction:
        return self.m2_sq - self.m1_sq

    def shifted(self, common_offset: Fraction) -> "MassSquaredSpectrum":
        if not isinstance(common_offset, Fraction):
            raise TypeError("offset must be an exact mass-squared Fraction")
        return MassSquaredSpectrum(
            self.m1_sq + common_offset,
            self.m2_sq + common_offset,
            self.m3_sq + common_offset,
            self.ordering,
            self.unit,
        )


def symbolic_delta21(m1_sq: Fraction, m2_sq: Fraction) -> Fraction:
    """Mathematical definition, WITHOUT an origin/provenance assertion."""
    if not isinstance(m1_sq, Fraction) or not isinstance(m2_sq, Fraction):
        raise TypeError("both squared masses must be exact Fractions")
    return m2_sq - m1_sq


def same_delta_after_common_offset(
    m1_sq: Fraction, m2_sq: Fraction, offset: Fraction,
) -> bool:
    if not isinstance(offset, Fraction):
        raise TypeError("offset must be exact")
    return (symbolic_delta21(m1_sq + offset, m2_sq + offset)
            == symbolic_delta21(m1_sq, m2_sq))


def load_frozen_first_juno(ledger_path: Path) -> FrozenObservation:
    """Review exact SM-D0 record; do NOT change the historical snapshot."""
    ledger = json.loads(Path(ledger_path).read_text(encoding="utf-8"))
    if ledger.get("schema") != FROZEN_LEDGER_SCHEMA or ledger.get("as_of") != FROZEN_DATE:
        raise ValueError("not the accepted SM-D0 schema/as-of snapshot")
    records = {r["id"]: r for r in ledger["constraints"]}
    if len(records) != len(ledger["constraints"]):
        raise ValueError("duplicate empirical record identity")
    mass = records[JUNO_RECORD_ID]
    angle = records[MIXING_RECORD_ID]
    if mass["domain"] != "neutrinos" or mass["kind"] != "measurement":
        raise ValueError("the JUNO mass-splitting record type changed")
    if mass["source"]["url"] != FIRST_JUNO_DOI:
        raise ValueError("changed peer-reviewed JUNO first-result DOI")
    if mass["source"]["status"] != "peer_reviewed_primary" or mass["source_date"] != "2026-06-10":
        raise ValueError("JUNO first-result provenance changed")
    if mass["details"].get("analysis_ordering") != "normal ordering scenario":
        raise ValueError("the frozen JUNO ordering convention changed")
    if mass["details"]["facility"] != "JUNO" or "59.1" not in mass["details"]["input"]:
        raise ValueError("the 59.1-day first JUNO dataset changed")
    if angle["source"]["url"] != FIRST_JUNO_DOI or angle["value"]["unit"] != "dimensionless":
        raise ValueError("the co-fitted mixing-angle provenance changed")
    if angle["domain"] != "neutrinos" or "correlated" not in angle["details"]["aggregation"]:
        raise ValueError("the historical co-fitted covariance warning changed")
    value = mass["value"]
    if value["unit"] != MASS_SQUARED_UNIT:
        raise ValueError("mass splitting unit is not the specified eV^2")
    central = Fraction(value["central"])
    minus = Fraction(value["error_minus"])
    plus = Fraction(value["error_plus"])
    if central <= 0 or min(minus, plus) <= 0:
        raise ValueError("invalid frozen JUNO value or reported error")
    if minus != plus:
        raise ValueError("this first-result interface expects symmetric quoted errors")
    if not value.get("uncertainty_label"):
        raise ValueError("missing original reported uncertainty description")
    # No covariance or likelihood is manufactured from these quoted errors.
    return FrozenObservation(
        JUNO_RECORD_ID, central, minus, plus, MASS_SQUARED_UNIT,
        value["uncertainty_label"], FIRST_JUNO_DOI,
        mass["source_date"], mass["source"]["status"],
        Ordering.NORMAL, MIXING_RECORD_ID,
    )


@dataclass(frozen=True)
class CandidateIntake:
    candidate: str
    status: CandidateStatus
    model_prediction: None
    source_derived: bool
    comparison_verdict: str = "NOT_COMPARABLE_NO_QUALIFIED_PREDICTION"
    experimental_evidence: str = "NO_EXPERIMENTAL_INFERENCE"

    def __post_init__(self) -> None:
        if self.model_prediction is not None or self.source_derived:
            raise ValueError("SM-P0N0 has no accepted physical prediction pathway")
        if not isinstance(self.status, CandidateStatus):
            raise TypeError("unknown candidate origin status")


def candidate_intakes() -> tuple[CandidateIntake, ...]:
    """Source-exact statuses, not a physical judgment about model validity."""
    return (
        CandidateIntake("neutrino-extended-SM-fit",
                        CandidateStatus.FIT_INPUT_NOT_PREDICTION, None, False),
        CandidateIntake("BFSS",
                        CandidateStatus.MISSING_PHYSICAL_MAP, None, False),
        CandidateIntake("NFC-protected-persistence",
                        CandidateStatus.MISSING_PHYSICAL_MAP, None, False),
        CandidateIntake("other-unassessed",
                        CandidateStatus.NOT_ASSESSED, None, False),
    )


def intake_checkpoint(ledger_path: Path) -> dict[str, object]:
    obs = load_frozen_first_juno(ledger_path)
    return {
        "gate": "SM-P0N0",
        "qualification": "INTAKE_AND_NEGATIVE_CONTROLS_ONLY",
        "source_ledger": FROZEN_LEDGER_SCHEMA,
        "frozen_as_of": FROZEN_DATE,
        "measurement": {
            "id": obs.record_id,
            "value": str(obs.value),
            "error_minus": str(obs.error_minus),
            "error_plus": str(obs.error_plus),
            "unit": obs.unit,
            "source": obs.source_url,
            "source_date": obs.source_date,
            "analysis_ordering": obs.analysis_ordering.value,
            "cofitted_observable": obs.cofit_record_id,
            "covariance_status": obs.covariance_status,
            "likelihood_status": obs.likelihood_status,
            "role": obs.role,
        },
        "candidate_statuses": {
            item.candidate: item.status.value for item in candidate_intakes()
        },
        "model_prediction_count": 0,
        "experimental_evidence": "NO_EXPERIMENTAL_INFERENCE",
        "physical_SM_D1": "PROSPECTIVE_UNSTAGED",
    }
