function y = phi(i, x, a, h)
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