### A Pluto.jl notebook ###
# v0.18.1

using Markdown
using InteractiveUtils

# ╔═╡ 1bd1a334-74c4-11ec-019b-03f01646310a
begin
	using PlutoUI
	using LinearAlgebra
	using Statistics
	using StatsBase
	using DataFrames
	
	md"# Introduction to Data Mining Notes"
end

# ╔═╡ ffd7f045-616b-4417-a892-9a752fd720b5
PlutoUI.TableOfContents()

# ╔═╡ 5307b475-f2ee-440b-a850-483c631c335f
md"# Introduction"

# ╔═╡ 6d0862cf-7c7d-4ea4-b472-64d888438c55
md"## What is Data Mining?"

# ╔═╡ 91ac53cc-6164-4849-8da5-b8a6a2684873
md"""
**Definition.**
**Data mining** is the process of automatically discovering useful information in larger data repositories, e.g., finding useful patterns and predicting outcomes of future observations.
"""

# ╔═╡ dd80a407-9f8d-415e-9f5b-3776b7eb77ee
md"""
**Definition.**
The overall process of converting raw data into useful information is known as **knowledge discovery in databases (KDD)**.
This process consists of the following steps:

1. Data preprocessing
   - Data integration
   - Feature selection
   - Dimensionality reduction
   - Normalization
   - Data Subsetting

2. Data mining
   - Pattern discovery
   - Classification
   - Clustering
   - Outlier analysis

3. Postprocessing
   - Filtering patterns
   - Visualization
   - Pattern interpretation
"""

# ╔═╡ 7e10875c-abeb-435d-aa83-1b7ab7805347
md"""
**Definition.**
The purpose of **preprocessing** is to transform the raw input data into an appropriate format for subsequent analysis.
"""

# ╔═╡ 09de7bbc-413e-4c6a-bb92-d8d6b911f336
md"""
**Definition.**
The purpose of **postprocessing** is to integrate valid and useful data mining results into decision support systems.
Hypothesis testing methods can also be applied during postprocessing to eliminate spurious data mining results.
"""

# ╔═╡ 272cfc19-9bd6-4f68-9836-5d555e0e3ad6
md"## Motivating Challenges"

# ╔═╡ a8651483-25e7-4830-b044-53938c526af1
md"""
**Example.**
The development of data mining is motivated by some challenges with traditional data analysis techniques such as:

- Scalability

- High dimensionality

- Heterogeneous and complex data

- Data ownership and distribution

- Non-traditional analysis
"""

# ╔═╡ 383d2e95-d8c5-48ec-b4bf-85ee9f721a65
md"## The Origins of Data Mining"

# ╔═╡ 7bf3c2bc-0a85-40ab-8210-7dfd82d4ce21
md"""
**Example.**
Data mining researchers draw upon ideas, such as

1. From statistics: sampling, estimation, and hypothesis testing

2. From AI, pattern recognition, and machine learning: search algorithms, modeling techniques, and learning theories
"""

# ╔═╡ dc6a7cc1-559a-47f0-8aee-8a8e5e43d44d
md"## Data Mining Tasks"

# ╔═╡ b455725f-022c-45c8-b16a-e40f3fb1895b
md"""
**Definition.**
The objective of **predictive tasks** is to predict the value of a particular attribute based on the values of other attributes.
The attribute to be predicted is commonly known as the **target** or **dependent variable**, while the attributes used for making the prediction are known as the **explanatory** or **independent variables**.
"""

# ╔═╡ 90b27d47-ba3f-4478-920b-ffc9f3c437b4
md"""
**Definition.**
The objective of **descriptive tasks** is to derive patterns (correlations, trends, clusters, trajectories, and anomalies) that summarize the underlying relationships in data.
Descriptive data mining tasks are often exploratory in nature and frequently require postprocessing techniques to validate and explain the results.
"""

# ╔═╡ efd4bb5b-f3d7-4af1-9627-5b5de45289aa
md"""
**Definition.**
**Predictive modeling** refers to the task of building a model for the target variable as a function of the explanatory variables.
There are two types of predictive modeling tasks: **classification**, which is used for discrete target variables, and **regression**, which is used for continuous target variables.
"""

# ╔═╡ f8fb71a3-c056-4737-a00f-1df954a89e82
md"""
**Example.**
Predicting whether a web user will make a purchase at an online bookstore is a **classification task** because the target variable is binary-valued.
"""

# ╔═╡ 8b241be2-66f6-47e2-96c3-ab0b336cd4d3
md"""
**Example.**
Forecasting the future price of a stock is a **regression task** because price is a continuous-valued attribute.
"""

# ╔═╡ a5e57c8f-fcdb-4225-9e23-75879476c3c6
md"# Data"

# ╔═╡ 76fe3006-ab84-4ce1-9f41-5f40d00a0643
md"## Types of Data"

# ╔═╡ 97cd03fa-58b8-440f-b046-9c8331bf74d5
md"### Attributes and Measurement"

# ╔═╡ 1e0f83f1-81de-4bac-a283-b0f0f7d4d797
md"### Types of Data Sets"

# ╔═╡ e498438f-0df7-43cb-b7ff-dcf3ddf4923d
md"""
**Remark.**
There are three characteristics that apply to many data set and have a significant impact on the data mining techniques that are used: dimensionality, distribution, and resolution.
"""

# ╔═╡ 5bfe4224-18cf-41b3-a8de-d138d74623c0
md"""
**Definition.**
The **dimensionality** of a data set is the number of attributes that the objects in the data set possess.
"""

# ╔═╡ 8b1501d2-094f-4fc9-afb9-cde7c7125057
md"""
**Definition.**
The **distribution** of a data set is the frequency of occurrence of various values or sets of values for the attributes comprising data objects.
"""

# ╔═╡ ceb6917e-e5d2-4e7a-9824-0393f89390dd
md"""
**Definition.**
The **skewness** of a distribution refers to the distortion of the distribution.
"""

# ╔═╡ 5182618e-4c81-4373-9d97-00063f89afe9
md"""
**Definition.**
A special case of skewed data is **sparsity**---most attributes of an object have values of zero.
"""

# ╔═╡ 3e60c9ef-ece1-4e46-95a2-b811faa0336f
md"""
**Definition.**
The **resolution** of a data set is the preciseness of the data.
"""

# ╔═╡ a3a0c1ea-be07-4007-a44b-fddfccd209fc
md"""
**Remark.**
There are several different types of data:

- Record Data

- Transaction or Market Basket Data

- The Data Matrix

- The Sparse Data Matrix

- Graph-Based Data

- Data with Objects That Are Graphs

- Ordered Data

- Sequential Transaction Data

- Time Series Data

- Sequence Data

- Spatial and Spatio-Temporal Data

- Handling Non-Record Data
"""

# ╔═╡ 6d5a3e33-b361-4b9a-b6a8-b0b461e10b1e
md"## Data Quality"

# ╔═╡ 737dbd11-7131-4595-a381-fbfbb7e72fbf
md"### Measurement and Data Collection Issues"

# ╔═╡ 2d2f609c-d446-4553-ae15-ef43970df51e
md"""
**Remark.**
There are several issues that may arise in data collection:

- Measurement and Data Collection Errors

- Noise and Artifacts

- Precision, Bias, and Accuracy

- Outliers

- Missing Values

- Eliminate Data Objects or Attributes

- Estimate Missing Values

- Ignore the Missing Value during Analysis

- Inconsistent Values

- Duplicate Data
"""

# ╔═╡ 9522b6f7-6c59-4717-b5c5-428035ad8e32
md"### Issues Related to Applications"

# ╔═╡ 5ba9665c-74eb-4095-a1b8-49952c868889
md"""
**Remark.**
There are several issues for applications impacted by data quality:

- Timeliness

- Relevance

- Knowledge about the Data
"""

# ╔═╡ ee2cc3ca-149f-4b65-abb5-14cc79d6f24e
md"## Data Preprocessing"

# ╔═╡ 059ef5d7-c1ec-47fb-9fd0-ff149a92a353
md"""
**Remark.**
Relevant topics in data preprocessing include:

- Aggregation

- Sampling

- Dimensionality reduction

- Feature subset selection

- Feature creation

- Discretization and binarization

- Variable transformation
"""

# ╔═╡ ac1382bd-95fc-496c-880f-2447c8d6b1c9
md"### Aggregation"

# ╔═╡ b70d8a12-bc7f-4c03-95ab-69020e138e88
md"### Sampling"

# ╔═╡ 1201c05e-ffc6-4e04-8838-ce95d5b9fee0
md"#### Sampling Approaches"

# ╔═╡ 2e6e4dce-004a-4f68-b47f-43841832d65c
md"""
**Definition.**
In **simple random sampling**, there is an equal probability of selecting any particular object.
"""

# ╔═╡ b2c305f0-2b21-4a41-b896-b63b42039bfb
md"""
**Definition.**
**Stratified sampling** involves partitioning the data and then drawing random samples from each partition.
"""

# ╔═╡ 713492c1-133e-4004-bef2-6a1add948f38
md"""
**Definition.**
Sometimes **adaptive** or **progressive sampling** schemes are used to determine the proper sample size.
These approaches start with a small sample, and then increase the sample size until a sample of sufficient size has been obtained.
"""

# ╔═╡ f0dd4fa1-aa6f-4fc3-8fae-0c21bdda1d6b
md"### Dimensionality Reduction"

# ╔═╡ 14755b9e-bf99-45ce-ada9-43273a19560d
md"#### The Curse of Dimensionality"

# ╔═╡ 6fac7d86-159f-4ab4-9fbd-73f1410d8a99
md"""
**Definition.**
The **curse of dimensionality** refers to the phenomenon that many types of data analysis become significantly harder as the dimensionality of the data increases.
Specifically, as dimensionality increases, the data becomes increasingly sparse in the space that it occupies.
Thus, the data objects we observe are quite possibly not a representative sample of possible objects.
"""

# ╔═╡ 5e083af3-cf89-4ef4-927c-c2d29788caa4
md"""
**Example.**
For classification, this can mean that there are not enough data objects to allow the creation of a model that reliably assigns a class to all possible objects.
"""

# ╔═╡ 8bb9f222-f7a7-4494-adbc-a015f78badc6
md"""
**Example.**
For clustering, the differences in density and in the distances between points, which are critical for clustering, become less meaningful.
"""

# ╔═╡ ee8e364c-81db-4e77-9b11-011f4ddfb971
md"#### Linear Algebra Techniques for Dimensionality Reduction"

# ╔═╡ 1484ce5e-e734-402b-8a8d-ef51e655f4be
md"### Feature Subset Selection"

# ╔═╡ 4bcd1e0d-b485-4bf3-895d-92380de58df4
md"""
**Remark.**
Another way to reduce the dimensionality is to use only a subset of the features.
While it might seem that such an approach would lose information, this is not the case if redundant and irrelevant features are present.
**Redundant features** duplicate much or all of the information contained in one or more other attributes.
For example, the purchase price of a product and the amount of sales tax paid contain much of the same information.
**Irrelevant features** contain almost no useful information for the data mining task at hand.
For instance, students' ID numbers are irrelevant to the task of predicting students' grade point averages.
Redundant and irrelevant features can reduce classification accuracy and the quality of the clusters that are found.
"""

# ╔═╡ 0dab3775-afeb-4283-b80a-69269d382cbf
md"""
**Remark.**
While some irrelevant and redundant attributes can be eliminated immediately by using common sense or domain knowledge, selecting the best subset of features frequently requires a systematic approach.
The ideal approach to feature selection is to try all possible subsets of features that produces the best results.
This method has the advantage of reflecting the objective and bias of the data mining algorithm that will eventually be used.
Unfortunately, since the number of subsets involving ``n`` attributes is ``2^n``, such an approach is impractical in most situations and alternative strategies are needed.
There are three standard approaches to feature selection: embedded, filter, and wrapper.

**Embedded approaches** Feature selection occurs naturally as part of the data mining algorithm.
Specifically, during the operation of the data mining algorithm, the algorithm itself decides which attributes to use and which to ignore.
Algorithms for building decision tree classifiers, which are discussed in Chapter 3, often operate in this manner.

**Filter approaches** Features are selected before the data mining algorithm is run, using some approach that is independent of the data mining task.
For example, we might select sets of attributes whose pairwise correlation is as low as possible so that the attributes are non-redundant.

**Wrapper approaches** These methods use the target data mining algorithm as a black box to find the best subset of attributes, in a way similar to that of the ideal algorithm described above, but typically without enumerating all possible subsets.
"""

# ╔═╡ 16b7e31e-a933-4213-88ae-e297906f6553
md"""
**Remark.**
Because the embedded approaches are algorithm-specific, only the filter and wrapper approaches will be discussed further here.
"""

# ╔═╡ 3894056b-8391-4dc8-8463-1b82da487838
md"#### An Architecture for Feature Subset Selection"

# ╔═╡ e0886ceb-a58f-4060-9aa5-dd7929376fa4
md"""
**Remark.**
It is possible to encompass both the filter and wrapper approaches within a common architecture.
The feature selection process is viewed as consisting of four parts:

- a measure for evaluating a subset

- a search strategy that controls the generation of a new subset of features

- a stopping criterion

- a validation procedure

Filter methods and wrapper methods differ only in the way in which they evaluate a subset of features.
For a wrapper method, subset evaluation uses the target data mining algorithm, while for a filter approach, the evaluation technique is distinct from the target data mining algorithm.
The following discussion provides some details of this approach, which is summarized in Figure 2.11.
"""

# ╔═╡ d55800e3-7b43-4694-bc6e-35f86f437cec
md"### Feature Creation"

# ╔═╡ 4f9276b7-fcd3-4287-acd9-fbb53234e333
md"### Discretization and Binarization"

# ╔═╡ e980eeb0-e8e8-4226-8435-73817b1a9480
md"### Variable Transformation"

# ╔═╡ 95bcf7b7-728e-4110-9324-8c95a50ec8be
md"## Measures of Similarity and Dissimilarity"

# ╔═╡ 0bb2ea83-bd17-494b-83ca-7534ceec1cb0
md"### Basics"

# ╔═╡ a72835f6-f870-4441-a058-b803e49a9fb7
md"""
**Definition.**
The **similarity** between two objects is a numerical measure of the degree to which the two objects are alike.
"""

# ╔═╡ 0a0a9f60-1234-4d02-9301-905a4cac5f54
md"""
**Definition.**
The **dissimilarity** between two objects is a numerical measure of the degree to which the two objects are different.
"""

# ╔═╡ 05754b5c-1db8-4419-ab13-71e865cf0eef
md"### Similarity and Dissimilarity between Simple Attributes"

# ╔═╡ 32e759d1-9199-4e4a-81bd-1f6d6192c50c
md"### Dissimilarities between Data Objects"

# ╔═╡ d5253a0c-a8b6-42eb-88a4-7cc026ff0576
md"""
**Definition.**
The **Euclidean distance**, ``d``, between two points, ``𝐱`` and ``𝐲``, in one-, two-, three-, or higher-dimensional space, is given by the following formula

$d(𝐱, 𝐲) = \sqrt{\sum_{k = 1}^n (x_k - y_k)^2} \tag{2.1}$

where ``n`` is the number of dimensions and ``x_k`` and ``y_k`` are, respectively, the ``k^{\text{th}}`` attributes (components) of ``𝐱`` and ``𝐲``.
"""

# ╔═╡ 4d7b62a9-a4ca-4d37-8f4f-0be61f68710a
md"""
**Definition.**
The Euclidean distance measure is generalized by the **Minkowski distance** metric given by

$d(𝐱, 𝐲) = \left(\sum_{k = 1}^n |x_k - y_k|^r\right)^{1/r} \tag{2.2}$

where ``r`` is a parameter.
"""

# ╔═╡ a2fd41f4-88e7-489c-952c-d535a5c2fa35
md"""
**Example.**
The following are the three most common examples of Minkowski distances.

- ``r = 1``.
  City block (Manhattan, taxicab, ``L_1`` norm) distance.
  A common example is the **Hamming distance**, which is the number of bits that is different between two objects that have only binary attributes, i.e., between two binary vectors.

- ``r = 2``.
  Euclidean distance (``L_2`` norm).

- ``r = ∞``.
  Supremum (``L_{\text{max}}`` or ``L_{∞}`` norm) distance.
  This is the maximum difference between any attribute of the objects.
  More formally, the ``L_{∞}`` distance is defined by

  $d(𝐱, 𝐲) = \lim_{r → ∞} \left(\sum_{k = 1}^n |x_k - y_k|^r\right)^{1/r}$
"""

# ╔═╡ 9a2fd7fc-6a20-4025-8404-d7eb3c8b2585
md"""
**Definition.**
If ``d(𝐱, 𝐲)`` is the distance between two points, ``𝐱`` and ``𝐲``, then the following properties hold.

1. **Positivity**

    - ``d(𝐱, 𝐲) ≥ 0`` for all ``𝐱`` and ``𝐲``.

    - ``d(𝐱, 𝐲) = 0`` only if ``𝐱 = 𝐲``.

2. **Symmetry**

    - ``d(𝐱, 𝐲) = d(𝐲, 𝐱)`` for all ``𝐱`` and ``𝐲``.

3. **Triangle Inequality**

    - ``d(𝐱, 𝐳) ≤ d(𝐱, 𝐲) + d(𝐲, 𝐳)`` for all points ``𝐱``, ``𝐲``, and ``𝐳``.

Measures that satisfy all three properties are known as **metrics**.
"""

# ╔═╡ 41a2ea67-2a51-48c5-aaa8-a4a2d8877973
md"### Similarities between Data Objects"

# ╔═╡ 7cc65cc6-fc8d-4e09-a60a-c39943aced5d
md"""
**Remark.**
If ``s(𝐱, 𝐲)`` is the similarity between points ``𝐱`` and ``𝐲``, then the typical properties of similarities are the following:

1. ``s(𝐱, 𝐲) = 1`` only if ``𝐱 = 𝐲`` ``(0 ≤ s ≤ 1)``

2. ``s(𝐱, 𝐲) = s(𝐲, 𝐱)`` for all ``𝐱`` and ``𝐲``. (Symmetry)
"""

# ╔═╡ 48645e2d-5810-49e5-858d-45d23b192915
md"### Examples of Proximity Measures"

# ╔═╡ e2fd0a03-494b-4874-b572-e2afdf50b56f
md"#### Similarity Measures for Binary Data"

# ╔═╡ 42c36f8a-fbbd-4e6e-940e-20ac40199610
md"""
**Definition.**
Similarity measures between objects that contain only binary attributes are called **similarity coefficients**, and typically have values between 0 and 1.
A value of 1 indicates that the two objects are completely similar, while a value of 0 indicates that the objects are not at all similar.
"""

# ╔═╡ 75268401-0ce8-4fe1-8018-25c88bdd9ea1
md"""
**Definition.**
Let ``𝐱`` and ``𝐲`` be two objects that consist of ``n`` binary attributes.
The comparison of two such objects, i.e., two binary vectors, leads to the following four quantities (frequencies):

- ``f_{00} =`` the number of attributes where ``𝐱`` is ``0`` and ``𝐲`` is ``0``.

- ``f_{01} =`` the number of attributes where ``𝐱`` is ``0`` and ``𝐲`` is ``1``.

- ``f_{10} =`` the number of attributes where ``𝐱`` is ``1`` and ``𝐲`` is ``0``.

- ``f_{11} =`` the number of attributes where ``𝐱`` is ``1`` and ``𝐲`` is ``1``.
"""

# ╔═╡ 0b87306b-0dfb-4132-8c81-f41232d65406
md"#### Simple Matching Coefficient"

# ╔═╡ eb78615f-ad93-4d9b-934b-d3cce13b8c03
md"""
**Definition.**
One commonly used similarity coefficient is the **simple matching coefficient** (SMC), which is defined as

$SMC = \frac{\text{number of matching attribute values}}{\text{number of attributes}} = \frac{f_{11} + f_{00}}{f_{01} + f_{10} + f_{11} + f_{00}}$

This measure counts both presences and absences equally.
Consequently, the SMC could be used to find students who had answered questions similarly on a test that consisted only of true/false questions.
"""

# ╔═╡ 58ab24d7-6392-4b23-a8ae-109f7a258bfa
md"#### Jaccard Coefficient"

# ╔═╡ 8fcffe9b-f3a1-41ee-a0f4-705e17a7ec48
md"""
**Remark.**
Suppose ``𝐱`` and ``𝐲`` are data objects that represent two rows (two transaction) of a transaction matrix.
If each asymmetric binary attribute corresponds to an item in a store, then ``1`` indicates that the item was purchased, while a ``0`` indicates that the product was not purchased.
Because the number of products not purchased by any customer far outnumbers the number of products that were purchased, a similarity measure such as ``SMC`` would say that all transactions are very similar.
As a result, the Jaccard coefficient is frequently used to handle objects consisting of asymmetric binary attributes.
"""

# ╔═╡ 2add3ff5-e1ad-4314-b600-a9875f7fa0b6
md"""
**Definition.**
The **Jaccard coefficient**, which is often symbolized by ``J``, is given by the following equation:

$J = \frac{\text{number of matching presences}}{\text{number of attributes not involved in 00 matches}} = \frac{f_{11}}{f_{01} + f_{10} + f_{11}} \tag{2.5}$
"""

# ╔═╡ 95d13ce3-1a9f-4e2b-8731-cfd0a38db5a2
md"""
**Example 2.16** (The SMC and Jaccard Similarity Coefficients).
To illustrate the difference between these two similarity measures, we calculate ``SMC`` and ``J`` for the following two binary vectors.
"""

# ╔═╡ d30ece9d-fc94-4e75-8fc0-52fcc1e2ac93
let
	x = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0] .== 1
	y = [0, 0, 0, 0, 0, 0, 1, 0, 0, 1] .== 1

	f01 = sum([!x && y for (x, y) in zip(x, y)])
	f10 = sum([x && !y for (x, y) in zip(x, y)])
	f00 = sum([!x && !y for (x, y) in zip(x, y)])
	f11 = sum([x && y for (x, y) in zip(x, y)])

	SMC = (f11 + f00) / (f01 + f10 + f11 + f00)

	J = f11 / (f01 + f10 + f11)

	Hamming = sum(x .!= y)

	:SMC => SMC, :J => J, :Hamming => Hamming
end

# ╔═╡ d875be4c-40ed-4c37-837d-906cca62c2cb
md"### Cosine Similarity"

# ╔═╡ 33a686b8-8907-486e-8696-5768a5f84dd8
md"""
**Remark.**
Documents are often represented as vecetors, where each component (attribute) represents the frequency with which a particular term (word) occurs in the document.
Even though documents have thousands or tens of thousands of attributes (terms), each document is sparse since it has relatively few nonzero attributes.
Thus, as with transaction data, similarity should not depend on the number of shared ``0`` values because any two documents are likely to "not contain" many of the same words, and therefore, if ``0``--``0`` matches are counted, most documents will be highly similar to most other documents.
Therefore, a similarity measure for documents needs to ignore ``0``--``0`` matches like the Jaccard measure, but also must be able to handle non-binary vectors.
The **cosine similarity**, defined next, is one of the most common measures of document similarity.
"""

# ╔═╡ 818cbf7f-c703-4ef0-b03c-55c203a5e088
md"""
**Definition.**
If ``𝐱`` and ``𝐲`` are two document vectors, then

$\cos(𝐱, 𝐲) = \frac{\langle 𝐱, 𝐲 \rangle}{\|𝐱\| \|𝐲\|} = \frac{𝐱' 𝐲}{\|𝐱\| \|𝐲\|} \tag{2.6}$

where ``'`` indicates vector or matrix transpose and ``\langle 𝐱, 𝐲 \rangle`` indicates the inner product of two vectors,

$\langle 𝐱, 𝐲 \rangle = \sum_{k = 1}^n x_k y_k = 𝐱' 𝐲 \tag{2.7}$

and ``\|𝐱\|`` is the length of vector ``𝐱``, ``\|𝐱\| = \sqrt{\sum_{k=1}^n {x_k}^2} = \sqrt{\langle 𝐱, 𝐱 \rangle} = \sqrt{𝐱'𝐱}``.
"""

# ╔═╡ fe736fe9-993c-4d7d-93f6-2fd4b4399dc7
md"""
**Remark.**
The inner product of two vectors works well for asymmetric attributes since it depends only on components that are non-zero in both vectors.
Hence, the similarity between two documents depends only upon the words that appear in both of them.
"""

# ╔═╡ 67003971-790e-4a2b-bcb4-1ae5b573d8ba
md"""
**Example 2.17** (Cosine Similarity between Two Document Vectors).
This example calculates the cosine similarity for the following two data objects, which might represent document vectors:

$\begin{align*}
𝐱 &= (3, 2, 0, 5, 0, 0, 0, 2, 0, 0) \\
𝐲 &= (1, 0, 0, 0, 0, 0, 0, 1, 0, 2)
\end{align*}$

$\cos{(𝐱, 𝐲)} = \frac{\langle 𝐱, 𝐲 \rangle}{\|𝐱\| \|𝐲\|} = 0.31$
"""

# ╔═╡ c6fac3ee-f1d3-4950-b49d-5104e21e7a40
let
	x = [3, 2, 0, 5, 0, 0, 0, 2, 0, 0]
	y = [1, 0, 0, 0, 0, 0, 0, 1, 0, 2]

	dot(x, y) / (norm(x) * norm(y))
end

# ╔═╡ d13973b9-6a3f-4414-9b9d-65d741550a01
md"#### Extended Jaccard Coefficient (Tanimoto Coefficient)"

# ╔═╡ 06a6943e-7ef7-4303-b0d0-53e3893fcf7a
md"""
**Definition.**
The extended Jaccard coefficient can be used for document data and that reduces to the Jaccard coefficient in the case of binary attributes.
This coefficient, which we shall represent as ``EJ``, is defined by the following equation:

$EJ(𝐱, 𝐲) = \frac{\langle 𝐱, 𝐲 \rangle}{\|𝐱\|^2 + \|𝐲\|^2 - \langle 𝐱, 𝐲 \rangle} = \frac{𝐱' 𝐲}{\|𝐱\|^2 + \|𝐲\|^2 - 𝐱'𝐲} \tag{2.9}$
"""

# ╔═╡ 2e16651e-6eb5-4420-ae7a-f327511cec6f
md"#### Correlation"

# ╔═╡ 4da159dc-1bf0-463c-a345-c6ec19e7fb5c
md"""
**Remark.**
Correlation is frequently used to measure the linear relationship between two sets of values that are observed together.
Thus, correlation can measure the relationship between two variables (height and weight) or between two objects (a pair of temperature time series).
Correlation is used much more frequently to measure the similarity between attributes since the values in two data objects come from different attributes, which can have very different attribute types and scales.
There are many types of correlation, and indeed correlation is sometimes used in a general sense to mean the relationship between sets of values that are observed together.
In this discussion, we will focus on a measure appropriate for numerical values.
"""

# ╔═╡ c692911c-9d37-43ef-accf-0ce41f84eaf4
md"""
**Definition.**
**Pearson's correlation** bteeween two sets of numerical values, i.e., two vectors, ``𝐱`` and ``𝐲``, is defined by the following equation:

$\text{corr}(𝐱, 𝐲) = \frac{\text{covariance}(𝐱, 𝐲)}{\text{standard\_deviation}(𝐱) × \text{standard\_deviation}(𝐲)} = \frac{s_{xy}}{s_x s_y}$

where we use the following standard statistical notation and definitions:

$\text{covariance}(𝐱, 𝐲) = s_{xy} = \frac{1}{n - 1} \sum_{k = 1}^n (x_k - \bar{x}) (y_k - \bar{y}) \tag{2.11}$

$\text{standard\_deviation}(𝐱) = s_x = \sqrt{\frac{1}{n-1} \sum_{k=1}^n (x_k - \bar{x})^2}$

$\text{standard\_deviation}(𝐲) = s_y = \sqrt{\frac{1}{n-1} \sum_{k=1}^n (y_k - \bar{y})^2}$

$\bar{x} = \frac{1}{n} \sum_{k = 1}^n x_k \text{ is the mean of } 𝐱$

$\bar{y} = \frac{1}{n} \sum_{k = 1}^n y_k \text{ is the mean of } 𝐲$
"""

# ╔═╡ 1284073d-4b85-46a8-98ad-7e8fbfa9ddfe
function covariance(x::Vector, y::Vector)
	if length(x) != length(y)
		return 0
	end
	
	n = length(x)
	x̄ = mean(x)
	ȳ = mean(y)
	return (1 / (n - 1)) * sum([(x[k] - x̄) * (y[k] - ȳ) for k ∈ 1:n])
end;

# ╔═╡ 86b96f85-a687-4618-9db4-8d5692cf1c23
function standard_deviation(x::Vector)
	n = length(x)
	x̄ = mean(x)
	
	return sqrt((1 / (n - 1)) * sum([(x[k] - x̄)^2 for k ∈ 1:n]))
end;

# ╔═╡ 22d6b026-dece-4160-916c-5463d69ea042
function corr(x::Vector, y::Vector)
	return covariance(x, y) / (standard_deviation(x) * standard_deviation(y))
end;

# ╔═╡ c70afbef-82ee-4213-b81d-890784a69843
md"""
**Example 2.18** (Perfect Correlation).
Correlation is always in the range ``-1`` to ``1``.
A correlation of ``1`` ``(-1)`` means that ``𝐱`` and ``𝐲`` have a perfect positive (negative) linear relationship; that is, ``x_k = ay_k + b``, where ``a`` and ``b`` are constants.
The following two vectors ``𝐱`` and ``𝐲`` illustrate cases where the correlation is ``-1`` and ``+1``, respectively.
In the first case, the means of ``𝐱`` and ``𝐲`` were chosen to be ``0``, for simplicity.
"""

# ╔═╡ 6e765a3a-be2f-48eb-8d7c-836138586626
let
	x = [-3, 6, 0, 3, -6]
	y = [1, -2, 0, -1, 2]
	
	corr(x, y)
end

# ╔═╡ 3d290756-bdc8-41c2-b491-5334cbf3bc95
let
	x = [3, 6, 0, 3, 6]
	y = [1, 2, 0, 1, 2]

	corr(x, y)
end

# ╔═╡ f3207bb5-2f99-47cd-bbb7-a5b56c7b0601
md"""
**Example 2.19** (Nonlinear Relationships).
If the correlation is ``0``, then there is no linear relationship between the two sets of values.
However, nonlinear relationships can still exist.
In the following example, ``y_k = {x_k}^2``, but their correlation is ``0``.
"""

# ╔═╡ 7a467da0-5734-46bc-926b-9c0bceea496d
let
	x = [-3, -2, -1, 0, 1, 2, 3]
	y = [ 9,  4,  1, 0, 1, 4, 9]

	corr(x, y)
end

# ╔═╡ ddd1503a-8c07-4cc1-80f8-0f5c8582ccab
md"""
**Example 2.20** (Visualizing Correlation).
It is also easy to judge the correlation between two vectors ``𝐱`` and ``𝐲`` by plotting pairs of corresponding values of ``𝐱`` and ``𝐲`` in a scatter plot.
Figure 2.17 shows a number of these scatter plots when ``𝐱`` and ``𝐲`` consist of a set of 30 pairs of values that are randomly generated (with a normal distribution) so that the correlation of ``𝐱`` and ``𝐲`` ranges from ``-1`` to ``1``.
Each circle in a plot represents one of the 30 pairs of ``𝐱`` and ``𝐲`` values; its ``x`` coordinate is the value of that pair for ``𝐱``, while its ``y`` corrdinate is the value of the same pair for ``𝐲``.
"""

# ╔═╡ b052676a-9094-43d5-9ab6-2a586677d8f8
md"### Mutual Information"

# ╔═╡ 37d46e6e-faf2-447a-a61a-337496f3e09b
md"### Kernel Functions"

# ╔═╡ 0b958283-da16-4497-89ba-e98da19ffc65
md"""
**Remark.**
It is easy to understand how similarity and distance might be useful in an application such as clustering, which tries to group similar objects together.
What is much less obvious is that many other data analysis tasks, including predictive modeling and dimensionality reduction, can be expressed in terms of pairwise "proximities" of data objects.
More specifically, many data analysis problems can be mathematically formulated to take as input, a **kernel matrix**, ``𝐊``, which can be considered a type of proximity matrix.
Thus, an initial preprocessing step is used to convert the input data into a kernel matrix, which is the input to the data analysis algorithm.
"""

# ╔═╡ ab54b3a1-6d20-42fd-9a7f-bfffb8bc89b2
md"""
**Remark.**
More formally, if a data set has ``m`` data objects, then ``𝐊`` is an ``m`` by ``m`` matrix.
If ``𝐱_i`` and ``𝐱_j`` are the ``i^{\text{th}}`` and ``j^{\text{th}}`` data objects, respectively, then ``k_{ij}``, the ``ij^{\text{th}}`` entry of ``𝐊``, is computed by a **kernel function**:

$k_{ij} = \kappa(𝐱_i, 𝐱_j) \tag{2.16}$
"""

# ╔═╡ 4d3b0760-e464-456f-b15f-32c01be42d7c
md"""
**Remark.**
As we will see in the material that follows, the use of a kernel matrix allows both wider applicability of an algorithm to various kinds of data and an ability to model nonlinear relationships with algorithms that are designed only for detecting linear relationships.
"""

# ╔═╡ ae345d3b-d6b3-4d92-8d31-e0df8c25d72f
md"""
**Example 2.23** (Mapping Data to a Higher Dimensional Space).
Consider the relationship between two variables ``x`` and ``y`` given by the following equation, which defines an ellipse in two dimensions (Figure 2.19(a)):

$4x^2 + 9xy + 7y^2 = 10 \tag{2.17}$

We can map our two dimensional data to three dimensions by creating three new variables, ``u``, ``v``, and ``w``, which are defined as follows:

$\begin{align*}
w &= x^2 \\
u &= xy \\
v &= y^2
\end{align*}$

As a result, we can now express Equation 2.17 as a linear one.
This equation describes a plane in three dimensions.
Points on the ellipse will lie on that plane, while points inside and outside the ellipse will lie on opposite sides of the plane.
See Figure 2.19(b).
The viewpoint of this 3D plot is along the surface of the separating plane so that the plane appears as a line.

$4u + 9v + 7w = 10 \tag{2.18}$
"""

# ╔═╡ 6d1169aa-d3fc-4a62-83ce-4bfefb28e722
md"### Bregman Divergence"

# ╔═╡ 3ca7b9ac-096c-46cd-9bf9-35a6dec895a6
md"### Issues in Proximity Calculation"

# ╔═╡ a9de7ec3-ac2c-4161-9739-a941068f686a
md"### Selecting the Right Proximity Measure"

# ╔═╡ 66245e41-a2f6-49d0-b4c6-31fb36abfdb0
md"(Page 119) Most important page of Chapter 2. Read it."

# ╔═╡ fd045fe4-afe3-4929-82b7-47294763f537
md"""
**Remark.**
A few general observations may be helpful.
First, the type of proximity measure should fit the type of data.
For many types of dense, continuous data, metric distance measures such as Euclidean distance are often used.
Proximity between continuous attributes is most often expressed in terms of differences, and distance measures provide a well-defined way of combining these differences into an overall proximity measure.
Although attributes can have different scales and be of differing importance, these issues can often be dealt with as described earlier, such as normalization and weighting of attributes.

For sparse data, which often consists of asymmetric attributes, we typically employ similarity measures that ignore ``0``--``0`` matches.
Conceptually, this reflects the fact that, for a pair of complex objects, similarity depends on the number of characteristics they both share, rather than the number of characteristics they both lack.
The cosine, Jaccard, and extended Jaccard measures are appropriate for such data.

There are other characteristics of data vectors that often need to be considered.
Invariance to scaling (multiplication) and to translation (addition) were previously discussed with respect to Euclidean distance and the cosine and correlation measures.
The practical implications of such considerations are that, for example, cosine is more suitable for sparse document data where only scaling is important, while correlation works better for time series, where both scaling and translation are important.
Euclidean distance or other types of Minkowski distance are most appropriate when two data vectors are to match as closely as possible across all components (features).

In some cases, transformation or normalization of the data is needed to obtain a proper similarity measure.
For instance, time series can have trends or periodic patterns that significantly impact similarity.
Also, a proper computation of similarity often requires that time lags be taken into account.
Finally, two time series may be similar only over specific periods of time.
For example, there is a strong relationship between temperature and the use of natural gas, but only during the heating season.

Practical consideration can also be important.
Sometimes, one or more proximity measures are already in use in a particular field, and thus, others will have answered the question of which proximity measures should be used.
Other times, the software package or clustering algorithm being used can drastically limit the choices.
If efficiency is a concern, then we may want to choose a proximity measure that has a property, such as the triangle inequality, that can be used to reduce the number of proximity calculations.

However, if common practice or practical restrictions do not dictate a choice, then the proper choice of a proximity measure can be a time-consuming task that requires careful consideration of both domain knowledge and the purpose for which the measure is being used.
A number of different similarity measures may need to be evaluated to see which ones produce results that make the most sense.
"""

# ╔═╡ 94b51102-1c14-4b50-a413-0e33be3275b4
md"# Classification: Basic Concepts and Techniques"

# ╔═╡ 012dac22-60bc-4809-87b0-c35951e6e508
md"""
**Remark.**
This chapter introduces the basic concepts of classification and describes some of its key issues such as model overfitting, model selection, and model evaluation.
"""

# ╔═╡ 99613752-af37-4518-8eb8-cb42d97ce832
md"## Basic Concepts"

# ╔═╡ a9cd0474-5f1f-401c-b955-82a233052ae7
md"""
**Definition.**
Figure 3.2 illustrates the general idea behind classification.
The data for a classification task consists of a collection of instances (records).
Each such instance is characterized by the tuple ``(𝐱, y)``, where ``𝐱`` is the **set of attribute values** that describe the instance and ``y`` is the **class label** of the instance.
The attribute set ``𝐱`` can contain attributes of any type, while the class label ``y`` must be categorical.
"""

# ╔═╡ 697b28bc-ecc5-46e1-b39a-92665bd3a5d9
md"""
**Definition.**
A **classification model** is an abstract representation of the relationship between the attribute set and the class label.
We can express it mathematically as a target function ``f`` that takes as input the attribute set ``𝐱`` and produces and output corresponding to the predicted class label.
The model is said to classify an instance ``(𝐱, y)`` correctly if ``f(𝐱) = y``.
"""

# ╔═╡ 1bd4ea44-e30f-4845-bb51-f9e23af0e4cb
md"""
**Remark.**
A classification model can be represented in many ways, e.g., as a tree, a probability table, or simply, a vector of real-valued parameters.
"""

# ╔═╡ 573a55d9-b0ce-41ab-afa9-bed15ef3f42c
md"""
**Definition.**
If the number of classes in a classification problem is greater than two, then the problem is called a **multiclass classification** problem.
"""

# ╔═╡ c460e4a1-9086-4a1e-8287-3e354885f3a4
md"""
**Example 3.1. [Vertebrate Classification]**
Table 3.2 shows a sample data set for classifying vertebrates into mammals, reptiles, birds, fishes, and amphibians.
The attribute set includes characteristics of the vertebrate such as its body temperature, skin cover, and ability to fly.
The data set can also be used for a binary classification task such as mammal classification, by grouping the reptiles, birds, fishes, and amphibians into a single category called non-mammals.
"""

# ╔═╡ 90690836-e59a-4bfc-9559-1a91666a21e1
md"""
**Example 3.2. [Loan Borrower Classification]**
Consider the problem of predicting whether a loan borrower will repay the loan or default on the loan payments.
The data set used to build the classification model is shown in Table 3.3.
The attribute set includes personal information of the borrower such as marital status and annual income, while the class label indicates whether the borrower had defaulted on the loan payments.
"""

# ╔═╡ 004045fc-1455-4c43-aa99-d0de4e8e5734
md"**Table 3.3.** A sample data for the loan borrower classification problem"

# ╔═╡ 44117937-bf97-482f-8ec6-e321b56766c4
table_3_3 = let
	name = ["Nancy", "Jim", "Allen", "Jane", "Steve", "Peter", "Sayani", "Lata", "Mary", "Victor", "Dale"]
	age = [21, 27, 43, 38, 44, 51, 53, 56, 59, 61, 63]
	salary = [37000, 41000, 61000, 55000, 30000, 56000, 70000, 74000, 25000, 68000, 51000]
	donor = [false, false, true, false, false, true, true, true, false, true, true]
	
	df = DataFrame(name=name, age=age, salary=salary, donor=donor)
end

# ╔═╡ f7a3ea5f-f960-4ec3-b544-28f356974025
md"""
**Remark.**
A classification model serves two important roles in data mining.
First, it is used as a **predictive model** to classify previously unlabeled instances.
A good classification model must provide accurate predictions with a fast response time.
Second, it serves as a **descriptive model** to identify the characteristics that distinguish instances from different classes.
This is particularly useful for critical applications, such as medical diagnosis, where it is insufficient to have a model that makes a prediction without justifying how it reaches such a decision.
"""

# ╔═╡ 0adbe285-5b4d-447e-b375-b7351a38de2d
md"## General Framework for Classication"

# ╔═╡ 7536856b-2629-4d5d-bed5-0d888913d38c
md"""
**Definition.**
Classification is the task of assigning labels to unlabeled data instances and a **classifier** is used to perform such a task.
A classifier is typically described in terms of a model as illustrated in the previous section.
The model is created using a given set of instances, known as the **training set**, which contains attribute values as well as class labels for each instance.
The systematic approach for learning a classification model given a training set is known as a **learning algorithm**.
The process of using a learning algorithm to build a classification model from the training data is known as **induction**.
This process is also often described as "learning a model" or "building a model."
This process of applying a classification model on unseen test instasnces to predic their class labels is known as **deduction**.
Thus, the process of classification involves two steps: applying a learning algorithm to training data to learn a model, and then applying the model to assign labels to unlabeled instances.
"""

# ╔═╡ 2558f1be-0558-402a-ad84-1f5876b3b45a
md"""
**Definition.**
In the general framework shown in Figure 3.3, the induction and deduction steps should be performed separately.
In fact, as will be discussed later in Section 3.6, the training and test sets should be independent of each other to ensure that the induced model can accurately predict the class labels of instances it has never encountered before.
Models that deliver such predictive insights are said to have good **generalization performance**.
The performance of a model (classifier) can be evaluated by comparing the predicted labels against the true labels of instances.
This information can be summarized in a table called a **confusion matrix**.
Table 3.4 depicts the confusion matrix for a binary classification problem.
Each entry ``f_{ij}`` denotes the number of instances from class ``i`` predicted to be of class ``j``.
For example, ``f_{01}`` is the number of instances from class 0 incorrectly predicted as class 1.
The number of correct predictions made by the model is ``(f_{11} + f_{00})`` and the number of incorrect predictions is ``(f_{10} + f_{01})``.
"""

# ╔═╡ f8230add-dd0f-49dd-8290-333cdee785d9
md"**Table 3.4.** Confusion matrix for a binary classification problem."

# ╔═╡ 9f97a7f6-661f-467e-856a-0123096aa25d
md"""
|           | Predicted Class = 1  | Predicted Class = 0  |
|-----------|------------|------------|
| Actual Class = 1 | ``f_{11}`` | ``f_{10}`` |
| Actual Class = 0 | ``f_{01}`` | ``f_{00}`` |
"""

# ╔═╡ ad011225-4911-4982-bb59-73c7ef060d5d
md"""
**Definition.**
Although a confusion matrix provides the information needed to determine how well a classification model performs, summarizing this information into a single number makes it more convenient to compare the relative performance of different models.
This can be done using an **evaluation metric** such as **accuracy**, which is computed in the following way:

$\text{Accuracy} = \frac{\text{Number of correct predictions}}{\text{Total number of predictions}} \tag{3.1}$

For binary classification problems, the accuracy of a model is given by

$\text{Accuracy} = \frac{f_{11} + f_{00}}{f_{11} + f_{10} + f_{01} + f_{00}} \tag{3.2}$
"""

# ╔═╡ c504bfc5-69a7-4578-b295-8958f664ab37
md"""
**Definition.**
**Error rate** is another related metric, which is defined as follows for binary classification problems:

$\text{Error rate} = \frac{\text{Number of wrong predictions}}{\text{Total number of predictions}} = \frac{f_{10} + f_{01}}{f_{11} + f_{10} + f_{01} + f_{00}} \tag{3.3}$
"""

# ╔═╡ f4d2118e-74b6-4294-aefb-2a79946e293f
md"""
**Remark.**
The learning algorithms of most classification techniques are designed to learn models that attain the highest accuracy, or equivalently, the lowest error rate when applied to the test set.
"""

# ╔═╡ ae83b04b-f98d-414f-9460-af659647deab
md"## Decision Tree Classifier"

# ╔═╡ fb8b1012-3c72-487d-9dde-ead3982a1b25
md"""
**Example.**
This section introduces a simple classification technique known as the **decision tree** classifier.
To illustrate how a decision tree works, consider the classification problem of distinguishing mammals from non-mammals using the vertebrate data set shown in Table 3.2.
Suppose a new species is discovered by scientists.
How can we tell whether it is a mammal or non-mammal?
One approach is to pose a series of questions about the characteristics of the species.
The first question we may ask is whether the species is cold- or warm-blooded.
If it is cold-blooded, then it is definitely not a mammal.
Otherwise, it is either a bird or a mammal.
In the latter case, we need to ask a follow-up question: Do the females of the species give birth to their young?
Those that do give birth are definitely mammals, while those that do not are likely to be non-mammals (with the exception of egg-laying mammals such as the platypus and spiny anteater).
"""

# ╔═╡ 53ac2e61-b43c-4424-bdfd-a3eca82d3a26
md"""
**Definition.**
The previous example illustrates how we can solve a classification problem by asking a series of carefully crafted questions about the attributes of the test instance.
Each time we receive an answer, we could ask a follow-up question until we can conclusively decide on its class label.
The series of questions and their possible answers can be organized into a hierarchical structure called a decision tree.
Figure 3.4 shows an example of the decision tree for the mammal classification problem.
The tree has three types of nodes:

- A **root node**, with no incoming links and zero or more outgoing links.

- **Internal nodes**, each of which has exactly one incoming link and two or more outgoing links.

- **Leaf** or **terminal** nodes, each of which has exactly one incoming links.

Every leaf node in the decision tree is associated with a class label.
The **non-terminal** nodes, which include the root and internal nodes, contain **attribute test conditions** that are typically defined using a single attribute.
Each possible outcome of the attribute test condition is associated with exactly one child of this node.
"""

# ╔═╡ 518a9059-ad2b-403c-b78c-e7e3740100d4
md"""
**Example.**
The root node of the tree shown in Figure 3.4 uses the attribute `Body Temperature` to define an attribute test condition that has two outcomes, warm and cold, resulting in two child nodes.
"""

# ╔═╡ 83a048f4-beb7-4404-8766-7500c0701132
md"### A Basic Algorithm to Build a Decision Tree"

# ╔═╡ c672bafb-03e7-488b-b993-6a21b5e62aab
md"""
**Remark.**
Many possible decision trees that can be constructed from a particular data set.
While some trees are better than others, finding an optimal one is computationally expensive due to the exponential size of the search space.
Efficient algorithms have been developed to induce a reasonably accurate, albeit suboptimal, decision tree in a reasonable amount of time.
These algorithms usually employ a greedy strategy to grow the decision tree in a top-down fashion by making a series of locally optimal decisions about which attribute to use when partitioning the training data.
One of the earliest method is **Hunt's algorithm**, which is the basis for many current of decision tree classifiers, including ID3, C4.5, and CART.
This subsection presents Hunt's algorithm and decsribes some of the design issues that must be considered when building a decision tree.
"""

# ╔═╡ 0b018667-c541-4a4b-b52d-ee5ef8b4cd0b
md"#### Hunt's Algorithm"

# ╔═╡ f5e99f85-a831-49b2-beff-1841d0bf39b5
md"""
**Remark.**
In Hunt's algorithm, a decision tree is grown in a recursive fashion.
The tree initially contains a single root node that is associated with all the training instances.
If a node is associated with instances from more than one classes, it is expanded using an attribute test condition that is determined using a **splitting criterion**.
A child leaf node is created for each outcome of the attribute test condition and the instances associated with the parent node are distributed to the children based on the test outcomes.
This node expansion step can then be recursively applied to each child node, as long as it has labels of more than one class.
If all the instances associated with a leaf node have identical class labels, then the node is not expanded any further.
Each leaf node is assigned a class label that occurs most frequently in the training instances associated with the node.
"""

# ╔═╡ f30f57fa-cdae-4945-aa05-a43605aef157
md"""
**Example.**
To illustrate how the algorithm works, consider the training set shown in Table 3.3 for the loan borrower classification problem.
Suppose we apply Hunt's algorithm to fit the training data.
The tree initially contains only a single leaf node as shown in Figure 3.6(a).
This node is labeled as `Defaulted = No`, since the majority of the borrowers did not default on their loan payments.
The training error of this tree is 30% as three out of the ten training instances have the class label `Defaulted = Yes`.
The leaf node can therefore be further expanded because it contains training insstances from more than one class.
"""

# ╔═╡ 2630d856-71de-488b-bc70-a59af696d454
md"""
**Example.**
Let `Home Owner` be the attribute chosen to split the training instances.
The justification for choosing this attribute as the attribute test condition will be discussed later.
The resulting binary split on the `Home Owner` attribute is shown in Figure 3.6(b).
All the training instances for which `Home Owner = Yes` are propagated to the left child of the root node and the rest are propagated to the right child.
Hunt's algorithm is then recursively applied to each child.
The left child becomes a leaf node labeled `Defaulted = No`, since all instances associated with this node have identical class label `Defaulted = No`.
The right child has instances from each class label.
Hence, we split it further.
The resulting subtrees after recursively expanding the right child are shown in Figures 3.6(c) and (d).
"""

# ╔═╡ 5ea2ff03-d1ef-44c1-a552-72d50d6acaee
md"""
**Remark.**
Hunt's algorithm, as described above, makes some simplifying assumptions that are often not true in practice.
In the following, we describe these assumptions and briefly discuss some of the possible ways for handling them.

1. Some of the child nodes created in Hunt's algorithm can be empty if none of the training instances have the particular attribute values.
   One way to handle this is by declaring each of them as a leaf node with a class label that occurs most frequently among the training instances associated with their parent nodes.

2. If all training instances associated with a node have identical attribute values but different class labels, it is not possible to expand this node any further.
   One way to handle this case is to declare it a leaf node and assign it the class label that occurs most frequently in the training instances associated with this node.
"""

# ╔═╡ c8de18d2-ffce-4401-8049-cc6ba83aea03
md"#### Design Issues of Decision Tree Induction"

# ╔═╡ 368a1042-f40c-423d-a9eb-029be7096053
md"""
**Remark.**
Hunt's algorithm is a generic procedure for growing decision trees in a greedy fashion.
To implement the algorithm, there are two key design issues that must be addressed.

1. **What is the splitting criterion?**
   At each recursive step, an attribute must be selected to partition the training instances associated with a node into smaller subsets associated with its child nodes.
   The splitting criterion determines which attribute is chosen as the test condition and how the training instances should be distributed to the child nodes.
   This will be discussed in Sections 3.3.2 and 3.3.3.

2. **What is the stopping criterion?**
   The basic algorithm stops expanding a node only when all the training instances associated with the node have the same class labels or have identical attribute values.
   Although these conditions are sufficient, there are reasons to stop expanding a node much earlier even if the leaf node contains training instances from more than one class.
   This process is called early termination and the condition used to determine when a node should be stopped from expanding is called a stopping criterion.
   The advantages of early termination are discussed in Section 3.4.
"""

# ╔═╡ 2248fe56-ee82-44b6-8ef5-6e012a695c20
md"### Methods for Expressing Attribute Test Conditions"

# ╔═╡ 48d7e7bc-e502-4bba-9584-d3ac07b43487
md"""
**Remark.**
Decision tree induction algorithms must provide a method for expressing an attribute test condition and its corresponding outcomes for different attribute types.

- **Binary Attributes.**
  The test condition for a binary attribute generates two potential outcomes, as shown in Figure 3.7.

- **Nominal Attributes.**
  Since a nominal attribute can have many values, its attribute test condition can be expressed in two ways, as a multiway split or a binary split as shown in Figure 3.8.
  For a multiway split (Figure 3.8(a)), the number of outcomes depends on the number of distinct values for the corresponding attribute.
  For example, if an attribute such as marital status has three distinct values---single, married, or divorced---its test condition will produce a three-way split.
  It is also possible to create a binary split by partitioning all values taken by the nominal attribute into two groups.
  For example, some decision tree algorithms, such as CART, produce only binary splits considering all ``2^{k-1} - 1`` ways of creating a binary partition of ``k`` attribute values.

- **Ordinal Attributes.**
  Ordinal attributes can also produce binary or multiway splits.
  Ordinal attribute values can be grouped as long as the grouping does not violate the order property of the attribute values.
  Figure 3.9 illustrates various ways of splitting training records based on the `Shirt Size` attribute.
  The groupings shown in Figures 3.9(a) and (b) preserve the order among the attribute values, whereas the grouping showin in Figure 3.9(c) violates this property because it combines the attribute values `Small` and `Large` into the same partition while `Medium` and `Extra Large` are combined into another partition.

- **Continuous Attributes.**
  For continuous attributes, the attribute test condition can be expressed as a comparison test (e.g., ``A < v``) producing a binary split, or as a range query of the for ``v_i ≤ A < v_{i+1}``, for ``i = 1,…,k``, producing a multiway split.
"""

# ╔═╡ 40eae95d-ca28-4153-b533-5a2c85228aff
md"### Measures for Selecting an Attribute Test Condition"

# ╔═╡ 42dcb05f-9758-4f57-b19b-40f4bf47804e
md"""
#### Impurity Measure for a Single Node
"""

# ╔═╡ 5d5eaa46-9dae-48f3-b3d2-90db699313c4
md"""
**Definition.**
The impurity of a node measures how dissimilar the class labels are for the data instances belonging to a common node.
Following are examples of measures that can be used to evaluate the impurity of a node ``t``:

$\begin{align*}
\text{Entropy} &= -\sum_{i=0}^{c-1} p_i(t) \log_2{p_i(t)}, \tag{3.4} \\
\text{Gini index} &= 1 - \sum_{i=0}^{c-1} p_i(t)^2, \tag{3.5} \\
\text{Classification error} &= 1 - \underset{i}{\text{max}} [p_i(t)], \tag{3.6}
\end{align*}$

where ``p_i(t)`` is the relative frequency of training instances that belong to class ``i`` at node ``t``, ``c`` is the total number of classes, and ``0 \log_2{0} = 0`` in entropy calculations.
All three measures give a zero impurity value if a node contains instances from a single class and maximum impurity if the node has equal proportion of instances from multiple classes.
"""

# ╔═╡ 1a8a609a-50c4-43d4-96c0-bafad226a82a
md"""
#### Collective Impurity of Child Nodes
"""

# ╔═╡ 84317ad6-e3f1-4156-a1aa-abc8bdeb6968
md"""
**Example 3.3. [Weighted Entropy]**
"""

# ╔═╡ 3a1b4846-e309-4e55-accd-f8ebed492eee
function I(df::DataFrame)
	count = countmap(df[!,:class])
	c = sum(values(count))
	entropy = -sum([(x // c) * log(2, (x // c)) for (_, x) ∈ count])
end

# ╔═╡ e333efc9-4367-45aa-a2e4-5d621069378c
function I(df::DataFrame, col::Symbol)
	count = countmap(df[!,col])
	c = sum(values(count))
	weightedentropy = sum([(count[cond] // c) * I(df, col, cond) for cond ∈ Set(keys(count))])
end

# ╔═╡ bd9768f5-4c40-4b60-8e98-b623dc05763c
function I(df::DataFrame, col::Any, cond::Any, classcol=:class)
	x = df[df[!,col] .== cond,:]
	count = countmap(x[!,classcol])
	if 0 ∈ values(count)
		return 0
	end
	c = sum(values(count))
	entropy = -sum([(x // c) * log(2, (x // c)) for (_, x) ∈ count])
end

# ╔═╡ 4b4bcdbd-4cd0-4180-84df-e22f06771e23
let
	homeowner = [true, true, true, false, false, false, false, false, false, false]
	class = [false, false, false, true, true, true, false, false, false, false]
	mstat = [:single, :single, :single, :single, :single, :divorced, :married, :married, :married, :divorced]
	df = DataFrame(homeowner=homeowner, class=class, mstat=mstat)

	(
		:yesho => I(df, :homeowner, true),
		:noho => I(df, :homeowner, false),
		:ho => I(df, :homeowner),
		:single => I(df, :mstat, :single),
		:married => I(df, :mstat, :married),
		:divorced => I(df, :mstat, :divorced),
		:mstat => I(df, :mstat),
		:parent => I(df),
		:Δho => I(df) - I(df, :homeowner),
		:Δmstat => I(df) - I(df, :mstat)
	)
end

# ╔═╡ 5711f366-d797-4cdf-a674-130fa9fbf364
md"""
#### Binary Splitting of Qualitative Attributes
"""

# ╔═╡ d6871f41-984d-4f36-9b73-7c9f4482587c
md"### Algorithm for Decision Tree Induction"

# ╔═╡ adad4ac3-4957-4eab-80b7-7254494789e5
md"### Example Application: Web Robot Detection"

# ╔═╡ 0dc10629-0145-4560-9dbb-83c432846456
md"### Characteristics of Decision Tree Classifiers"

# ╔═╡ a56b1324-8e23-4ffa-939c-35a6710349fd
md"""
**Remark.**
The following is a summary of the important characteristics of decision tree induction algorithms.

1. **Applicability**

2. **Expressiveness**

3. **Computational Efficiency**

4. **Handling Missing Values**

5. **Handling Interactions among Attributes**

6. **Handling Irrelevant Attributes**

7. **Handling Redundant Attributes**

8. **Using Rectilinear Splits**
"""

# ╔═╡ 42218024-b4ca-4f02-a78c-82f80eb9dfb8
md"## Model Overfitting"

# ╔═╡ 9a2642bf-9e7f-4c8e-b118-1ba04dc4885c
md"### Reasons for Model Overfitting"

# ╔═╡ c5c4a3bc-fa8f-4d05-b415-61d4bd64e169
md"#### High Model Complexity"

# ╔═╡ c081cb60-7163-4104-96b1-776efbab533a
md"### Incorporating Model Complexity"

# ╔═╡ b1dfcf8b-477b-4951-8d70-5c4525fa53b5
md"""
**Definition.**
The principle known as **Occam's razor** or the **principle of parsimony** suggests that given two models with the same errors, the simpler model is preferred over the more complex model.
"""

# ╔═╡ 15d7f997-d1d1-4b67-8a33-ce5e48dc7ab6
md"#### Estimating the Complexity of Decision Trees"

# ╔═╡ 8b68045f-f786-4027-a0bd-abe9872efab4
md"#### Minimum Description Length Principle"

# ╔═╡ 73c1fba4-43b3-402b-9b66-c431146ac1f0
md"### Estimating Statistical Bounds"

# ╔═╡ 78291a80-c93a-4610-a3d6-8f387c0e5f9c
md"### Model Selection for Decision Trees"

# ╔═╡ 90959a15-b611-41f4-9fa9-ea8091ca0a18
md"## Model Evaluation"

# ╔═╡ 7180079f-fcc0-4b61-8860-146989a90150
md"### Holdout Method"

# ╔═╡ a6431e4a-013a-49b3-9663-55e225ac0bff
md"### Cross-Validation"

# ╔═╡ 95d7107c-fe77-4b4a-9070-3772d98c6838
md"## Presence of Hyper-parameters"

# ╔═╡ 7f997fce-e0b1-493d-9cd7-18cfee4de5a5
md"## Pitfalls of Model Selection and Evaluation"

# ╔═╡ 016fcbbd-d1e8-4156-997d-13187edd39c2
md"## Model Comparison*"

# ╔═╡ 61f66060-1a05-40ed-b119-741d3a9156dc
md"# Association Analysis: Basic Concepts and Algorithms"

# ╔═╡ 6c915821-4a3a-46ee-9105-17aa75324130
md"## Preliminaries"

# ╔═╡ 277666d6-f9fb-427d-bb1f-13701a2a9634
md"## Frequent Itemset Generation"

# ╔═╡ 8a4a67a3-5dc7-47ea-bf33-190eafd0e92d
md"## Rule Generation"

# ╔═╡ 66ce3518-cce9-405a-a2d0-f8cd1617a789
md"## Compact Representation of Frequent Itemsets"

# ╔═╡ 4fb31984-e749-484b-94a2-2229b9bb1c58
md"## Alternative Methods for Generating Frequent Itemsets*"

# ╔═╡ ae7af4e0-d378-4a3f-967c-e40857f82f0a
md"## FP-Growth Algorithm*"

# ╔═╡ a38f787a-e9b1-450f-acfe-7fcebb5761ba
md"## Evaluation of Association Patterns"

# ╔═╡ faef03c4-836b-4873-a932-0ca098b158b5
md"## Effect of Skewed Support Distribution"

# ╔═╡ 12fafd08-f3d9-4f0c-9cc5-70424c1e4e11
md"# Cluster Analysis: Basic Concepts and Algorithms"

# ╔═╡ 98d21603-b30c-45c9-8af7-7e687a6af140
md"## Overview"

# ╔═╡ 32519d1a-a89e-4011-a67e-9b5152d30cdf
md"## K-means"

# ╔═╡ 1b3c9f58-1c1f-4190-aa1a-b49c20e0d9f4
md"## Agglomerative Hierarchical Clustering"

# ╔═╡ 66ef507b-20d6-4fbe-9f65-c83233f73087
md"## DBSCAN"

# ╔═╡ 3b81f57b-5ffc-4f24-9061-67fafd2811f9
md"## Cluster Evaluation"

# ╔═╡ ff7d7c70-65d5-404f-8a40-feefc76013b1
md"# Classification: Alternative Techniques"

# ╔═╡ a2442c34-684a-4284-82f9-e525a27b39f8
md"""
**Remark.**
Chapter 3 introduced the classification problem and presented a technique known as the decision tree classifier.
Issues such as model overfitting and model evaluation were also discussed.
This chapter presents alternative techniques for building classification models---from simple techniques such as artificial neural networks, deep learning, support vector machines, and ensemble methods.
Other practical issues such as the class imbalance and multiclass problems are also discussed at the end of the chapter.
"""

# ╔═╡ 061e233f-4847-49ca-8693-4007640acb7e
md"## Types of Classifiers"

# ╔═╡ 43578709-1b2b-451b-8650-b48829b1e577
md"""
**Binary versus Multiclass**
"""

# ╔═╡ 569bf48b-629d-45a8-89dd-69ee2f5fbfa7
md"""
**Deterministic versus Probabilistic**
"""

# ╔═╡ c5b3f21a-be25-492f-a280-d698db815f1f
md"""
**Linear versus Nonlinear**
"""

# ╔═╡ 0eace2df-c206-4d4e-9dbc-735715ce45fb
md"""
**Global versus Local**
"""

# ╔═╡ aef84d12-92cc-4c03-9c2c-c466e82b6c0e
md"""
**Generative versus Discriminative**
"""

# ╔═╡ 235aaa37-3565-48ca-846c-c322e6ac1f97
md"## Rule-Based Classifier"

# ╔═╡ 293a554f-ce0c-46b1-9b2f-d92defffb7a9
md"""
**Definition.**
A rule-based classifer uses a collection of "if ...then..." rules (also known as a **rule set**) to classify data instances.
Table 6.1 shows an example of a rule set generated for the vertebrate classification problem described in the previous chapter.
Each classification rule in the rule set can be expressed in the following way:

$r_i : (\text{Condition}_i) ⟶ y_i. \tag{6.1}$

The left-hand side of the rule is called the **rule antecedent** or **precondition**.
It contains a conjunction of attribute test conditions:

$\text{Condition}_i = (A_1 \text{ op } v_1) ∧ (A_2 \text{ op } v_2) ∧ … ∧ (A_k \text{ op } v_k), \tag{6.2}$

where ``(A_j, v_j)`` is an attribute-value pair and ``\text{op}`` is a comparison operator chosen from the set ``\{=, ≠, <, >, ≤, ≥\}``.
Each attribute test ``(A_j \text{ op } v_j)`` is also known as a conjunct.
The right-hand side of the rule is called the **rule consequent**, which contains the predicted class ``y_i``.
"""

# ╔═╡ 09c16fff-5934-43d3-aa8a-7a95c9f4b013
md"### How a Rule-Based Classifier Works"

# ╔═╡ 2f1f6eba-0ca1-48d6-bd80-e3a634033629
md"### Properties of a Rule Set"

# ╔═╡ 3444e48e-802e-4570-93a8-9d67c05347b7
md"""
**Definition 6.1** (Mutually Exclusive Rule Set).
The rules in a rule set ``R`` are mutually exclusive if no two rules in ``R`` are triggered by the same instance.
This property ensures that every instance is covered by at most one rule in ``R``.
"""

# ╔═╡ 726acb67-b073-4651-b62d-7a190d9e60ac
md"""
**Definition 6.2** (Exhaustive Rule Set).
A rule set ``R`` has exhaustive coverage if there is a rule for each combination of attribute values.
This property ensures that every instance is covered by at least one rule in ``R``.
"""

# ╔═╡ 491aba37-9737-4501-af21-efcf142ba188
md"""
**Definition 6.3** (Ordered Rule Set).
The rules in an ordered rule set ``R`` are ranked in decreasing order of their priority.
An ordered rule set is also known as a **decision list**.
"""

# ╔═╡ 2be8e92b-c7f7-4437-820e-322be73383d9
md"### Direct Methods for Rule Extraction"

# ╔═╡ 4eb8b807-576d-4113-93d0-1b0dec131c0e
md"#### Learn-One-Rule Function"

# ╔═╡ 63d6330e-d0b3-4e3b-a1ef-a636499c4698
md"""
**Rule Pruning**
"""

# ╔═╡ a7c79ee6-5ec8-4a4c-8169-996b504f0738
md"""
**Building the Rule Set**
"""

# ╔═╡ 3655f1b3-66a0-445c-b432-69bc5b13ed9d
md"#### Instance Elimination"

# ╔═╡ 79429f42-83e0-4fe3-9e2f-96462b475c3a
md"### Indirect Methods for Rule Extraction"

# ╔═╡ 180acc86-f1eb-42b1-b3d9-5cad93dab6df
md"""
**Rule Generation**
"""

# ╔═╡ d0b33193-6933-4a2a-af04-9fb44d49a774
md"""
**Rule Ordering**
"""

# ╔═╡ 3c361e8b-1bd8-4d2c-ad18-53a39883f330
md"### Characteristics of Rule-Based Classifiers"

# ╔═╡ 75ae45b9-7ccf-4384-a23d-a63b5797e573
md"## Nearest Neighbor Classifiers"

# ╔═╡ d7a82cfa-ee9a-4c69-917f-9b1300b2651a
md"### Algorithm"

# ╔═╡ a2dc910b-6fe6-4d46-8ebe-ffb52c0b15e4
md"### Characteristics of Nearest Neighbor Classifiers"

# ╔═╡ 8fd72fce-e97d-40ce-a84b-33d62d5a86a5
md"## Naïve Bayes Classifiers"

# ╔═╡ da42d314-5dc1-4d68-a104-74b026734368
md"### Basics of Probability Theory"

# ╔═╡ 399731d6-bbd8-48c6-a94f-cc02471b1fa8
md"#### Bayes Theorem"

# ╔═╡ 290fba7a-55e1-4673-8d4d-81f9ea8826de
md"#### Using Bayes Theorem for Classification"

# ╔═╡ ba97d72d-01b5-4e9c-9684-becfde553e03
md"### Naïve Bayes Assumption"

# ╔═╡ 96db2a90-2725-4274-ad35-de3d54041672
md"#### How a Naïve Bayes Classifier Works"

# ╔═╡ a79b66be-8017-43c2-b457-fba7d5accacd
md"#### Estimating Conditional Probabilities for Categorical Attributes"

# ╔═╡ 838b5464-f6b8-4be5-a890-34ebc289a145
md"#### Estimating Conditional Probabilities for Continuous Attributes"

# ╔═╡ 05592ea9-888e-4c2e-8692-c9be4e2dc471
md"#### Handling Zero Conditional Probabilities"

# ╔═╡ 5d412238-76b3-4a7d-85ce-a3739a37722d
md"#### Characteristics of Naïve Bayes Classifiers"

# ╔═╡ 53043546-80c8-44af-8d0e-dd22e7710f2e
md"## Bayesian Networks"

# ╔═╡ 11d415a4-8676-49c5-a1ba-e0b3f2ff7ab9
md"### Graphical Representation"

# ╔═╡ 9fcbaf54-947b-4110-990f-502d05d26d9c
md"#### Conditional Independence"

# ╔═╡ 3904dcb6-cb55-4b70-bba4-a59217af32eb
md"#### Joint Probability"

# ╔═╡ 93f36425-2548-4aea-9356-3b07cae062f7
md"#### Use of Hidden Variables"

# ╔═╡ bad5a796-caff-4809-a922-16a9ffe27f4e
md"### Inference and Learning"

# ╔═╡ d97c203d-3012-4582-b104-b3c35b2823b1
md"#### Variable Elimination"

# ╔═╡ 61061304-2966-49c5-aedd-5808f40f8fbd
md"#### Sum-Product Algorithm for Trees"

# ╔═╡ ab05bdde-ede8-44b8-b052-4403a7c7fac0
md"#### Generalizations for Non-Tree Graphs"

# ╔═╡ 49277a93-ad29-4699-9eb0-2c906f832773
md"#### Learning Model Parameters"

# ╔═╡ d2c36a0d-fafe-4a47-81f9-3cfec40e0123
md"### Characteristics of Bayesian Networks"

# ╔═╡ c9167d6f-226b-47d8-9608-67a66a403733
md"## Logistic Regression"

# ╔═╡ f74dfe19-9655-4b10-8bd5-cf29bc84da25
md"### Logistic Regression as a Generalized Linear Model"

# ╔═╡ 09f13dd4-517e-41cd-8ae7-61c8b48110eb
md"### Learning Model Parameters"

# ╔═╡ 5c4ac7a6-5a3a-43f6-91f2-641563b0ba28
md"### Characteristics of Logistic Regression"

# ╔═╡ 49264001-f108-4e6e-a521-f0fa1feb2d9f
md"## Artificial Neural Network (ANN)"

# ╔═╡ f4f83e7e-13a3-482f-8eb1-8d71772f0bb7
md"""
**Remark.**
Artificial neural networks (ANN) are powerful classification models that are able to learn highly complex and nonlinear decision boundaries purely from the data.
They have gained widespread acceptance in several applications such as vision, speech, and language processing, where they have been repeatedly shown to outperform other classification models (and in some cases even human performance).
Historically, the study of artificial neural networks was inspired by attempts to emulate biological neural systems.
The human brain consists primarily of nerve cells called **neurons**, linked together with other neurons via strands of fiber called **axons**.
Whenever a neuron is stimulated (e.g., in response to a stimuli), it transmits nerve activations via axons to other neurons.
The receptor neurons collect these nerve activations using structures called **dendrites**, which are extensions from the cell body of the neuron.
The strength of the contact point between a dendrite and an axon, known as a **synapse**, determines the connectivity between neurons.
Neuroscientists have discovered that the human brain learns by changing the strength of the synaptic connection between neurons upon repeated stimulation by the same impulse.
"""

# ╔═╡ b9ee16aa-6088-4d10-bfb5-9f4ad7e232a7
md"""
**Remark.**
Artificial neural networks have had a long history of developments spanning over five decades of research.
Although classical models of ANN suffered from several challenges that hindered progress for a long time, they have reemerged with widespread popularity because of a number of recent developments in the last decade, collectively known as **deep learning**.
In this section, we examine classical approaches for learning ANN models, starting from the simplest model called **perceptrons** to more complex architectures called **multi-layer neural networks**.
In the next section, we discuss some of the recent advancement in the area of ANN that have made it possible to effectively learn modern ANN models with deep architectures.
"""

# ╔═╡ 9fe3b5f8-8c5d-4708-8c74-c8bd2ec9bdcf
md"### Perceptron"

# ╔═╡ 29c304eb-b000-493d-ab12-c1a5950e7eb8
md"""
**Definition.**
A perceptron is a basic type of ANN model that involves two types of nodes: input nodes, which are used to represent the input attributes, and an output node, which is used to represent the model output.
Figure 6.20 illustrates the basic architecture of a perceptron that takes three input attributes, ``x_1``, ``x_2``, and ``x_3``, and produces a binary output ``y``.
The input node corresponding to an attribute ``x_i`` is connected via a weighted link ``w_i`` to the output node.
The weighted link is used to emulate the strength of a synaptic connection between neurons.

The output node is a mathematical device that computes a weighted sum of its inputs, adds a bias factor ``b`` to the sum, and then examines the sign of the result to produce the output ``\hat{y}`` as follows:

$\hat{3} y = \begin{cases}
1, &\text{if } 𝐰^T 𝐱 + b > 0 \\
-1, &\text{otherwise}
\end{cases}$

To simplify notations, ``𝐰`` and ``b`` can be concated to form ``\tilde{𝐰} = (𝐰^T b)^T``, while ``𝐱`` can be appended with 1 at the end to form ``\tilde{𝐱} = (𝐱^T 1)^T``.
The output of the perceptron ``\hat{y}`` can then be written:

$\hat{y} = \text{sign}(\tilde{𝐰}^T \tilde{𝐱}),$

where the sign function acts as an **activation function** by providing an output value of +1 if the argument is positive and -1 if its argument is negative.
"""

# ╔═╡ 86de1747-3e88-48ab-8794-d9a6301f567a
md"#### Learning the Perception"

# ╔═╡ a9155998-4973-49a8-b3b0-5a39510c4705
md"""
**Remark.**
Given a training set, we are interested in learning parameters ``\tilde{𝐰}`` such that ``\hat{y}`` closely resembles the true ``y`` of training instances.
This is achieved by using the perceptron learning algorithm given in Algorithm 6.3.
"""

# ╔═╡ e1ba66bd-8eda-485f-9025-73db77f7d4b0
md"""
**Definition.**
The key computation for this algorithm is the iterative weight update formula given in Step 8 of the algorithm:

$w_j^{(k + 1)} = w_j^{(k)} + \lambda (y_i - \hat{y}_i^{(k)}) x_{ij}, \tag{6.49}$

where ``w^{(k)}`` is the weight parameter associated with the ``i^{\text{th}}`` input link after the ``k^{\text{th}}`` iteration, ``\lambda`` is a parameter known as the **learning rate**, and ``x_{ij}`` is the value of the ``j^{\text{th}}`` attribute of the training example ``𝐱_i``.
"""

# ╔═╡ f854b9b6-5d04-4742-ade5-2c6575e08da7
md"""
**Remark.**
The justification for Equation 6.49 is rather intuitive.
Note that ``(y_i - \hat{y}_i)`` captures the discrepancy between ``y_i`` and ``\hat{y}_i``, such that its value is ``0`` only when the true label and the predicted output match.
Assume ``x_{ij}`` is positive.
If ``\hat{y} = 0`` and ``y = 1``, then ``w_j`` is increased at the next iteration so that ``\tilde{𝐰}^T 𝐱_i`` can become positive.
On the other hand, if ``\hat{y} = 1`` and ``y = 0``, then ``w_j`` is decreased so that ``\tilde{𝐰}^T 𝐱_i`` can become negative.
Hence, the weights are modified at every iteration to reduce the discrepancies between ``\hat{y}`` and ``y`` across all training instances.
The learning rate ``\lambda``, a parameter whose value is between ``0`` and ``1``, can be used to control the amount of adjustments made in each iteration.
The algorithm halts when the average number of discrepancies are smaller than a threshold ``\gamma``.
"""

# ╔═╡ 14cca674-80b1-449e-bfc8-5bbda0a82757
md"### Multi-layer Neural Network"

# ╔═╡ c1124f92-31f5-4f2b-8d5c-e0644cf3e499
md"""
**Remark.**
A multi-layer neural network generalizes the basic concept of a perceptron to more complex architectures of nodes that are capable of learning nonlinear decision boundaries.
A generic architecture of a multi-layer neural network is shown in Figure 6.23 where the nodes are arranged in groups called layers.
These layers are commonly organized in the form of a chain such that every layer operates on the outputs of its preceding layer.
In this way, the layers represent different levels of *abstraction* that are applied on the input features in a sequential manner.
The composition of these abstractions generates the final output at the last layer, which is used for making predictions.
In the following, we briefly describe the three types of layers used in multi-layer neural networks.
"""

# ╔═╡ 3ea5d319-6867-421c-b71d-a387c98ad074
md"""
**Remark.**
The first layer of the network, called the **input layer**, is used for representing inputs from attributes.
Every numerical or binary attribute is typically represented using a single node on this layer, while a categorical attribute is either represented using a different node for each categorical value, or by encoding the ``k``-ary attribute using ``⌈\log_2{k}⌉`` input nodes.
These inputs are fed into intermediary layers known as **hidden layers**, which are made up of processing units known as hidden nodes.
Every hidden node operates on signals received fro the input nodes or hidden nodes at the preceding layer, and produces an activation value that is transmitted to the next layer.
The final layer is called the **output layer** and processes the activation values from its preceding layer to produce predictions of output variables.
For binary classification, the output layer contains a single node representing the binary class label.
In this architecture, since the signals are propagated only in the forward direction from the input layer to the output layer, they are also called **feedforward neural networks**.
"""

# ╔═╡ 8c955690-06f7-446b-8d22-de24b15674e5
md"""
**Remark.**
A major difference between multi-layer neural networks and perceptrons is the inclusion of hidden layers, which dramatically improves their ability to represent arbitrarily complex decision boundaries.
For example, consider the XOR problem described in the previous section.
The instances can be classified using two hyperplanes that partition the input space into their respective classes, as shown in Figure 6.24(a).
Because a perceptron can create only one hyperplane, it cannot find the optimal solution.
However, this problem can be addressed by using a hidden layer consisting of two nodes, as shown in Figure 6.24(b).
Intuitively, we can think of each hidden node as a perceptron that tries to construct one of the two hyperplanes, while the output node simply combines the results of the perceptrons to yield the decision boundary shown in Figure 6.24(a).
"""

# ╔═╡ b3321da3-cf70-47f7-a6d0-0a0004133c6a
md"""
**Remark.**
The hidden nodes can be viewed as learning latent representations or *features* that are useful for distinguishing between the classes.
While the first hidden layer directly operates on the input attributes and thus captures simpler features, the subsequent hidden layers are able to combine them and construct more complex features.
From this perspective, multi-layer neural networks learn a hierarchy of features at different levels of abstraction that are finally combined at the output nodes to make predictions.
Further, there are combinatorically many ways we can combine the features learned at the hidden layers of ANN, making them highly expressive.
This property chiefly distinguishes ANN from other classification models such as decision trees, which can learn partitions in the attribute space but are unable to combine them in exponential ways.
"""

# ╔═╡ d11398c5-203f-42ce-92ff-8c089fcc913b
md"""
**Remark.**
To understand the nature of computations happening at the hidden and output nodes of ANN, consider the ``i^{\text{th}}`` node at the ``l^{\text{th}}`` layer of the network ``(l > 0)``, where the layers are numbered from ``0`` (input layer) to ``L`` (output layer), as shown in Figure 6.25.
The activation value generated at this node, ``a_i^l``, can be represented as a function of the inputs received from nodes at the preceding layer.
Let ``w_{ij}^l`` represent the weight of the connection from the ``j^{\text{th}}`` node at layer ``(l - 1)`` to the ``i^{\text{th}}`` node at layer ``l``.
Similarly, let us denote the bias term at this node as ``b_i^l``.
The activation value ``a_i^l`` can then be expressed as

$a_i^l = f(z_i^l) = f\left(\sum_j w_{ij}^l a_j^{l-1} + b_i^l\right),$

where ``z`` is called the **linear predictor** and ``f(.)`` is the activation function that converts ``z`` to ``a``.
Further, note that, by definition, ``a_j^0 = x_j`` at the input layer and ``a^L = \hat{y}`` at the output node.
"""

# ╔═╡ 255e2123-a847-493e-930f-c0e45fed6501
md"""
**Remark.**
There are a number of alternate activation functions apart from the sign function that can be used in multi-layer neural networks.
Some examples include linear, sigmoid (logistic), and hyperbolic tangent functions, as shown in Figure 6.26.
These functions are able to produce real-valued and nonlinear activation values.
Among these activation functions, the sigmoid ``\sigma(.)`` has been widely used in many ANN models, although the use of other types of activation functions in the context of deep learning will be discussed in Section 6.8.
We can thus represent ``a_i^l`` as

$a_i^l = \sigma(z_i^l) = \frac{1}{1 + e^{-z_i^l}}. \tag{6.50}$
"""

# ╔═╡ 3be70aeb-7acf-4959-be2d-95382bfc545f
md"#### Learning Model Parameters"

# ╔═╡ 8becfd39-59d9-49fe-8d1d-56312299053f
md"""
**Definition.**
The weights and bias terms ``(𝐰, 𝐛)`` of the ANN model are learned during training so that the predictions on training instances match the true labels.
This is achieved by using a loss function

$E(𝐰, 𝐛) = \sum_{k=1}^n \text{Loss}(y_k, \hat{y}_k) \tag{6.51}$

where ``y_k`` is the true label of the ``k^{\text{th}}`` training instance and ``\hat{y}_k`` is equal to ``a^L``, produced by using ``𝐱_k``.
A typical choice of the loss function is the **squared loss function**:

$\text{Loss} (y_k, \hat{y}_k) = (y_k - \hat{y}_k)^2. \tag{6.52}$
"""

# ╔═╡ 1cfa45e3-08c3-4cb4-8819-4455b86b509a
md"""
**Remark.**
Note that ``E(𝐰, 𝐛)`` is a function of the model parameters ``(𝐰, 𝐛)`` because the output activation value ``a^L`` depends on the weights and bias terms.
We are interested in choosing ``(𝐰, 𝐛)`` that minimizes the training loss ``E(𝐰, 𝐛)``.
Unfortunately, because of the use of hidden nodes with nonlinear activation functions, ``E(𝐰, 𝐛)`` is not a convex function of ``𝐰`` and ``𝐛``, which means that ``E(𝐰, 𝐛)`` can have local minima that are not globally optimal.
However, we can still apply standard optimization techniques such as the **gradient descent method** to arrive at a locally optimal solution.
In particular, the weight parameter ``w_{ij}^l`` and the bias term ``b_i^l`` can be iteratively updated using the following equations:

$\begin{align*}
w_{ij}^l &⟵ w_{ij}^l - \lambda \frac{∂E}{∂w_{ij}^l}, \tag{6.53} \\
b_i^l &⟵ b_i^l - \lambda \frac{∂E}{∂b_i^l}, \tag{6.54}
\end{align*}$

where ``\lambda`` is a hyper-parameter known as the learning rate.
The intuition behind this equation is to move the weights in a direciton that reduces the training loss.
If we arrive at a minima using this procedure, the gradient of the training loss will be close to ``0``, eliminating the second term and resulting in the convergence of weights.
The weights are commonly initialized with values drawn randomly from a Gaussian or a uniform distribution.
"""

# ╔═╡ 48736d40-ab43-4c86-8fdf-80c6057b314c
md"""
**Remark.**
A necessary tool for updating weights in Equation 6.53 is to compute the partial derivative of ``E`` with respect to ``w_{ij}^l``.
This computation is nontrivial especially at hidden layers ``(l < L)``, since ``w_{ij}^l`` does not directly affect ``\hat{y} = aL`` (and hence the training loss), but has complex chains of influences via activation values at subsequent layers.
To address this problem, a technique known as **backpropagation** was developed, which propagates the derivatives from the output layer to the hidden layers.
This technique can be described as follows.
"""

# ╔═╡ 8a3c50b1-2b67-494d-abda-4ad1af0d2a8e
md"""
**Remark.**
Recall that the training loss ``E`` is simply the sum of individual losses at training instances.
Hence the partial derivative of ``E`` can be decomposed as a sum of partial derivatives of individual losses.

$\frac{∂E}{∂w_j^l} = \sum_{k = 1}^n \frac{∂ \text{ Loss} (y_k, \hat{y}_k)}{∂w_j^l}.$

To simplify discussions, we will consider only the derivatives of the loss at the ``k^{\text{th}}`` training instance, which will be generically represented as ``\text{Loss}(y, a^L)``.
By using the chain rule of differentiation, we can represent the partial derivatives of the loss with respect to ``w_{ij}^l`` as

$\frac{∂ \text{ Loss}}{∂w_{ij}^l} = \frac{∂ \text{ Loss}}{∂a_i^l} × \frac{∂a_i^l}{∂z_i^l} × \frac{∂z_i^l}{∂w_{ij}^l}. \tag{6.55}$
"""

# ╔═╡ 85ac0c5e-003e-42ed-8434-005340f032ca
md"""
**Remark.**
The last term of the previous equation can be written as

$\frac{∂z_i^l}{∂w_{ij}^l} = \frac{∂ \left(\sum_j w_{ij}^l a_j^{l-1} + b_i^l\right)}{∂w_{ij}^l} = a_j^{l-1}.$

Also, if we use the sigmoid activation function, then

$\frac{∂z_i^l}{∂z_i^l} = \frac{∂ \sigma(z_i^l)}{∂z_i^l} = a_i^l (1 - a_i^l).$

Equation 6.55 can thus be simplified as

$\frac{∂ \text{ Loss}}{∂w_{ij}^l} = \delta_i^l × a_i^l (1 - a_i^1) × a_j^{l-1}, \tag{6.56}$

where ``\delta_i^l = \frac{∂ \text{ Loss}}{∂a_i^l}``.
A similar formula for the partial derivatives with respect to the bias terms ``b_i^l`` is given by

$\frac{∂ \text{ Loss}}{∂b_i^l} = \delta_i^l × a_i^l (1 - a_i^l). \tag{6.57}$
"""

# ╔═╡ 1ddd485b-4fa4-4430-8462-0fbe4d3538f1
md"### Characteristics of ANN"

# ╔═╡ ca811418-280b-4b82-ac3e-aae1e9d26a8c
md"""
**Remark.** (Characteristics of ANN)

1. Multi-layer neural networks with at least one hidden layer are **universal approximators**; i.e., they can be used to approximate any target function.

2. ANN provides a natural way to represent a hierarchy of features at multiple levels of abstraction.

3. ANN represents complex high-level features as compositions of simpler lower-level features that are easier to learn.

4. ANN can easily handle irrelevant attributes, by using zero weights for attributes that do not help in improving the training loss.

5. Since the learning of ANN model involves minimizing a non-convex function, the solutions obtained by gradient descent are not guaranteed to be globally optimal.
   For this reason, ANN has a tendency to get stuck in local minima, a challenge that can be addressed by using deep learning techniques discussed in Section 6.8.4.

6. Training an ANN is a time consuming process, especially when the number of hidden nodes is large.

7. Just like logistic regression, ANN can learn in the presence of interacting variables, since the model parameters are jointly learned over all variables together.
   In addition, ANN cannot handle instsances with missing values in the training or testing phase.
"""

# ╔═╡ 00331799-28b8-4d5d-b9dc-12ead2d7013d
md"## Deep Learning"

# ╔═╡ 864faae4-654e-48ad-baab-cd57ed2452ee
md"""
**Remark.**
As described above, the use of hidden layers in ANN is based on the general belief that complex high-level features can be constructed by combining simpler lower-level features.
Typically, the greater the number of hidden layers, the deeper the hierarchy of features learned by the network.
This motivates the learning of ANN models with long chains of hidden layers, known as **deep neural networks**.
In contrast to "shallow" neural networks that involve only a small number of hidden layers, deep neural networks are able to represent features at multiple levels of abstraction and often require far fewer nodes per layer to achieve generalization performance similar to shallow networks.
"""

# ╔═╡ 1b35fc01-ee3f-4ce3-82cc-faf873146f79
md"""
**Remark.**
Despite the huge potential in learning deep neural networks, it has remained challenging to learn ANN models with a large number of hidden layers using classical approaches.
Apart from reason related to limited computational resources and hardware architectures, there have been a number of algorithmic challenges in learning deep neural networks.

1. Learning a deep neural network with low training error has been a daunting task because of the saturation of sigmoid activation functions, resulting in slow convergence of gradient descent.
   This problem becomes even more serious as we move away from the output node to the hidden layers, because of the compounded effects of saturation at multiple layers, known as the **vanishing gradient problem**.
   Because of this reason, classical ANN models have suffered from slow and ineffective learning, leading to poor training and test performance.

2. The learning of deep neural networks is quite sensitive to the initial values of model parameters, chiefly because of the non-convex nature of the optimization function and the slow convergence of gradient descent.

3. Deep neural networks with a large number of hidden layers have high model complexity, making them susceptible to overfitting.
   Hence, even if a deep neural network has been training to show low training error, it can still suffer from poor generalization performance.
"""

# ╔═╡ 40d7d299-f4d5-4c15-bfd3-92762b343a02
md"""
**Remark.**
These challenges have deterred progress in building deep neural networks for several decades and it is only recently that we have started to unlock their immense potential with the help of a number of advances being made in the area of deep learning.
Although some of these advances have been around for some time, they have only gained mainstream attention in the last decade, with deep neural networks continually beating records in various competitions and solving problems that were too difficult for other classification approaches.
"""

# ╔═╡ 8947fcd0-e150-4c77-a879-417b08238a34
md"""
**Remark.**
There are two factors that have played a major role in the emergence of deep learning techniques.

1. The availability of larger labeled data sets, e.g., the ImageNet data set contains more than 10 million labeled images, has made it possible to learn more complex ANN models than ever before, without falling easily into the traps of model overfitting.

2. Advances in computational abilities and hardware infrastructures, such as the use of graphical processing units (GPU) for distributed computing, have greatly helped in experimenting with deep neural networks with larger architectures that would not have been feasible with traditional resources.
"""

# ╔═╡ 811c8d1c-fa4b-41fa-8892-4195d7aad2c4
md"""
**Remark.**
In addition to the previous two factors, there have been a number of algorithmic advancements to overcome the challenges faced by classical methods in learning deep neural networks.
Some examples include the use of more responsive combinations of loss functions and activation functions, better initialization of model parameters, novel regularization techniques, more agile architecture designs, and better techniques for model learning and hyperparameter selection.
In the following, we describe some of the deep learning advances made to address the challenges in learning deep neural networks.
Further details on recent developments in deep learning can be obtained from the Bibliographic Notes.
"""

# ╔═╡ 10a0f292-a438-45af-bb15-b8c4649e24fa
md"### Using Synergistic Loss Functions"

# ╔═╡ 1d3d18d8-fb36-4f3c-9e23-b453d5964b8c
md"#### Saturation of Outputs"

# ╔═╡ 90e5fd02-f475-49d9-a310-ef5de8bf4701
md"### Using Responsive Activation Functions"

# ╔═╡ 54742983-527f-418a-a462-e40c444020cd
md"#### Vanishing Gradient Problem"

# ╔═╡ e04f8520-6ec2-44f9-b02a-0ce43e861b52
md"""
**Remark.**
The impact of saturating activation values on the learning of model parameters increases at deeper hidden layers that are farther away from the output node.
Even if the activation in the output layer does not saturate, the repeated multiplications performed as we backpropagate the gradients from the output layer to the hidden layers may lead to decreasing gradients in the hidden layers.
This is called the vanishing gradient problem, which has been one of the major hindrances in learning deep neural networks.
"""

# ╔═╡ f9d603db-17d0-45b2-b2a9-4116bcc27fb4
md"#### Rectified Linear Units"

# ╔═╡ f246fdcb-5ded-4cee-83ce-78387ef9c9c2
md"### Regularization"

# ╔═╡ ab5a03e0-9911-424c-8efa-cf611f9dd18a
md"#### Dropout"

# ╔═╡ 7915e12a-c0ab-42c1-82cd-c2a6465be0dc
md"### Initialization of Model Parameters"

# ╔═╡ 7c19e3b7-3d94-44ee-9cb3-6752d726f0d0
md"#### Supervised Pretraining"

# ╔═╡ cd030ebb-66f2-4458-bbd3-044527cc0ad0
md"#### Unsupervised Pretraining"

# ╔═╡ fff45fe1-6d43-4a21-b6fc-535dc7d7e7df
md"#### Use of Autoencoders"

# ╔═╡ da687caf-1d9d-48c6-b968-f8b94c04fb4a
md"#### Hybrid Pretraining"

# ╔═╡ 98ea659b-e541-4da6-8861-e7910ad77141
md"### Characteristics of Deep Learning"

# ╔═╡ dcde3bcc-b17e-4fd4-88a6-a2b96766b701
md"""
**Remark.**
Apart from the basic characteristics of ANN discussed in Section 6.7.3, the use of deep learning techniques provides the following additional characteristics:

1. 

2. 

3. 

4. 

5. 
"""

# ╔═╡ e2c034c0-1ae8-49e7-aafb-98b730897b29
md"## Support Vector Machine (SVM)"

# ╔═╡ eddcf22e-894c-4899-8fc4-248c8d772369
md"""
**Remark.**
A support vector machine (SVM) is a discriminative classification model that learns linear or nonlinear decision boundaries in the attribute space to separate the classes.
"""

# ╔═╡ 638e2305-b212-4f88-97df-94140636b55d
md"""
**Remark.**
Apart from maximizing the separability of the two classes, SVM offers strong regularization capabilities, i.e., it is able to control the complexity of the model in order to ensure good generalization performance.
"""

# ╔═╡ 0fd0f022-ff7c-4b3e-8ac7-be8dc53fb7ad
md"""
**Remark.**
Due to its unique ability to innately regularize its learning, SVM is able to learn highly expressive models without suffering from overfitting.
It has thus received considerable attention in the machine learning community and is commonly used in several practical applications, ranging from handwritten digit recognition to text categorization.
"""

# ╔═╡ becfe1e6-6c29-47e0-b801-7803f415d9a2
md"""
**Remark.**
SVM has strong roots in statistical learning theory and is based on the principle of structural risk minimization.
Another unique aspect of SVM is that it represents the decision boundary using only a subset of the training examples that are most difficult to classify, known as the **support vectors**.
Hence, it is a discriminative model that is impacted only by training instances near the boundary of the two classes, in contrast to learning the generative distribution of every class.
"""

# ╔═╡ 110399b7-562b-4c69-a4fd-68570593c2f0
md"### Margin of a Separating Hyperplane"

# ╔═╡ b2de5c46-630b-4c21-8ad1-56f264b491b2
md"""
**Remark.**
The bottom line is you want to maximize the margin.
"""

# ╔═╡ fbaaebca-280b-490b-aafd-90620900cb79
md"#### Rationale for Maximum Margin"

# ╔═╡ 5898db1c-42d2-4847-b4be-96f4126aa415
md"### Linear SVM"

# ╔═╡ b1a6798c-cb20-4ec9-a956-1c4c2b9f21d1
md"#### Learning Model Parameters"

# ╔═╡ e78fb658-89ef-46f1-8323-3fde6081e12c
md"### Soft-margin SVM"

# ╔═╡ f82a0101-8633-4923-9076-5d9456b411d7
md"#### SVM as a Regularizer of Hinge Loss"

# ╔═╡ 5e68ebcf-3470-4ea8-b210-083f3d99ba11
md"### Nonlinear SVM"

# ╔═╡ bebe9cd0-bf21-466a-93a8-a76aab4af947
md"#### Attribute Transformation"

# ╔═╡ 9128b0f4-7163-4966-9a61-f7866b9c887b
md"#### Learning a Nonlinear SVM Model"

# ╔═╡ e6141536-3ef2-44aa-a5a0-50333d26dbc2
md"### Characteristics of SVM"

# ╔═╡ 6d835be9-0982-4018-85dc-bef464d7f797
md"## Ensemble Methods"

# ╔═╡ c36bf58a-3a8e-4fb9-a3f5-20d467e2583c
md"""
**Remark.**
This section presents techniques for improving classification accuracy by aggregating the predictions of multiple classifiers.
These techniques are known as **ensemble** or **classifier combination** methods.
An ensemble method constructs a set of **base classifiers** from training data and performs classification by taking a vote on the predictions made by each base classifier.
This section explains why ensemble methods tend to perform better than any single classifier and presents techniques for constructing the classifier ensemble.
"""

# ╔═╡ e8a89f57-70a0-4561-98cb-e099cd4da304
md"### Rationale for Ensemble Method"

# ╔═╡ f4ab97e5-753b-4882-a89a-05b74b4459c4
md"""
**Example 6.8.**
Consider an ensemble of 25 binary classifiers, each of which has an error rate of ``\epsilon = 0.35``.
The ensemble classifier predicts the class label of a test example by taking a majority vote on the predictions made by the base classifiers.
If the base classifiers are identical, then all the base classifiers will commit the same mistakes.
Thus, the error rate of the ensemble remains 0.35.
On the other hand, if the base classifiers are independent---i.e., their errors are uncorrelated---then the ensemble makes a wrong prediction only if more than half of the base classifiers predict incorrectly.
In this case, the error rate of the ensemble classifier is

$e_{\text{ensemble}} = \sum_{i=13}^{25} \begin{pmatrix} 25 \\ i \end{pmatrix} \epsilon^i (1 - \epsilon)^{25 - i} = 0.06 \tag{6.101}$

which is considerably lower than the error rate of the base classifiers.
"""

# ╔═╡ d096d68b-baa0-4aa4-81df-5a7eee3d314b
md"""
**Remark.**
Figure 6.42 shows the error rate of an ensemble of 25 binary classifiers (``e_{\text{ensemble}}``) for different base classifier error rates (``\epsilon``).
The diagonal line represents the case in which the base classifiers are independent.
Observe that the ensemble classifier performs worse than the base classifiers when ``\epsilon`` is larger than 0.5.
"""

# ╔═╡ a78f527d-759f-4c45-b77d-105be9e3f504
md"""
**Remark.**
The preceding example illustrates two necessary conditions for an ensemble classifier to perform better than a single classifier: (1) the base classifiers should be independent of each other, and (2) the base classifiers should do better than a classifer that performs random guessing.
In practice, it is difficult to ensure total independence among the base classifiers.
Nevertheless, improvements in classification accuracies have been observed in ensemble methods in which the base classifiers are somewhat correlated.
"""

# ╔═╡ ce1b411a-b0a5-4650-b372-7ff12c64aa5f
md"### Methods for Constructing an Ensemble Classifier"

# ╔═╡ 798c1082-30c7-4894-96d0-a3f1ff201990
md"""
**Remark.**
The logical view of the ensemble method is presented in Figure 6.43.
The basic idea is to construct multiple classifiers from the original data and then aggregate their predictions when classifying unknown examples.
The ensemble of classifiers can be constructed in many ways:

1. **By manipulating the training set.**
   In this approach, multiple sets are created by resampling the original data according to some sampling distribution and constructing a classifier from each training set.
   The sampling distribution determines how likely it is that an example will be selected for training, and it may vary from one trial to another.
   **Bagging** and **boosting** are two example of ensemble methods that manipulate their training sets.
   These methods are described in further detail in Sections 6.10.4 and 6.10.5.

2. **By manipulating the input features.**
   In this approach, a subset of input features is choen to form each training set.
   The subset can be either chosen randomly or based on the recommendation of domain experts.
   Some studies have shown that this approach works very well with data sets that contain highly redundant features.
   **Random forest**, which is described in Section 6.10.6, in an ensemble method that manipulates its input features and uses decision trees as its base classifiers.

3. **By manipulating the class labels.**

4. **By manipulating the learning algorithm.**
"""

# ╔═╡ ad07b19c-13a4-4448-8bbb-bb9f5fa8cf4e
md"### Bias-Variance Decomposition"

# ╔═╡ 27fb4c3d-ab15-4311-90d2-e74a1dc2c7d9
md"""
**Remark.**
Bias-variance decomposition is a formal method for analyzing the generalization error of a predictive model.
Although the analysis is slightly different for classification than regression, we first discuss the basic intuition of this decomposition by using an analogue of a regression problem.
"""

# ╔═╡ 2836145c-67b9-4196-a7da-5908f852c762
md"### Bagging"

# ╔═╡ 1649449c-e27a-4483-8c2b-7f5ac7545eb1
md"""
**Definition.**
Bagging, which is also known as bootstrap aggregating, is a technique that repeatedly samples (with replacement) from a data set according to a uniform probability distribution.
Each bootstrap sample has the same size as the original data.
Because the sampling is done with replacement, some instances may appear several times in the same training set, while others may be omitted from the training set.
On average, a bootstrap sample ``D_i`` contains approximately ``63\%`` of the original training data because each sample has a probability ``1 - (1 - 1/N)^N`` of being selected in each ``D_i``.
If ``N`` is sufficiently large, this probability converges to ``1 - 1/e ≃ 0.632``.
The basic procedure for bagging is summarized in Algorithm 6.5.
After training the ``k`` classifiers, a test instance is assigned to the class that receives the highest number of votes.
"""

# ╔═╡ 4dce4ea1-695a-4d8a-9da2-b726cedcc6fd
md"""
**Algorithm 6.5** (Bagging algorithm).

Let ``k`` be the number of bootstrap samples.

**for** ``i = 1`` to ``k`` **do**

Create a bootstrap sample of size ``N``, ``D_i``.

Train a base classifier ``C_i`` on the bootstrap sample ``D_i``.

**end for**

``C^*(x) = \underset{y}{\text{argmax}} \sum_i \delta(C_i(x) = y).``

``\{\delta(⋅) = 1 \text{ if its argument is true and 0 otherwise.}\}``
"""

# ╔═╡ 90b0eba3-8ad9-434c-9b4b-7e777c21a031
md"### Boosting"

# ╔═╡ 79752e0b-994f-4a56-bc4d-9120884491e0
md"""
**Remark.**
Boosting is an iterative procedure used to adaptively change the distribution of training examples for learning base classifiers so that they increasingly focus on examples that are hard to classify.
Unlike bagging, boosting assigns a weight to each training example and may adaptively change the weight at the end of each boosting round.
The weights assigned to the training examples can be used in the following ways:

1. They can be used to inform the sampling distribution used to draw a set of bootstrap samples from the original data.

2. They can be used to learn a model that is biased toward examples with higher weight.
"""

# ╔═╡ f46591ff-fd99-4e28-886c-0fd0055cd7fc
md"""
#### AdaBoost

Let ``\{(𝐱_j, y_j) ∣ j = 1,2,…,N\}`` denote a set of ``N`` training examples.
In the AdaBoost algorithm, the importance of a base classifier ``C_i`` depends on its error rate, which is defined as

$\epsilon_i = \frac{1}{N} \left[\sum_{j=1}^N w_j \, I\Big(C_i(𝐱_j) ≠ y_j\Big)\right], \tag{6.102}$

where ``I(p) = 1`` if the predicate is true, and ``0`` otherwise.
The importance of a classifier ``C_i`` is given by the following parameter,

$\alpha_i = \frac{1}{2} \ln{\left(\frac{1 - \epsilon_i}{\epsilon_i}\right)}.$

Note that ``\alpha_i`` has a large positive value if the error rate is close to ``0`` and a large negative value if the error rate is close to ``1``, as shown in Figure 6.48.
"""

# ╔═╡ d53c038f-147e-4146-bb0f-f3ae966fac46
md"### Random Forests"

# ╔═╡ 4ceb8497-cc1c-4e9b-bbbf-bfcd734a76af
md"""
**Remark.**
Random forests attempt to improve the generalization performance by constructing an ensemble of *decorrelated* decision trees.
Random forests build on the idea of bagging to use a different bootstrap sample of the training data for learning decision trees.
However, a key distinguishing feature of random forests from bagging is that at every internal node of a tree, the best splitting criterion is chosen among a small set of randomly selected attributes.
In this way, random forests construct ensembles of decision trees by not only manipulating training instances (by using bootstrap samples similar to bagging), but also the input attributes (by using different subsets of attributes at every internal node).
"""

# ╔═╡ 3b250ee8-bbde-4e7b-adcc-3f27dc992cc9
md"## Class Imbalance Problem"

# ╔═╡ 21e29232-41ce-480e-b3bc-ae41308f9572
md"## Multiclass Problem"

# ╔═╡ 92e3b542-44e0-4e7a-bab9-c6f0d8515ba0
md"# Association Analysis: Advanced Concepts"

# ╔═╡ 2cd4e968-3b6a-4471-b0e0-08aab72dc43b
md"## Handling Categorical Attributes"

# ╔═╡ eb65f1d9-ee16-4aea-9030-64977e08b054
md"## Handling Continuous Attributes"

# ╔═╡ 6bbf0b8e-4cd6-4da4-8dd9-53d19ec416f1
md"## Handling a Concept Hierarchy"

# ╔═╡ 919f070e-04f7-40ab-affa-3a66aff311c6
md"## Sequential Patterns"

# ╔═╡ 764d80e1-8973-46ee-8683-086c87ac94c3
md"## Subgraph Patterns"

# ╔═╡ 16d494d8-5cc0-4420-968c-941617a847e1
md"## Infrequent Patterns*"

# ╔═╡ ef464793-ba4e-42a9-a684-d6e84475c537
md"# Cluster Analysis: Additional Issues and Algorithms"

# ╔═╡ 982fef18-6122-492e-8e10-b63387fdb668
md"## Characteristics of Data, Clusters, and Clustering Algorithms"

# ╔═╡ fab4943a-cf0b-48aa-8aec-06cf9487e7fe
md"## Prototype-Based Clustering"

# ╔═╡ 1c6a4b21-95f1-40ab-8d48-24c2e9ef6605
md"## Density-Based Clustering"

# ╔═╡ c7084842-feea-4d2f-9dd4-9e0dd5742070
md"## Graph-Based Clustering"

# ╔═╡ 79f5961a-4abd-4124-9b7e-7128cd41d22e
md"## Scalable Clustering Algorithms"

# ╔═╡ d3c697c0-ae92-489c-95f9-ef904411db4b
md"## Which Clustering Algorithm?"

# ╔═╡ ceca0772-8cb6-4a65-9590-37b687f9b850
md"# Anomaly Detection"

# ╔═╡ 36805642-6937-49e2-8fbe-308fe6092054
md"## Characteristics of Anomaly Detection Problems"

# ╔═╡ e0693afe-74e0-4890-abf4-9af21a6ec0e6
md"## Characteristics of Anomaly Detection Methods"

# ╔═╡ 12620ea6-1601-4fa5-8f23-8ae63c3d15c6
md"## Statistical Approaches"

# ╔═╡ e09b8502-b0b7-45b5-8183-5f6f58ec22f9
md"## Proximity-based Approaches"

# ╔═╡ 64044115-36c4-487d-9099-7d336fd502e2
md"## Clustering-based Approaches"

# ╔═╡ b0c86911-4f87-446f-b5fa-080620cdf9c6
md"## Reconstruction-based Approaches"

# ╔═╡ 3b71a004-97cb-4083-83ea-f56ae6c317b1
md"## One-class Classification"

# ╔═╡ ae36a78f-8cee-4e4b-89a5-f404ae3fbf9b
md"## Information Theoretic Approaches"

# ╔═╡ 4b82921b-258a-4837-9d9b-a52ea884e582
md"## Evaluation of Anomaly Detection"

# ╔═╡ a4132ece-8ec3-4258-97d3-bcc915c106b4
md"# Avoiding False Discoveries"

# ╔═╡ ad5231f9-9c09-4245-90d3-931e79b62b6c
md"## Preliminaries: Statistical Testing"

# ╔═╡ 741a987a-7d31-4f68-8f9a-16245998b773
md"## Modeling Null and Alternative Distributions"

# ╔═╡ dadb74e5-dedb-4330-83fe-63c127a98e99
md"## Statistical Testing for Classification"

# ╔═╡ 22c2d6b7-843c-48b0-b0af-9c90cbe0a47b
md"## Statistical Testing for Association Analysis"

# ╔═╡ 9d2cf046-ef3c-4e33-828b-bcf6c6576e97
md"## Statistical Testing for Cluster Analysis"

# ╔═╡ 75863ad3-783a-4fc8-b5bc-254c8cb4b728
md"## Statistical Testing for Anomaly Detection"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
DataFrames = "~1.3.2"
PlutoUI = "~0.7.34"
StatsBase = "~0.33.14"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "f9982ef575e19b0e5c7a98c6e75ee496c0f73a93"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.12.0"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "bf98fa45a0a4cee295de98d4c1462be26345b9a1"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.2"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "44c37b4636bc54afac5c574d2d02b625349d6582"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.41.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "ae02104e835f219b8930c7664b8012c93475c340"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.3.2"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "3daef5523dd2e769dad2365274f760ff5f282c7d"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.11"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "a7254c0acd8e62f1ac75ad24d5db43f5f19f3c65"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.2"

[[deps.InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "e5718a00af0ab9756305a0392832c8952c7426c1"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.6"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0b5cfbb704034b5b4c1869e36634438a047df065"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8979e9802b4ac3d58c503a20f2824ad67f9074dd"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.34"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "db3a23166af8aebf4db5ef87ac5b00d36eb771e2"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.0"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "dfb54c4e414caa595a1f2ed759b160f5a3ddcba5"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
git-tree-sha1 = "d88665adc9bcf45903013af0982e2fd05ae3d0a6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.2.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "51383f2d367eb3b444c961d485c565e4c0cf4ba0"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.14"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "bb1064c9a84c52e277f1096cf41434b675cd368b"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.6.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─1bd1a334-74c4-11ec-019b-03f01646310a
# ╟─ffd7f045-616b-4417-a892-9a752fd720b5
# ╟─5307b475-f2ee-440b-a850-483c631c335f
# ╟─6d0862cf-7c7d-4ea4-b472-64d888438c55
# ╟─91ac53cc-6164-4849-8da5-b8a6a2684873
# ╟─dd80a407-9f8d-415e-9f5b-3776b7eb77ee
# ╟─7e10875c-abeb-435d-aa83-1b7ab7805347
# ╟─09de7bbc-413e-4c6a-bb92-d8d6b911f336
# ╟─272cfc19-9bd6-4f68-9836-5d555e0e3ad6
# ╟─a8651483-25e7-4830-b044-53938c526af1
# ╟─383d2e95-d8c5-48ec-b4bf-85ee9f721a65
# ╟─7bf3c2bc-0a85-40ab-8210-7dfd82d4ce21
# ╟─dc6a7cc1-559a-47f0-8aee-8a8e5e43d44d
# ╟─b455725f-022c-45c8-b16a-e40f3fb1895b
# ╟─90b27d47-ba3f-4478-920b-ffc9f3c437b4
# ╟─efd4bb5b-f3d7-4af1-9627-5b5de45289aa
# ╟─f8fb71a3-c056-4737-a00f-1df954a89e82
# ╟─8b241be2-66f6-47e2-96c3-ab0b336cd4d3
# ╟─a5e57c8f-fcdb-4225-9e23-75879476c3c6
# ╟─76fe3006-ab84-4ce1-9f41-5f40d00a0643
# ╟─97cd03fa-58b8-440f-b046-9c8331bf74d5
# ╟─1e0f83f1-81de-4bac-a283-b0f0f7d4d797
# ╟─e498438f-0df7-43cb-b7ff-dcf3ddf4923d
# ╟─5bfe4224-18cf-41b3-a8de-d138d74623c0
# ╟─8b1501d2-094f-4fc9-afb9-cde7c7125057
# ╟─ceb6917e-e5d2-4e7a-9824-0393f89390dd
# ╟─5182618e-4c81-4373-9d97-00063f89afe9
# ╟─3e60c9ef-ece1-4e46-95a2-b811faa0336f
# ╟─a3a0c1ea-be07-4007-a44b-fddfccd209fc
# ╟─6d5a3e33-b361-4b9a-b6a8-b0b461e10b1e
# ╟─737dbd11-7131-4595-a381-fbfbb7e72fbf
# ╟─2d2f609c-d446-4553-ae15-ef43970df51e
# ╟─9522b6f7-6c59-4717-b5c5-428035ad8e32
# ╟─5ba9665c-74eb-4095-a1b8-49952c868889
# ╟─ee2cc3ca-149f-4b65-abb5-14cc79d6f24e
# ╟─059ef5d7-c1ec-47fb-9fd0-ff149a92a353
# ╟─ac1382bd-95fc-496c-880f-2447c8d6b1c9
# ╟─b70d8a12-bc7f-4c03-95ab-69020e138e88
# ╟─1201c05e-ffc6-4e04-8838-ce95d5b9fee0
# ╟─2e6e4dce-004a-4f68-b47f-43841832d65c
# ╟─b2c305f0-2b21-4a41-b896-b63b42039bfb
# ╟─713492c1-133e-4004-bef2-6a1add948f38
# ╟─f0dd4fa1-aa6f-4fc3-8fae-0c21bdda1d6b
# ╟─14755b9e-bf99-45ce-ada9-43273a19560d
# ╟─6fac7d86-159f-4ab4-9fbd-73f1410d8a99
# ╟─5e083af3-cf89-4ef4-927c-c2d29788caa4
# ╟─8bb9f222-f7a7-4494-adbc-a015f78badc6
# ╟─ee8e364c-81db-4e77-9b11-011f4ddfb971
# ╟─1484ce5e-e734-402b-8a8d-ef51e655f4be
# ╟─4bcd1e0d-b485-4bf3-895d-92380de58df4
# ╟─0dab3775-afeb-4283-b80a-69269d382cbf
# ╟─16b7e31e-a933-4213-88ae-e297906f6553
# ╟─3894056b-8391-4dc8-8463-1b82da487838
# ╟─e0886ceb-a58f-4060-9aa5-dd7929376fa4
# ╟─d55800e3-7b43-4694-bc6e-35f86f437cec
# ╟─4f9276b7-fcd3-4287-acd9-fbb53234e333
# ╟─e980eeb0-e8e8-4226-8435-73817b1a9480
# ╟─95bcf7b7-728e-4110-9324-8c95a50ec8be
# ╟─0bb2ea83-bd17-494b-83ca-7534ceec1cb0
# ╟─a72835f6-f870-4441-a058-b803e49a9fb7
# ╟─0a0a9f60-1234-4d02-9301-905a4cac5f54
# ╟─05754b5c-1db8-4419-ab13-71e865cf0eef
# ╟─32e759d1-9199-4e4a-81bd-1f6d6192c50c
# ╟─d5253a0c-a8b6-42eb-88a4-7cc026ff0576
# ╟─4d7b62a9-a4ca-4d37-8f4f-0be61f68710a
# ╟─a2fd41f4-88e7-489c-952c-d535a5c2fa35
# ╟─9a2fd7fc-6a20-4025-8404-d7eb3c8b2585
# ╟─41a2ea67-2a51-48c5-aaa8-a4a2d8877973
# ╟─7cc65cc6-fc8d-4e09-a60a-c39943aced5d
# ╟─48645e2d-5810-49e5-858d-45d23b192915
# ╟─e2fd0a03-494b-4874-b572-e2afdf50b56f
# ╟─42c36f8a-fbbd-4e6e-940e-20ac40199610
# ╟─75268401-0ce8-4fe1-8018-25c88bdd9ea1
# ╟─0b87306b-0dfb-4132-8c81-f41232d65406
# ╟─eb78615f-ad93-4d9b-934b-d3cce13b8c03
# ╟─58ab24d7-6392-4b23-a8ae-109f7a258bfa
# ╟─8fcffe9b-f3a1-41ee-a0f4-705e17a7ec48
# ╟─2add3ff5-e1ad-4314-b600-a9875f7fa0b6
# ╟─95d13ce3-1a9f-4e2b-8731-cfd0a38db5a2
# ╠═d30ece9d-fc94-4e75-8fc0-52fcc1e2ac93
# ╟─d875be4c-40ed-4c37-837d-906cca62c2cb
# ╟─33a686b8-8907-486e-8696-5768a5f84dd8
# ╟─818cbf7f-c703-4ef0-b03c-55c203a5e088
# ╟─fe736fe9-993c-4d7d-93f6-2fd4b4399dc7
# ╟─67003971-790e-4a2b-bcb4-1ae5b573d8ba
# ╠═c6fac3ee-f1d3-4950-b49d-5104e21e7a40
# ╟─d13973b9-6a3f-4414-9b9d-65d741550a01
# ╟─06a6943e-7ef7-4303-b0d0-53e3893fcf7a
# ╟─2e16651e-6eb5-4420-ae7a-f327511cec6f
# ╟─4da159dc-1bf0-463c-a345-c6ec19e7fb5c
# ╟─c692911c-9d37-43ef-accf-0ce41f84eaf4
# ╠═1284073d-4b85-46a8-98ad-7e8fbfa9ddfe
# ╠═86b96f85-a687-4618-9db4-8d5692cf1c23
# ╠═22d6b026-dece-4160-916c-5463d69ea042
# ╟─c70afbef-82ee-4213-b81d-890784a69843
# ╠═6e765a3a-be2f-48eb-8d7c-836138586626
# ╠═3d290756-bdc8-41c2-b491-5334cbf3bc95
# ╟─f3207bb5-2f99-47cd-bbb7-a5b56c7b0601
# ╠═7a467da0-5734-46bc-926b-9c0bceea496d
# ╟─ddd1503a-8c07-4cc1-80f8-0f5c8582ccab
# ╟─b052676a-9094-43d5-9ab6-2a586677d8f8
# ╟─37d46e6e-faf2-447a-a61a-337496f3e09b
# ╟─0b958283-da16-4497-89ba-e98da19ffc65
# ╟─ab54b3a1-6d20-42fd-9a7f-bfffb8bc89b2
# ╟─4d3b0760-e464-456f-b15f-32c01be42d7c
# ╟─ae345d3b-d6b3-4d92-8d31-e0df8c25d72f
# ╟─6d1169aa-d3fc-4a62-83ce-4bfefb28e722
# ╟─3ca7b9ac-096c-46cd-9bf9-35a6dec895a6
# ╟─a9de7ec3-ac2c-4161-9739-a941068f686a
# ╟─66245e41-a2f6-49d0-b4c6-31fb36abfdb0
# ╟─fd045fe4-afe3-4929-82b7-47294763f537
# ╟─94b51102-1c14-4b50-a413-0e33be3275b4
# ╟─012dac22-60bc-4809-87b0-c35951e6e508
# ╟─99613752-af37-4518-8eb8-cb42d97ce832
# ╟─a9cd0474-5f1f-401c-b955-82a233052ae7
# ╟─697b28bc-ecc5-46e1-b39a-92665bd3a5d9
# ╟─1bd4ea44-e30f-4845-bb51-f9e23af0e4cb
# ╟─573a55d9-b0ce-41ab-afa9-bed15ef3f42c
# ╟─c460e4a1-9086-4a1e-8287-3e354885f3a4
# ╟─90690836-e59a-4bfc-9559-1a91666a21e1
# ╟─004045fc-1455-4c43-aa99-d0de4e8e5734
# ╟─44117937-bf97-482f-8ec6-e321b56766c4
# ╟─f7a3ea5f-f960-4ec3-b544-28f356974025
# ╟─0adbe285-5b4d-447e-b375-b7351a38de2d
# ╟─7536856b-2629-4d5d-bed5-0d888913d38c
# ╟─2558f1be-0558-402a-ad84-1f5876b3b45a
# ╟─f8230add-dd0f-49dd-8290-333cdee785d9
# ╟─9f97a7f6-661f-467e-856a-0123096aa25d
# ╟─ad011225-4911-4982-bb59-73c7ef060d5d
# ╟─c504bfc5-69a7-4578-b295-8958f664ab37
# ╟─f4d2118e-74b6-4294-aefb-2a79946e293f
# ╟─ae83b04b-f98d-414f-9460-af659647deab
# ╟─fb8b1012-3c72-487d-9dde-ead3982a1b25
# ╟─53ac2e61-b43c-4424-bdfd-a3eca82d3a26
# ╟─518a9059-ad2b-403c-b78c-e7e3740100d4
# ╟─83a048f4-beb7-4404-8766-7500c0701132
# ╟─c672bafb-03e7-488b-b993-6a21b5e62aab
# ╟─0b018667-c541-4a4b-b52d-ee5ef8b4cd0b
# ╟─f5e99f85-a831-49b2-beff-1841d0bf39b5
# ╟─f30f57fa-cdae-4945-aa05-a43605aef157
# ╟─2630d856-71de-488b-bc70-a59af696d454
# ╟─5ea2ff03-d1ef-44c1-a552-72d50d6acaee
# ╟─c8de18d2-ffce-4401-8049-cc6ba83aea03
# ╟─368a1042-f40c-423d-a9eb-029be7096053
# ╟─2248fe56-ee82-44b6-8ef5-6e012a695c20
# ╟─48d7e7bc-e502-4bba-9584-d3ac07b43487
# ╟─40eae95d-ca28-4153-b533-5a2c85228aff
# ╟─42dcb05f-9758-4f57-b19b-40f4bf47804e
# ╟─5d5eaa46-9dae-48f3-b3d2-90db699313c4
# ╟─1a8a609a-50c4-43d4-96c0-bafad226a82a
# ╟─84317ad6-e3f1-4156-a1aa-abc8bdeb6968
# ╠═3a1b4846-e309-4e55-accd-f8ebed492eee
# ╠═e333efc9-4367-45aa-a2e4-5d621069378c
# ╠═bd9768f5-4c40-4b60-8e98-b623dc05763c
# ╠═4b4bcdbd-4cd0-4180-84df-e22f06771e23
# ╟─5711f366-d797-4cdf-a674-130fa9fbf364
# ╟─d6871f41-984d-4f36-9b73-7c9f4482587c
# ╟─adad4ac3-4957-4eab-80b7-7254494789e5
# ╟─0dc10629-0145-4560-9dbb-83c432846456
# ╟─a56b1324-8e23-4ffa-939c-35a6710349fd
# ╟─42218024-b4ca-4f02-a78c-82f80eb9dfb8
# ╟─9a2642bf-9e7f-4c8e-b118-1ba04dc4885c
# ╟─c5c4a3bc-fa8f-4d05-b415-61d4bd64e169
# ╟─c081cb60-7163-4104-96b1-776efbab533a
# ╟─b1dfcf8b-477b-4951-8d70-5c4525fa53b5
# ╟─15d7f997-d1d1-4b67-8a33-ce5e48dc7ab6
# ╟─8b68045f-f786-4027-a0bd-abe9872efab4
# ╟─73c1fba4-43b3-402b-9b66-c431146ac1f0
# ╟─78291a80-c93a-4610-a3d6-8f387c0e5f9c
# ╟─90959a15-b611-41f4-9fa9-ea8091ca0a18
# ╟─7180079f-fcc0-4b61-8860-146989a90150
# ╟─a6431e4a-013a-49b3-9663-55e225ac0bff
# ╟─95d7107c-fe77-4b4a-9070-3772d98c6838
# ╟─7f997fce-e0b1-493d-9cd7-18cfee4de5a5
# ╟─016fcbbd-d1e8-4156-997d-13187edd39c2
# ╟─61f66060-1a05-40ed-b119-741d3a9156dc
# ╟─6c915821-4a3a-46ee-9105-17aa75324130
# ╟─277666d6-f9fb-427d-bb1f-13701a2a9634
# ╟─8a4a67a3-5dc7-47ea-bf33-190eafd0e92d
# ╟─66ce3518-cce9-405a-a2d0-f8cd1617a789
# ╟─4fb31984-e749-484b-94a2-2229b9bb1c58
# ╟─ae7af4e0-d378-4a3f-967c-e40857f82f0a
# ╟─a38f787a-e9b1-450f-acfe-7fcebb5761ba
# ╟─faef03c4-836b-4873-a932-0ca098b158b5
# ╟─12fafd08-f3d9-4f0c-9cc5-70424c1e4e11
# ╟─98d21603-b30c-45c9-8af7-7e687a6af140
# ╟─32519d1a-a89e-4011-a67e-9b5152d30cdf
# ╟─1b3c9f58-1c1f-4190-aa1a-b49c20e0d9f4
# ╟─66ef507b-20d6-4fbe-9f65-c83233f73087
# ╟─3b81f57b-5ffc-4f24-9061-67fafd2811f9
# ╟─ff7d7c70-65d5-404f-8a40-feefc76013b1
# ╟─a2442c34-684a-4284-82f9-e525a27b39f8
# ╟─061e233f-4847-49ca-8693-4007640acb7e
# ╟─43578709-1b2b-451b-8650-b48829b1e577
# ╟─569bf48b-629d-45a8-89dd-69ee2f5fbfa7
# ╟─c5b3f21a-be25-492f-a280-d698db815f1f
# ╟─0eace2df-c206-4d4e-9dbc-735715ce45fb
# ╟─aef84d12-92cc-4c03-9c2c-c466e82b6c0e
# ╟─235aaa37-3565-48ca-846c-c322e6ac1f97
# ╟─293a554f-ce0c-46b1-9b2f-d92defffb7a9
# ╟─09c16fff-5934-43d3-aa8a-7a95c9f4b013
# ╟─2f1f6eba-0ca1-48d6-bd80-e3a634033629
# ╟─3444e48e-802e-4570-93a8-9d67c05347b7
# ╟─726acb67-b073-4651-b62d-7a190d9e60ac
# ╟─491aba37-9737-4501-af21-efcf142ba188
# ╟─2be8e92b-c7f7-4437-820e-322be73383d9
# ╟─4eb8b807-576d-4113-93d0-1b0dec131c0e
# ╟─63d6330e-d0b3-4e3b-a1ef-a636499c4698
# ╟─a7c79ee6-5ec8-4a4c-8169-996b504f0738
# ╟─3655f1b3-66a0-445c-b432-69bc5b13ed9d
# ╟─79429f42-83e0-4fe3-9e2f-96462b475c3a
# ╟─180acc86-f1eb-42b1-b3d9-5cad93dab6df
# ╟─d0b33193-6933-4a2a-af04-9fb44d49a774
# ╟─3c361e8b-1bd8-4d2c-ad18-53a39883f330
# ╟─75ae45b9-7ccf-4384-a23d-a63b5797e573
# ╟─d7a82cfa-ee9a-4c69-917f-9b1300b2651a
# ╟─a2dc910b-6fe6-4d46-8ebe-ffb52c0b15e4
# ╟─8fd72fce-e97d-40ce-a84b-33d62d5a86a5
# ╟─da42d314-5dc1-4d68-a104-74b026734368
# ╟─399731d6-bbd8-48c6-a94f-cc02471b1fa8
# ╟─290fba7a-55e1-4673-8d4d-81f9ea8826de
# ╟─ba97d72d-01b5-4e9c-9684-becfde553e03
# ╟─96db2a90-2725-4274-ad35-de3d54041672
# ╟─a79b66be-8017-43c2-b457-fba7d5accacd
# ╟─838b5464-f6b8-4be5-a890-34ebc289a145
# ╟─05592ea9-888e-4c2e-8692-c9be4e2dc471
# ╟─5d412238-76b3-4a7d-85ce-a3739a37722d
# ╟─53043546-80c8-44af-8d0e-dd22e7710f2e
# ╟─11d415a4-8676-49c5-a1ba-e0b3f2ff7ab9
# ╟─9fcbaf54-947b-4110-990f-502d05d26d9c
# ╟─3904dcb6-cb55-4b70-bba4-a59217af32eb
# ╟─93f36425-2548-4aea-9356-3b07cae062f7
# ╟─bad5a796-caff-4809-a922-16a9ffe27f4e
# ╟─d97c203d-3012-4582-b104-b3c35b2823b1
# ╟─61061304-2966-49c5-aedd-5808f40f8fbd
# ╟─ab05bdde-ede8-44b8-b052-4403a7c7fac0
# ╟─49277a93-ad29-4699-9eb0-2c906f832773
# ╟─d2c36a0d-fafe-4a47-81f9-3cfec40e0123
# ╟─c9167d6f-226b-47d8-9608-67a66a403733
# ╟─f74dfe19-9655-4b10-8bd5-cf29bc84da25
# ╟─09f13dd4-517e-41cd-8ae7-61c8b48110eb
# ╟─5c4ac7a6-5a3a-43f6-91f2-641563b0ba28
# ╟─49264001-f108-4e6e-a521-f0fa1feb2d9f
# ╟─f4f83e7e-13a3-482f-8eb1-8d71772f0bb7
# ╟─b9ee16aa-6088-4d10-bfb5-9f4ad7e232a7
# ╟─9fe3b5f8-8c5d-4708-8c74-c8bd2ec9bdcf
# ╟─29c304eb-b000-493d-ab12-c1a5950e7eb8
# ╟─86de1747-3e88-48ab-8794-d9a6301f567a
# ╟─a9155998-4973-49a8-b3b0-5a39510c4705
# ╟─e1ba66bd-8eda-485f-9025-73db77f7d4b0
# ╟─f854b9b6-5d04-4742-ade5-2c6575e08da7
# ╟─14cca674-80b1-449e-bfc8-5bbda0a82757
# ╟─c1124f92-31f5-4f2b-8d5c-e0644cf3e499
# ╟─3ea5d319-6867-421c-b71d-a387c98ad074
# ╟─8c955690-06f7-446b-8d22-de24b15674e5
# ╟─b3321da3-cf70-47f7-a6d0-0a0004133c6a
# ╟─d11398c5-203f-42ce-92ff-8c089fcc913b
# ╟─255e2123-a847-493e-930f-c0e45fed6501
# ╟─3be70aeb-7acf-4959-be2d-95382bfc545f
# ╟─8becfd39-59d9-49fe-8d1d-56312299053f
# ╟─1cfa45e3-08c3-4cb4-8819-4455b86b509a
# ╟─48736d40-ab43-4c86-8fdf-80c6057b314c
# ╟─8a3c50b1-2b67-494d-abda-4ad1af0d2a8e
# ╟─85ac0c5e-003e-42ed-8434-005340f032ca
# ╟─1ddd485b-4fa4-4430-8462-0fbe4d3538f1
# ╟─ca811418-280b-4b82-ac3e-aae1e9d26a8c
# ╟─00331799-28b8-4d5d-b9dc-12ead2d7013d
# ╟─864faae4-654e-48ad-baab-cd57ed2452ee
# ╟─1b35fc01-ee3f-4ce3-82cc-faf873146f79
# ╟─40d7d299-f4d5-4c15-bfd3-92762b343a02
# ╟─8947fcd0-e150-4c77-a879-417b08238a34
# ╟─811c8d1c-fa4b-41fa-8892-4195d7aad2c4
# ╟─10a0f292-a438-45af-bb15-b8c4649e24fa
# ╟─1d3d18d8-fb36-4f3c-9e23-b453d5964b8c
# ╟─90e5fd02-f475-49d9-a310-ef5de8bf4701
# ╟─54742983-527f-418a-a462-e40c444020cd
# ╟─e04f8520-6ec2-44f9-b02a-0ce43e861b52
# ╟─f9d603db-17d0-45b2-b2a9-4116bcc27fb4
# ╟─f246fdcb-5ded-4cee-83ce-78387ef9c9c2
# ╟─ab5a03e0-9911-424c-8efa-cf611f9dd18a
# ╟─7915e12a-c0ab-42c1-82cd-c2a6465be0dc
# ╟─7c19e3b7-3d94-44ee-9cb3-6752d726f0d0
# ╟─cd030ebb-66f2-4458-bbd3-044527cc0ad0
# ╟─fff45fe1-6d43-4a21-b6fc-535dc7d7e7df
# ╟─da687caf-1d9d-48c6-b968-f8b94c04fb4a
# ╟─98ea659b-e541-4da6-8861-e7910ad77141
# ╟─dcde3bcc-b17e-4fd4-88a6-a2b96766b701
# ╟─e2c034c0-1ae8-49e7-aafb-98b730897b29
# ╟─eddcf22e-894c-4899-8fc4-248c8d772369
# ╟─638e2305-b212-4f88-97df-94140636b55d
# ╟─0fd0f022-ff7c-4b3e-8ac7-be8dc53fb7ad
# ╠═becfe1e6-6c29-47e0-b801-7803f415d9a2
# ╟─110399b7-562b-4c69-a4fd-68570593c2f0
# ╟─b2de5c46-630b-4c21-8ad1-56f264b491b2
# ╟─fbaaebca-280b-490b-aafd-90620900cb79
# ╟─5898db1c-42d2-4847-b4be-96f4126aa415
# ╟─b1a6798c-cb20-4ec9-a956-1c4c2b9f21d1
# ╟─e78fb658-89ef-46f1-8323-3fde6081e12c
# ╟─f82a0101-8633-4923-9076-5d9456b411d7
# ╟─5e68ebcf-3470-4ea8-b210-083f3d99ba11
# ╟─bebe9cd0-bf21-466a-93a8-a76aab4af947
# ╟─9128b0f4-7163-4966-9a61-f7866b9c887b
# ╟─e6141536-3ef2-44aa-a5a0-50333d26dbc2
# ╟─6d835be9-0982-4018-85dc-bef464d7f797
# ╟─c36bf58a-3a8e-4fb9-a3f5-20d467e2583c
# ╟─e8a89f57-70a0-4561-98cb-e099cd4da304
# ╟─f4ab97e5-753b-4882-a89a-05b74b4459c4
# ╟─d096d68b-baa0-4aa4-81df-5a7eee3d314b
# ╟─a78f527d-759f-4c45-b77d-105be9e3f504
# ╟─ce1b411a-b0a5-4650-b372-7ff12c64aa5f
# ╟─798c1082-30c7-4894-96d0-a3f1ff201990
# ╟─ad07b19c-13a4-4448-8bbb-bb9f5fa8cf4e
# ╟─27fb4c3d-ab15-4311-90d2-e74a1dc2c7d9
# ╟─2836145c-67b9-4196-a7da-5908f852c762
# ╟─1649449c-e27a-4483-8c2b-7f5ac7545eb1
# ╟─4dce4ea1-695a-4d8a-9da2-b726cedcc6fd
# ╟─90b0eba3-8ad9-434c-9b4b-7e777c21a031
# ╟─79752e0b-994f-4a56-bc4d-9120884491e0
# ╟─f46591ff-fd99-4e28-886c-0fd0055cd7fc
# ╟─d53c038f-147e-4146-bb0f-f3ae966fac46
# ╟─4ceb8497-cc1c-4e9b-bbbf-bfcd734a76af
# ╟─3b250ee8-bbde-4e7b-adcc-3f27dc992cc9
# ╟─21e29232-41ce-480e-b3bc-ae41308f9572
# ╟─92e3b542-44e0-4e7a-bab9-c6f0d8515ba0
# ╟─2cd4e968-3b6a-4471-b0e0-08aab72dc43b
# ╟─eb65f1d9-ee16-4aea-9030-64977e08b054
# ╟─6bbf0b8e-4cd6-4da4-8dd9-53d19ec416f1
# ╟─919f070e-04f7-40ab-affa-3a66aff311c6
# ╟─764d80e1-8973-46ee-8683-086c87ac94c3
# ╟─16d494d8-5cc0-4420-968c-941617a847e1
# ╟─ef464793-ba4e-42a9-a684-d6e84475c537
# ╟─982fef18-6122-492e-8e10-b63387fdb668
# ╟─fab4943a-cf0b-48aa-8aec-06cf9487e7fe
# ╟─1c6a4b21-95f1-40ab-8d48-24c2e9ef6605
# ╟─c7084842-feea-4d2f-9dd4-9e0dd5742070
# ╟─79f5961a-4abd-4124-9b7e-7128cd41d22e
# ╟─d3c697c0-ae92-489c-95f9-ef904411db4b
# ╟─ceca0772-8cb6-4a65-9590-37b687f9b850
# ╟─36805642-6937-49e2-8fbe-308fe6092054
# ╟─e0693afe-74e0-4890-abf4-9af21a6ec0e6
# ╟─12620ea6-1601-4fa5-8f23-8ae63c3d15c6
# ╟─e09b8502-b0b7-45b5-8183-5f6f58ec22f9
# ╟─64044115-36c4-487d-9099-7d336fd502e2
# ╟─b0c86911-4f87-446f-b5fa-080620cdf9c6
# ╟─3b71a004-97cb-4083-83ea-f56ae6c317b1
# ╟─ae36a78f-8cee-4e4b-89a5-f404ae3fbf9b
# ╟─4b82921b-258a-4837-9d9b-a52ea884e582
# ╟─a4132ece-8ec3-4258-97d3-bcc915c106b4
# ╟─ad5231f9-9c09-4245-90d3-931e79b62b6c
# ╟─741a987a-7d31-4f68-8f9a-16245998b773
# ╟─dadb74e5-dedb-4330-83fe-63c127a98e99
# ╟─22c2d6b7-843c-48b0-b0af-9c90cbe0a47b
# ╟─9d2cf046-ef3c-4e33-828b-bcf6c6576e97
# ╟─75863ad3-783a-4fc8-b5bc-254c8cb4b728
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
