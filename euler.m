function [t, y] = euler(func, tspan, x0)
% euler: Solve differential equations list
%   [t, y] = euler(func, tspan, x0)
%    `  uses Euler differential equation
%       solve method for multiple equations
% Input:
%   func    - CELL ARRAY of anonymous functions
%             describing differential equations
%   tspan   - span of time in equation
%   x0      - initial values for functions
% Output:
%   t       - vector of time in equation
%   y       - matrix of function values in
%             values corresponding time
    
    count = 500;
    t = linspace(tspan(1), tspan(2), count);
    numberOfFunctions = size(func, 2);
    y = zeros(numberOfFunctions, count);
    for i = 1:numberOfFunctions
        y(i, 1) = x0(i);
    end
    for i = 2:count
        step = t(i) - t(i-1);
        for j = 1:numberOfFunctions
            stepValue = step * func{j}(y(1:numberOfFunctions, i-1));
            y(j, i) = y(j, i - 1) + stepValue;
        end
    end
end