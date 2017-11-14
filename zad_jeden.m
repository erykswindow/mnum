function zad_jeden
% zadanie 1:
%  - obliczanie wartosci funkcji metodą eulera
    clear all
    pause off
    hold off

    h = 50;
    A = 0.0109;
    mb = 0.2;
    mw = 2.5;
    cb = 0.22;
    tspan  = [0 0.5];
    ic = [1200 65];

    calc = @(f, x, y) euler(f,x,y);
    [t, y] = state(h, A, mb, cb, mw, ic, tspan, calc);
    count = size(y,2);

    figure(1)
    plot(t,y(1,1:count),'g-o', 'DisplayName', 'T_b')
    hold on
    plot(t, y(2,1:count), 'b-o', 'DisplayName', 'T_w')
    show_temperature_plot_details(h, A, mb, mw, cb)
    title('Przebieg uzyskany metodą Eulera')

    calc = @(f, x, y) euler_modified(f,x,y);
    
    [t, y] = state(h, A, mb, cb, mw, ic, tspan, calc);
    count = size(y,2);

    figure(2)
    plot(t,y(1,1:count),'g-o', 'DisplayName', 'T_b')
    hold on
    plot(t, y(2,1:count), 'b-o', 'DisplayName', 'T_w')
    show_temperature_plot_details(h, A, mb, mw, cb)
    title('Przebieg uzyskany metodą zmodyfikowaną Eulera')
end

