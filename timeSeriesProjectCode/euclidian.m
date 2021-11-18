% 
% function dis = euclidian(data1, data2)
% 
% Author1: Jared Murray
% Date:    11/6/2021
% Course:  cse 454 
% 
% Function   : euclidian 
% 
% Description: Calculate euclidean distance between data1 and data2
%              
% 
% Parameters : data1         - 1 x i matrix 
%              data2         - 1 x i matrix 
% 
% Return     : Euclidean distance between data1 and data2
% 
% Examples of Usage: 
%    
%    Find euclidean distance between two rows of data matrix:
%    euclidian(data(i, :), data(j, :));
% 
% 

function dis = euclidian(data1, data2)
    sum = 0;
    %Calculate the sum of the square differences for each each element of
    %both sets then return its square root
    for k = 1:length(data1)
        sum = sum + (data1(k) - data2(k))^2;
    end
    dis = sqrt(sum);
end