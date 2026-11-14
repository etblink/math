import Lean.Elab.Tactic

/-! D2R2: differential original-Fock typed-expression observer.
Does not attempt proof, isDefEq, whnf or full expression pretty printing. -/
set_option autoImplicit false
namespace FCP.BFSSTDC1AD2R2
open Lean Lean.Meta Lean.Elab.Tactic

private def describe : Expr → String
  | .const n us => s!"const:{n}:universes={us.length}"
  | .app f _ =>
    match f.getAppFn with
    | .const n us => s!"app-of:{n}:universes={us.length}"
    | .fvar _ => "app-of:fvar"
    | .mvar _ => "app-of:mvar"
    | _ => "app-of:nonconst"
  | .fvar _ => "fvar"
  | .mvar _ => "mvar"
  | .bvar i => s!"bvar:{i}"
  | .sort _ => "sort"
  | .lit _ => "literal"
  | .lam .. => "lambda"
  | .forallE .. => "forall"
  | .letE .. => "let"
  | .mdata .. => "metadata"
  | .proj n i _ => s!"proj:{n}:{i}"

/-- Do not normalize; strip only outer metadata at each compared node. -/
private def firstDiff (lhs rhs : Expr) (fuel : Nat) (path : String) : String :=
  match fuel with
  | 0 => s!"{path}:DEPTH_LIMIT"
  | n + 1 =>
    let x := lhs.consumeMData
    let y := rhs.consumeMData
    if Expr.equal x y then
      s!"{path}:SAME_AFTER_METADATA"
    else
      match x, y with
      | .app .., .app .. =>
        let hx := x.getAppFn
        let hy := y.getAppFn
        if !Expr.equal hx.consumeMData hy.consumeMData then
          firstDiff hx hy n (path ++ ".fn")
        else
          let xs := x.getAppArgs
          let ys := y.getAppArgs
          if xs.size != ys.size then
            s!"{path}:ARITY:{xs.size}:{ys.size}"
          else if xs.size > 64 then
            s!"{path}:ARITY_LIMIT:{xs.size}"
          else
            match (List.range xs.size).find? (fun i =>
                !(Expr.equal xs[i]!.consumeMData ys[i]!.consumeMData)) with
            | some i => firstDiff xs[i]! ys[i]! n (path ++ s!".arg[{i}]")
            | none => s!"{path}:INNER_METADATA_OR_OTHER_DIFFERENCE lhs={describe x} rhs={describe y}"
      | .forallE _ tx bx _, .forallE _ ty by_ _ =>
        if !Expr.equal tx.consumeMData ty.consumeMData then
          firstDiff tx ty n (path ++ ".forall_type")
        else
          firstDiff bx by_ n (path ++ ".forall_body")
      | .lam _ tx bx _, .lam _ ty by_ _ =>
        if !Expr.equal tx.consumeMData ty.consumeMData then
          firstDiff tx ty n (path ++ ".lam_type")
        else
          firstDiff bx by_ n (path ++ ".lam_body")
      | .proj _ _ ex, .proj _ _ ey =>
        firstDiff ex ey n (path ++ ".proj_expr")
      | _, _ => s!"{path}:lhs={describe x}:rhs={describe y}"

/-- Observe two independently elaborated types. Does NOT check
definitional equality or assign proofs. No full expression dumps. -/
elab "td_c1a_d2r2_compare " h:ident : tactic => withMainContext do
  let decl ← getLocalDeclFromUserName h.getId
  let x ← instantiateMVars decl.type
  let y ← instantiateMVars (← getMainTarget)
  let sx := x.consumeMData
  let sy := y.consumeMData
  let fingerprint := firstDiff sx sy 32 "root"
  logInfo s!"TD_C1A_D2R2_EXPR_REPORT witness={h.getId} raw_equal={Expr.equal x y} raw_alpha={Expr.eqv x y} outer_metadata_equal={Expr.equal sx sy} outer_metadata_alpha={Expr.eqv sx sy} witness_mvars={x.hasMVar} goal_mvars={y.hasMVar} first_difference={fingerprint} root_witness={describe sx} root_goal={describe sy}"

/-- Record a deliberate nonqualification, not a theorem or repaired proof. -/
elab "td_c1a_d2r2_stop" : tactic => do
  throwError "TD_C1A_D2R2_EXPECTED_STOP_OBSERVATION_ONLY"

end FCP.BFSSTDC1AD2R2
