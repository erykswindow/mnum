function y = in_range(x, minimum, maximum)
% IN RANGE: Check if number is in range
% 	y = in_range(x, minimum, maximum)
%	` check if x >= minimum and x <= maximum
% INPUTS:
%	x  - the analyzed value
%	minimum - the minimum value of range
%   maximum - the maximum value of range
% OUTPUTS:
%	y  - a boolean if x is in range

	y = (x >= minimum && x <= maximum);
	
end