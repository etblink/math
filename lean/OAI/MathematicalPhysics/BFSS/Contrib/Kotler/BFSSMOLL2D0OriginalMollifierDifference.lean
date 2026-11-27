import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2C0OriginalHilbertNormBridge

/-! MOL-L2D0: literal mollifier difference, Hilbert contraction of differences,
and the quantitative density estimate. No limit or maximal graph claim yet. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMOLL2D0
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSMOLA0 FCP.BFSSMOLD0 FCP.BFSSMOLL2A0 FCP.BFSSMOLL2C0
open MeasureTheory

theorem mollifiedCore_sub {N : ℕ} (k : ScalarCore N) (u v : Boson N → Fermion N)
    (hu : LocallyIntegrable u volume) (hv : LocallyIntegrable v volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v) :
    mollifiedCore k (u - v) (hu.sub hv) (hsu.sub hsv) =
      mollifiedCore k u hu hsu - mollifiedCore k v hv hsv := by
  apply TestFunction.ext
  intro x
  change mollifiedCore k (u - v) (hu.sub hv) (hsu.sub hsv) x =
    mollifiedCore k u hu hsu x - mollifiedCore k v hv hsv x
  rw [mollifiedCore_apply, mollifiedCore_apply, mollifiedCore_apply]
  change (∫ y, k (x - y) • (u y - v y)) =
    (∫ y, k (x - y) • u y) - ∫ y, k (x - y) • v y
  simp only [smul_sub]
  exact integral_sub (kernel_integrable k u hu x) (kernel_integrable k v hv x)

theorem normalized_mollified_difference_le {N : ℕ} (φ : ContDiffBump (0 : Boson N))
    (u v : Boson N → Fermion N) (hsmu : StronglyMeasurable u)
    (hsmv : StronglyMeasurable v) (h2u : MemLp u 2 volume) (h2v : MemLp v 2 volume)
    (hu : LocallyIntegrable u volume) (hv : LocallyIntegrable v volume)
    (hsu : HasCompactSupport u) (hsv : HasCompactSupport v) :
    ‖coreToL2 (mollifiedCore (normalizedKernel φ) u hu hsu) -
      coreToL2 (mollifiedCore (normalizedKernel φ) v hv hsv)‖ ≤
      ‖h2u.toLp u - h2v.toLp v‖ := by
  rw [← map_sub, ← mollifiedCore_sub, ← MemLp.toLp_sub h2u h2v]
  exact normalized_mollified_norm_le φ (u - v) (hsmu.sub hsmv)
    (h2u.sub h2v) (hu.sub hv) (hsu.sub hsv)

theorem normalized_mollified_density_bound {N : ℕ} (φ : ContDiffBump (0 : Boson N))
    (u : Boson N → Fermion N) (hsm : StronglyMeasurable u)
    (h2 : MemLp u 2 volume) (hu : LocallyIntegrable u volume) (hs : HasCompactSupport u)
    (f : SmoothCore N) (hf : LocallyIntegrable (f : Boson N → Fermion N) volume) :
    ‖coreToL2 (mollifiedCore (normalizedKernel φ) u hu hs) - h2.toLp u‖ ≤
      2 * ‖h2.toLp u - coreToL2 f‖ +
      ‖coreToL2 (mollifiedCore (normalizedKernel φ) f hf f.hasCompactSupport) -
        coreToL2 f‖ := by
  let U : FullL2 N := h2.toLp u
  let F : FullL2 N := coreToL2 f
  let Su : FullL2 N := coreToL2 (mollifiedCore (normalizedKernel φ) u hu hs)
  let Sf : FullL2 N := coreToL2 (mollifiedCore (normalizedKernel φ) f hf f.hasCompactSupport)
  have hc : ‖Su - Sf‖ ≤ ‖U - F‖ :=
    normalized_mollified_difference_le φ u (f : Boson N → Fermion N) hsm
      f.continuous.stronglyMeasurable h2
      (f.continuous.memLp_of_hasCompactSupport f.hasCompactSupport) hu hf hs f.hasCompactSupport
  change ‖Su - U‖ ≤ 2 * ‖U - F‖ + ‖Sf - F‖
  calc
    ‖Su - U‖ ≤ ‖Su - Sf‖ + ‖Sf - U‖ := norm_sub_le_norm_sub_add_norm_sub Su Sf U
    _ ≤ ‖U - F‖ + (‖Sf - F‖ + ‖F - U‖) :=
      add_le_add hc (norm_sub_le_norm_sub_add_norm_sub Sf F U)
    _ = _ := by rw [norm_sub_rev F U]; ring

#print axioms mollifiedCore_sub
#print axioms normalized_mollified_difference_le
#print axioms normalized_mollified_density_bound

end
end FCP.BFSSMOLL2D0
