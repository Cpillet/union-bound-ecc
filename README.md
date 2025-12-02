# Union Bound for Error-Correction Codes

## Introduction

The **union bound** is a classical analytical tool used to upper-bound the error probability of error-correcting codes under various decoding strategies.

It provides a way to estimate the **frame error rate (FER)** or **bit error rate (BER)** without performing exhaustive simulations.

---

## General Principle

For a decoder that selects the closest codeword to the received vector, the union bound expresses that the probability of decoding error is at most the sum of the pairwise error probabilities:

$P_e \le \sum_{c \neq c_0} P\big( c \rightarrow c_0 \big)

where:

* (c_0) is the transmitted codeword,
* the sum is over all other codewords (c),
* (P(c \rightarrow c_0)) is the pairwise error probability between (c) and (c_0).

---

## For Linear Codes

For linear codes, we typically assume the all-zero codeword is sent, which simplifies analysis. The union bound becomes:

$P_e \le \sum_{w} A_w P_w$

where:

* ($A_w$) is the number of codewords of Hamming weight ($w$),
* ($P_w$) is the pairwise error probability of confusing the all-zero codeword with any codeword of weight ($w$).

---

## AWGN Channel Example

For binary antipodal modulation (e.g., BPSK), the pairwise error probability for Hamming weight (w) is:

$P_w = Q\left( \sqrt{2 w E_b / N_0} \right)$

The union bound becomes:

$P_e \le \sum_{w=1}^{n} A_w , Q\left( \sqrt{2 w R E_b / N_0} \right)$

---

## Practical Use

You typically need:

* The **weight enumerator** (A_w) of the code (analytically or computed).
* The channel condition ($E_b/N_0$).
* The rate $R=\frac{K}{N}$ of the code
* A way to evaluate the **Q-function** numerically.


---

## MATLAB Explanation

### MATLAB Script Description

main_union_bound.m is the script, in which you specify A_w, w, and the SNR. All can be vectors. If the SNR is a vector, then a vector of BLER is given. Union bound is computed with the function call of union_bound(A_w, w, SNR).
The BLER results is then plot with a log scale.

 
---

### MATLAB Functions

union_bound computes the truncated union bound given A_w, w and the specified SNR.


