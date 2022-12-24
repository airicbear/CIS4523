### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ bac3780e-7fd3-11ec-18ce-e35c15302eed
md"# Data Mining: The Textbook"

# ╔═╡ c6d07aff-d37f-4fa2-a470-735d255b0184
md"# An Introduction to Data Mining"

# ╔═╡ ae24f458-390c-4a7e-a7fd-5f4d1119999c
md"## Introduction"

# ╔═╡ c3290ad8-f180-4acd-919b-3e900698d21c
md"## The Data Mining Process"

# ╔═╡ f76bc41c-ca2a-4c24-b9cf-7c1525b2b820
md"## The Basic Data Types"

# ╔═╡ 4bcd374f-90f9-4631-ad59-a4dd02d9b9a8
md"## The Major Building Blocks: A Bird's Eye View"

# ╔═╡ de3d1371-f14a-4df4-a6c5-2c030a5cd9e2
md"## Scalability Issues and the Streaming Scenario"

# ╔═╡ e8528625-5668-4abf-843c-aeb759f2c7bc
md"## A Stroll Through Some Application Scenarios"

# ╔═╡ a23d859a-a403-4918-96f4-0d35aed32d02
md"## Summary"

# ╔═╡ 358158f5-4076-4ecd-bdb5-b7e47377d69c
md"# Data Preparation"

# ╔═╡ 4545689b-c5c8-4c40-8f86-49699c6850ec
md"## Introduction"

# ╔═╡ a363cbb5-18e6-495a-a468-2786255a7774
md"## Feature Extraction and Portability"

# ╔═╡ faff9652-5de5-40bc-95e9-5a937dbdb77d
md"## Data Cleaning"

# ╔═╡ 7eaab2c4-5db7-46c1-8d39-9591b70feac8
md"## Data Reduction and Transformation"

# ╔═╡ 5195333d-6824-4dd3-9f4e-510912f0f378
md"### Sampling"

# ╔═╡ 8a5ce91d-1de6-4043-8c9f-59273983a454
md"#### Sampling for Static Data"

# ╔═╡ 928c5608-3b8b-41b3-b4fa-ab667023e44f
md"#### Reservoir Sampling for Data Streams"

# ╔═╡ c996f7ce-a5e8-412e-89e0-b3bba7cb15b4
md"""
**Lemma 2.4.1**
After ``n`` stream points have arrived, the probability of any stream point being included in the reservoir is the same, and is equal to ``k / n``.
"""

# ╔═╡ d6cdb15d-905c-45ea-9cf0-392845848186
md"""
**Proof.**
This result is easy to show by induction.
An initialization of the first ``k`` data points, the theorem is trivially true.
Let us (inductively) assume that it is also true after ``(n - 1)`` data points have been received, and therefore the probability of each point being included in the reservoir is ``k / (n - 1)``.
The probability of the arriving point being included in the stream is ``k / n``, and therefore the lemma holds true for the arriving data point.
It remains to prove the result for the remaining points in the data stream.
There are two *disjoint* case events that can arise for an incoming data point, and the final probability of a point being included in the reservoir is the sum of these two cases:

1. The incoming data point is not inserted into the reservoir.
   The probability of this is ``(n - k)/n``.
   Because the original probability of any point being included in the reservoir by the inductive assumption, is ``k / (n - 1)``, the overall probability of a point being included in the reservoir and Case 1 event, is the multiplicative value of ``\displaystyle p_1 = \frac{k(n - k)}{n(n - 1)}``.

2. The incoming data point is inserted into the reservoir.
   The probability of Case 2 is equal to insertion probability ``k / n`` of incoming data points.
   Subsequently, existing reservoir points are retained with probability ``(k - 1)/k`` because exactly one of them is ejected.
   Because the inductive assumption implies that any of the earlier points in the data stream was originally present in the reservoir with probability ``k / (n - 1)``, it implies that the probability of a point being included in the reservoir and Case 2 event is given by the product ``p_2`` of the three aforementioned probabilities:

   $p_2 = \frac{k(k - 1)}{n(n - 1)}$
"""

# ╔═╡ dbcabd8f-4ff1-4c05-9372-6a8599f3ba3e
md"## Summary"

# ╔═╡ 5eab7e8c-86bd-4f79-b6a4-3ebd79f8888c
md"# Similarity and Distances"

# ╔═╡ 0bf9afcf-2c85-4612-b973-29ff35888822
md"## Introduction"

# ╔═╡ b371246e-4c35-463f-bf87-588eec1eefca
md"## Multidimensional Data"

# ╔═╡ 11a14a67-027c-4cce-974a-a5d3d9fdf0e4
md"## Text Similarity Measures"

# ╔═╡ c5944fd0-6e02-4d81-945d-15fd1df45aca
md"## Temporal Similarity Measures"

# ╔═╡ 741642fe-feb3-4e02-b9ac-29e9f29f9b9a
md"## Graph Similarity Measures"

# ╔═╡ 89ca81c9-ce5b-42ec-bfc5-715998a59019
md"## Supervised Similarity Functions"

# ╔═╡ d130cb20-8ab0-4619-8a4f-4f60677c9d4d
md"## Summary"

# ╔═╡ a6e012d6-ae5d-4564-b225-cce9971b63f9
md"# Association Pattern Mining"

# ╔═╡ 244a1272-f80a-4dbb-ad41-f8fba2607402
md"# Association Pattern Mining: Advanced Concepts"

# ╔═╡ 3133f9ea-b868-49a7-bb8f-679ce06fe961
md"# Cluster Analysis"

# ╔═╡ a579a297-336a-4063-8fba-974352386b98
md"# Cluster Analysis: Advanced Concepts"

# ╔═╡ e7b3702e-cb95-470f-a9ec-c5f0c6cf2033
md"# Outlier Analysis"

# ╔═╡ 73729fca-deb5-446c-984e-40b97d72194f
md"# Outlier Analysis: Advanced Concepts"

# ╔═╡ 356b0358-8301-49a3-8edc-4f13286eadb2
md"# Data Classification"

# ╔═╡ 5c28756b-b0d7-42d9-a708-702ccaa2e73a
md"# Data Classification: Advanced Concepts"

# ╔═╡ 31edabdd-7464-4427-a08d-0c94a83957cf
md"# Mining Data Streams"

# ╔═╡ 7b51859e-abbd-4abc-adca-ef9c16680cb5
md"# Mining Text Data"

# ╔═╡ 8db102a8-a3ac-484b-8ff0-71ed70d08b1b
md"# Mining Time Series Data"

# ╔═╡ 5db0df9b-cf60-4cbe-bb0b-20b454d078b8
md"# Mining Discrete Sequences"

# ╔═╡ 4befc1b6-b69a-4bc8-8dc3-afe8308b1409
md"# Mining Spatial Data"

# ╔═╡ 076f5062-5a00-4a38-98c4-c7cebdb0fe57
md"# Mining Graph Data"

# ╔═╡ c6af31a6-f389-41b1-9b9d-c0ef12fb3e5f
md"# Mining Web Data"

# ╔═╡ 718a2693-69c1-4d88-8e70-380630bc2922
md"# Social Network Analysis"

# ╔═╡ ce6cfaa3-8893-4a51-9d3c-eff8b77ff8b4
md"# Privacy-Preserving Data Mining"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─bac3780e-7fd3-11ec-18ce-e35c15302eed
# ╟─c6d07aff-d37f-4fa2-a470-735d255b0184
# ╟─ae24f458-390c-4a7e-a7fd-5f4d1119999c
# ╟─c3290ad8-f180-4acd-919b-3e900698d21c
# ╟─f76bc41c-ca2a-4c24-b9cf-7c1525b2b820
# ╟─4bcd374f-90f9-4631-ad59-a4dd02d9b9a8
# ╟─de3d1371-f14a-4df4-a6c5-2c030a5cd9e2
# ╟─e8528625-5668-4abf-843c-aeb759f2c7bc
# ╟─a23d859a-a403-4918-96f4-0d35aed32d02
# ╟─358158f5-4076-4ecd-bdb5-b7e47377d69c
# ╟─4545689b-c5c8-4c40-8f86-49699c6850ec
# ╟─a363cbb5-18e6-495a-a468-2786255a7774
# ╟─faff9652-5de5-40bc-95e9-5a937dbdb77d
# ╟─7eaab2c4-5db7-46c1-8d39-9591b70feac8
# ╟─5195333d-6824-4dd3-9f4e-510912f0f378
# ╟─8a5ce91d-1de6-4043-8c9f-59273983a454
# ╟─928c5608-3b8b-41b3-b4fa-ab667023e44f
# ╟─c996f7ce-a5e8-412e-89e0-b3bba7cb15b4
# ╟─d6cdb15d-905c-45ea-9cf0-392845848186
# ╟─dbcabd8f-4ff1-4c05-9372-6a8599f3ba3e
# ╟─5eab7e8c-86bd-4f79-b6a4-3ebd79f8888c
# ╟─0bf9afcf-2c85-4612-b973-29ff35888822
# ╟─b371246e-4c35-463f-bf87-588eec1eefca
# ╟─11a14a67-027c-4cce-974a-a5d3d9fdf0e4
# ╟─c5944fd0-6e02-4d81-945d-15fd1df45aca
# ╟─741642fe-feb3-4e02-b9ac-29e9f29f9b9a
# ╟─89ca81c9-ce5b-42ec-bfc5-715998a59019
# ╟─d130cb20-8ab0-4619-8a4f-4f60677c9d4d
# ╠═a6e012d6-ae5d-4564-b225-cce9971b63f9
# ╠═244a1272-f80a-4dbb-ad41-f8fba2607402
# ╠═3133f9ea-b868-49a7-bb8f-679ce06fe961
# ╠═a579a297-336a-4063-8fba-974352386b98
# ╠═e7b3702e-cb95-470f-a9ec-c5f0c6cf2033
# ╠═73729fca-deb5-446c-984e-40b97d72194f
# ╠═356b0358-8301-49a3-8edc-4f13286eadb2
# ╠═5c28756b-b0d7-42d9-a708-702ccaa2e73a
# ╠═31edabdd-7464-4427-a08d-0c94a83957cf
# ╠═7b51859e-abbd-4abc-adca-ef9c16680cb5
# ╠═8db102a8-a3ac-484b-8ff0-71ed70d08b1b
# ╠═5db0df9b-cf60-4cbe-bb0b-20b454d078b8
# ╠═4befc1b6-b69a-4bc8-8dc3-afe8308b1409
# ╠═076f5062-5a00-4a38-98c4-c7cebdb0fe57
# ╠═c6af31a6-f389-41b1-9b9d-c0ef12fb3e5f
# ╠═718a2693-69c1-4d88-8e70-380630bc2922
# ╠═ce6cfaa3-8893-4a51-9d3c-eff8b77ff8b4
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
