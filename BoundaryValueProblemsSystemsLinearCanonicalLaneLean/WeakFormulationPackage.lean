import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.SobolevSpacePackage

/-!
# Weak Formulation Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure WeakFormulationPackage (S : SobolevSpacePackage) where
  bilinearForm : S.domain → S.domain → ℝ
  linearFunctional : S.domain → ℝ
  coercivity : Prop
  boundedness : Prop
  infSupCondition : Prop

structure WeakFormulationEvidence {S : SobolevSpacePackage}
    (W : WeakFormulationPackage S) where
  coercivityClosed : W.coercivity
  boundednessClosed : W.boundedness
  infSupConditionClosed : W.infSupCondition

def WeakFormulationClosed {S : SobolevSpacePackage}
    (W : WeakFormulationPackage S) : Prop :=
  W.coercivity ∧ W.boundedness ∧ W.infSupCondition

theorem weak_formulation_closed_from_evidence
    {S : SobolevSpacePackage} (W : WeakFormulationPackage S)
    (E : WeakFormulationEvidence W) : WeakFormulationClosed W := by
  exact And.intro E.coercivityClosed
    (And.intro E.boundednessClosed E.infSupConditionClosed)

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse
