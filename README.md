# functions-intersection-R
This package contains a collection of R scripts designed to compare the execution time of differently implemented programs that perform the same task: finding the intersection point(s) of two mathematical functions. Each implementation calculates function values, detects intersection points, and measures runtime performance. The scripts also generate visual plots marking the intersections, produce a results table, and export the computed data to a text file.

# Functions Intersection in R

This project demonstrates how to **numerically find and visualize the intersection point of two mathematical functions** using R.  
The functions analyzed are:

- f(x) = 8 * x²  
- g(x) = 64 * x * log(x)

The script searches for the intersection point, displays the result, and plots both functions (full view and zoomed-in view).

---

## Features
- Iterative search for the intersection using `while` loops  
- Precise calculation of the intersection coordinates (X, Y)  
- Two plots generated:
  - Full function plots
  - Zoomed-in plot with highlighted intersection point  
- Export of calculated values into a `.txt` file  

---

## Example Output
Console output:

The graphs of the functions intersect at the point with coordinates:
X = 15.1543
Y = 1839.1
Position in table = 276

Example plots:

- **Plot 1**: Full view of both functions with labels  
- **Plot 2**: Zoomed-in view showing the exact intersection point with gridlines  

---

## Requirements
- R 4.0 or later  
- Base R functions (no additional packages required)  

---

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/GP-data-engineer/functions-intersection-R.git
   cd functions-intersection-R
