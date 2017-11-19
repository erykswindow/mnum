function zad_cztery
% zadanie polegające na porównaniu:
%  - interpolacji funkcjami sklejanymi
%  - aproksymacji wielomianami rzędów 3 i 5
    clear all
    clear plot
    hold off
	% Oryginalne dane wejściowe
	Tid = [0, 55, 70, 100, 200, 400, 1000, 2000];
    cwd = [0.2, 0.12, 0.1, 0.08, 0.05, 0.03, 0.02, 0.016];
    figure(5)

    xx = linspace(min(Tid), max(Tid), 50);


    % aproksymacja wielomianem 3 rzędu
    yy_1 = approximate(Tid, cwd, 3, xx);

    % % aproksymacja wielomianem 5 rzędu
    yy_2 = approximate(Tid, cwd, 5, xx);
    
    % interpolacja funkcjami sklejanymi
    % z powodu podanych nierówno odległych danych
    % stworzymy najpierw przybliżone węzły
    % z założeniem, że wartości pomiędzy podanymi 
    % zmieniają się liniowo
    [x,y] = linearize_samples(Tid, cwd, 8);
    yy_3 = spline_interpolation(x, y, 0, 0, xx);

   
    subplot(3,1,1)
    plot(xx,yy_1,'r-o', 'DisplayName', 'Approximate m = 3')
    hold on
    plot(Tid, cwd, 'g*', 'DisplayName', 'Original nodes')
    grid on
    legend('show')
    title('Porównanie metod przybliżania zależności pojemności cieplnej oleju od jego temperatury')

    subplot(3,1,2)
    plot(xx, yy_2, 'b-o', 'DisplayName', 'Approximate m = 5')
    hold on
    plot(Tid, cwd, 'g*', 'DisplayName', 'Original nodes')
    grid on
    legend('show')

    subplot(3,1,3)
    plot(xx, yy_3,'k-o', 'DisplayName', 'Spline interpolation')
    hold on
    plot(Tid, cwd, 'g*', 'DisplayName', 'Original nodes')
    plot(x, y, 'rx', 'DisplayName', '"New" nodes')
    hold off
    grid on
    legend('show')

% zadanie polegające na porównaniu wyników działania dwóch
% implementacji niejawnych metod eulera
% ustalamy warunki dla równań określonych w zadaniu
    h = 50;
    A = 0.0109;
    mb = 0.2;
    cb = 0.22;
    mw  = 1.5;
    tspan  = [0 0.5];
    ic = [1200 65];

    calc_one = @(f, x, y) euler_modified(f,x,y);
    calc_two = @(f, x, y) euler(f,x,y);
    [t, y_1] = state(h, A, mb, cb, mw, ic, tspan, calc_one);
    [t, y_2] = state(h, A, mb, cb, mw, ic, tspan, calc_two);

    count = size(y_1,2);
    newAxis = [0 0.5 400 1200]

    figure(6)
    subplot(1,2,1)
    plot(t, y_2(1,1:count), 'r-o', 'DisplayName', 'Euler')
    axis(newAxis)
    legend('show')
    grid on

    subplot(1,2,2)
    plot(t, y_1(1,1:count), 'g-o', 'DisplayName', 'Euler Modified')
    axis(newAxis)
    legend('show')
    grid on
end