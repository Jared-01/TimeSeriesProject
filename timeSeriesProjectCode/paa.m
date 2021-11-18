% 
% function paa = paa(segAmount, data)
% 
% Author1: Jared Murray
% Date:    11/6/2021
% Course:  cse 454 
% 
% Function   : paa 
% 
% Description: Calculate PAA representation of the given data with
%              segAmount number of segments 
%              
% 
% Parameters : segAmount     - integer number of segments to split data
%                              into
%              data          - data matrix PAA is generated from
% 
% Return     : PAA representation of data
% 
% Examples of Usage: 
%    
%    Calculate 10-segment PAA representation of data
%    paa(10, data); 
% 
% 




function paa = paa(segAmount, data)
    
    dataSize = size(data);
    timeLength = dataSize(2);
    %determine length of segemnts data will be split into
    segLength = timeLength/segAmount;
    segLength = ceil(segLength);
    %Create PAA representation for each row of data
    for j = 1:dataSize(1)
        for s = 1:segAmount
            sample = [];
            sampleCount = 1;
            %determine values for the bounds of each data segment
            if (s - 1) * segLength < dataSize(2)
                leftBound = (s - 1) * segLength;
                rightBound = s * segLength;
                for i = 1:dataSize(2)
                    if i > leftBound
                        if i <= rightBound
                            sample(sampleCount) = data(j, i);
                            sampleCount = sampleCount + 1;
                        end
                    end
                end                
            end
            %The PAA representation of each data segments is the mean of
            %the data within that segment
            paa(j, s) = mean(sample);
        end
    end
end
