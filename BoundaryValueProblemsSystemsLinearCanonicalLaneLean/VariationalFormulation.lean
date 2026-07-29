import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearBVPPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure VariationalFormulationPackage {P : LinearBVPPackage} where
  bilinearFormDefined : Prop
  coercivity : Prop
  continuity : Prop
  laxMilgramApplicable : Prop

structure VariationalFormulationEvidence {P : LinearBVPPackage} (V : VariationalFormulationPackage P) where
  bilinearFormDefinedClosed : V.bilinearFormDefined
  coercivityClosed : V.coercivity
  continuityClosed : V.continuity
  laxMilgramApplicableClosed : V.laxMilgramApplicable

def VariationalFormulationClosed {P : LinearBVPPackage} (V : VariationalFormulationPackage P) : Prop :=
  V.bilinearFormDefined ∧ V.coercivity ∧ V.continuity ∧ V.laxMilgramApplicable

theorem variational_formulation_closed_from_evidence {P : LinearBVPPackage} (V : VariationalFormulationPackage P) (E : VariationalFormulationEvidence V) :
    VariationalFormulationClosed V := by
  exact And.intro E.bilinearFormDefinedClosed (And.intro E.coercivityClosed (And.intro E.continuityClosed E.laxMilgramApplicableClosed))

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse