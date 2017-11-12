function y = in_range(x, minimum, maximum)
	if (x >= minimum && x <= maximum)
		y =  1;
	else
		y =  0;
	end
end