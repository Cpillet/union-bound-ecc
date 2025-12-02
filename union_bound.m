function [BLER] = union_bound(nb_cw, weight, SNR)
% UNION_BOUND  Compute the union bound on the block error rate (BLER)
%              using the distance (or weight) spectrum of the code.
%
% The union bound gives an *upper bound* on the performance of the 
% Maximum Likelihood (ML) decoder. Its general expression is (see eq. (4) in):
% https://arxiv.org/pdf/1908.06652.pdf
%
% In this function:
%   - nb_cw(i)    = multiplicity A_i of the i-th weight
%   - distance(i) = corresponding distance d_i (Hamming weight for BPSK)
%   - SNR         in dB
%
% The Q-function is implemented through:
%       Q(x) = 0.5 * erfc( x / sqrt(2) )
%
% The argument of the Q-function for BPSK over AWGN is:
%       sqrt( d_i / (2 * sigma^2) )
% where sigma^2 is the noise variance.
%
% ----------------------------------------------------------------------
if (length(nb_cw) ~= length(weight))
    error("Number of codewords nb_cw and corresponding weights should have the same length.")
end
% Convert Eb/N0 from dB to noise variance sigma^2.
% For BPSK: sigma = sqrt(N0/2) = sqrt(10^(-Eb/N0/10))
stddev   = sqrt(10.^(-SNR/10));   % sigma
variance = stddev .* stddev;      % sigma^2
BLER = 0.0;

% Add the contribution of all remaining distances
for i = 1:length(weight)
    BLER = BLER + 0.5 * nb_cw(i) * erfc( sqrt( weight(i) ./ (2 .* variance) ) ); %  (see eq. (4) in  https://arxiv.org/pdf/1908.06652.pdf
    %BLER = BLER + nb_cw(i)*qfunc(sqrt(2*weight(i)*K/N*SNR(i))); % see eq (1) in https://arxiv.org/pdf/2312.14749
end

end
