# Packed bilinear R3 — separate literal selector and transport

Date 2026-11-25 Pacific. Branch `integration/bfss-unified-research-20261108`. Owner authorized continuation after R2 two-RED reassessment. Baseline 62392f3a58971b6cc6581673d55b79b81f447e56.

R2 artifact 15037400298 independently rehashed: 9765 bytes, f8c9b06d6ed6d03537548f6590a37696d533327bc9eeb389b6e5f678bac31f26; CRC clean, six members, exact tested SHA and source manifest inspected. R2 errors were obsolete if_pos/if_neg and residual if True. Fin.ext numeral equalities succeeded.

R3 candidate: introduce private packedAction_pair selector theorem exposing literal if on rho, reducing only the equivalence round trip by direct rw. Separate private even/odd selector lemmas consume it by calc with the pinned ite_eq_left/ite_eq_right lemmas, not simp. Main intertwiner uses the established Fin.ext case split, then transports selector equality by congrArg and applies qualified packedEvenIntertwine / packedOddIntertwine. No change to public declarations, definitions, imports, existing downstream abstract lemmas, consumers or CI. Direct conditional lemmas are already used in qualified packed carrier and mask. No new axioms, resource changes or enumeration.

Falsifiers: source preflight drift, native error, independent error, missing expected axiom report, unexpected axiom or missing strict sentinel. Require original artifact audit and all eight source plus two consumer roots. R3 not locally compiled. If R3 fails, stop and reassess; do not weaken standards. No seed or physical conclusion.
