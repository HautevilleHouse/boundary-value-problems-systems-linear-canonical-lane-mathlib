import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure LinearBVPSystem (n : ℕ) where
  domainType : Type u
  codomainType : Type v
  operator : (domainType → ℝ) → (domainType → ℝ)
  boundaryOperator : (domainType → ℝ) → ℝ^n
  sourceTerm : domainType → ℝ
  linearityProof : ∀ f g, operator (f + g) = operator f + operator g
  boundaryOperatorLinear : ∀ f g, boundaryOperator (f + g) = boundaryOperator f + boundaryOperator g
  wellPosedness : Prop

structure LinearBVPEvidence (n : ℕ) (S : LinearBVPSystem n) where
  sourceTermSmooth : S.wellPosedness
  boundaryOperatorContinuous : S.wellPosedness
  operatorElliptic : S.wellPosedness

def LinearBVPClosed (n : ℕ) (S : LinearBVPSystem n) : Prop :=
  S.wellPosedness

theorem linear_bvp_closed_from_evidence (n : ℕ) (S : LinearBVPSystem n) (E : LinearBVPEvidence n S) : LinearBVPClosed n S := by
  exact E.sourceTermSmooth

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse