Project: Linear Regression Analysis

- [uv](https://docs.astral.sh/uv/guides/install-python/) for package management
- [Typst](https://typst.app/) for the writeup

## Assignment TODO (Strict per Instructions)

### 1) Project and Dataset Selection
- [ ] Choose a dataset from the UCI ML repository (https://archive.ics.uci.edu/ml/datasets.php) with Default Task = Regression
- [ ] Read the dataset description to understand variables
- [ ] Identify the predicted variable (target) and predictor (independent) variables
- [ ] Store the dataset at a public URL (e.g., GitHub/AWS); do not submit the dataset file

### 2) Regression Model Building

#### 2.1 Pre‑Processing
- [ ] Load data into a pandas DataFrame from a public URL (remember to use public URLs to read the file)
- [ ] Check for null values, missing data, and inconsistencies; handle them
- [ ] Examine attributes and the target; convert categorical attributes to numeric if needed
- [ ] Output summaries of the attributes; note whether attributes are normally distributed and why/why not
- [ ] Standardize and normalize the attributes (as appropriate)
- [ ] Analyze correlations among attributes and with the target; provide numerical and visual results (plots)
- [ ] Identify a few important attributes; do not use all attributes blindly
- [ ] Split the data into training and testing parts (choose and state the ratio)

#### 2.2 Model Construction
- [ ] Model 1: Stochastic Gradient Descent using `SGDRegressor` (scikit‑learn)
  - [ ] Tune hyper‑parameters (e.g., learning rate, maximum iterations, loss, penalty, etc.)
  - [ ] Figure out which combination of hyper‑parameters works best for your dataset
  - [ ] Do not just use all default values
  - [ ] Keep track of hyper‑parameters used and results obtained
  - [ ] Output metrics: training and test error, accuracy (if applicable), R‑squared
  - [ ] Standardize data before model creation (e.g., with `StandardScaler`) - highly recommended
- [ ] Model 2: Ordinary Least Squares using statsmodels (OLS)
  - [ ] Output the model summary
  - [ ] Interpret diagnostics: coef, standard error, t‑value, p‑value, R‑squared, R‑squared adjusted, F‑statistic, etc.

#### 2.3 Result Analysis
- [ ] Create a report with results and your interpretation for each model
- [ ] Prefer tabular results and visual plots; include your own analysis and interpretation of the results
- [ ] Do not copy definitions or long explanations from external sources; write your own analysis
- [ ] Do not include code in the report; submit code separately

### 3) Requirements (Cannot Be Changed)
- [ ] Team of at most two; include names and NetIDs on the cover page; one final submission per team
- [ ] Treat as a data science project; interpret diagnostics; include as many plots as you can
- [ ] No copying publicly available solutions (plagiarism penalty)
- [ ] Submit Python code file and report file; do not hard code local paths; read data from a public link
- [ ] Python code can be on Google Colab or Jupyter Notebook
- [ ] Tune as many hyper‑parameters as possible and keep a log of experiments and results
- [ ] State any assumptions completely
- [ ] Include instructions on how to compile and run your code in this README
