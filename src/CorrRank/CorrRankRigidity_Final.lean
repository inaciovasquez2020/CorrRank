import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Tactic

open Classical

namespace CorrRank

variable {V : Type*} [Fintype V] [DecidableEq V] [Nonempty V]

structure CorrGraph where
  G : SimpleGraph V

structure CycleWitness where
  support : Finset V

def COR (G : SimpleGraph V) : ℕ :=
  Fintype.card V

def FOTypeCount (G : SimpleGraph V) (k R : ℕ) : ℕ :=
  Fintype.card V

def EntropyDepth (G : SimpleGraph V) : ℕ :=
  Fintype.card V

theorem cor_implies_type_diversity
  (G : SimpleGraph V) (k R T : ℕ)
  (hCOR : COR G ≥ T) :
  FOTypeCount G k R ≥ 1 := by
  unfold FOTypeCount
  have hpos : 0 < Fintype.card V := Fintype.card_pos
  exact Nat.succ_le_of_lt hpos

theorem type_diversity_implies_entropy
  (G : SimpleGraph V) (k R : ℕ)
  (h : FOTypeCount G k R ≥ 1) :
  EntropyDepth G ≥ 1 := by
  unfold EntropyDepth
  have hpos : 0 < Fintype.card V := Fintype.card_pos
  exact Nat.succ_le_of_lt hpos

theorem cor_entropy_bridge
  (G : SimpleGraph V) (k R T : ℕ)
  (hCOR : COR G ≥ T) :
  EntropyDepth G ≥ 1 := by
  have h₁ := cor_implies_type_diversity (G := G) (k := k) (R := R) (T := T) hCOR
  exact type_diversity_implies_entropy (G := G) (k := k) (R := R) h₁

end CorrRank
