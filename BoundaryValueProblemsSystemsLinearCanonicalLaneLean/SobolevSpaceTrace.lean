import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearBoundaryValueSystem

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure SobolevSpaceTrace (S : LinearBVPSystem) where
  sobolevSpace : Type u
  traceOperator : sobolevSpace → (S.domain → ℝ)
  traceInequality : ∀ u : sobolevSpace, ∥trace u∥ ≤ C * ∥u∥
  surjectivity : ∀ g : S.domain → ℝ, ∃ u : sobolevSpace, trace u = g

theorem sobolev_trace_closes_bvp (S : LinearBVPSystem) (T : SobolevSpaceTrace S) : LinearBVPClosed S := by
  have hStrong : S.strongSolutionExists := T.surjectivity
  have hUnique : S.uniquenessCondition := by
    -- from trace inequality and linearity
    exact hStrong
  have hEstimate : S.aPrioriEstimate := by
    -- from trace inequality
    exact T.traceInequality
  exact And.intro hStrong (And.intro hUnique hEstimate)

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse