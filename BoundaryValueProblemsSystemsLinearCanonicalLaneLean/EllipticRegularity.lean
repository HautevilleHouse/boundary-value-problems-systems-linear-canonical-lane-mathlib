import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearBVPPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure EllipticRegularityPackage {P : LinearBVPPackage} where
  regularityTheory : Prop
  sobolevEstimates : Prop
  schauderEstimates : Prop
  smoothnessUpToBoundary : Prop

structure EllipticRegularityEvidence {P : LinearBVPPackage} (E : EllipticRegularityPackage P) where
  regularityTheoryClosed : E.regularityTheory
  sobolevEstimatesClosed : E.sobolevEstimates
  schauderEstimatesClosed : E.schauderEstimates
  smoothnessUpToBoundaryClosed : E.smoothnessUpToBoundary

def EllipticRegularityClosed {P : LinearBVPPackage} (E : EllipticRegularityPackage P) : Prop :=
  E.regularityTheory ∧ E.sobolevEstimates ∧ E.schauderEstimates ∧ E.smoothnessUpToBoundary

theorem elliptic_regularity_closed_from_evidence {P : LinearBVPPackage} (E : EllipticRegularityPackage P) (Ev : EllipticRegularityEvidence E) :
    EllipticRegularityClosed E := by
  exact And.intro Ev.regularityTheoryClosed (And.intro Ev.sobolevEstimatesClosed (And.intro Ev.schauderEstimatesClosed Ev.smoothnessUpToBoundaryClosed))

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse