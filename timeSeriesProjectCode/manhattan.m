% 
% function dis = manhattan(data1, data2)
% 
% Author1: Jared Murray
% Date:    11/6/2021
% Course:  cse 454 
% 
% Function   : manhattan 
% 
% Description: Calculate manhattan distance between data1 and data2
%              
% 
% Parameters : data1         - 1 x i matrix 
%              data2         - 1 x i matrix 
% 
% Return     : Manhattan distance between data1 and data2
% 
% Examples of Usage: 
%    
%    Find manhattan distance between two rows of data matrix:
%    manhattan(data(i, :), data(j, :));
% 
% 

function dis = manhattan(data1, data2)
    dis = 0;
    %Return the sum of the absolute difference between corresponding 
    %elements of each data set
    for k = 1:length(data1)
        d = data1(k) - data2(k);
        dAbs = abs(d);
        dis = dis + dAbs;
    end
end