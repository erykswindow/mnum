function y = approximation_base_matrix(x, m)
% Approximation Base Matrix: an approximation
%		helper matrix
%  y = approximation_base_matrix(x, m)
%	` creates the M matrix for polynominal
%	  approximation method
% INPUTS:
% 	x  - the x nodes to approximate along
%	m  - order of polynominal aproximation
% OUTPUTS
% 	y  - an m x m matrix of coefficients

	y = ones(m);
	for i = 0:m
		for j = 1:size(x,2)
			y(j,i+1) = x(j)^i;
		end
	end
end