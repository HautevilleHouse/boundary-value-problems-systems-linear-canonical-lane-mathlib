import Mathlib.Analysis.Functional.Basic

/-!
# Linear Operator Package for Boundary Value Problems
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure LinearOperatorPackage where
  domain : Type u
  codomain : Type v
  operator : domain → codomain
  linearity : Prop
  boundedness : Prop
  closedRange : Prop
  kernelClosed : Prop

structure LinearOperatorEvidence (L : LinearOperatorPackage) where
  linearityClosed : L.linearity
  boundednessClosed : L.boundedness
  closedRangeClosed : L.closedRange
  kernelClosedClosed : L.kernelClosed

def LinearOperatorClosed (L : LinearOperatorPackage) : Prop :=
  L.linearity ∧ L.boundedness ∧ L.closedRange ∧ L.kernelClosed

theorem linear_operator_closed_from_evidence (L : LinearOperatorPackage)
    (E : LinearOperatorEvidence L) : LinearOperatorClosed L := by
  exact And.intro E.linearityClosed
    (And.intro E.boundednessClosed
      (And.intro E.closedRangeClosed E.kernelClosedClosed))

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse
