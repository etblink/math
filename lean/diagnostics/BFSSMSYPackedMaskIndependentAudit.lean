import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedMask

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedMaskIndependent
noncomputable section

open FCP.BFSSMSYPackedMask FCP.BFSSMSYCoefficientCarrier

/-- Check actual little-endian bit positions, including the last mode. -/
theorem lastBitAudit :
    (23 : Fin 24) ∈ decodeMask (8388608 : Fin (2 ^ 24)) := by
  rw [mem_decodeMask]
  decide

/-- Compare the literal XOR and occupation action on arbitrary masks. -/
theorem literalXorAudit (m : Fin (2 ^ 24)) (i : Fin 24) :
    decodeNat 24 (m.val ^^^ (2 ^ i.val)) = toggleOccupation i (decodeMask m) :=
  decode_xor_source m i

#print axioms lastBitAudit
#print axioms literalXorAudit

end
end FCP.BFSSMSYPackedMaskIndependent
