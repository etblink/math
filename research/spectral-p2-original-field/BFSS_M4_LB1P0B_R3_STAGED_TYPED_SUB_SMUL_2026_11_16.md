# P0B R3 bounded repair staged

Contract commit 103c6a2a0e672547c88b72284bd0a1f8f4df1702, receipt research/spectral-p2-original-field/BFSS_M4_LB1P0B_R2_RED_43958703251_TYPED_SUB_SMUL_2026_11_16.md. Complete original R2 ZIP is preserved and separately rehashed before this proof change. Source blob 1c47a8645bb8ae18110f29083c95887b8a0e3a15; workflow blob 9192b1045aa478c2f03f3635d21d150dc8afdfb1; unchanged consumer 056d7692125f723c91e1d4a50540b9bcfaaf09da.

Exactly three source substitutions: sub_smul _ _ _ becomes sub_smul (a : ℂ) (b : ℂ) x; if_pos h becomes ite_eq_left h; if_neg h becomes ite_eq_right h. The accepted LB1C1 source already uses this explicitly typed complex sub_smul architecture and current conditional lemma names. No mathematical definition or statement changes. Workflow only updates the exact source pin. All other workflow bytes remain identical.

Source compilation has not yet executed for this candidate. Require the same cold original-source build, strict source and independent consumer compilations, 2+2 standard-only reports, all three consumer controls and auditor controls. No local executor available; CI is proof authority. P0A R4 remains last qualified; no physical or spectral promotion. If another analogous scalar/native elaboration failure occurs, pause and review architecture before further repair.
