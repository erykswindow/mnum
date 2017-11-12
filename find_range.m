function [x_1,x_2] = find_range(x, value)
% FIND_RANGE: Find range from x
%	[x_1, x_2] = find_range(x, value)
%	 `	finds the range from xs for value
% Inputs:
%	x 		-	vector of xs
%	value 	- 	value of x to find range for
% Outputs:
%	x_1 	- 	lower index
%	x_2 	- 	upper index

	for j=1:size(x,2)
		x_1 = j;
		x_2 = j+1;
		if j + 1 >= size(x, 2)
			return
		end

		if (x(x_1) <= value) && (x(x_2) >= value)
			return
		end
	end
end