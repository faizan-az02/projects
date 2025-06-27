# Emergency Travel Plan Optimizer

Welcome to the Emergency Travel Plan Optimizer project! This program calculates the minimum number of days required for a traveler to return to the office during an emergency, navigating a graph of cities with both road and aerial connections.

---

## Project Overview
This C++ project simulates an emergency return route for a traveler who must traverse through a series of cities connected by roads and flights. The system applies custom logic and constraints to find the optimal number of days needed to reach the final city (city N-1) from the starting city (city 0).

---

## Problem Description
A traveler receives an emergency call and must return to the office. Cities are connected by roads (with a max of 6 cities traveled per day) and some also have aerial routes (instant travel). The traveler must avoid backward loops via flights.

---

## Algorithm Approach

Emergency Travel Plan Optimizer
CS-2001 Data Structures – Semester Project

This C++ program calculates the minimum number of days required for a traveler to 
reach their destination city (city N-1) from the starting city (city 0), given a 
graph of cities connected via roads and aerial routes, under certain constraints.

Constraints:
- The traveler can travel through a maximum of 6 cities per day by road.
- Aerial routes allow instant travel between two cities on the same day.
- The traveler must avoid using aerial routes that create backward movement or loops.

Approach (Specific to this implementation):
- The city network is represented as an adjacency matrix where:
  - Road connections are sequential (city i to city i+1).
  - Aerial routes are added after filtering overlapping flights using a custom 
    overlap elimination function `flights()` that retains only the most beneficial ones.
- Traversal is done linearly with basic checks on:
  - Number of cities traveled per day (reset after 6).
  - Availability of forward aerial routes (selected if they help progress).
  - Avoiding backward aerial routes (ignored or stepped back if needed).
- The number of days is incremented when:
  - The traveler uses an aerial route (unless it's the last leg).
  - The 6-city daily travel limit by road is reached.

Input:
- Number of test cases.
- For each test case: number of cities and number of aerial routes.
- Each aerial route is defined by its source and destination city.

Output:
- Minimum number of days required for each test case.
- Adjacency matrix representing the final graph with all road and aerial connections.

