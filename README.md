# efficienttrace
This is a trial R package that implements a heuristic to calculate the trace of a matrix which itself is the result of multiplication of two large matrices.
## Installation
If you haven't installed `devtools` package, open R console and type
```
install.packages("devtools")
```

Then type
```
library(devtools)
install_github("skybullbobby/efficienttrace")
```
## Usage


There is only one function available right now. It is called `tracecalc`. Using this function we can compare the calculation speed of the trace of a large matrix which itself is a product of two matrices together with their transpose. The detailed algorithm can be checked out ![here](https://drive.google.com/open?id=1l4ZAlXXjMYrCcwa02a8PVm96stdWDH8o). An example is as follows,
```
> tracecalc(2000,23,19)
[1] "Real trace is 56426.7"
[1] "Time Spent: 0.694"
[1] "Simulated trace is 52969.85"
[1] "Time Spent: 0.182"
```
In the example above, the first parameter is the number of rows for both matrices. The second parameter is the number of columns for the first matrix and the third parameter is the number of columns for the second matrix.

You can define the number of helper vectors if you want to. They are used in the heuristics.
```
> tracecalc(B=600, 2000,23,19)
[1] "Real trace is 57405.15"
[1] "Time Spent: 0.203"
[1] "Simulated trace is 55811.09"
[1] "Time Spent: 0.189"
```

**Note: Don't put too large parameters in the function! Numbers similar to the two examples above is okay, but numbers on a larger magnitude could cause the program to get stuck.**
