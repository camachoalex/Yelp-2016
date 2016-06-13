%% Log of what's been done.
run('AddPaths.m')
%% A long time ago.
% Before running any code we need to filter the data.
% All images are converted to grayscale.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SURFMat CELL DESCRIPTION:
%1. FileName,
%2. Five feature vectors for the image
%3. Business ID
%4. Photo ID
%5. Yelp- Assigned Attributes
%6. Cluster Round 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 06-12-2016
% I grouped images in yelp_attributes. Each column corresponds to a
% yelp-assigned attribute (0-8). Output is saved as yelp_attributes
% Next step, create a "mean image" for each column.
%
%
%
%
%
%% IGNORE BELOW.
%% Import photo_id && business Id
% run CheckTrain.m 
%% Import business_id && labels
% run readTRAINCSV.m
%% Beginning of the script
run('AddPaths.m')
