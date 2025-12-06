% UNION BOUND DEMONSTRATION SCRIPT
% This script computes the union bound on the BLER for a given
% distance/weight spectrum using the function union_bound.m
%
% The user specifies:
%   - A_w : multiplicities of the codeword weights
%   - w   : corresponding weights/distances
%   - SNR : range of Eb/N0 values (in dB)
%
% The script then calls the union_bound() function and displays
% the resulting BLER curve.

fprintf('--- UNION BOUND COMPUTATION ---\n');
fprintf('This script computes the union bound on the BLER using:\n');
fprintf('  - A_w : multiplicities of the code weights\n');
fprintf('  - w   : corresponding Hamming weights\n');
fprintf('  - SNR : Eb/N0 range in dB\n');

% User-defined parameters
if true
    info_set = sort([127 126 125 123 119 111 95 63 124 122 121 118 117 115 110 109 107 103 94 93 91 87 79 62 61 59 55 47 31 120 116 114 113 108 106 105 102 101 99 92 90 89 86 85 83 78 77 75 71 60 58 57 54 53 51 46 45 43 39 30 29 27 23 15]);
    N = max(info_set)+1;
    A_w = compute_multiplicity_dmin(N,info_set);
    w = compute_Dmin(N, info_set);
else
    A_w = [10416];
    w   = [4];
end

SNR = 0:0.5:10;

% Compute BLER using the union bound
BLER = union_bound(A_w, w, SNR);
% Plot the BLER curve using semilogy
figure('Name','Union Bound BLER');
semilogy(SNR, BLER, 'LineWidth', 2);
xlabel('SNR (dB)');
ylabel('BLER (Union Bound)');
grid on;
title('Union Bound on BLER vs SNR');

fprintf('Truncated union bound computation finished.\n');
fprintf('   A_w      w\n');
fprintf('-----------------\n');
for k = 1:length(A_w)
    fprintf('%6d   %6d\n', A_w(k), w(k));
end
fprintf('You can now plot BLER versus SNR or compare with simulations.\n');
