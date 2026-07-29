import canonicalLaneMathlib.AdmissibleClass

/-!
# Boundary Conditions Package -/

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

inductive BoundaryType
| dirichlet
| neumann
| robin

definition BoundaryCondition where
  boundaryType : BoundaryType
  boundaryData : Type u
  compatibilityWithOperator : Prop
  traceCondition : Prop

structure BoundaryConditionPackage where
  condition : BoundaryCondition
  compatibilityClosed : compatibilityWithOperator
  traceConditionClosed : traceCondition

def BoundaryConditionClosed (B : BoundaryConditionPackage) : Prop :=
  B.compatibilityClosed ∧ B.traceConditionClosed

structure BoundaryConditionEvidence (B : BoundaryConditionPackage) where
  compatibilityClosed : B.compatibilityClosed
  traceConditionClosed : B.traceConditionClosed

theorem boundary_condition_closed_from_evidence (B : BoundaryConditionPackage)
    (E : BoundaryConditionEvidence B) : BoundaryConditionClosed B := by
  exact And.intro E.compatibilityClosed E.traceConditionClosed

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse