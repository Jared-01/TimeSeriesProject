% 
%  File    :   timeProject.m  
% 
%  Author  :   Jared Murray 
%  Date    :   11/05/2021 
% 
%  Course  :   CSE 454
%   
%  Description : 
% %   This code reads in data from synthetic_control.data file then creates
% two new representations of that data, one using PAA and another using
% SAX. The PAA and SAX representations are also plotted alongside the
% original data. In additiona, the orignal data and the PAA data were also
% classified using both Euclidiean distance and Manhattan distance
%
%  To use this script run it using MATLAB online and in the same directory
%  as synthetic_control.data file
% 


clc %clear text form command line
clear %remove variables from workspace
close all %close all graph windowd

data = load("synthetic_control.data"); %load in data

%paaReturn is the 10-segment PAA representation of each line of data
paaReturn = paa(10, data); 

%Generate the SAX representation of each line of data using a 10-symbol
%alphabet consisting of integers 1 to 10
for i = 1:size(data, 1)
    SAX(i, :) = sax(data(i, :));
end

%Graph the PAA and SAX representations against the original data fpr each
%class of data
figure (1)
tiledlayout(2,3)
nexttile
Graph(paaReturn, data, 10, 50)
title('PAA representation Class 1')
xlabel('time') 
ylabel('value') 
legend({'PAA', 'Original Data'})
nexttile
Graph(paaReturn, data, 10, 150)
title('PAA representation Class 2')
xlabel('time') 
ylabel('value') 
legend({'PAA', 'Original Data'})
nexttile
Graph(paaReturn, data, 10, 250)
title('PAA representation Class 3')
xlabel('time') 
ylabel('value') 
legend({'PAA', 'Original Data'})
nexttile
Graph(paaReturn, data, 10, 350)
title('PAA representation Class 4')
xlabel('time') 
ylabel('value') 
legend({'PAA', 'Original Data'})
nexttile
Graph(paaReturn, data, 10, 450)
title('PAA representation Class 5')
xlabel('time') 
ylabel('value') 
legend({'PAA', 'Original Data'})
nexttile
Graph(paaReturn, data, 10, 550)
title('PAA representation Class 6')
xlabel('time') 
ylabel('value') 
legend({'PAA', 'Original Data'})


figure (2)
tiledlayout(2,3)
nexttile
Graph(SAX, data, 10, 50)
title('SAX representation Class 1')
xlabel('time') 
ylabel('value') 
legend({'SAX', 'Original Data'})
nexttile
Graph(SAX, data, 10, 150)
title('SAX representation Class 2')
xlabel('time') 
ylabel('value') 
legend({'SAX', 'Original Data'})
nexttile
Graph(SAX, data, 10, 250)
title('SAX representation Class 3')
xlabel('time') 
ylabel('value') 
legend({'SAX', 'Original Data'})
nexttile
Graph(SAX, data, 10, 350)
title('SAX representation Class 4')
xlabel('time') 
ylabel('value') 
legend({'SAX', 'Original Data'})
nexttile
Graph(SAX, data, 10, 450)
title('SAX representation Class 5')
xlabel('time') 
ylabel('value') 
legend({'SAX', 'Original Data'})
nexttile
Graph(SAX, data, 10, 550)
title('SAX representation Class 6')
xlabel('time') 
ylabel('value') 
legend({'SAX', 'Original Data'})
hold off





for i = 1:size(data, 1)
    k = 1;
    for j = 1:size(data, 1)
        % For both the PAA and original data, calculate the euclidean 
        % and manhattan distance between ith row and every other row of
        % data
        if i == j
            continue
        end
        disEuc(k) = euclidian(data(i, :), data(j, :));
        disMan(k) = manhattan(data(i, :), data(j, :));
        disEucPaa(k) = euclidian(paaReturn(i, :), paaReturn(j, :));
        disManPaa(k) = manhattan(paaReturn(i, :), paaReturn(j, :));
        k = k + 1;
    end
       % determine minimum distance from above calculations then record the
       % row number of the line of data that is closest to the ith row of
       % data 
       [~, rowNumEuc(i)] = min(disEuc);
       [~, rowNumMan(i)] = min(disMan);
       [~, rowNumEucPaa(i)] = min(disEucPaa);
       [~, rowNumManPaa(i)] = min(disManPaa);
       % Based off of the row number of the line closest to the ith row of 
       % data predict the class of the ith row data where 
%        closest row number      class
%        1 - 100                   1
%        101 - 200                 2
%        201 - 300                 3
%        301 - 400                 4
%        401 - 500                 5
%        501 - 600                 6
       classPredictEuc(i) = floor(rowNumEuc(i)/100) + 1;
       classPredictMan(i) = floor(rowNumMan(i)/100) + 1;
       classPredictEucPaa(i) = floor(rowNumEucPaa(i)/100) + 1;
       classPredictManPaa(i) = floor(rowNumManPaa(i)/100) + 1;
end
k = 1;
for i = 1:6
    for j = 1:100
        % create matrix where the value in each row corresponds to the class
        % of the data in the corresponding row within the input data where 
%        row number              class
%        1 - 100                   1
%        101 - 200                 2
%        201 - 300                 3
%        301 - 400                 4
%        401 - 500                 5
%        501 - 600                 6
        classActual(k) = i;
        k = k + 1;
    end 
end

% Create confusion matrices where the row number of the confusion matrix
% corresponds to the actual class of a row within the PAA or raw data and
% the column of the confusion matrix represents the predicted class of that
% row using the corresponding distace calculation

%Only one confusion matrix can be plotted at once

matEucPaa =confusionmat(classActual, classPredictEucPaa); 
figure (3)
cm = confusionchart(matEucPaa);
cm.Title = 'Confusion Matrix with PAA and Euclidean Distance';

% 
% matManPaa =confusionmat(classActual, classPredictManPaa);
% figure (3)
% cm = confusionchart(matManPaa);
% cm.Title = 'Confusion Matrix with PAA and Manhattan Distance';


% matEuc =confusionmat(classActual, classPredictEuc);
% figure(3)
% cm = confusionchart(matEuc);
% cm.Title = 'Confusion Matrix with Original Data and Euclidean Distance';

% matMan =confusionmat(classActual, classPredictMan);
% figure(3)
% cm = confusionchart(matMan);
% cm.Title = 'Confusion Matrix with Original Data and Manhattan Distance';




