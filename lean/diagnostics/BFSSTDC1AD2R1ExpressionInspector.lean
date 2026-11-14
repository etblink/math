import Lean.Elab.Tactic

/-! D2R1: original-Fock instrument-only microgate, no native theorem. -/
set_option autoImplicit false
namespace FCP.BFSSTDC1AD2R1
open Lean Lean.Meta Lean.Elab.Tactic

private def firstDiff (x y : Expr) (fuel : Nat) (path : String) : String :=
  match fuel with
  | 0 => s!"{path}: DEPTH_LIMIT"
  | n + 1 =>
    let x := x.consumeMData
    let y := y.consumeMData
    if Expr.equal x y then s!"{path}: SAME_AFTER_METADATA"
    else
      match x, y with
      | .app .., .app .. =>
        let fx := x.getAppFn
        let fy := y.getAppFn
        if !Expr.equal fx.consumeMData fy.consumeMData then
          firstDiff fx fy n (path ++ ".fn")
        else
          let ax := x.getAppArgs
          let ay := y.getAppArgs
          if ax.size != ay.size then s!"{path}: ARITY {ax.size}/{ay.size}"
          else if ax.size > 64 then s!"{path}: ARITY_LIMIT {ax.size}"
          else
            match (List.range ax.size).find? (fun i =>
                !(Expr.equal ax[i]!.consumeMData ay[i]!.consumeMData)) with
            | some i => firstDiff ax[i]! ay[i]! n (path ++ s!".arg[{i}]")
            | none => s!"{path}: INNER_METADATA_OR_BINDER_DIFFERENCE"
      | _, _ => s!"{path}: constructor_or_data_difference"

/-- Only inspect fully elaborated local types. No reducibility or proof action. -/
elab "td_c1a_d2r1_compare " h:ident : tactic => withMainContext do
  let decl ← getLocalDeclFromUserName h.getId
  let witnessType ← instantiateMVars decl.type
  let goalType ← instantiateMVars (← getMainTarget)
  let raw := Expr.equal witnessType goalType
  let rawAlpha := Expr.eqv witnessType goalType
  let stripped := Expr.equal witnessType.consumeMData goalType.consumeMData
  let strippedAlpha := Expr.eqv witnessType.consumeMData goalType.consumeMData
  let difference := firstDiff witnessType goalType 32 "root"
  logInfo s!"TD_C1A_D2R1_EXPR_REPORT witness={h.getId} raw_equal={raw} raw_alpha={rawAlpha} outer_metadata_equal={stripped} outer_metadata_alpha={strippedAlpha} witness_mvars={witnessType.hasMVar} goal_mvars={goalType.hasMVar} first_difference={difference}"

end FCP.BFSSTDC1AD2R1
