import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsLinearCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BVPSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BVPAdmittedObject where
  space : BVPSpace
  linearBVPDefined : Prop
  wellPosed : Prop
  solutionSpace : Type
  solutionTopology : TopologicalSpace solutionSpace
  uniqueSolutionExists : Prop
  conclusion : uniqueSolutionExists

structure BVPEndgameState where
  object : BVPAdmittedObject

def BVPWitnessClosed (O : BVPAdmittedObject) : Prop :=
  O.uniqueSolutionExists

end BoundaryValueProblemsSystemsLinearCanonicalLaneLean
end HautevilleHouse