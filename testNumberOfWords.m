function [ ] = testNumberOfWords( fileName,col_run ,numberOfCentroids )
% The purpose of this function is to plot the wss for i number of
% centroids.
% Input: .mat file generated from FeatureExtraction.m
%       col_to_run - which column do you want to run kmeans on.
%       numberOfCentroids - a vector of number of centroids you want to test for.
% RUN with col_run=2 for the first test.
% RUN with col_run=6 for testing the second type.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load the file
load(fileName);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

wss=[];

% Determine training and testing size. I chose a 70/30
totImages= length(SURFMat);
trainSize=ceil(totImages*.7);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Write data into a matrix. Each row is an observation of a keypoint
wordData = [];
if col_run==6
    for i=1:trainSize
    wordData = [wordData ;SURFMat{i,6}];
    end
else
    col_run=2; % just a safetynet
    for i=1:trainSize
        wordData = [wordData SURFMat{i,col_run}];
    end
    wordData=double(wordData)';
end

if nargin < 3
    numberOfCentroids= [2:50];
end
loc=0;
% kmeans section
for k=numberOfCentroids
    loc=loc+1;
    [idx,~,sumd,~] = kmeans(wordData, k,'Display','iter','Distance','sqeuclidean');
    wss= [wss sum(sumd)];
    sumd =0;
end
figure(randi(11)+13)
plot(numberOfCentroids,wss);
xlabel('number of words')
ylabel('wss')
if col_run==6
    title('kmeans on kmeans result');
else
    title(strcat(fileName,'kmeans on surf_pts:'))
shg
end

