# functions-intersection-R
This package contains a collection of R scripts designed to compare the execution time of differently implemented programs that perform the same task: finding the intersection point(s) of two mathematical functions. Each implementation calculates function values, detects intersection points, and measures runtime performance. The scripts also generate visual plots marking the intersections, produce a results table, and export the computed data to a text file.

# Functions Intersection in R
This package contains a collection of R scripts designed to compare the execution time of differently implemented programs that perform the same task: finding the intersection point(s) of two mathematical functions.  
One implementation searches for intersections by **comparing arrays** and returning the rows with matching values.  
The other finds the intersection point using a **simple `for` loop**.  

Each implementation calculates function values, detects intersection points, and measures runtime performance. The scripts also generate visual plots marking the intersections, produce a results table, and export the computed data to a text file.

The functions analyzed are:

- f(x) = 8 * x²  
- g(x) = 64 * x * log(x)

The script searches for the intersection point, displays the result, and plots both functions (full view and zoomed-in view).

---

## Features
- Iterative search for the intersection using `while` loops  
- Precise calculation of the intersection coordinates (X, Y)  
- Two plots generated:
 - **Plot 1**: Full view of both functions with labels  
 - **Plot 2**: Zoomed-in view showing the exact intersection point with gridlines  
- Export of calculated values into a `.txt` file  

---

## Example Output
Console output:

The graphs of the functions intersect at the point with coordinates:
(x)=26.09349      f(x)=5446.96100      g(x)=5446.96100 

**Performance note:**  
The array-comparison implementation completes in under 0.5 seconds of system runtime,  
while the `for`‑loop implementation takes over 5 seconds.

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
