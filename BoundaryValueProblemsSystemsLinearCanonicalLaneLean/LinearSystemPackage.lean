import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure LinearSystemPackage where
  equationSpace : Type u
  operator : Type v
  boundaryConditions : Prop
  linearFormulation : Prop
  coefficientSmoothness : Prop

structure LinearSystemEvidence (L : LinearSystemPackage) where
  equationSpaceClosed : L.equationSpace
  operatorClosed : L.operator
  boundaryConditionsClosed : L.boundaryConditions
  linearFormulationClosed : L.linearFormulation
  coefficientSmoothnessClosed : L.coefficientSmoothness

def LinearSystemClosed (L : LinearSystemPackage) : Prop :=
  L.equationSpace ∧ L.operator ∧ L.boundaryConditions ∧ L.linearFormulation ∧ L.coefficientSmoothness

theorem linear_system_closed_from_evidence (L : LinearSystemPackage) (E : LinearSystemEvidence L) :
    LinearSystemClosed L := by
  exact And.intro E.equationSpaceClosed
    (And.intro E.operatorClosed
      (And.intro E.boundaryConditionsClosed
        (And.intro E.linearFormulationClosed E.coefficientSmoothnessClosed)))

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse