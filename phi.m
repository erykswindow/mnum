function y = phi(i, x, a, h)
	nodes = @(x) a + (h * x);

    y = 0;
		if in_range(x, nodes(i-2), nodes(i-1))
			y = (x - nodes(i-2))^3;
		elseif in_range(x, nodes(i-1), nodes(i))
			y = ((x - nodes(i-2)) ^ 3) - 4 * ((x - nodes(i-1)) ^ 3);
		elseif in_range(x, nodes(i), nodes(i+1))
			y = ((nodes(i+2) - x) ^ 3) - 4 * ((nodes(i+1) - x) ^ 3);
		elseif in_range(x, nodes(i+1), nodes(i+2))
			y = ((nodes(i+2) - x) ^ 3);
	 	end
    y = y * (1/h^3);
end
