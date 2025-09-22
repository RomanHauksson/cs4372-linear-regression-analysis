# Linear Regression Analysis

**Author:** A. Nagar  
**Due Date:** Mentioned in eLearning

## Instructions

- Build a linear regression model in Python using standard machine learning libraries.
- Store your dataset in a public location (e.g., GitHub or AWS). **Do not** submit the dataset on eLearning.
- Teams of up to **two** students are allowed. Include the **names** and **NetIDs** of each group member on the cover page. Only **one** final submission per team.
- You have a total of **4 free late days** for the entire semester. You can use at most **2 days** for any one assignment. After four days have been used, there is a **10% penalty per late day**. Submission will be **closed 2 days after the due date**.

## 1. Project and Dataset Selection

Choose a dataset from the **UCI Machine Learning Repository**: <https://archive.ics.uci.edu/ml/datasets.php>  
Set the **Default Task** to **Regression**, then select any dataset you like. Read the dataset’s description to identify the **predicted variable** (target) and the **predictors** (independent variables).

## 2. Regression Model Building

You will perform data preprocessing, loading, model creation, and results analysis. Create **two** different regression models:

1. **Stochastic Gradient Descent** using `SGDRegressor` from **scikit-learn**.  
2. **Ordinary Least Squares (OLS)** using **statsmodels**.

### 2.1 Pre-Processing

Perform at least the following steps (add more if needed):

- **Load data** into a **Pandas DataFrame**. Use **public URLs** to read the file.
- **Check data consistency**: handle nulls/missing data and any inconsistencies before proceeding.
- **Examine attributes and the target variable**: understand each attribute; convert categorical attributes to numerical if needed. Provide a **summary** of attributes. Consider normality—are attributes normally distributed? If not, why?
- **Standardize and normalize** the attributes.
- **Correlation analysis**: examine how attributes correlate with each other and with the target. Include **numerical and visual** analysis with plots and results.
- **Feature selection**: identify a few important attributes; do **not** use all attributes blindly.
- **Train–test split**: split data into training and testing sets (ratio is your choice).

### 2.2 Model Construction

Create the two models using `SGDRegressor` (scikit-learn) and **OLS** (statsmodels).

- **SGDRegressor**: tune hyperparameters such as **learning rate**, **max iterations**, **loss**, **penalty**, etc. Keep a **log** of hyperparameters and results; do **not** rely solely on defaults. Output as many metrics as possible: **training/test error and accuracy**, **R-squared**, etc. It is **highly recommended** to standardize data before using `SGDRegressor` (e.g., `StandardScaler` in scikit-learn).
- **OLS (statsmodels)**: output the **model summary** and **interpret** all diagnostics (coef, standard error, t-value, p-value, R-squared, adjusted R-squared, F-statistic, etc.).

### 2.3 Result Analysis

Create a **report** with results and your **interpretation** for each model. You may add additional details. Prefer **tables** and **plots**, followed by your interpretation. **Do not** copy definitions or long explanations from external sources—write your own analysis and interpretation.

> **Note:** Do **not** include code or snippets in the report. Submit code as a **separate file**.

## 3. Requirements

The following requirements **cannot be changed**:

1. Teams of **maximum size 2**.
2. Treat this as a **data science project**: interpret output diagnostics and include as many plots as possible. Your **interpretation and analysis** are the primary focus.
3. **No plagiarism**: do not copy publicly available solutions.
4. Submit your **Python code file** and **report file**. Do **not** hard-code local paths. Place data in a **public location** (e.g., GitHub) and read from that link.
5. Python code may be in **Google Colab** or a **Jupyter Notebook**.

You must tune as many hyperparameters as possible (see library documentation and sample code). Keep a **log** of experiments with hyperparameters and results.

If you make any **assumptions**, state them clearly. Include **instructions** on how to compile and run your code in a **README** file.
