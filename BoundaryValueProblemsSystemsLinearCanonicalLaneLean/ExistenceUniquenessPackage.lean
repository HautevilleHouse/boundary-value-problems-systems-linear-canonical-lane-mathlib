import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.WeakFormulationPackage

/-!
# Existence and Uniqueness Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure ExistenceUniquenessPackage (W : WeakFormulationPackage) where
  solutionSpace : Type u
  existenceTheorem : Prop
  uniquenessTheorem : Prop
  continuousDependence : Prop

structure ExistenceUniquenessEvidence {W : WeakFormulationPackage}
    (E : ExistenceUniquenessPackage W) where
  existenceTheoremClosed : E.existenceTheorem
  uniquenessTheoremClosed : E.uniquenessTheorem
  continuousDependenceClosed : E.continuousDependence

def ExistenceUniquenessClosed {W : WeakFormulationPackage}
    (E : ExistenceUniquenessPackage W) : Prop :=
  E.existenceTheorem ∧ E.uniquenessTheorem ∧ E.continuousDependence

theorem existence_uniqueness_closed_from_evidence
    {W : WeakFormulationPackage} (E : ExistenceUniquenessPackage W)
    (Ev : ExistenceUniquenessEvidence E) : ExistenceUniquenessClosed E := by
  exact And.intro Ev.existenceTheoremClosed
    (And.intro Ev.uniquenessTheoremClosed Ev.continuousDependenceClosed)

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse
