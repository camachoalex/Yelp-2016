% In this script we separate our data nicely into different clusters and
% see if any of it actually makes sense.
run AddPaths;
load Yelp_5_keypoints.mat
ux = unique(yelp_info.idx);
if length(ux) == 1, counts = length(idx);
else counts = hist(yelp_info.idx,ux); end
hist(yelp_info.idx,ux)
% we are looking at the larger clusters. In this case, the clusters with more than meadian(counts).
chosen_ones=ux(counts>median(counts));
%% Deeper look into the chosen ones. THIS IS NOT GENERALIZED!!
% Append the file names into a new cell matrix, A.
% Each column of A will correspond to a different class.
%   A=[ X(1) X(2) ... X(N)]; X is arbitrary variable.
idx1=0; clear f2 f3 f4 f5 f6;
idx2=idx1;
idx3=idx2;
idx4=idx3;
idx5=idx4;
for k=1:yelp_info.trainSize
    if length(find(chosen_ones(1) == cell2mat(yelp_info.SurfMat(k,6)))) > 1
        idx1 = idx1+1;
        f2{idx1} = find(chosen_ones(1) == cell2mat(yelp_info.SurfMat(k,6)) );
    elseif length(find(chosen_ones(2) == cell2mat(yelp_info.SurfMat(k,6)))) > 1
        idx2 = idx2+1;
        f3{idx2} = find(chosen_ones(2) == cell2mat(yelp_info.SurfMat(k,6)) );
    elseif length(find(chosen_ones(3) == cell2mat(yelp_info.SurfMat(k,6)))) > 1
        idx3 = idx3+1;
        f4{idx3} = find(chosen_ones(3) == cell2mat(yelp_info.SurfMat(k,6)) );
    elseif length(find(chosen_ones(4) == cell2mat(yelp_info.SurfMat(k,6)))) > 1
        idx4 = idx4+1;
        f5{idx4} = find(chosen_ones(4) == cell2mat(yelp_info.SurfMat(k,6)) );
    elseif length(find(chosen_ones(5) == cell2mat(yelp_info.SurfMat(k,6)))) > 1  
        idx5 = idx5+1;
        f6{idx5} = find(chosen_ones(5) == cell2mat(yelp_info.SurfMat(k,6)) );
    end
end

Fcell={f2',f3',f4',f5',f6'};
%% append the name to A
A={};
Fcell;
for i=1:5
    for j=1:length(Fcell{i})
        A{j,i} = yelp_info.SurfMat(Fcell{i}{j},1);
    end
end
B{1}=[A{1,1};A{2,1}];
B{2}=[A{1,2};A{2,2};A{3,2};A{4,2}];
B{3}=[A{1,3};A{2,3};A{3,3};A{4,3};A{5,3}];
B{4}=[A{1,4};A{2,4};A{3,4};A{4,4}];
B{5}=[A{1,5};A{2,5};A{3,5}];
%% plot the images
cluster_group = chosen_ones(1:5);
for k=1:length(B)
    idx=0;
    tmp=unique(B{k})
    for i=1:length(tmp)
        idx=idx+1;
        subplot(3,2,idx)
        f = imshow(char(tmp(i)));
    end
    savefig(strcat('centroid_',num2str(cluster_group(k) ),'_train' ));
end
close all;
