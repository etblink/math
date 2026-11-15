# G12 R1 strict launch binding — November 15, 2026 Pacific

Status: IN PROGRESS / UNQUALIFIED. Observed job setup PASS and checkout in progress; all later phases pending at this observation.

- Strict run: [#43711440502](https://github.com/etblink/math/actions/runs/43711440502), attempt1.
- Exact tested proof commit: `40933c1e2f76a67093b4a2abde977d5298c09a82`.
- Job: `132803656126`, original-derivative-fock-bilinear.
- Prospective contract commit: `a080af0c4b08f9085d6a4dfdc1a3169541b132ac`, committed before proof code.
- Accepted source baseline: `7459e472085a6ef9b3c5c8352073ea1bafa6645e` (G11 R3 #43708533905).
- Candidate source blob: `567661beef53c27fb8d3a3282a580e296c992962`.
- Mathlib-only coefficient helper blob: `2c0b07a603a94ad18342a53a5d88eaad5345cb5d`.
- Independent consumer blob: `13f5557809b7ecce2dfeb60d2988febcd85bf529`.
- Strict workflow blob: `d987f7e02dfe98be035d1710409f1ad04601ddc9`.

Expected qualification: freshly measured166 recursive original-source pins; early helper reports1+3+1; cold native build; fresh warning-as-error source6 and consumer12 standard-axiom reports; all twelve literal paired-source controls. The deduplicated manifest count remains unmeasured in the canonical checkpoint until CI evidence is audited. Local static checks are not Lean qualification.

The verified remote diff has eight files, including three new Lean files and no changes to accepted Lean donors. G11 acceptance and its full rehashed artifact remain canonical. This gate targets only the pointwise ordered kinetic-symbol/tau-derivative Fock bilinear, with theta product order fixed. The full smooth-core charge/tau rotation, tau norm, genuine physical Spin9/charge covariance, energy/domain identities and the Hardy/fidelity certificate remain separate obligations. Physical symmetry and energy/domain research remains the highest forward-research priority.

If red, preserve the complete artifact and first causal failure; repeated native conversion requires an isolated typed comparison before another full retry. No unchanged retry or resource escalation.
