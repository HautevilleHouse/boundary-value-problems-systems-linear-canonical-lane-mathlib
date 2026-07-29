import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinear

structure DirichletProblemPackage (A : AdmissibleClass) where
  domain : Type u
  boundary : Set domain
  operator : (domain → ℝ) → (domain → ℝ)
  sourceTerm : domain → ℝ
  boundaryCondition : boundary → ℝ
  classicalSolution : domain → ℝ

structure DirichletProblemEvidence {A : AdmissibleClass} (P : DirichletProblemPackage A) where
  operatorLinear : LinearMap ℝ (domain → ℝ) (domain → ℝ)
  sourceContinuous : Continuous P.sourceTerm
  boundaryContinuous : ContinuousOn P.boundaryCondition (Set.univ : Set (boundary → ℝ))
  solutionSatisfiesPDE : (P.operator P.classicalSolution) = P.sourceTerm
  solutionMatchesBoundary : ∀ x : P.boundary, P.classicalSolution x = P.boundaryCondition x

def DirichletProblemClosed {A : AdmissibleClass} (P : DirichletProblemPackage A) : Prop :=
  P.operatorLinear ∧ P.sourceContinuous ∧ P.boundaryContinuous ∧
  P.solutionSatisfiesPDE ∧ P.solutionMatchesBoundary

theorem dirichlet_problem_closed_from_evidence {A : AdmissibleClass} (P : DirichletProblemPackage A)
    (E : DirichletProblemEvidence P) : DirichletProblemClosed P := by
  exact And.intro E.operatorLinear (And.intro E.sourceContinuous (And.intro E.boundaryContinuous
    (And.intro E.solutionSatisfiesPDE E.solutionMatchesBoundary)))

end BoundaryValueProblemsSystemsLinear
end HautevilleHouse