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
A_w = [10416];
w   = [4];
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

fprintf('Union bound computation finished.\n');
fprintf('You can now plot BLER versus SNR or compare with simulations.\n');
