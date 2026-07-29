import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearBVPSystem

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure WeakFormulationPackage (S : LinearBVPSystem) where
  bilinearFormContinuous : Prop
  coercivity : Prop
  weakSolutionEquivalent : Prop

structure WeakFormulationEvidence {S : LinearBVPSystem} (W : WeakFormulationPackage S) where
  bilinearFormContinuousClosed : W.bilinearFormContinuous
  coercivityClosed : W.coercivity
  weakSolutionEquivalentClosed : W.weakSolutionEquivalent

def WeakFormulationClosed {S : LinearBVPSystem} (W : WeakFormulationPackage S) : Prop :=
  W.bilinearFormContinuous ∧ W.coercivity ∧ W.weakSolutionEquivalent

theorem weak_formulation_closed_from_evidence {S : LinearBVPSystem} (W : WeakFormulationPackage S) (E : WeakFormulationEvidence W) :
    WeakFormulationClosed W := by
  exact And.intro E.bilinearFormContinuousClosed (And.intro E.coercivityClosed E.weakSolutionEquivalentClosed)

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse