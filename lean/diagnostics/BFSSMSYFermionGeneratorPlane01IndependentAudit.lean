import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYFermionGeneratorPlane01

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYFermionGeneratorPlane01Independent

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2PhysicalDomainL6G6K
open FCP.BFSSMSYFermionGeneratorPlane01

/-- Evaluate the generator on the original Fock carrier, checking the
positive scale and the order in which the Majoranas act. -/
theorem original_fermion_generator_apply (v : Fermion 2) :
    sourceFiberFermionColorGenerator pairedAlgebraData (2 : Fin 3) v =
      (Real.sqrt 2 : ℂ) •
        (∑ α : SpinIndex, pairedTheta α (0 : Fin 3) (pairedTheta α (1 : Fin 3) v)) := by
  have h := congrArg (fun T : SourceFiberEnd => T v) native_fermion_generator_plane01
  simpa only [_root_.smul_apply, _root_.sum_apply, _root_.mul_apply_eq_comp] using h

#print axioms original_fermion_generator_apply

end FCP.BFSSMSYFermionGeneratorPlane01Independent
