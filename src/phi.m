function y = phi(i, x, a, h)
% Phi: a base function for third degree 
%	   polynominal interpolation
% 	y = phi(i, x, a, h)
%	 ` calculate the value of base function
% INPUTS:
%	i - number of base function
%	x - input of function
%	a - beginning of interpolated range
%	h - step size
% OUTPUTS:
% 	y - value described by schema

	node = @(x) a + (h * x);

    y = 0;
		if in_range(x, node(i-2), node(i-1))
			y = (x - node(i-2))^3;
		elseif in_range(x, node(i-1), node(i))
			y = ((x - node(i-2)) ^ 3) - 4 * ((x - node(i-1)) ^ 3);
		elseif in_range(x, node(i), node(i+1))
			y = ((node(i+2) - x) ^ 3) - 4 * ((node(i+1) - x) ^ 3);
		elseif in_range(x, node(i+1), node(i+2))
			y = ((node(i+2) - x) ^ 3);
	 	end
    y = y * (1/h^3);
end