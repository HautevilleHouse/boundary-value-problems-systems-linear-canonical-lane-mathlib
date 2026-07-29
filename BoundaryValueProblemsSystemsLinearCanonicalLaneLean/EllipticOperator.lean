import canonicalLaneMathlib.AdmissibleClass

/-!
# Linear Elliptic Operator Package -/

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure EllipticOperatorPackage where
  coefficientType : Type u
  ellipticityConstant : ℝ
  boundednessConstant : ℝ
  smoothCoefficients : Prop
  divergenceForm : Prop

def EllipticOperatorClosed (E : EllipticOperatorPackage) : Prop :=
  E.smoothCoefficients ∧ E.divergenceForm

structure EllipticOperatorEvidence (E : EllipticOperatorPackage) where
  smoothCoefficientsClosed : E.smoothCoefficients
  divergenceFormClosed : E.divergenceForm

theorem elliptic_operator_closed_from_evidence (E : EllipticOperatorPackage)
    (Ev : EllipticOperatorEvidence E) : EllipticOperatorClosed E := by
  exact And.intro Ev.smoothCoefficientsClosed Ev.divergenceFormClosed

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse