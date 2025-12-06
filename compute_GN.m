function [GN] = compute_GN(n)
% n number of recursion (2^n=N the code length of the polar code)
% Provide the N\timesN matrix GN of polar codes based on the binary kernel.

GN=1;
G2 = [1 0 ; 1 1];
for i =1:n
    GN = kron(GN,G2);
end
end