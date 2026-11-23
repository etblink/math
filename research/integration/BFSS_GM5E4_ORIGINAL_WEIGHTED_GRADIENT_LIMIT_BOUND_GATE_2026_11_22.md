# GM5E4 original weighted gradient limit bound

GM5E4 R1 is a candidate on unified integration. For an original invariant smooth-core sequence, assume strong convergence of the original $L^2$ input to $u$, the native charge output to $q$, and the square-root radius weighted output to $w$. The candidate keeps GM5E3's source gradient limit $g$ and membership of $(u,g,w)$ in the original weighted Sobolev closure. It adds the estimate

$$\|g\|^2\le \tfrac18\|q\|^2+2C_M\|w\|^2,$$

where $C_M$ is the existing source fermion growth constant. The proof takes the limit of the [qualified GM5E1 estimate](BFSS_GM5E1_R1_ORIGINAL_RADIAL_WEIGHTED_GRADIENT_CONTROL_GREEN_ACCEPTANCE_2026_11_22.md) by continuity of the squared norms and closedness of the real order, using the limit from [GM5E3](BFSS_GM5E3_R1_ORIGINAL_WEIGHTED_GRAPH_GRADIENT_LIMIT_GREEN_ACCEPTANCE_2026_11_22.md).

The strict workflow checks one source declaration and one independent declaration on literal paired SU(2) data. This estimate would supply the gradient bound for a later application of the [qualified weighted Sobolev compactness theorem](https://github.com/etblink/math/actions/runs/42320696105) to uniformly bounded families of these limits. The compactness adapter, the full intersection of operator domains, and the global radial moment estimate remain separate.
