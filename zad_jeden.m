
% zadania 1 oraz 2
% łączą się i obejmują:
%  - obliczanie wartosci funkcji metodą eulera
%  - interpolację funkcjami sklejanymi warości cw

function zad_jeden
    h = 50;
    A = 0.0109;
    mb = 0.2;
    mw = 2.5;
    cb = 0.22;
    tspan  = [0 0.4];
    ic = [1200 65];
    calc = @(f, x, y) euler_modified(f,x,y);
    [t, y] = state(h, A, mb, cb, mw, ic, tspan, calc);
    count = size(y,2);
    plot(t,y(1,1:count),'g', t, y(2,1:count), 'b')
end

