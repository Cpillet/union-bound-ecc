function [mu_dmin] = compute_multiplicity_dmin(N,I)
% 1.19/1.20 https://theses.hal.science/tel-02861774/document
if max(I)==N-1
    I = I+1;
end
[Dmin,sub_I_d] = compute_Dmin(N,I);
d = log2(Dmin);
n = log2(N);
mu_dmin = 0;
for i=1:length(sub_I_d)
    mu_dmin = mu_dmin+2^(compute_sn(log2(N),sub_I_d(i)-1));
end
mu_dmin = mu_dmin*2^(n-((d*(d+1))/2));
end 


function sn = compute_sn(n,i)
    b_n_i = de2bi(i,n,'left-msb');
    sn = sum((0:n-1).*b_n_i);
end