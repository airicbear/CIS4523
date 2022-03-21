### A Pluto.jl notebook ###
# v0.18.1

using Markdown
using InteractiveUtils

# ╔═╡ 885a1116-a123-4fb7-a8c9-86824b890e49
begin
	using DataFrames
	using StatsBase
	using CSV
	using PlutoUI
end

# ╔═╡ dbb3267e-8e90-11ec-1bac-f1b8da04e4e5
md"""
# Assignment 4

- Name: Eric Nguyen

- TUID: 915786865
"""

# ╔═╡ 73527311-40b3-442c-8c02-871e7386b10b
donordf = let	
	name = ["Nancy", "Jim", "Allen", "Jane", "Steve", "Peter", "Sayani", "Lata", "Mary", "Victor", "Dale"]
	age = [21, 27, 43, 38, 44, 51, 53, 56, 59, 61, 63]
	salary = [37000, 41000, 61000, 55000, 30000, 56000, 70000, 74000, 25000, 68000, 51000]
	donor = [false, false, true, false, false, true, true, true, false, true, true]
	
	df = DataFrame(name=name, age=age, salary=salary, donor=donor)
end

# ╔═╡ 9be6a024-5963-479e-b702-3af5891003c0
md"""
## Problem 1
"""

# ╔═╡ 33b3ef2e-796d-48b0-83d5-83038d7f8f45
md"### Problem 1(a)"

# ╔═╡ e765ff94-867b-4748-bf6f-8332a1dd57d0
"""
```
hascolumn(df::DataFrame, column)
```

Check if the DataFrame `df` has some column `column`.
"""
hascolumn(df::DataFrame, column) = column ∈ propertynames(df) || column ∈ names(df)

# ╔═╡ 4143901b-f8fb-4dcc-9a2b-df47f6983803
begin
	"""
	```
	features(df::DataFrame, ignore=[])
	```
	
	Get all features from a DataFrame excluding the columns specified in `ignore`.
	"""
	features(df::DataFrame, ignore=[]) = filter(col -> col ∉ ignore, propertynames(df))
	features(df::DataFrameRow, ignore=[]) = filter(col -> col ∉ ignore, propertynames(df))
end

# ╔═╡ 05a53090-aa05-4f33-98fb-e0090fc500c2
"""
```
entropy(df::DataFrame, column)
```

Calculate the entropy of a DataFrame `df` given an attribute `column` where the entropy at some node ``t`` is given by

``\\displaystyle \\text{Entropy} = -\\sum_{i=0}^{c-1} p_i(t) \\log_2{p_i(t)}``

where ``p_i(t)`` is the probability of the ``i``th class at node ``t`` and ``c`` is the total number of classes.
We make the assumption that ``0 \\log_2{0} = 0``.
"""
function entropy(df::DataFrame, column)
	N = size(df,1)
	if N < 1 || !hascolumn(df, column)
		return 0
	end
	return -sum([n == 0 ? 0 : (n/N) * log(2, n/N) for (class, n) ∈ countmap(df[!,column])])
end

# ╔═╡ 73403255-a455-44df-852a-79450735adb2
"""
```
Δinfo(df::DataFrame, target, feature)
```

Calculate the information gain ``Δ_{\\text{info}}`` for the attribute `feature` of a DataFrame `df` given the target attribute `target` of the DataFrame where

``Δ_{\\text{info}} = I(\\text{parent}) - I(\\text{children})``

where ``I`` represents the impurity of a node.
"""
function Δinfo(df::DataFrame, target, feature)
	N = size(df, 1)
	if N < 1 || !hascolumn(df, target)
		return 0
	end
	weightedentropy = sum([(n / N) * entropy(df[df[!,feature] .== val,:], target) for (val, n) ∈ countmap(df[!,feature])])
	return entropy(df, target) - weightedentropy
end

# ╔═╡ c72b5b8f-0af8-49bf-9a03-c2d335975841
"""
```
findsplitfeature(df::DataFrame, target)
```

Find the best feature of a DataFrame `df` with a target attribute `target` to use as the splitting condition.
"""
function findsplitfeature(df::DataFrame, target)
	return maximum([feature => Δinfo(df, target, feature) for feature ∈ features(df, [:id, :name, target])]).first
end

# ╔═╡ 495b902d-09f9-472d-9da9-662fb627436b
"""
```
decisiontree(df::DataFrame, df0::DataFrame, target, ignore, rootclass=missing)
```

Build a decision tree on a DataFrame `df` using the ID3 algorithm.
"""
function decisiontree(df::DataFrame, df0::DataFrame, target, ignore, rootclass=missing)
	counts = if eltype(df[!,target]) <: Bool
		counts = filter(kv -> kv.second != 0, countmap(df[!,target]))
	else
		countmap(df[!,target])
	end
	
	# Stopping criteria
	if length(counts) == 1
		return first(counts).first
	elseif isempty(df)
		return maximum(countmap(df0[!,target])).first
	elseif isempty(features(df, ignore))
		return rootclass
	else
		# Splitting criteria
		rootclass = maximum(countmap(df[!,target])).first
		opt = findsplitfeature(df, target)
		root = Dict([opt => Dict()])
		for val ∈ Set(df[!,opt])
			childdf = select!(dropmissing(df[df[!,opt] .== val, :]), Not(opt))
			root[opt][val] = decisiontree(childdf, df0, target, ignore, rootclass)
		end
		return root
	end
end

# ╔═╡ 4727efc9-6738-48bc-89e6-bb6983b22d33
"""
```
finddiscretization(df::DataFrame, target, feature)
```

Find the best condition to use for binary discretization of a numerical attribute `feature` in a DataFrame `df` with a target attribute `target`.
"""
function finddiscretization(df::DataFrame, target, feature)
	df = df
	sorteddf = sort(df, feature)

	# Find midpoints
	midpoints = [df[!,feature][i] + (df[!,feature][i + 1] - df[!,feature][i]) / 2 for i ∈ 1:(length(df[!,feature])-1)]

	# The entropies for each midpoint
	entropies = Dict([midpoint => entropy(df[df[!,feature] .> midpoint,:], target) for midpoint ∈ midpoints])

	# Take the lowest nonzero impurity
	(impurity, split) = findmin(filter(x -> x.second ≠ 0, entropies))
	
	return split
end

# ╔═╡ 3536604b-8494-4119-847c-45310d66dd37
"""
```
discretize(df::DataFrame, target, ignore)
```

Discretize the numerical features of a DataFrame `df` with a target attribute `target` excluding the columns specified in `ignore`.
"""
function discretize(df::DataFrame, target, ignore)
	copydf = copy(df)
	for feature ∈ features(copydf, ignore)
		col = copydf[!,feature]
		if eltype(col) <: Number
			col .= col .> finddiscretization(copydf, target, feature)
		end
	end
	copydf
end

# ╔═╡ 75e37b99-3434-4638-a9e2-dc2fc2ec3498
begin
	"""
	```
	predict(test::DataFrameRow, tree::Dict, ignore=[])
	predict(test::DataFrame, tree::Dict, ignore=[])
	```
	
	Make a prediction on `test` using a decision tree `tree` ignoring columns specified in `ignore`.
	"""
	function predict(test::DataFrameRow, tree::Dict, ignore=[], default=true)
		result = nothing

		# Predict current node
		for feature ∈ features(test, ignore)
			if feature ∈ keys(tree)
				result = try
					tree[feature][test[feature]]
				catch e
					default
				end
			end
		end

		# Predict next node
		if typeof(result) <: Dict
			return predict(test, result, ignore)
		end
	
		return result
	end

	# Predict entire DataFrame test set
	function predict(tests::DataFrame, tree::Dict, ignore=[], default=true)
		[predict(test, tree, ignore) for test ∈ eachrow(tests)]
	end
end

# ╔═╡ dac1625d-8319-4e34-a72d-a0dd64c4cf5b
md"""
#### Donor dataset classification results
"""

# ╔═╡ 94727c08-f1ca-44cc-a081-6c11f9f49432
let
	target = :donor
	ignore = [:id, :name, target]

	# Discretize the dataset
	df = discretize(donordf, target, ignore)

	# Apply leave-one-out training
	train = df[1:end-1,:]
	tree = decisiontree(train, train, target, ignore)
	predictions = [predict(df[i,:], tree, ignore) for i ∈ 1:size(df,1)]

	# Calculate accuracy of model
	success = predictions .== df[!,target]
	failure = predictions .!= df[!,target]

	:accuracy => sum(success) / (sum(success) + sum(failure))
end

# ╔═╡ fc39d1c2-a33c-4eed-a611-3bd445e18644
md"""
**Results 1(a).** My decision tree classification of the Donor dataset had an accuracy of

$\text{Accuracy} = 91\%$
"""

# ╔═╡ dcd99952-0624-470d-ae0f-e8bbec160c29
md"### Problem 1(b)"

# ╔═╡ 20c70d79-86f3-4603-ba07-5efc52fa0f82
mushroomdf = let
	mushroomdf = CSV.read("data/mushrooms.csv", DataFrame)
	mushroomdf.id = 1:size(mushroomdf,1)
	mushroomdf
end

# ╔═╡ ecd7027d-3f75-4e8f-a9a9-4a97c17e0e57
function kfold(df::DataFrame, k)
	splits = round.(Int, range(1, size(df, 1), length=k))
	folds = Dict([splits[i-1]:splits[i] => df[splits[i-1]:splits[i], :] for i ∈ 2:length(splits)])

	for fold ∈ folds
		fold.second.id .= fold.first
	end

	folds
end

# ╔═╡ 8f97ccab-9b38-4a93-88ea-4efb9dac910a
md"#### Mushroom dataset classification results"

# ╔═╡ 2a906f3f-efd0-4403-9774-30f0e3cf02b0
let
	target = :class
	ignore = [:id]
	predictions = Dict([])
	errors = []

	# Discretize the dataset
	df = discretize(mushroomdf, target, ignore)

	# Apply 10-fold partition
	partitions = kfold(df, 10)

	# Make predictions for each partition
	for partition ∈ partitions
		(fold, set) = partition
		train = filter(x -> x.id ∉ fold, df)
		test = df[fold, :]
		tree = decisiontree(train, train, target, ignore)
		predictions[fold] = predict(test, tree, ignore)
	end

	# Calculate the error for each partition prediction
	for prediction ∈ predictions
		error = sum(prediction.second .!= df[prediction.first,:].class) / size(prediction.second,1)
		push!(errors, error)
	end

	# Calculate the total error
	:err => sum(errors)
end

# ╔═╡ f3b4a40d-36f6-4212-b1db-8064f27c4d05
md"""
**Results 1(b).** The classifier obtains an error of 0% for the mushroom dataset.
In other words, the classifer has 100% accuracy on the mushroom dataset,

$\text{Accuracy} = 100\%$
"""

# ╔═╡ 0d01d1ca-1afd-4b3c-a935-6f0c8b3f52de
md"### Problem 1(c)"

# ╔═╡ a0dc8c7a-b874-4fae-8470-ae935a5becd5
let
	target = :class
	ignore = [:id]

	# Discretize the dataset
	df = discretize(mushroomdf, target, ignore)

	function accuracy(df, trainN)
		# Take sample rows
		samplerows = sample(1:nrow(df), trainN, replace=false)

		# Define training and testing data
		train = df[samplerows,:]
		test = filter(x -> x.id ∉ samplerows, df)

		# Build decision tree
		tree = decisiontree(train, train, target, ignore)

		# Make predictions on test data
		predictions = predict(test, tree, ignore)

		# Calculate the accuracy of the classifer
		sum(predictions .== test.class) / length(predictions)
	end

	:accuracy500 => accuracy(df, 500), :accuracy5000 => accuracy(df, 5000)
end

# ╔═╡ 75efc039-d9ea-4713-a320-9169f16e5cb6
md"""
**Results 1(c).** The accuracy is better when we use 5000 training examples compared to using only 500 training examples.
"""

# ╔═╡ 6032f328-e750-46c0-9ad1-32d96cb3a5c7
md"### Problem 1(d)"

# ╔═╡ eb757dc2-cf7a-4548-87bf-ac35ae85dbc9
"""
```
countleaves(tree::Dict)
```

Utility method to count number of leaves in `tree`.
"""
function countleaves(tree::Dict)
	count = 0
	
	for pair ∈ tree
		if !(typeof(pair.second) <: Dict)
			count += 1
		else
			count += countleaves(pair.second)
		end
	end

	return count
end

# ╔═╡ b2d5d917-aec4-4dd4-ab3f-6e4a69bf0a03
"""
```
prune(tree, n, default)
```

Naïve pruning algorithm that simply replaces nodes with `default`.
Pruned trees have at most `n` leaves.
"""
function prune(tree, n, default)
	if countleaves(tree) ≤ n
		return tree
	end

	count = 0
	stack = []
	push!(stack, first(tree))

	while !isempty(stack) && countleaves(tree) != n
		next = pop!(stack)
		
		if typeof(next.second) <: Dict
			for pair ∈ next.second
				count += 1

				if count ≥ n && typeof(next.second[pair.first]) <: Dict{Symbol, Dict{Any, Any}}
					next = convert(Pair{Any, Dict{Any, Any}}, next)
					next.second[pair.first] = default
				end
				
				push!(stack, pair.first => next.second[pair.first])
			end
		end
	end
	
	return tree
end

# ╔═╡ 742f0075-e222-4c97-993e-2ac510a5b63e
p1d = let
	target = :class
	ignore = [:id]

	# Discretize the dataset
	df = discretize(mushroomdf, target, ignore)

	trainN = size(df,1) ÷ 2
	
	# Take sample rows
	samplerows = sample(1:nrow(df), trainN, replace=false)

	# Define training and testing data
	train = df[samplerows,:]
	test = filter(x -> x.id ∉ samplerows, df)

	function prunetree(n)
		# Build decision tree
		tree = decisiontree(train, train, target, ignore)
		tree = convert(Dict{Any, Union{Dict, Any}}, tree)
		default = last(findmax(countmap(df[!,target])))
		prunedtree = prune(tree, n, default)
	end
	
	function accuracy(tree)
		# Make predictions on test data
		predictions = predict(test, tree, ignore)
	
		# Calculate the accuracy of the classifer
		sum(predictions .== test.class) / length(predictions)
	end

	prunetree10 = prunetree(10)
	prunetree30 = prunetree(30)

	:prune10 => (prunetree10, accuracy(prunetree10)), :prune30 => (prunetree30, accuracy(prunetree30))
end

# ╔═╡ 9f340ab3-b80d-4e67-8675-346161528fea
md"""
**Results 1(d).** The accuracy on the 10 leaf decision tree is ≈ $(round(last(p1d[1].second), digits=3) * 100)%.
The accuracy on the 30 leaf decision tree is ≈ $(round(last(p1d[2].second), digits=3) * 100)%.

Unfortunately I was unable to produce a correct pruning algorithm.
"""

# ╔═╡ 31fb7e0c-683c-44e7-8e7e-6208eeaaae91
md"""
### Problem 1(e)
"""

# ╔═╡ 176dd88a-0d71-4f42-b63c-18fa4221f6e1
function printtree(tree)
	for pair ∈ tree
		if typeof(pair.second) <: Dict
			println(pair.first)
			printtree(pair.second)
		end
	end
end

# ╔═╡ 8a2b3c2d-e6cd-4866-98f2-dd857917881e
md"""
**Results 1(e).**
"""

# ╔═╡ 8eb16d76-5175-4ef9-84d2-434a9ab96d5c
with_terminal() do
	tree = first(p1d[1].second)

	printtree(tree)
end

# ╔═╡ 1a5a51d4-4de6-4ab1-a06a-6e12a8e85f25
md"### Problem 1(f)"

# ╔═╡ ae789fea-47ac-40c3-b2db-00f4ac422f35
function counts(df, tree, property=nothing, visited=[])
	count = size(df, 1)
	for pair ∈ tree
		if typeof(pair.second) <: Dict
			if pair.first ∈ propertynames(df)
				for prop ∈ Set(df[!,pair.first])
					if prop ∈ keys(pair.second)
						nextdf = df[df[!,pair.first] .== prop, :]
						numpositive = sum(nextdf.class .== "e")
						numnegative = sum(nextdf.class .== "p")
						if prop ∉ visited
							println(pair.first => prop => (:pos => numpositive, :neg => numnegative))
							push!(visited, prop)
						end
						counts(df[df[!,pair.first] .== prop, :], tree[pair.first], prop, visited)
					end
				end
			else
				counts(df, tree[pair.first], property, visited)
			end
		end
	end
end

# ╔═╡ 782ea6c6-05c7-43ba-aaeb-df724d4f1c72
md"""
**Results 1(f).**
"""

# ╔═╡ 1dc99b20-9806-44ea-87ef-e36abca8c9eb
with_terminal() do
	tree = first(p1d[1].second)
	counts(mushroomdf, tree)
end

# ╔═╡ 55245add-b02e-439c-9dfa-fc99ff0be2cf
md"""
## Problem 2

I am an undergraduate student.
"""

# ╔═╡ 4a9ff3e9-223a-4c48-9ec1-c0011c2e83a5
md"""
## Problem 3

I would prefer **classifier A** because the results indicate that it has a better generalization performance as it performed better in the 10-fold cross-validation despite it performing lower in the 100-fold cross-validation.
Additionally, the 100-fold cross-validation typically isn't a reasonable measurement since it overfits to the training data and has few testing data to compare against.
"""

# ╔═╡ 643c6bd4-721b-49d0-ba95-63f3b20e72dd
md"""
## Problem 4

The **advantages** of a nearest neighbor classifier over decision trees include:

- Better flexibility in predicting new information outside of training set

- Ability to produce decision boundaries of arbitrary shape

The **disadvantages** of nearest neighbor classifier over decision trees include:

- They are more computationally expensive due to the lack of a precomputed model

- Challenges dealing with missing values from inconsistent proximity measures

- Challenges dealing with irrelevant and redundant attributes affecting proximity measures

- Requires good choice of proximity measure and good data preprocessing

- Training data must be stored
"""

# ╔═╡ 62b53186-d319-4f50-a33e-37ff9c6fccea
md"""
## Acknowledgements

- Inspiration for ID3 algorithm: [https://guillermoarriadevoe.com/blog/building-a-id3-decision-tree-classifier-with-python](https://guillermoarriadevoe.com/blog/building-a-id3-decision-tree-classifier-with-python)
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
CSV = "~0.10.2"
DataFrames = "~1.3.2"
PlutoUI = "~0.7.34"
StatsBase = "~0.33.15"
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

[[deps.CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "InlineStrings", "Mmap", "Parsers", "PooledArrays", "SentinelArrays", "Tables", "Unicode", "WeakRefStrings"]
git-tree-sha1 = "9519274b50500b8029973d241d32cfbf0b127d97"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.10.2"

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

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

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

[[deps.FilePathsBase]]
deps = ["Compat", "Dates", "Mmap", "Printf", "Test", "UUIDs"]
git-tree-sha1 = "04d13bfa8ef11720c24e4d840c0033d145537df7"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.17"

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

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "61feba885fac3a407465726d0c330b3055df897f"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.1.2"

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
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

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
git-tree-sha1 = "13468f237353112a01b2d6b32f3d0f80219944aa"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.2"

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

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "6a2f7d70512d205ca8c7ee31bfa9f142fe74310c"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.12"

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
git-tree-sha1 = "118e8411d506d583fbbcf4f3a0e3c5a9e83370b8"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.15"

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

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "c69f9da3ff2f4f02e811c3323c22e5dfcb584cfa"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.1"

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
# ╟─dbb3267e-8e90-11ec-1bac-f1b8da04e4e5
# ╠═885a1116-a123-4fb7-a8c9-86824b890e49
# ╟─73527311-40b3-442c-8c02-871e7386b10b
# ╟─9be6a024-5963-479e-b702-3af5891003c0
# ╟─33b3ef2e-796d-48b0-83d5-83038d7f8f45
# ╠═e765ff94-867b-4748-bf6f-8332a1dd57d0
# ╠═4143901b-f8fb-4dcc-9a2b-df47f6983803
# ╠═05a53090-aa05-4f33-98fb-e0090fc500c2
# ╠═73403255-a455-44df-852a-79450735adb2
# ╠═495b902d-09f9-472d-9da9-662fb627436b
# ╠═c72b5b8f-0af8-49bf-9a03-c2d335975841
# ╠═4727efc9-6738-48bc-89e6-bb6983b22d33
# ╠═3536604b-8494-4119-847c-45310d66dd37
# ╠═75e37b99-3434-4638-a9e2-dc2fc2ec3498
# ╟─dac1625d-8319-4e34-a72d-a0dd64c4cf5b
# ╠═94727c08-f1ca-44cc-a081-6c11f9f49432
# ╟─fc39d1c2-a33c-4eed-a611-3bd445e18644
# ╟─dcd99952-0624-470d-ae0f-e8bbec160c29
# ╟─20c70d79-86f3-4603-ba07-5efc52fa0f82
# ╠═ecd7027d-3f75-4e8f-a9a9-4a97c17e0e57
# ╟─8f97ccab-9b38-4a93-88ea-4efb9dac910a
# ╠═2a906f3f-efd0-4403-9774-30f0e3cf02b0
# ╟─f3b4a40d-36f6-4212-b1db-8064f27c4d05
# ╟─0d01d1ca-1afd-4b3c-a935-6f0c8b3f52de
# ╠═a0dc8c7a-b874-4fae-8470-ae935a5becd5
# ╟─75efc039-d9ea-4713-a320-9169f16e5cb6
# ╟─6032f328-e750-46c0-9ad1-32d96cb3a5c7
# ╠═eb757dc2-cf7a-4548-87bf-ac35ae85dbc9
# ╠═b2d5d917-aec4-4dd4-ab3f-6e4a69bf0a03
# ╠═742f0075-e222-4c97-993e-2ac510a5b63e
# ╟─9f340ab3-b80d-4e67-8675-346161528fea
# ╟─31fb7e0c-683c-44e7-8e7e-6208eeaaae91
# ╠═176dd88a-0d71-4f42-b63c-18fa4221f6e1
# ╟─8a2b3c2d-e6cd-4866-98f2-dd857917881e
# ╠═8eb16d76-5175-4ef9-84d2-434a9ab96d5c
# ╟─1a5a51d4-4de6-4ab1-a06a-6e12a8e85f25
# ╠═ae789fea-47ac-40c3-b2db-00f4ac422f35
# ╟─782ea6c6-05c7-43ba-aaeb-df724d4f1c72
# ╠═1dc99b20-9806-44ea-87ef-e36abca8c9eb
# ╟─55245add-b02e-439c-9dfa-fc99ff0be2cf
# ╟─4a9ff3e9-223a-4c48-9ec1-c0011c2e83a5
# ╟─643c6bd4-721b-49d0-ba95-63f3b20e72dd
# ╟─62b53186-d319-4f50-a33e-37ff9c6fccea
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
