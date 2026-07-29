import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.SchauderTheory

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure MaximumPrinciplePackage {L : LinearSystemPackage} {E : EllipticRegularityPackage L}
    {S : SchauderTheoryPackage E} where
  weakPrinciple : Prop
  strongPrinciple : Prop
  hopfLemma : Prop
  zarembaPrinciple : Prop

structure MaximumPrincipleEvidence {L : LinearSystemPackage} {E : EllipticRegularityPackage L}
    {S : SchauderTheoryPackage E} (M : MaximumPrinciplePackage S) where
  weakPrincipleClosed : M.weakPrinciple
  strongPrincipleClosed : M.strongPrinciple
  hopfLemmaClosed : M.hopfLemma
  zarembaPrincipleClosed : M.zarembaPrinciple

def MaximumPrincipleClosed {L : LinearSystemPackage} {E : EllipticRegularityPackage L}
    {S : SchauderTheoryPackage E} (M : MaximumPrinciplePackage S) : Prop :=
  M.weakPrinciple ∧ M.strongPrinciple ∧ M.hopfLemma ∧ M.zarembaPrinciple

theorem maximum_principle_closed_from_evidence {L : LinearSystemPackage} {E : EllipticRegularityPackage L}
    {S : SchauderTheoryPackage E} (M : MaximumPrinciplePackage S) (Ev : MaximumPrincipleEvidence M) :
    MaximumPrincipleClosed M := by
  exact And.intro Ev.weakPrincipleClosed
    (And.intro Ev.strongPrincipleClosed
      (And.intro Ev.hopfLemmaClosed Ev.zarembaPrincipleClosed))

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse