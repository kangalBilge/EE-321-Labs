function [h_ret] = Inverse_2ndOrd(h)
    array = (0:length(h)-1)-1;
    h_inter = h.*array;
    h_ret = zeros(1,length(h_inter));
    for i = 3:length(h_ret)
        h_ret(i-2) = sum(h_inter(i:length(h_inter)));
        array = array - 1;
        h_inter = h.*array;
    end
end