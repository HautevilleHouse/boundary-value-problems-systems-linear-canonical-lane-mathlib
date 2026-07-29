import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearBVPSystem
import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.SobolevSpace

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure WeakSolution (n : ℕ) (S : LinearBVPSystem n) (H : SobolevSpace 1 2) where
  candidate : H.underlyingSpace
  bilinearForm : H.underlyingSpace → H.underlyingSpace → ℝ
  bilinearFormContinuous : ∀ u v, bilinearForm u v ≤ H.norm u * H.norm v
  coercivity : ∀ u, bilinearForm u u ≥ H.norm u ^ 2
  weakEquation : ∀ v : H.underlyingSpace, bilinearForm candidate v = S.sourceTerm v

theorem weak_solution_unique (n : ℕ) (S : LinearBVPSystem n) (H : SobolevSpace 1 2) (u v : WeakSolution n S H) :
    u.candidate = v.candidate := by
  have h : u.bilinearForm (u.candidate - v.candidate) (u.candidate - v.candidate) = 0 := by
    calc
      u.bilinearForm (u.candidate - v.candidate) (u.candidate - v.candidate)
          = u.bilinearForm u.candidate (u.candidate - v.candidate) - u.bilinearForm v.candidate (u.candidate - v.candidate) := by
        rw [map_sub, map_sub]
      _ = S.sourceTerm (u.candidate - v.candidate) - S.sourceTerm (u.candidate - v.candidate) := by
        rw [u.weakEquation (u.candidate - v.candidate), v.weakEquation (u.candidate - v.candidate)]
      _ = 0 := by ring
  have h_nonneg : u.bilinearForm (u.candidate - v.candidate) (u.candidate - v.candidate) ≥ 0 := by
    apply u.coercivity
  have h_norm : H.norm (u.candidate - v.candidate) ^ 2 ≤ 0 := by
    calc
      H.norm (u.candidate - v.candidate) ^ 2 ≤ u.bilinearForm (u.candidate - v.candidate) (u.candidate - v.candidate) := u.coercivity (u.candidate - v.candidate)
      _ = 0 := h
    -- Actually coercivity gives ≥, so we have inequality in opposite direction? Wait: coercivity says bilinearForm u u ≥ H.norm u ^ 2, so we have H.norm u^2 ≤ bilinearForm u u. Then from h we have bilinearForm = 0, so H.norm^2 ≤ 0. That's correct.
  have h_norm_eq_zero : H.norm (u.candidate - v.candidate) = 0 := by
    nlinarith
  have h_zero : u.candidate - v.candidate = 0 := by
    apply H.norm_eq_zero_iff.mp h_norm_eq_zero
  exact sub_eq_zero.mp h_zero

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse