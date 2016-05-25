function [SurfMat,idx, C, trainSize, testSize, totImages] = ClusterKeyPoints_1(yelp_info)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % SURFMat CELL COLUMN DESCRIPTION:
    %1. FileName,
    %2. Five feature vectors for the image
    %3. Business ID
    %4. Photo ID
    %5. Attributes
    %6. Cluster Round 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % THIS FUNCTION IS HARD-CODED TO WRITE TO THE 6TH COLUMN OF THE MATRIX.
    % Determine training and testing size. I chose a 70/30
    totImages= length(yelp_info.SurfMat);
    trainSize=ceil(totImages*.7);
    testSize= totImages - trainSize;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Write data into a matrix.
    wordData = [];
    for i=1:trainSize
        wordData = [wordData yelp_info.SurfMat{i,2}];
    end
    wordData=double(wordData)';
    %% Kmeans 
    [idx,C,~,~]=kmeans(wordData, yelp_info.numWords ,'Display','iter','Distance','sqeuclidean');
    %% There has to be a better way to append these values
    h=0;
    tmpVec=[];
    for k=1:length(idx)
        tmpVec=[tmpVec idx(k)];
        if length(tmpVec) == yelp_info.featPerImage
            h=h+1;
            SurfMat{h,1}=tmpVec;
            tmpVec=[];
        end
    end
%     yelp_info.idx = idx;
%     yelp_info.cluster_mean = C;
%     yelp_info.testSize = testSize;
%     yelp_info.totNumImages= totImages;
%     yelp_info.trainSize = trainSize;
%     save(outputFileName,'SURFMat','trainSize','totImages','C','testSize','idx')
    
end
