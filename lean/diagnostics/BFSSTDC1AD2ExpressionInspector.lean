import Lean.Elab.Tactic

/-!
TD-C1A D2: observation-only, bounded raw-expression inspection.
This imports no BFSS source and proves no native covariance result.
-/
set_option autoImplicit false

namespace FCP.BFSSTDC1AD2
open Lean Lean.Meta Lean.Elab.Tactic

private def shortNode : Expr → String
  | .app .. => "app"
  | .const n us => s!"const:{n}/levels:{us.length}"
  | .fvar _ => "fvar"
  | .mvar _ => "mvar"
  | .bvar i => s!"bvar:{i}"
  | .sort _ => "sort"
  | .lit _ => "literal"
  | .lam .. => "lambda"
  | .forallE .. => "forall"
  | .letE .. => "let"
  | .mdata .. => "metadata"
  | .proj n i _ => s!"proj:{n}/{i}"

/-- First differing application argument, with no definitional reduction.
    This walk is bounded by fuel and never unfolds source Fock definitions. -/
private def firstDiff (x y : Expr) (fuel : Nat) (path : String) : String :=
  match fuel with
  | 0 => s!"{path}: DEPTH_LIMIT"
  | n + 1 =>
    if Expr.equal x y then
      s!"{path}: SAME"
    else
      match x, y with
      | .app .., .app .. =>
        let hx := x.getAppFn
        let hy := y.getAppFn
        if !Expr.equal hx hy then
          firstDiff hx hy n (path ++ ".head")
        else
          let ax := x.getAppArgs
          let ay := y.getAppArgs
          if ax.size != ay.size then
            s!"{path}: ARITY {ax.size}/{ay.size}"
          else
            match (List.range ax.size).find? (fun i => !(Expr.equal ax[i]! ay[i]!)) with
            | some i => firstDiff ax[i]! ay[i]! n (path ++ s!".arg[{i}]")
            | none => s!"{path}: EQUAL_ARGS_BUT_DIFFERENT_NODE"
      | .mdata _ ex, .mdata _ ey =>
        firstDiff ex ey n (path ++ ".mdata")
      | .forallE _ tx bx _, .forallE _ ty by_ _ =>
        if !Expr.equal tx ty then firstDiff tx ty n (path ++ ".forall_type")
        else firstDiff bx by_ n (path ++ ".forall_body")
      | .lam _ tx bx _, .lam _ ty by_ _ =>
        if !Expr.equal tx ty then firstDiff tx ty n (path ++ ".lambda_type")
        else firstDiff bx by_ n (path ++ ".lambda_body")
      | .proj _ _ ex, .proj _ _ ey =>
        firstDiff ex ey n (path ++ ".proj_operand")
      | _, _ =>
        s!"{path}: {shortNode x} vs {shortNode y}"

/-- Inspect a separately synthesized witness type versus the current
    unaltered goal. No isDefEq, whnf, simp, typeclass search or proof assignment. -/
elab "td_c1a_d2_compare " h:ident : tactic => withMainContext do
  let fv ← getFVarFromUserName h.getId
  let witnessType ← inferType fv
  let goalType ← getMainTarget
  let raw := Expr.equal witnessType goalType
  let alpha := Expr.eqv witnessType goalType
  let difference := firstDiff witnessType goalType 32 "root"
  logInfo s!"TD_C1A_D2_EXPR_REPORT witness={h.getId} raw_equal={raw} alpha_equiv={alpha} witness_mvars={witnessType.hasMVar} goal_mvars={goalType.hasMVar} first_difference={difference} witness_node={shortNode witnessType} goal_node={shortNode goalType}"

/-- Deliberately do not close an unqualified native theorem goal. -/
elab "td_c1a_d2_stop" : tactic => do
  throwError "TD_C1A_D2_EXPECTED_STOP_OBSERVATION_ONLY"

end FCP.BFSSTDC1AD2
