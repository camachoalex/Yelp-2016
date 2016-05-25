%% Before running any code we need to filter the data.
% Possible issues:
% 1. Multiple images from the same restaurant.
% 2. Image sizes vary. Observations from first 41K. 
%                      min=[56 75 3]; max=[500 500 3];
% 3. This data set is HUGE!!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SURFMat CELL DESCRIPTION:
%1. FileName,
%2. Five feature vectors for the image
%3. Business ID
%4. Photo ID
%5. Attributes
%6. Cluster Round 1
%7. Clusters based on column #6. NO LONGER DOING THIS!->kMeansOnKeypoints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Import photo_id && business Id
% run CheckTrain.m 
%% Import business_id && labels
% run readTRAINCSV.m
%% Beginning of the script
run('AddPaths.m')
%%
for j=1:4
vals = [5 10 15 20];
global yelp_info; % I don't think this makes a difference. I like the cyan color.
yelp_info = InitVar(vals(j), 50);%(number of features per image, number of clusters).
tic; % start timer
%% Extract Surf Features
yelp_info.SurfMat = FeatureExtraction(yelp_info.featPerImage,...
                            yelp_info.train_path,...
                            yelp_info.fileContents, ...
                            yelp_info.numFiles);
%% Run kmeans and calculate centroids/words.
[   tmp,...
    yelp_info.idx,...
    yelp_info.C,...
    yelp_info.trainSize,...
    yelp_info.testSize,...
    yelp_info.totImages] = ClusterKeyPoints_1(yelp_info);
% cheap hack for appending the output from above.
for i=1:length(tmp)
    yelp_info.SurfMat{i,6}=cell2mat(tmp(i));
end
toc %end timer

save(strcat('Yelp_',num2str(vals(j)),'_keypoints'),'yelp_info');
clear yelp_info
end