### A Pluto.jl notebook ###
# v0.17.7

using Markdown
using InteractiveUtils

# ╔═╡ 54c99b2a-8542-11ec-3200-1f9fa2aee3f6
md"# Feb 3"

# ╔═╡ 08bc6eed-aeb2-4f01-8210-c64b65888e82
md"""
### Challenges of sampling

- CONCEPT DRIFT

- ONE PASS CONSTRAINT
"""

# ╔═╡ 59c5908e-aeb2-49a8-ae06-8b3e1d28879e
md"""
### Measures of Node Impurity

Gini index

$\text{GINI}(t) = 1 - \sum_j [p(j ∣ t)]^2$

Entropy

$\text{Entropy}(t) = -\sum_j p(j ∣ t) \log(p(j ∣ t))$

Misclassification error

$⋯$
"""

# ╔═╡ e04bc1f0-7b59-4d37-8ecd-c69694294bc6
md"""
### Finding the Best Split

1. Compute impurity measure (P) before splitting

2. Compute impurity measure (M) after splitting

   - Compute impurity measure of each child node

   - ...

3. ...
"""

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
# ╟─54c99b2a-8542-11ec-3200-1f9fa2aee3f6
# ╟─08bc6eed-aeb2-4f01-8210-c64b65888e82
# ╟─59c5908e-aeb2-49a8-ae06-8b3e1d28879e
# ╟─e04bc1f0-7b59-4d37-8ecd-c69694294bc6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
