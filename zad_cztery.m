function zad_cztery
% zadanie polegające na porównaniu:
%  - interpolacji funkcjami sklejanymi
%  - aproksymacji wielomianami rzędów 3 i 5

	% Oryginalne dane wejściowe
	Tid = [0, 55, 70, 100, 200, 400, 1000, 2000];
    cwd = [0.2, 0.12, 0.1, 0.08, 0.05, 0.03, 0.02, 0.016];
    
    plot(Tid, cwd, 'g*', 'DisplayName', 'Original nodes')
    hold on

    xx = linspace(min(Tid), max(Tid), 200);
    yy = zeros(3, size(xx,2))
    % aproksymacja wielomianem 3 rzędu
    yy_1 = approximate(Tid, cwd, 3, xx);
    plot(xx,yy_1,'r', 'DisplayName', 'Approximate m = 3')


    % aproksymacja wielomianem 5 rzędu
    yy_2 = approximate(Tid, cwd, 5, xx);
    plot(xx, yy_2, 'b', 'DisplayName', 'Approximate m = 5')

    % interpolacja funkcjami sklejanymi
    % z powodu podanych nierówno odległych danych
    % stworzymy najpierw przybliżone węzły
    % z założeniem, że wartości pomiędzy podanymi 
    % zmieniają się liniowo
    [x,y] = linearize_samples(Tid, cwd, 100);
    yy_3 = spline_interpolation(x, y, 0, 0, xx);

    yy = [yy_1; yy_2; yy_3]
    plot(xx, yy_3,'k', 'DisplayName', 'Spline Interpolation')
    legend('show', 'Location', 'northwest')
    grid on
    hold off

end