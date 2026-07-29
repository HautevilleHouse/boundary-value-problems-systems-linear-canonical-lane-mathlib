import Mathlib.Analysis.Sobolev

/-!
# Sobolev Space Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure SobolevSpacePackage where
  domain : Type u
  smoothness : ℕ
  integrability : ℝ≥0∞
  embeddingTheorem : Prop
  compactEmbedding : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  embeddingTheoremClosed : S.embeddingTheorem
  compactEmbeddingClosed : S.compactEmbedding

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.embeddingTheorem ∧ S.compactEmbedding

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage)
    (E : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro E.embeddingTheoremClosed E.compactEmbeddingClosed

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse
