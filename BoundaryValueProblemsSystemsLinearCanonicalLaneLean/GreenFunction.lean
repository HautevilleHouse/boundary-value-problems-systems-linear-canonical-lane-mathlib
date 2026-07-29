import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinear

structure GreenFunctionPackage (A : AdmissibleClass) where
  domain : Type u
  boundary : Set domain
  operator : (domain → ℝ) → (domain → ℝ)
  deltaSource : domain → ℝ
  greenFunction : domain → domain → ℝ
  boundaryCondition : (domain → ℝ) → Prop

def GreenFunctionAdmissible {A : AdmissibleClass} (G : GreenFunctionPackage A) : Prop :=
  (∀ y : G.domain, (G.operator (fun x => G.greenFunction x y)) = G.deltaSource (· - y)) ∧
  (G.boundaryCondition (fun x => G.greenFunction x ·))

theorem green_function_admissible_from_proof {A : AdmissibleClass}
    (G : GreenFunctionPackage A) (h : GreenFunctionAdmissible G) :
    GreenFunctionAdmissible G := h

end BoundaryValueProblemsSystemsLinear
end HautevilleHouse