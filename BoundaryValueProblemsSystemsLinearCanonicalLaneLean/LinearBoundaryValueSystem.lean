import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure LinearBVPSystem where
  domain : Type u
  domainTopology : TopologicalSpace domain
  differentialOperator : LinearOperator domain
  sourceTerm : domain → ℝ
  boundaryCondition : domain → ℝ → Prop
  strongSolutionExists : Prop
  uniquenessCondition : Prop
  aPrioriEstimate : Prop
  wellPosedness : strongSolutionExists ∧ uniquenessCondition ∧ aPrioriEstimate

structure LinearBVPEvidence (S : LinearBVPSystem) where
  strongSolutionExistsClosed : S.strongSolutionExists
  uniquenessConditionClosed : S.uniquenessCondition
  aPrioriEstimateClosed : S.aPrioriEstimate

def LinearBVPClosed (S : LinearBVPSystem) : Prop :=
  S.strongSolutionExists ∧ S.uniquenessCondition ∧ S.aPrioriEstimate

theorem linear_bvp_closed_from_evidence (S : LinearBVPSystem) (E : LinearBVPEvidence S) : LinearBVPClosed S := by
  exact And.intro E.strongSolutionExistsClosed (And.intro E.uniquenessConditionClosed E.aPrioriEstimateClosed)

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse