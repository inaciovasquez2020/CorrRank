import Lake
open Lake DSL

package CorrRank where

require mathlib from git
"https://github.com/leanprover-community/mathlib4"

@[default_target]
lean_lib CorrRank where
srcDir := "src"
