# D1P — original BFSS CAR projector and Gaussian Berry-flatness research

**Research classification:** exact finite-dimensional source-convention mathematical analysis + independently checked symbolic/integer tests + small-mode dense CAR sanity tests; **not a native Lean formal proof**.

Use Python 3 with NumPy and SymPy. From this directory run:

```bash
python d1p_car_rank_one_factorization.py
python d1p_berry_curvature_exact.py
python d1p_berry_tensor_atoms.py
python d1p_berry_symbolic_clifford.py
python d1p_generic_berry_control.py
python d1p_full24_deck_holonomy.py
```

Each script writes its adjacent `*_results.json` deterministically. The curvature scripts use *exact* integer matrices, or SymPy rational/Clifford matrices. The generic and rank-one tests use independently randomized but fixed-seed small Fock matrices. No script constructs the full `2^24 × 2^24` original Fock matrix. The 24-orbital deck computation works on 24×24 real/complex orbital matrices and eight occupied orbitals.

For a clean-room check, extract the ZIP to a fresh directory, run all six scripts, and compare `sha256sum -c SHA256SUMS`. `SHA256SUMS` lists all files except itself. It also includes the report and this README and therefore detects accidental documentation/algorithm changes.

Main mathematical outputs: an ordinary CAR-only rank-one proof for the polynomial Gaussian projector; an exact tensor-trace proof of the BFSS Berry curvature being zero; an independent **nonzero generic Gaussian** control; a whole-deck-path `+1` Slater wedge sign in original source indexing. Correspondence to the **literal Lean** `SmoothCore 2`, physical gauge core and exact closed Hamiltonian is **not qualified**. All historical strict RED results remain RED.
