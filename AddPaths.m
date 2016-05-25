% paths to files with functions and analysis.
allPaths = {'./Yelp-Functions(Feat_Extrac_and_Clustering)/',...
           './DataExploration_Filtering_SomeStats/',...
           './Analysis',...
           './Output'};
for p=1:length(allPaths)
    addpath(allPaths{p})
end
clear allPaths