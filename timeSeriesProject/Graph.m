% 
% function Graph(dataRep, data, segAmount, j)
% 
% Author1: Jared Murray
% Date:    11/6/2021
% Course:  cse 454 
% 
% Function   : Graph 
% 
% Description: Graph the jth row of a given data representation against
% the jth row of the original data.
%              
% 
% Parameters : dataRep      - PAA or SAX representation of data set 
%              data         - Original data
%              segAmount    - Amount of data segments in PAA or alphabet
%                             size of SAX
%              j            - Row of dataRep and data to graph
% 
% Return     : Graph of data representation and original data
% 
% Examples of Usage: 
%    
%    Graph 450th row of PAA data with 0 segments:
%    Graph(paaReturn, data, 10, 450) 
% 
% 

function Graph(dataRep, data, segAmount, j)
    Size  = size(data);
    %segLength is the duration of time for each semgemnt/symbol 
    segLength = ceil(Size(2)/segAmount);
    %intialize x and y axis
    paax = [];
    paay = [];
    s = 1;
    paax(1) = 0;
    paay(1) = dataRep(j, s);
    i = 2;
    %plot time on x-axis and corresponing PAA value/ SAX symbol on y axis
    for s = 2:segAmount
        paax(i) = paax(i - 1) + segLength;
        paay(i) = dataRep(j, s - 1);
        i = i + 1;
        paax(i) = paax(i - 1);
        paay(i) = dataRep(j, s);
        i = i + 1;
    end
    paax(i) = paax(i - 1) + segLength;
    paay(i) = dataRep(j, s);
    
    %Plot x-axis and y -axis matrices for data representation set
    plot(paax, paay);
    hold on
    %Plot raw data on the same graph
    time =linspace(0,Size(2),Size(2));
    scatter(time,data(j,:),"filled");
    hold off
    
end