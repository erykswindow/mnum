function yy = approximate(x, y, order, xx)
% APPROXIMATE: approximate the n-th degree
% 			   polynomal for points
%  yy = approximate(x, y, order, xx)
%	`	calculate values for the provided
%		points along approximation of function
%		defined.
% INPUTS:
%	x - original nodes 
%	y - original node values
%	order - order of approximation
% 	xx - points to approximate for
% OUTPUTS:
% 	yy - values of approximation
	
	m = approximation_base_matrix(x, order);
	y = transpose(y);
	a = inv((transpose(m) * m)) * (transpose(m) * y);
	yy = zeros(1,size(xx,2));
	for i = 1:size(xx,2)
		for j = 0:order
			yy(i) = yy(i) + (a(j+1) * xx(i).^j);
		end
	end
end