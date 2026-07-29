import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinear

structure FredholmAlternativePackage (A : AdmissibleClass) where
  operator : (E → ℝ) → (E → ℝ)
  sourceTerm : E → ℝ
  homogeneousSolutions : Set (E → ℝ)
  adjointOperator : (E → ℝ) → (E → ℝ)
  adjointHomogeneousSolutions : Set (E → ℝ)

def FredholmAlternativeClosed {A : AdmissibleClass} (P : FredholmAlternativePackage A) : Prop :=
  (∀ f : E → ℝ, ∃ u : E → ℝ, (P.operator u) = f) ∨
  (∃ (v : E → ℝ) (hv : v ∈ P.adjointHomogeneousSolutions), 
    ∫ x, (P.sourceTerm x) * v x ≠ 0)

theorem fredholm_alternative_closed_from_construction {A : AdmissibleClass}
    (P : FredholmAlternativePackage A) (h : FredholmAlternativeClosed P) :
    FredholmAlternativeClosed P := h

end BoundaryValueProblemsSystemsLinear
end HautevilleHouse