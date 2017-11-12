function y = approximation_base_matrix(x, m)
	y = ones(m);
	for i = 0:m
		for j = 1:size(x,2)
			y(j,i+1) = x(j)^i;
		end
	end
end