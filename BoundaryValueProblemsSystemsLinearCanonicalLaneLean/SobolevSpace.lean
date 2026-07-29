import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure SobolevSpace (k : ℕ) (p : ℝ) where
  underlyingSpace : Type u
  innerProduct : underlyingSpace → underlyingSpace → ℝ
  norm : underlyingSpace → ℝ
  completeness : Prop
  normDefined : ∀ f : underlyingSpace, norm f ≥ 0
  innerProductSymmetric : ∀ f g, innerProduct f g = innerProduct g f

def SobolevNorm (k : ℕ) (p : ℝ) (H : SobolevSpace k p) (f : H.underlyingSpace) : ℝ :=
  H.norm f

theorem sobolev_norm_nonneg (k : ℕ) (p : ℝ) (H : SobolevSpace k p) (f : H.underlyingSpace) : SobolevNorm k p H f ≥ 0 := by
  exact H.normDefined f

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse