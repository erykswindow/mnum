function yy = spline_interpolation(x, y, alpha, beta, xx)
% spline_interpolation: create a spline interpolating function
%	yy = spline_interpolation(x, y, alpha, beta, xx)
% 	`	uses equal third degree spline interpolation method
%		to interpolate the (x, y) nodes
% INPUTS:
%	x 	  - original x nodes, it is required they are 
% 			equally distributes
% 	y 	  - original y node vales for provided x
%	alpha - first degree derivative of the funtion at the start point
%	beta  - first degree derivative of the function at the end point
% 	xx 	  - points for which we interpolate the functon for
% OUTPUTS:
%	yy    - the output values for interpolation

	% assuming x and y sizes are equal
	n = size(x,2) - 1;
	c_mat = c_matrix(n+1);
	a = x(1);
	b = x(n+1);
	h = (b - a)/(n);
	y(1) = y(1) + h/3 * alpha; y(n+1) = y(n+1) - h/3 * beta;

	c = c_mat\y'; % c - coefficients
	c = [
		c(2) - h/3 * alpha; 
		c; 
		c(size(c,1)-1) + (h/3 * beta)
	];
	yy = zeros(1, size(xx,2));
	for i = 1:size(xx,2)
		yy(i) = interpolate(xx(i), c, a, h, n);
	end
end

function y = interpolate(x, c, a, h, n)
	y = 0;
	for j = -1:n+1% S(x) = sum(c(i) * phi(i, x)) for i from -1 to n+1
		k = j+2;
		y = y + c(k) * phi(j, x, a, h);
	end
end