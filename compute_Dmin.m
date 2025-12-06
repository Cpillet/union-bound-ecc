function [Dmin,sub_info_d] = compute_Dmin(N,I)
%Compute the minimal distance of the polar codes defined by the information
%set I
if max(I) == N-1
    I = I+1;
end
GN = compute_GN(log2(N));
sum_row_gn = sum(GN');
Dmin = min(sum_row_gn(I));
sub_info_d = I(sum_row_gn(I)==Dmin);
end