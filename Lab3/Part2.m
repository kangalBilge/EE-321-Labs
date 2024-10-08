N_range = 100:300:10000;
a_val = [0,0.05,0.1,0.25,0.5];
output_array = zeros(length(a_val),length(N_range));
n_arr = -N_range(length(N_range)):N_range(length(N_range));
figure
for i = 1:length(a_val)
    imp_resp = exp(-a_val(i)*n_arr);
    x = sumElements(imp_resp,N_range);
    subplot(5,1,i)
    stem(N_range, x, 'b', 'LineWidth', 2);
    xlabel('N values');
    ylabel('Summation of Input');
    title('Discrete-Time Integrator BIBO stability Analysis with a=',num2str(a_val(i)));
end
x = sumElements(exp(-a_val(3)*n_arr),N_range);