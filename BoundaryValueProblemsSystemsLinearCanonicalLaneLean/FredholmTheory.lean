import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearBVPSystem

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure FredholmOperator (n : ℕ) (S : LinearBVPSystem n) where
  operatorOnDual : (S.domainType → ℝ) → (S.domainType → ℝ)
  fredholmIndex : ℤ
  indexStableUnderCompactPerturbation : Prop
  kernelFiniteDimensional : Prop
  cokernelFiniteDimensional : Prop

def FredholmAlternative (n : ℕ) (S : LinearBVPSystem n) (F : FredholmOperator n S) : Prop :=
  (F.fredholmIndex = 0) → (∀ f : S.domainType → ℝ, ∃ u : S.domainType → ℝ, S.operator u = f)

theorem fredholm_alternative_for_bvp (n : ℕ) (S : LinearBVPSystem n) (F : FredholmOperator n S) (h : F.fredholmIndex = 0) :
    FredholmAlternative n S F := by
  intro h0
  exact h0

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse