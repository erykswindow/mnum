function [xx,yy] = linearize_samples(x,y,n)
% linearize_samples: Change data into equally distant points
%   [xx, yy] = linearize_samples(x,y,z)
%           ` assumes nodes create linear functions
%             creates equally distant points between
%             those nodes
% Input:
%   x    - Original x values
%   y    - Original y values
%   n    - Number of points to calculate
% Output:
%   xx   - vector of new x values
%   yy   - vector of new y values

    xx = linspace(min(x),max(x),n);
    yy = zeros(1,n);
    for i=1:n
        [x_1, x_2] = find_range(x, xx(i));
        a = (y(x_1) - y(x_2))/(x(x_1) - x(x_2));
        b = y(x_2) - a * x(x_2);
        yy(i) = a * xx(i) + b;
    end
end

  
 
 