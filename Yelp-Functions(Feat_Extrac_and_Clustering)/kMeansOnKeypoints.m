% In this script we run the k-means clustering algorithm on the clustered
% keypoints genereated by ClusterKeypoints_1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SURFMat CELL DESCRIPTION:
%1. FileName,
%2. Five feature vectors for the image
%3.  Business ID
%4. Photo ID
%5. Given Attributes
%6. Cluster Round 1
%7. Clusters based on column #6.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Write data into a matrix.
wordData = [];
for i=1:trainSize
    wordData = [wordData ;SURFMat{i,end}];
end
%% Kmeans 
[idx,C2,sumd,~]=kmeans(wordData, 61 ,'Display','iter','Distance','sqeuclidean');
for k=1:length(idx)
    SURFMat{k,7}=idx(k);
end
%%
save(outputFileName,'SURFMat','trainSize','totImages','C2','testSize','idx')

