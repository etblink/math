# GM5C massless core moment control

GM5C is a candidate on unified integration. Let $Q(f)=\|Tu_f\|^2/16$ be the [qualified GM5B native charge form](BFSS_GM5B_R1_ORIGINAL_NATIVE_CLOSED_CHARGE_CORE_ENERGY_GREEN_ACCEPTANCE_2026_11_22.md), and let $B(f)$ be the sum of the kinetic and bosonic-potential terms on the original invariant smooth core.

The original field growth bound and Cauchy–Schwarz give

$$|Q(f)-B(f)|\ \le\ C_M\int \|x\|\,\|f(x)\|^2\,dx,$$

where $C_M$ is the existing `fermionGrowthConstant` of the same `AlgebraData` used for the charge column. Taking the absolute value also bounds the fermionic expectation because GM5A and GM5B identify it with $Q-B$. On core vectors vanishing outside a common radius $R$, the right-hand side is bounded by $C_M R\|u_f\|^2$. The independent paired SU(2) consumer restates both estimates with the original data and native charge column.

Both contributions to $B$ are nonnegative, so each is bounded above by $Q+C_M\int\|x\|\|f(x)\|^2dx$. For a graph-Cauchy core sequence whose differences also tend to zero in this weighted norm, the estimate on the differences gives Cauchy control of the gradient and square-root potential outputs. A fixed support radius supplies that weighted control from the ordinary $L^2$ convergence. Identifying the individual limits and the domain on which they exist remains a separate step. The current candidate supplies no global bound on the first radial moment in terms of the unweighted charge graph norm.
