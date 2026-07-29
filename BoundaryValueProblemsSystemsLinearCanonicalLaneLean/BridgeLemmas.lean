import HautevilleHouse.BoundaryValueProblemsSystemsLinearCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BVPWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse