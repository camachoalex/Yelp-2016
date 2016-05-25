% In this script we separate our data nicely into different clusters and
% see if any of it actually makes sense.
clear
load('SURFMATRIX_25pts.mat');
ux = unique(idx);
if length(ux) == 1, counts = length(idx);
else counts = hist(idx,ux); end
hist(idx,ux)
chosen_ones=ux(counts>5)

%% Deeper look into the chosen ones. THIS IS NOT GENERALIZED!!
% Append the file names into a new cell matrix, A.
% Each column of A will correspond to a different class.
%   A=[ X(1) X(2) ... X(N)]; X is arbitrary variable.
tmpB=cell2mat(SURFMat(1:217,7));
f30=find(tmpB==chosen_ones(1));
f32=find(tmpB==chosen_ones(2));
f35=find(tmpB==chosen_ones(3));
f44=find(tmpB==chosen_ones(4));
f51=find(tmpB==chosen_ones(5));
Fcell={f30, f32,f35, f44, f51};

A={};
for i=1:5
    for j=1:length(Fcell{i})
        A{j,i}=SURFMat(Fcell{i}(j), 1);
    end
end
%% Read in the images from one class. 
% I'm only looking at the first 6. I don't want to deal with vectors of
% different lengths.
close all;
h=figure(10); hist(idx,ux);title('freq count of classes');
savefig(h,'HistOfClusteredKeypoints')
for gb=1:5
    h=figure(gb);
    for i=1:6
        subplot(2,3,i)
        I =imread(cell2mat(A{i,gb}));
        imshow(I);
    end
    suptitle(strcat('class: ',num2str(chosen_ones(gb)))); 
    savefig(h,strcat('AnalysisClassIM_',num2str(chosen_ones(gb))))
end
% Create a subplot within a subplot. It'd be really cool for comparisons purposes.
