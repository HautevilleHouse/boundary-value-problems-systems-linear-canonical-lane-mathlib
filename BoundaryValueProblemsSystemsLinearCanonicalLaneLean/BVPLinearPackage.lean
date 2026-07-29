import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure BVPLinearPackage where
  domain : Type u
  codomain : Type v
  operator : (domain → codomain) → (domain → codomain)
  boundaryOperator : (domain → codomain) → codomain
  linear : Prop
  bounded : Prop
  wellPosed : Prop
  wellPosedTerm : wellPosed

structure BVPLinearEvidence (B : BVPLinearPackage) where
  linearClosed : B.linear
  boundedClosed : B.bounded
  wellPosedClosed : B.wellPosed

def BVPLinearClosed (B : BVPLinearPackage) : Prop :=
  B.linear ∧ B.bounded ∧ B.wellPosed

theorem bvp_linear_closed_from_evidence (B : BVPLinearPackage) (E : BVPLinearEvidence B) :
    BVPLinearClosed B := by
  exact And.intro E.linearClosed (And.intro E.boundedClosed E.wellPosedClosed)

structure BVPLinearAdmittedObject where
  object : BVPLinearPackage
  conclusion : BVPLinearClosed object

def BVPLinearWitnessClosed (O : BVPLinearAdmittedObject) : Prop :=
  O.conclusion

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse