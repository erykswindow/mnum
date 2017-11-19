function zad_dwa
% zadanie 2:
% - interpolacja funkcjami sklejanymi warości cw
    clear all
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

    figure(3)
    plot(t,y(1,1:count),'g-o', 'DisplayName', 'T_b')
    hold on
    plot(t, y(2,1:count), 'b-o', 'DisplayName', 'T_w')
    show_temperature_plot_details(h, A, mb, mw, cb)
    title('Zadanie 2: Przebieg dla nowych danych')
end