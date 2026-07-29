import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearBVPSystem

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure ExistenceUniquenessPackage (S : LinearBVPSystem) where
  weakSolutionExists : Prop
  strongSolutionExists : Prop
  uniquenessHolds : Prop
  regularityGain : Prop

structure ExistenceUniquenessEvidence {S : LinearBVPSystem} (P : ExistenceUniquenessPackage S) where
  weakSolutionExistsClosed : P.weakSolutionExists
  strongSolutionExistsClosed : P.strongSolutionExists
  uniquenessHoldsClosed : P.uniquenessHolds
  regularityGainClosed : P.regularityGain

def ExistenceUniquenessClosed {S : LinearBVPSystem} (P : ExistenceUniquenessPackage S) : Prop :=
  P.weakSolutionExists ∧ P.strongSolutionExists ∧ P.uniquenessHolds ∧ P.regularityGain

theorem existence_uniqueness_closed_from_evidence {S : LinearBVPSystem} (P : ExistenceUniquenessPackage S) (E : ExistenceUniquenessEvidence P) :
    ExistenceUniquenessClosed P := by
  exact And.intro E.weakSolutionExistsClosed (And.intro E.strongSolutionExistsClosed (And.intro E.uniquenessHoldsClosed E.regularityGainClosed))

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse