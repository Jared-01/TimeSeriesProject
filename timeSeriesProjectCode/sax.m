% 
% function saxRep = sax(data)
% 
% Author1: Jared Murray
% Date:    11/6/2021
% Course:  cse 454 
% 
% Function   : sax 
% 
% Description: Calculate the SAX representation of the given data using a
%              10-letter alphabet
%               
%              
% 
% Parameters :   data         - single-row data matrix SAX is generated from
% 
% Return     : SAX representation of data
% 
% Examples of Usage: 
%    
%    Calculate SAX representation of data using 10-letter aphabet
%    sax(data) 
% 
% 





function saxRep = sax(data)
    %Geneterate new row of data with mean of 0 and standard deviation of 1
    for i = 1:length(data)
        dataNew(i) = (data(i) - mean(data))/std(data);
    end
    %Generate PAA represenation of new data
    dataPAA = paa(10, dataNew);
    
    %For each element in PAA representation generate a corresponding letter
    %for the SAX string representation based on the range the PAA value
    %falls within. 
    
    %The letters of the alphabet are integers 1 through 10. 
    for i = 1:length(dataPAA)
        if (dataPAA(i) < -1.75)
            saxRep(i) = 1;
        end
        if ((dataPAA(i) >= -1.75) && (dataPAA(i) < -1.25))
            saxRep(i) = 2;
        end
        if ((dataPAA(i) >= -1.25) && (dataPAA(i) < -0.75))
            saxRep(i) = 3;
        end
        if ((dataPAA(i) >= -0.75) && (dataPAA(i) < -0.25))
            saxRep(i) = 4;
        end
        if ((dataPAA(i) >= -0.25) && (dataPAA(i) < 0))
            saxRep(i) = 5;
        end
        if ((dataPAA(i) >= 0) && (dataPAA(i) < 0.25))
            saxRep(i) = 6;
        end
        if ((dataPAA(i) >= 0.25) && (dataPAA(i) < 0.75))
            saxRep(i) = 7;
        end
        if ((dataPAA(i) >= 0.75) && (dataPAA(i) < 1.25))
            saxRep(i) = 8;
        end
        if ((dataPAA(i) >= 1.25) && (dataPAA(i) < 1.75))
            saxRep(i) = 9;
        end
        if (dataPAA(i) >= 1.75)
            saxRep(i) = 10;
        end
        %Return string of integers within saxRep
    end
    
end
    