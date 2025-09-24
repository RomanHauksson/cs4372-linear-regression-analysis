= Linear Regression Analysis

= CS4372

Roman Hauksson-Neill

Ivan Masyuk

== Introduction

We chose to analyze a dataset called "Combined Cycle Power Plant", which contains readings of temperature, pressure, relative humidity, and exhaust vacuum of a power plant, which can be used to predict its net hourly electrical energy output.

== Pre-Processing

=== Normality Analysis

Running the Shapiro-Wilk test on the features, we found that all features are non-normal.

#table(
  columns: 3,
  table.header([Feature], [p-value], [Normality]),
  [ambient_temp], [2.10e-30], [Non-normal],
  [vacuum], [6.40e-48], [Non-normal],
  [ambient_pressure], [5.96e-12], [Non-normal],
  [relative_humidity], [1.47e-28], [Non-normal],
  [power_output], [6.50e-36], [Non-normal],
)

#figure(
  image("src/images/feature-distributions.png", width: 80%),
  caption: [
    Feature distributions.
  ],
)

Each of the features has a totally different unit and scale. We standardized them so that they all have a mean of 0 and a standard deviation of 1.

#figure(
  image("src/images/feature-distributions-standardized.png", width: 80%),
  caption: [
    Feature distributions after standardization.
  ],
)

=== Correlation Analysis

Correlation analysis showed that the target variable (power output) is strongly correlated with the ambient temperature and vacuum features, and the ambient temperature and vacuum features are strongly correlated with each other.

#table(
  columns: 3,
  table.header([*Feature*], [*Correlation*], [*Direction*]),
  [ambient_temp], [-0.948], [Negative],
  [vacuum], [-0.870], [Negative],
  [ambient_pressure], [+0.519], [Positive],
  [relative_humidity], [+0.391], [Positive],
)

#figure(
  image("src/images/correlation-matrix.png", width: 80%),
  caption: [
    Correlation matrix.
  ],
)

=== Feature Selection

We tested every possible combination of features to use in an OLS model and found that including every feature in our model achieved the best test $R^2$ value of 0.9284. However, its maximium variance inflation factor was 5.89, which is above the threshold of 5, indicating that it's an untrustworthy combination of features.

Using only two features – ambient temperature and relative humidity – achieves an $R^2$ of 0.9204 and a maximum variance inflation factor of 1.41.

#table(
  columns: 7,
  table.header(
    [*Number of Features*],
    [*Features*],
    [*$R^2$*],
    [*VIF*],
    [*Condition Number*],
    [*Trustworthy?*],
    [*All features significant?*],
  ),
  [4], [ambient_temp, vacuum, ambient_pressure, relative_humidity], [0.9284], [5.89], [4.8], [False], [True],
  [3], [ambient_temp, vacuum, relative_humidity], [0.9281], [4.88], [4.3], [True], [True],
  [3], [ambient_temp, ambient_pressure, relative_humidity], [0.9205], [2.01], [2.4], [True], [True],
  [2], [ambient_temp, relative_humidity], [0.9204], [1.41], [1.8], [True], [True],
  [3], [ambient_temp, vacuum, ambient_pressure], [0.9177], [3.81], [3.8], [True], [True],
  [2], [ambient_temp, vacuum], [0.9154], [3.41], [3.4], [True], [True],
  [2], [ambient_temp, ambient_pressure], [0.9001], [1.35], [1.7], [True], [True],
  [1], [ambient_temp], [0.8981], [1.00], [1.0], [True], [True],
  [3], [vacuum, ambient_pressure, relative_humidity], [0.8021], [1.32], [1.7], [True], [True],
  [2], [vacuum, ambient_pressure], [0.7841], [1.21], [1.6], [True], [True],
  [2], [vacuum, relative_humidity], [0.7692], [1.10], [1.4], [True], [True],
  [1], [vacuum], [0.7530], [1.00], [1.0], [True], [True],
  [2], [ambient_pressure, relative_humidity], [0.3848], [1.01], [1.1], [True], [True],
  [1], [ambient_pressure], [0.2698], [1.00], [1.0], [True], [True],
  [1], [relative_humidity], [0.1493], [1.00], [1.0], [True], [True],
)

== Stochastic Gradient Descent (SGD)

=== Hyperparameter Search

We ran grid search to find the hyperparameters for our SGD model. It tracks the R^2, root mean squared error, and mean absolute error of each combination, but only picks the best combination based on R^2. It also uses early stopping.

We used repeated random sub-sampling validation to evaluate the performance of each combination, using 15 folds and a test size of 20%.

#table(
  columns: 2,
  table.header([*Hyperparameter*], [*Options*]),
  [Learning Rate], [constant, optimal, adaptive],
  [Penalty], [l2, l1, elasticnet],
  [Alpha], [0.0008, 0.001, 0.002, 0.005, 0.008, 0.01, 0.015, 0.02],
  [eta0], [0.0002, 0.0004, 0.0005, 0.001, 0.005, 0.01],
)

#figure(
  image("src/images/sgd-hyperparameters-performance.png", width: 80%),
  caption: [
    SGD hyperparameter analysis.
  ],
)

#figure(
  image("src/images/sgd-hyperparameters-interactions.png", width: 80%),
  caption: [
    SGD hyperparameter interactions.
  ],
)

The best combination of hyperparameters achieved a cross-validation $R^2$ of 0.9279.

#figure(
  table(
    columns: 2,
    table.header([*Hyperparameter*], [*Value*]),
    [Learning Rate], [adaptive],
    [Penalty], [l1],
    [Alpha], [0.0008],
    [eta0], [0.005],
  ),
  caption: [
    SGD hyperparameter values for the best combination.
  ],
)

== Ordinary Least Squares (OLS)

> For the OLS library of statsmodels, you will need to output the model summary and
interpret and explain all of the output diagnostics, such as coef, standard error, t-value,
p-value, R-squared, R-squared adjusted, F-statistic, etc

==

== Assumption Testing

We executed a variety of tests to see whether the theoretical assumptions behind using an OLS model hold for this dataset.

*Linearity*: running the RESET test on our model showed that a linear model is not adequate to predict the target variable, and adding non-linear terms significantly improves the model (F-statistic = 417.7905, p-value $approx$ 0.0000).

*Multicollinearity*: The following table shows the variance inflation factors (VIF) for each feature.

#table(
  columns: 3,
  table.header([*Feature*], [*VIF*], [*Interpretation*]),
  [Ambient Temperature], [5.89], [Problematic],
  [Vacuum], [3.87], [Acceptable],
  [ambient_pressure], [1.46], [Excellent],
  [relative_humidity], [1.71], [Excellent],
)

The condition number is 4.83, which demonstrates strong numerical stability.

*Residual normality*: running the Jarque-Bera Test showed that the residuals are not normally distributed.

*Heteroscedasticity*: Running the Breusch-Pagan Test resulted in an LM statistic of 30.5727 and a p-value of 0.0000. This means that the heteroscedasticity assumption (that error vaiance is not dependent on the fitted values) is violated.

*Autocorrelation*: Running the Durbin-Watson Test resulted in a DW statistic of 2.0112, which means that there is no significant autocorrelation in the residuals.

== Reconciling Assumption Violations

== Model Comparison

#image(
  image("src/images/comprehensive_ols_diagnostics.png", width: 80%),
  caption: [
    Comprehensive OLS diagnostics.
  ],
)

#image(
  image("src/images/ols-model-comparison.png", width: 80%),
  caption: [
    OLS model comparison.
  ],
)

= Conclusion
