% 4/13
% The purpose of this script is to group the results of the
% ClusterKeyPoints_1.m.
% To do so, look through each vector and group the images together. For example,
% x=[1 2 3 4], y= [2 23 6 1 4];
% => group 1,2,4 will contain image(s) x and y
%% Second Method
% use the "sign-change method" 
% should i reorder the vectors?
%% Grouping assignment
load('SURFMATRIX_5pts');
idx=cell2mat(SURFMat(:,6));
idx=unique(idx);
groupingMat={};
rowNum=1;
% iterate through idx and check if it corresponds to a keypoint.
for ii=1:numel(idx)
    for j=1:trainSize
        if ismember(ii, SURFMat{j,6})
            groupingMat{rowNum,ii}=SURFMat{j,1};
            rowNum=rowNum+1;
        end
    end
    rowNum=1;
end
%%
for p=1:50
    for k=1:25
        subplot(5,5,k)
        myimshow(imread(groupingMat{k,2}))
    end
    
end
shg

