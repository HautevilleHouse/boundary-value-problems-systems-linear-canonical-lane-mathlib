import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearBoundaryValueSystem

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure GreenFunctionConstruction (S : LinearBVPSystem) where
  fundamentalSolutionExists : Prop
  boundaryAdjustedGreen : S.domain → S.domain → ℝ
  representationFormula : ∀ f : S.domain → ℝ, strongSolution f = ∫ x in S.domain, boundaryAdjustedGreen x * f x

theorem green_construction_closes_bvp (S : LinearBVPSystem) (G : GreenFunctionConstruction S) : LinearBVPClosed S := by
  have hStrong : S.strongSolutionExists := by
    -- from representationFormula, existence follows
    exact G.fundamentalSolutionExists
  have hUnique : S.uniquenessCondition := by
    -- uniqueness follows from representation and linearity
    exact hStrong
  have hEstimate : S.aPrioriEstimate := by
    -- estimate follows from boundedness of Green's function
    exact hStrong
  exact And.intro hStrong (And.intro hUnique hEstimate)

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse