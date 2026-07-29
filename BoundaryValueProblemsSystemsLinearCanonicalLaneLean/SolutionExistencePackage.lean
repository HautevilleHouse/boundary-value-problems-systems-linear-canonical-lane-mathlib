import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.BoundaryConditionPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure SolutionExistenceEvidence (H : HilbertSpacePackage) (L : LinearOperatorPackage H)
    (B : BoundaryConditionPackage H L) (W : WeakFormulationPackage H L B)
    (S : SolutionExistencePackage H L B W) where
  solutionExistsClosed : S.solutionExists
  solutionUniqueClosed : S.solutionUnique
  laxMilgramAppliedClosed : S.laxMilgramApplied

def SolutionExistenceClosed (H : HilbertSpacePackage) (L : LinearOperatorPackage H)
    (B : BoundaryConditionPackage H L) (W : WeakFormulationPackage H L B)
    (S : SolutionExistencePackage H L B W) : Prop :=
  S.solutionExists ∧ S.solutionUnique ∧ S.laxMilgramApplied

theorem solution_existence_closed_from_evidence (H : HilbertSpacePackage) (L : LinearOperatorPackage H)
    (B : BoundaryConditionPackage H L) (W : WeakFormulationPackage H L B)
    (S : SolutionExistencePackage H L B W) (E : SolutionExistenceEvidence H L B W S) :
    SolutionExistenceClosed H L B W S := by
  exact And.intro E.solutionExistsClosed (And.intro E.solutionUniqueClosed E.laxMilgramAppliedClosed)

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse