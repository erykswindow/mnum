 function c = c_matrix(s)
    c = diag(ones(1, s) * 4);
    for i = 1:size(c,1)
        for j = 1:size(c,2)
            if (i == 1 && j == 2) || (i==size(c,1) && j == size(c,2) - 1)
                c(i,j) = 2;
            elseif (i == j-1) || (i == j+1)
                c(i,j) = 1;
            end
        end
    end
 end