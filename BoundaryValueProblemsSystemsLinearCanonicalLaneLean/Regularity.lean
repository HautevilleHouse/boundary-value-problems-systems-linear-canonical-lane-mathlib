import canonicalLaneMathlib.AdmissibleClass

/-!
# Elliptic Regularity Package -/

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure RegularityPackage where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  higherOrderEstimates : Prop
  smoothnessGain : ℕ

def RegularityClosed (R : RegularityPackage) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.higherOrderEstimates

structure RegularityEvidence (R : RegularityPackage) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  higherOrderEstimatesClosed : R.higherOrderEstimates

theorem regularity_closed_from_evidence (R : RegularityPackage)
    (E : RegularityEvidence R) : RegularityClosed R := by
  exact And.intro E.interiorRegularityClosed
    (And.intro E.boundaryRegularityClosed E.higherOrderEstimatesClosed)

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse