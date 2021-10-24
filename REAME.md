Coursera-Introduction-to-Data-Signal-and-Image-Analysis-with-MATLAB
===================================================================

<table>
<tr>
<td>
A collection of <i>Code Files</i> used in lectures, quizzes, and assignments for <a href="https://www.coursera.org/learn/advanced-matlab-programming?specialization=matlab-programming-engineers-scientists">Mastering Programming with MATLAB</a>.
I took this online course on Coursera platform during September-October, 2021. (<a href="https://www.coursera.org/account/accomplishments/certificate/EAAHRSKXQR7A">Certificate of Completion</a>)
</td>
</tr>
</table>

> DISCLAIMER: Please do not simply copy the code without trying to solve the problems yourself in the first place. The author reserves all rights but does not be liable in any event (e.g., plagiarism) caused by the use of the program. Remember that one can only learn programming by doing it. Have fun coding!😃

---

### Overview
This course is the last part of the specialization [MATLAB Programming for Engineers and Scientists Specialization](https://www.coursera.org/specializations/matlab-programming-engineers-scientists), offered by Vanderbilt University.
It provides an introduction on how to use MATLAB for data, signal, and image analysis. After completing the course, learners will understand how machine learning methods can be used in MATLAB for data classification and prediction; 
how to perform data visualization, especially for high dimensional datasets; how to perform image processing and analysis methods, including image filtering and image segmentation; 
and how to perform common signal analysis tasks, including filter design and frequency analysis.

Instructor: [Jack Noble](https://www.coursera.org/instructor/jacknoble)

---

### Naming Convention

- For file names starting with `Example`: code examples that are demonstrated in the lectures
- For file names starting with `Quiz`: scripts and answers for quizzes
- For file names starting with `<function-name>` (e.g., ): function definition required for completing the assignments
- For file names starting with `Script`: scripts that are used to call the corresponding functions in the assignments

---

### Final Project

In the final project of this course, I developed an image analysis-based solution for counting coin change for a bank.
A camera is placed above the bank teller's countertop which will photograph coins placed on the countertop.
When someone spreads any combination of *quarters*, *nickels*, and *dimes* on the countertop, my program will analyze an image taken from the camera to:
(1) localize the coins, (2) classify each coin as a quarter, nickel, or dime, (3) add up the total value of the coins shown in the image.

<p align="center">
  <img width="550" src="https://user-images.githubusercontent.com/43208378/133851704-f66f1b1a-3933-4ed8-bb36-a9be46748bce.png">
</p>

#### Steps to achieve the goal:

1. Localize the centroid of each coin 
2. Measure features for each coin using a "bank" of matching filters 
3. Perform k-means clustering of features for an unsupervised learning coin-type classifier, sum up the total value of coins, and visualize the results

#### How to run the program?
Simply run `Final_project_script_3.m`, which is the final version of the implementation to solve the problem. The output should look identical to the image above. 

---

### Recommended Further Readings
- For Signal Analysis: *Oppenheim, Alan V.; Willsky, Alan S.; Nawab, Syed Hamid (1997): Signals and systems. 2. ed.*
- For Image Analysis: *Šonka, Milan; Hlaváč, Václav; Boyle, Roger (2015): Image processing, analysis, and machine vision. 4. ed.*

---

### Contact
If you have any question or suggestion, feel free to contact me at huaming.huang.tw@gmail.com. Contributions are also welcomed. Please open a [pull-request](https://github.com/hmhuang0501/Coursera-Mastering-Programming-with-MATLAB/compare) or an [issue](https://github.com/hmhuang0501/Coursera-Mastering-Programming-with-MATLAB/issues/new) in this repository. 