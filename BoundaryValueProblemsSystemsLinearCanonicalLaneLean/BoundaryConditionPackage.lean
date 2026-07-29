import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearOperatorPackage

/-!
# Boundary Condition Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure BoundaryConditionPackage (L : LinearOperatorPackage) where
  boundarySpace : Type u
  traceOperator : L.domain → boundarySpace
  boundaryCondition : L.domain → Prop
  homogeneousCase : Prop
  inhomogeneousCase : Prop

structure BoundaryConditionEvidence {L : LinearOperatorPackage}
    (B : BoundaryConditionPackage L) where
  homogeneousCaseClosed : B.homogeneousCase
  inhomogeneousCaseClosed : B.inhomogeneousCase

def BoundaryConditionClosed {L : LinearOperatorPackage}
    (B : BoundaryConditionPackage L) : Prop :=
  B.homogeneousCase ∧ B.inhomogeneousCase

theorem boundary_condition_closed_from_evidence
    {L : LinearOperatorPackage} (B : BoundaryConditionPackage L)
    (E : BoundaryConditionEvidence B) : BoundaryConditionClosed B := by
  exact And.intro E.homogeneousCaseClosed E.inhomogeneousCaseClosed

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse
