# Edition 0.10.0

**The Relative SU(2) BFSS Quantum System**  
*Closed Supercharges and the Zero-Energy Existence Problem*

Internal research monograph dated November 27, 2026 Pacific. The 12 chapters follow the original physical charge graph through the common-square and positive-regulator arguments, then treat the exact witness calculation, independent spectral routes, topology, and empirical comparisons. Four appendices give normalization, the evidence index, negative results and an Edition 0.9.1 crosswalk.

The mathematical evidence cutoff is [ec55da1d6e6f](https://github.com/etblink/math/commit/ec55da1d6e6ffe50fedc1ea722f63eb470fae021). The exact CSQ-F0 R3 qualification covers complex pairing on the closed joint graph. The common-square and fidelity assemblies retain their analytical status. The original zero-energy existence claim remains open pending the stated source and independent raw-witness obligations.

## Build and audit

From this directory, with TeX Live and Python 3 installed:

```sh
python3 audit_edition.py
SOURCE_DATE_EPOCH=1795823999 latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex
python3 audit_edition.py --log main.log
```

The date override makes the PDF metadata independent of build time. See [build validation](BUILD_VALIDATION.md) for the actual build environment, PDF hash and scope of review. The previous edition and its receipts are available in the [parent directory](../README.md).
