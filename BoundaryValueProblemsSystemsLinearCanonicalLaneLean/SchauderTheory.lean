import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.EllipticRegularity

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure SchauderTheoryPackage {L : LinearSystemPackage} {E : EllipticRegularityPackage L} where
  campanatoEstimates : Prop
  holderContinuity : Prop
  fundamentalSolution : Prop
  greenFunction : Prop

structure SchauderTheoryEvidence {L : LinearSystemPackage} {E : EllipticRegularityPackage L} (S : SchauderTheoryPackage E) where
  campanatoEstimatesClosed : S.campanatoEstimates
  holderContinuityClosed : S.holderContinuity
  fundamentalSolutionClosed : S.fundamentalSolution
  greenFunctionClosed : S.greenFunction

def SchauderTheoryClosed {L : LinearSystemPackage} {E : EllipticRegularityPackage L} (S : SchauderTheoryPackage E) : Prop :=
  S.campanatoEstimates ∧ S.holderContinuity ∧ S.fundamentalSolution ∧ S.greenFunction

theorem schauder_theory_closed_from_evidence {L : LinearSystemPackage} {E : EllipticRegularityPackage L}
    (S : SchauderTheoryPackage E) (Ev : SchauderTheoryEvidence S) : SchauderTheoryClosed S := by
  exact And.intro Ev.campanatoEstimatesClosed
    (And.intro Ev.holderContinuityClosed
      (And.intro Ev.fundamentalSolutionClosed Ev.greenFunctionClosed))

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse