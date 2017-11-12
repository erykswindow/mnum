function y = in_range(x, minimum, maximum)
	if (x >= minimum && x <= maximum)
        % sprintf('%f in <%f, %f>', x, minimum, maximum)
		y =  1;
	else
		% sprintf('%f not in <%f, %f>', x, minimum, maximum)
		y =  0;
	end
end