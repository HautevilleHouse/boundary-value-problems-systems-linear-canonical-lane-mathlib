import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure EllipticBVPPackage where
  domain : Type
  operator : Type
  boundaryCondition : Prop
  solutionSpace : Type
  wellPosedness : Prop
  regularity : Prop
  boundaryConditionClosed : boundaryCondition
  solutionSpaceClosed : solutionSpace
  wellPosednessClosed : wellPosedness
  regularityClosed : regularity

def EllipticBVPClosed (P : EllipticBVPPackage) : Prop :=
  P.boundaryCondition ∧ P.solutionSpace ∧ P.wellPosedness ∧ P.regularity

theorem elliptic_bvp_from_evidence (P : EllipticBVPPackage) (E : P.boundaryCondition ∧ P.solutionSpace ∧ P.wellPosedness ∧ P.regularity) :
    EllipticBVPClosed P := by
  exact E

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse