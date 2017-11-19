% rownania stanu
function [t, y] = state(h, A, mb, cb, mw, ic, ts, calc)
    f1 = @(x) F1(x, h, A, mb, cb);
    f2 = @(x) F2(x, h, A, mw);
    [t, y] = calc({f1, f2}, ts, ic);
end

function y = F1(y, h, A, m, c)
    alpha = (h * A)/(m * c);
    y = (y(2) - y(1)) * alpha;
end

function y = F2(y, h, A, m)
    beta = (h * A)/(m * fcw(y(2)));
    y = (y(1) - y(2)) * beta;
end