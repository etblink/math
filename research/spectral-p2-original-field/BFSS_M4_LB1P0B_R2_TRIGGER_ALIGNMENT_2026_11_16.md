# P0B R2 launch trigger alignment

R2 staging commit 4ff1888aea8afd7fee459d7683a19b91eb54fe92 passed roadmap run 43958345801 but launched no P0B strict run. Its push path filter retained the shorter inherited filename, while the actual workflow is .github/workflows/bfss-m4-lb1p0b-source48-skew-plane-normalization-strict.yml.

Align that path with the existing workflow filename. R2 has not yet executed. This is a launch correction within the staged R2 attempt, not a mathematical retry. The source and consumer remain blobs c27ebd4b909b157d70efb5ad5db0ce836468f4d3 and 056d7692125f723c91e1d4a50540b9bcfaaf09da; donor pins, statements, resource limits and strict audit remain unchanged. The workflow blob is c57b2957d87eeb0604eeaac2f69bc1f726d6ac22. R1 preflight RED remains preserved separately.
