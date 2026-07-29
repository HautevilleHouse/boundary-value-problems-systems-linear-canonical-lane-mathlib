import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure HilbertSpacePackage where
  carrier : Type u
  innerProduct : carrier → carrier → ℝ
  complete : Prop

structure LinearOperatorPackage (H : HilbertSpacePackage) where
  operator : H.carrier → H.carrier
  bounded : Prop
  coercive : Prop

structure BoundaryConditionPackage (H : HilbertSpacePackage) (L : LinearOperatorPackage H) where
  boundaryType : Type v
  condition : H.carrier → Prop
  wellPosed : Prop

structure WeakFormulationPackage (H : HilbertSpacePackage) (L : LinearOperatorPackage H) (B : BoundaryConditionPackage H L) where
  bilinearForm : H.carrier → H.carrier → ℝ
  linearForm : H.carrier → ℝ
  continuous : Prop
  coercive : Prop

structure SolutionExistencePackage (H : HilbertSpacePackage) (L : LinearOperatorPackage H) (B : BoundaryConditionPackage H L) (W : WeakFormulationPackage H L B) where
  solutionExists : Prop
  solutionUnique : Prop
  laxMilgramApplied : Prop

structure BVPAdmittedObject where
  hilbert : HilbertSpacePackage
  operator : LinearOperatorPackage hilbert
  boundary : BoundaryConditionPackage hilbert operator
  weak : WeakFormulationPackage hilbert operator boundary
  solution : SolutionExistencePackage hilbert operator boundary weak
  conclusion : solution.solutionExists ∧ solution.solutionUnique

def BVPSolutionClosed (O : BVPAdmittedObject) : Prop :=
  O.solution.solutionExists ∧ O.solution.solutionUnique

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse