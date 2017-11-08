function zad_jeden
    h = 50;
    A = 0.0109;
    mb = 0.2;
    mw = 2.5;
    cb = 0.22;
    tspan  = [0 0.35];
    ic = [1200 65];
    [t, y] = func(h, A, mb, cb, mw, ic, tspan);
    count = size(y,2);
    plot(t,y(1,1:count),'g', t, y(2,1:count), 'b')
end

% rownania stanu
function [t, y] = func(h, A, mb, cb, mw, ic, ts)
    f1 = @(x) F1(x, h, A, mb, cb);
    f2 = @(x) F2(x, h, A, mw);
    [t, y] = euler_modified({f1, f2}, ts, ic);
end

function y = F1(y, h, A, m, c)
    alpha = (h * A)/(m * c);
    y = (y(2) - y(1)) * alpha;
end

function y = F2(y, h, A, m)
    beta = (h * A)/(m * fcw(y(2)));
    y = (y(1) - y(2)) * beta;
end

% model współczynnika pojemnosci cieplnej oleju chlodzacego
function cw = fcw(T)
    Tid = [0, 55, 70, 100, 200, 400, 1000, 2000];
    cwd = [0.2, 0.12, 0.1, 0.08, 0.05, 0.03, 0.02, 0.016];
    polyn = spline(Tid, cwd);
    cw = ppval(polyn,T);
end