import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsSystemsLinearCanonicalLaneLean.EllipticBoundaryValueProblem

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

structure LaxMilgramPackage where
  V : Type
  innerProduct : Prop
  bilinearForm : Prop
  coercivity : Prop
  boundedness : Prop
  solutionExistence : Prop
  innerProductClosed : innerProduct
  bilinearFormClosed : bilinearForm
  coercivityClosed : coercivity
  boundednessClosed : boundedness
  solutionExistenceClosed : solutionExistence

def LaxMilgramClosed (L : LaxMilgramPackage) : Prop :=
  L.innerProduct ∧ L.bilinearForm ∧ L.coercivity ∧ L.boundedness ∧ L.solutionExistence

theorem lax_milgram_closed_from_evidence (L : LaxMilgramPackage) (E : LaxMilgramClosed L) : LaxMilgramClosed L := E

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse