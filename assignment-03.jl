### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ a407578c-5081-4268-b686-06d3c7774615
begin
	using StatsBase
	using LinearAlgebra
	using DataFrames
	
	md"""
	# Assignment 3
	
	- Name: Eric Nguyen
	
	- TUID: 915786865
	"""
end

# ╔═╡ 369b6549-194c-4513-99cd-0382c6c8caf5
md"""
### Problem 1

Computing the proximity between two attributes is often simpler than computing the similarity between two objects because the values in two objects are derived from different attributes of which could have many different types whose similarities then need to be aggregated into one measure.
On the other hand, the values of attributes have uniform types such that comparing another attribute of the same type is a straightforward operation.
"""

# ╔═╡ 5bc1a171-2871-45c6-843f-81fc753a4193
md"""
### Problem 2
"""

# ╔═╡ 68f4481d-809a-4f86-8b61-062b48eeb8df
# Return word frequency vectors for two strings
function freqvecs(x::String, y::String)
	xtokens = split(strip(lowercase(x), ['.', ' ']), " ")
	ytokens = split(strip(lowercase(y), ['.', ' ']), " ")

	allwords = union(Set(xtokens), Set(ytokens))

	xcount = countmap(xtokens)
	ycount = countmap(ytokens)
	for word ∈ allwords
		if !haskey(xcount, word)
			xcount[word] = 0
		end
		
		if !haskey(ycount, word)
			ycount[word] = 0
		end
	end
	
	xvec = collect(values(xcount))
	yvec = collect(values(ycount))

	return (xvec, yvec)
end;

# ╔═╡ fef37151-7b28-4444-90af-bb58cc813381
function cos(x::String, y::String)
	xfreq, yfreq = freqvecs(x, y)
	return dot(xfreq, yfreq) / (norm(xfreq) * norm(yfreq))
end;

# ╔═╡ 09bcafcf-19d2-4c4d-8deb-4715f2158ef8
let
	x = "The sly fox jumped over the lazy dog."
	y = "The dog jumped at the intruder."

	xfreq, yfreq = freqvecs(x, y)
	cos(x, y), xfreq, yfreq
end

# ╔═╡ aad23450-d782-4f42-a867-22165015c057
md"""
The cosine measure between the two sentences is approximately 0.671.
"""

# ╔═╡ 861fe815-bc03-4b09-9a6b-f6622ee0456c
# Hint: see page 93
md"""
### Problem 3

Suppose we have a linear transformation ``T : [-1, 1] → [0, 1]``

In the case of time series clustering, we are not interested in negative correlation, so we can clamp negative values to be equal to zero, i.e.,

$T(x) = \begin{cases}
x &\text{if } x > 0 \\
0 &\text{otherwise}
\end{cases}$

In the case of a time series predicting another time series, both the negative and positive correlation matter so we may use an absolute value transformation, i.e.,

$T(x) = |x|$
"""

# ╔═╡ e111f99d-f0c7-4832-b067-a5e42af36906
md"""
### Problem 4

**(a).**
The **Jaccard similarity** would be more appropriate to measure the similarity between two species in terms of number of genes they share since it ignores ``0``--``0`` matches which aren't relevant in comparing species.
That is, we are interested in the genes that the species share, not what they don't share.

**(b).**
I would use the **Hamming distance** to compare the genetic makeup of two organisms of the same species considering that we would be interested in the differences between the genes and the Hamming distance is great at detecting differences in binary data.
"""

# ╔═╡ 0e36e0a3-dae6-4f27-962c-f018a55cfe97
md"""
### Problem 5
"""

# ╔═╡ 708a5e6e-e1ab-4bfd-adef-c22f31e944a1
df = let	
	name = ["Nancy", "Jim", "Allen", "Jane", "Steve", "Peter", "Sayani", "Lata", "Mary", "Victor", "Dale"]
	age = [21, 27, 43, 38, 44, 51, 53, 56, 59, 61, 63]
	salary = [37000, 41000, 61000, 55000, 30000, 56000, 70000, 74000, 25000, 68000, 51000]
	donor = [false, false, true, false, false, true, true, true, false, true, true]
	
	df = DataFrame(name=name, age=age, salary=salary, donor=donor)
end

# ╔═╡ cd8f822b-df81-48d2-8f29-de5b945387bd
# Compute the Gini index for the entire Donor data set
let
	count = countmap(df[!,:donor])
	c = sum(values(count))
	
	gini = 1 - sum([(x // c)^2 for (_, x) ∈ count])
end

# ╔═╡ 8ff99e2d-430a-4c1d-ac4b-43d0243782c0
df[df.age .≥ 50,:]

# ╔═╡ 7d63562e-ef5b-46d8-89b7-9ef907ac3130
# Compute the Gini index for the portion of the data set with age at least 50
let
	df = df[df.age .≥ 50,:]
	count = countmap(df[!,:donor])
	c = sum(values(count))
	
	gini = 1 - sum([(x // c)^2 for (i, x) ∈ count])
end

# ╔═╡ de7d453b-0118-42f0-81f2-d9a00ba9d548
md"""
The Gini index for the entire Donor data set, with respect to the two classes is

$1 - \left[\left(\frac{5}{11}\right)^2 + \left(\frac{6}{11}\right)^2\right] = \frac{60}{121} ≈ 0.496$

The Gini index for the portion of the data set with age at least 50 is

$1 - \left[\left(\frac{1}{6}\right)^2 + \left(\frac{5}{6}\right)^2\right] = \frac{5}{18} ≈ 0.278$
"""

# ╔═╡ 35533b10-3b87-47c7-8cf0-02fcadc4a2f9
md"""
### Problem 6
"""

# ╔═╡ 14090ec6-5a6d-4e43-a4c7-bb5a23a1b785
# Compute the entropy for the entire Donor data set
let
	count = countmap(df[!,:donor])
	c = sum(values(count))
	
	entropy = -sum([(x // c) * log(2, (x // c)) for (_, x) ∈ count])
end

# ╔═╡ 52926ee8-ab21-45c2-9863-4d8c86a57409
# Compute the entropy for the portion of the data set with age at least 50
let
	df = df[df.age .≥ 50,:]
	count = countmap(df[!,:donor])
	c = sum(values(count))
	
	entropy = -sum([(x // c) * log(2, (x // c)) for (_, x) ∈ count])
end

# ╔═╡ 0dc28504-274c-48b6-9582-46cd62126074
md"""
The entropy for the entire Donor data set, with respect to the two classes is

$-\left[\frac{5}{11} \log_2{\left(\frac{5}{11}\right)} + \frac{6}{11} \log_2{\left(\frac{6}{11}\right)}\right] ≈ 0.994$

The entropy for the portion of the data set with age at least 50 is

$-\left[\frac{1}{6} \log_2{\left(\frac{1}{6}\right)} + \frac{5}{6} \log_2{\left(\frac{5}{6}\right)}\right]≈ 0.650$
"""

# ╔═╡ a2461435-87a0-48eb-9b15-4451af5aa1d3
md"""
### Problem 7
"""

# ╔═╡ a709ce7a-df92-4129-8eb0-da60b4a32582
function gini(df::DataFrame, col::Symbol, cond::Any, classcol::Symbol)
	x = df[cond,:]
	count = countmap(x[!,classcol])
	c = sum(values(count))
	gini = 1 - sum([(x / c)^2 for (_, x) ∈ count])
end;

# ╔═╡ 7bf36da0-cf22-409f-9e99-f0b2c9134b21
# Binary split by salary
let
	sorteddf = sort(df, :salary)
	salary = sorteddf.salary
	midpoints = [salary[i] + (salary[i + 1] - salary[i]) / 2 for i ∈ 1:(length(sorteddf.salary)-1)]
	ginis = [midpoint => gini(df, :salary, df.salary .> midpoint, :donor) for midpoint ∈ midpoints]
end

# ╔═╡ 3b79cc70-6c91-4913-89d4-0aef5479bc1f
# Binary split by age
let
	sorteddf = sort(df, :age)
	age = sorteddf.age
	midpoints = [age[i] + (age[i + 1] - age[i]) / 2 for i ∈ 1:(length(sorteddf.age)-1)]
	ginis = [midpoint => gini(df, :age, df.age .> midpoint, :donor) for midpoint ∈ midpoints]
end

# ╔═╡ 0c284699-7ce0-422a-a06f-37e3a9ffc3c5
md"""
The binary split only makes sense for the age and salary columns since it doesn't make sense to split by names.
For salary, the minimum nonzero Gini index is when ``\text{Salary} > \$46,000`` and the minimum nonzero Gini index for age is when ``\text{Age} > 47.5 \text{ years old}``.
"""

# ╔═╡ 91fa45e3-952d-4218-9d9f-4301f5450be6
function accuracy(df::DataFrame, col::Symbol, bound::Any, class::Symbol)
	isdonor = df[df[!,col] .> bound,:]
	notdonor = df[df[!,col] .<= bound,:]
	f11 = sum(isdonor[!,class] .== true)
	f00 = sum(notdonor[!,class] .== false)
	f10 = sum(isdonor[!,class] .== false)
	f01 = sum(notdonor[!,class] .== true)
	accuracy = (f11 + f00) / (f11 + f10 + f01 + f00)
end;

# ╔═╡ eab681c7-a7a2-48d5-a996-0a466f1c5ff8
# Accuracy of salary split
accuracy(df, :salary, 46000, :donor)

# ╔═╡ f7d6b17c-7da5-47a3-b55e-ffa243c7b998
# Accuracy of salary split
accuracy(df, :age, 47.5, :donor)

# ╔═╡ 1176cde3-d178-466a-8c77-aac3d4de73e2
md"""
The best classification accuracy that can be obtained on the Donor dataset with a decision tree of depth 2 is the binary split where ``\text{Salary} > \$46,000`` which produces an accuracy of approximately ``91\%``.
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
StatsBase = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"

[compat]
DataFrames = "~1.3.2"
StatsBase = "~0.33.14"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

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

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

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

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

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
# ╟─a407578c-5081-4268-b686-06d3c7774615
# ╟─369b6549-194c-4513-99cd-0382c6c8caf5
# ╟─5bc1a171-2871-45c6-843f-81fc753a4193
# ╠═68f4481d-809a-4f86-8b61-062b48eeb8df
# ╠═fef37151-7b28-4444-90af-bb58cc813381
# ╠═09bcafcf-19d2-4c4d-8deb-4715f2158ef8
# ╟─aad23450-d782-4f42-a867-22165015c057
# ╟─861fe815-bc03-4b09-9a6b-f6622ee0456c
# ╟─e111f99d-f0c7-4832-b067-a5e42af36906
# ╟─0e36e0a3-dae6-4f27-962c-f018a55cfe97
# ╠═708a5e6e-e1ab-4bfd-adef-c22f31e944a1
# ╠═cd8f822b-df81-48d2-8f29-de5b945387bd
# ╠═8ff99e2d-430a-4c1d-ac4b-43d0243782c0
# ╠═7d63562e-ef5b-46d8-89b7-9ef907ac3130
# ╟─de7d453b-0118-42f0-81f2-d9a00ba9d548
# ╟─35533b10-3b87-47c7-8cf0-02fcadc4a2f9
# ╠═14090ec6-5a6d-4e43-a4c7-bb5a23a1b785
# ╠═52926ee8-ab21-45c2-9863-4d8c86a57409
# ╟─0dc28504-274c-48b6-9582-46cd62126074
# ╟─a2461435-87a0-48eb-9b15-4451af5aa1d3
# ╠═a709ce7a-df92-4129-8eb0-da60b4a32582
# ╠═7bf36da0-cf22-409f-9e99-f0b2c9134b21
# ╠═3b79cc70-6c91-4913-89d4-0aef5479bc1f
# ╟─0c284699-7ce0-422a-a06f-37e3a9ffc3c5
# ╠═91fa45e3-952d-4218-9d9f-4301f5450be6
# ╠═eab681c7-a7a2-48d5-a996-0a466f1c5ff8
# ╠═f7d6b17c-7da5-47a3-b55e-ffa243c7b998
# ╟─1176cde3-d178-466a-8c77-aac3d4de73e2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
