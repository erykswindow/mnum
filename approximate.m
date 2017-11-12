function yy = approximate(x, y, order, xx)
	
	m = approximation_base_matrix(x, order)
	y = transpose(y)
	a = inv((transpose(m) * m)) * (transpose(m) * y)
	yy = zeros(1,size(xx,2))
	for i = 1:size(xx,2)
		for j = 0:order
			yy(i) = yy(i) + (a(j+1) * xx(i).^j);
		end
	end
end