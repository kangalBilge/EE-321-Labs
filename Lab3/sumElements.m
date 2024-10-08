function [sum_array] = sumElements(h, N_range)

ind=(length(h)+1)/2;
sum_array = zeros(size(N_range));

for i = 1:length(N_range)
    N = N_range(i);
    sliced_arr = h(ind-N:ind+N);
    sum_array(i) = sum(abs(sliced_arr)) ;
end