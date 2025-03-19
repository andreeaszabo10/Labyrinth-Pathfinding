Copyright Szabo Cristina-Andreea 2022-2023
# Labyrinth Pathfinding and Optimization

## Overview

This project is a MATLAB-based solution for pathfinding and optimization in a labyrinth environment. The project leverages several algorithms and techniques such as greedy heuristics, iterative methods, and Jacobi parameterization to find optimal paths through a labyrinth grid.

The system reads a labyrinth structure from a file, computes adjacency matrices, and applies algorithms to solve for optimal paths based on probabilities or other heuristic methods. It also implements an iterative solver using the Jacobi method to compute solutions for a series of equations, commonly encountered in network flow or similar optimization problems.

## File Structure

- **decode_path.m**: Decodes a given path by mapping positions to rows and columns based on the labyrinth's dimensions.
- **get_adjacency_matrix.m**: Computes the adjacency matrix from the labyrinth, which helps in determining the connectivity between different cells in the maze.
- **get_Jacobi_parameters.m**: Extracts the necessary parameters from a link matrix for solving equations using the Jacobi iterative method.
- **get_link_matrix.m**: Generates a link matrix based on the labyrinth's structure, allowing for the calculation of transitions between adjacent cells.
- **heuristic_greedy.m**: Implements the greedy heuristic algorithm to find a path through the labyrinth, selecting the best neighbor based on a probability measure.
- **parse_labyrinth.m**: Reads a labyrinth from a file, extracting its dimensions and structure.
- **perform_iterative.m**: Performs iterative calculations using the Jacobi method to solve for an unknown variable in the context of the labyrinth or network.
- **task.m**: The main script that initializes the problem by sourcing all necessary functions and runs the required algorithms.

## Problem Description

### Pathfinding in a Labyrinth

The project addresses a pathfinding problem within a grid-based labyrinth. Given a labyrinth, the goal is to find an optimal path from a start point to a destination (typically a "win" state) by:

1. **Parsing the Labyrinth**: The labyrinth is read from a file using `parse_labyrinth.m`, which extracts the grid dimensions and structure.
2. **Adjacency Matrix Creation**: The adjacency matrix is computed using `get_adjacency_matrix.m`, which determines the connectivity between adjacent cells.
3. **Link Matrix**: The link matrix is calculated with `get_link_matrix.m`, which helps in evaluating the possible transitions between cells based on the labyrinth's constraints.
4. **Heuristic Greedy Algorithm**: The `heuristic_greedy.m` function implements a greedy approach to explore the labyrinth. It selects the next position based on the highest probability of reaching the "win" state.
5. **Jacobi Iteration**: The Jacobi method is used in `perform_iterative.m` to solve a system of linear equations based on the link matrix. This helps find solutions that may optimize the pathfinding process.

### Key Concepts

- **Greedy Heuristic**: This algorithm iteratively selects the next best option based on a heuristic (in this case, the highest probability), without considering the global context.
- **Jacobi Iterative Method**: A method for solving linear equations by iterating over guesses for unknown values, often used in network optimization problems.
- **Adjacency and Link Matrices**: These matrices represent the relationships between cells in the labyrinth. They are essential for determining connectivity and transitions between points.
