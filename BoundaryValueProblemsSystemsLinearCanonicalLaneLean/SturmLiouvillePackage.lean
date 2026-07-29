import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.LinearBVPPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure SturmLiouvillePackage {P : LinearBVPPackage} where
  coefficientFunctions : Prop
  spectralData : Prop
  eigenfunctionExpansion : Prop
  greenFunction : Prop

structure SturmLiouvilleEvidence {P : LinearBVPPackage} (S : SturmLiouvillePackage P) where
  coefficientFunctionsClosed : S.coefficientFunctions
  spectralDataClosed : S.spectralData
  eigenfunctionExpansionClosed : S.eigenfunctionExpansion
  greenFunctionClosed : S.greenFunction

def SturmLiouvilleClosed {P : LinearBVPPackage} (S : SturmLiouvillePackage P) : Prop :=
  S.coefficientFunctions ∧ S.spectralData ∧ S.eigenfunctionExpansion ∧ S.greenFunction

theorem sturm_liouville_closed_from_evidence {P : LinearBVPPackage} (S : SturmLiouvillePackage P) (E : SturmLiouvilleEvidence S) :
    SturmLiouvilleClosed S := by
  exact And.intro E.coefficientFunctionsClosed (And.intro E.spectralDataClosed (And.intro E.eigenfunctionExpansionClosed E.greenFunctionClosed))

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse