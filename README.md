![Lean Build](https://github.com/inaciovasquez2020/CorrRank/actions/workflows/build.yml/badge.svg)

# CorrRank — Cycle Overlap Rank Rigidity (Lean Formalization)

This repository contains a Lean 4 formalization of the **Cycle Overlap Rank (COR)** rigidity framework.

The project formalizes the structural chain

COR  →  FO^k local type diversity  →  EntropyDepth lower bounds

for bounded-degree graphs.

## Core Idea

For a graph G and radius R:

1. Each vertex v defines a local neighborhood (ball) B_R(v).
2. Neighborhoods are grouped by isomorphism type.
3. For each type τ we compute β₁(τ), the cycle rank (first homology dimension).
4. The **Correlation Rank**

CorrRank_R(G) = Σ_τ (β₁(τ))²

measures the total cycle interaction across local types.

Large CorrRank forces **multiple FO^k local types**, breaking FO^k-homogeneity.

## Mathematical Role

This repository provides machine-checked components of the rigidity chain used in:

Cycle-Overlap Rigidity
→ FO^k Local Diversity
→ EntropyDepth Lower Bounds

within the broader **Chronos / Unified Rigidity Framework** program.

## Repository Structure

src/
CorrRank/
CorrRankRigidity_Final.lean

Main definitions:

• Ball / BallGraph
• BallIsoRel and BallSetoid
• β₁ cycle rank
• β₁_class quotient invariant
• CorrRank_R(G)

All definitions avoid representative choice via `Quotient.lift`.

## Build

Requirements:

Lean 4 + mathlib4

Build with:

lake update
lake exe cache get
lake build

## Status

Mathematical core complete.
Remaining work is API engineering around `Sym2` edge representations.

## Author

Inacio F. Vasquez
Independent Researcher — Foundations of Physics & Mathematics
