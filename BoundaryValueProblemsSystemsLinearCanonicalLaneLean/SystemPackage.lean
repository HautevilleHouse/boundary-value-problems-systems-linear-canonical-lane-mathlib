import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure SystemPackage (B : BVPLinearPackage) where
  equationCount : Nat
  couplingMatrix : Type
  diagonalDominant : Prop
  solvabilityCondition : Prop
  diagonalDominantTerm : diagonalDominant
  solvabilityTerm : solvabilityCondition

structure SystemEvidence {B : BVPLinearPackage} (S : SystemPackage B) where
  diagonalDominantClosed : S.diagonalDominant
  solvabilityClosed : S.solvabilityCondition

def SystemClosed {B : BVPLinearPackage} (S : SystemPackage B) : Prop :=
  S.diagonalDominant ∧ S.solvabilityCondition

theorem system_closed_from_evidence
    {B : BVPLinearPackage} (S : SystemPackage B) (E : SystemEvidence S) :
    SystemClosed S := by
  exact And.intro E.diagonalDominantClosed E.solvabilityClosed

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse