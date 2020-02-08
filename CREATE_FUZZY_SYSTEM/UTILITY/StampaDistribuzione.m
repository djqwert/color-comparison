function [] = StampaDistribuzione(ME,Lim)
    g = 1;
    figure;
    hold on;
    for i = 1:1:Lim
        subplot(3,2,g);
        plot(1:1:20, ME(1:20,i)*100, 'o-');
        xlim([1 20]);
        xlabel('Addestramenti');
        ylabel('MSE');
        title(['ANFIS = ',num2str(i)]);
        if(g == 6)
            figure;
            g = 0;
        end
        g = g + 1;
    end
    hold off;
    disp('Stampa distribuzione completata.');
end