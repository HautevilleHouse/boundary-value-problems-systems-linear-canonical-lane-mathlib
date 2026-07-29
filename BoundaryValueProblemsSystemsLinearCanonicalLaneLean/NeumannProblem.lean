import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinear

structure NeumannProblemPackage (A : AdmissibleClass) where
  domain : Type u
  boundary : Set domain
  operator : (domain → ℝ) → (domain → ℝ)
  sourceTerm : domain → ℝ
  normalDerivative : boundary → ℝ
  classicalSolution : domain → ℝ

structure NeumannProblemEvidence {A : AdmissibleClass} (P : NeumannProblemPackage A) where
  operatorLinear : LinearMap ℝ (domain → ℝ) (domain → ℝ)
  sourceContinuous : Continuous P.sourceTerm
  normalDerivativeContinuous : ContinuousOn P.normalDerivative (Set.univ : Set (boundary → ℝ))
  solutionSatisfiesPDE : (P.operator P.classicalSolution) = P.sourceTerm
  solutionMatchesNeumann : ∀ x : P.boundary, (deriv (P.classicalSolution) x) = P.normalDerivative x

def NeumannProblemClosed {A : AdmissibleClass} (P : NeumannProblemPackage A) : Prop :=
  P.operatorLinear ∧ P.sourceContinuous ∧ P.normalDerivativeContinuous ∧
  P.solutionSatisfiesPDE ∧ P.solutionMatchesNeumann

theorem neumann_problem_closed_from_evidence {A : AdmissibleClass} (P : NeumannProblemPackage A)
    (E : NeumannProblemEvidence P) : NeumannProblemClosed P := by
  exact And.intro E.operatorLinear (And.intro E.sourceContinuous (And.intro E.normalDerivativeContinuous
    (And.intro E.solutionSatisfiesPDE E.solutionMatchesNeumann)))

end BoundaryValueProblemsSystemsLinear
end HautevilleHouse