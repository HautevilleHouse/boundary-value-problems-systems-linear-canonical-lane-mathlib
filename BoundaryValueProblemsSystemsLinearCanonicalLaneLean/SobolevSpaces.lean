import canonicalLaneMathlib.AdmissibleClass

/-!
# Sobolev Spaces for Linear BVP -/

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure SobolevSpacePackage where
  domain : Type u
  dimension : ℕ
  smoothnessIndex : ℕ
  integrabilityExponent : ℝ
  embeddingTheorems : Prop
  traceOperator : Prop

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.embeddingTheorems ∧ S.traceOperator

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  embeddingTheoremsClosed : S.embeddingTheorems
  traceOperatorClosed : S.traceOperator

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage)
    (E : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro E.embeddingTheoremsClosed E.traceOperatorClosed

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse