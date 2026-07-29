import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure LinearBVPPackage where
  domain : Type u
  boundary : Type v
  differentialOperator : Type w
  boundaryOperator : Type x
  pdeType : Prop
  wellPosed : Prop
  uniqueSolution : Prop

structure LinearBVPEvidence (P : LinearBVPPackage) where
  pdeTypeClosed : P.pdeType
  wellPosedClosed : P.wellPosed
  uniqueSolutionClosed : P.uniqueSolution

def LinearBVPClosed (P : LinearBVPPackage) : Prop :=
  P.pdeType ∧ P.wellPosed ∧ P.uniqueSolution

theorem linear_bvp_closed_from_evidence (P : LinearBVPPackage) (E : LinearBVPEvidence P) :
    LinearBVPClosed P := by
  exact And.intro E.pdeTypeClosed (And.intro E.wellPosedClosed E.uniqueSolutionClosed)

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse