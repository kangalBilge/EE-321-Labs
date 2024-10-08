tao = -10:0.25:10; %samplela çarp
eta = double(tao>-5) - double(tao>5); 
phi = double(tao>-2.5) - double(tao>2.5); 
omega = ConvFUNC(eta,phi, 0.25);
tao_new = -length(omega)/8:0.25:(length(omega)-1)/8;
phi_flipped = fliplr(phi);
omega = omega(double(length(omega)/4):double(length(omega)*3/4));
tao_slided = -20:0.25:0;




figure;
for ii = 1:length(omega)
    
    subplot(2, 2, 1);
    plot( tao, eta);
    xlabel('τ');
    ylabel('eta');
    title('Eta signal');
    grid on;
    
    
    subplot(2, 2, 2);
    plot( tao, phi_flipped);
    xlabel('τ');
    ylabel('phi');
    title('Phi signal');
    grid on;
    

    subplot(2, 2, 4);
    plot( tao(1:ii), omega(1:ii));
    xlabel('τ');
    ylabel('Amplitude');
    title('Convolution Animation');
    xlim([-15, 15]);
    ylim([min(omega)-5, max(omega)+5]);
    grid on;
    
    
    subplot(2, 2, 3);
    plot(tao_slided, phi_flipped, tao, eta);
    title('Convolution Animation');
    xlabel('τ');
    ylabel('Amplitude');
    xlim([-15, 15]);
    ylim([min(phi)-0.5, max(phi)+0.5]);
    grid on;
    % Pause to create animation effect
    pause(0.05);
    drawnow;
    tao_slided = tao_slided + 0.25;
end