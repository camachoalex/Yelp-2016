%% Create mean-size image.
run('AddPaths');
load('yelp_attributes');
clc
tic
mean_image=zeros(500,375,9);
for attribute = 1:9
    get_empty= find(cellfun(@isempty,yelp_attributes(:,attribute)));
    for k=1:(length(yelp_attributes(:,attribute)) - length(get_empty) )
        mean_image(:,:,attribute)=mean_image(:,:,attribute)+double(rgb2gray(imread(yelp_attributes{k,attribute})));
    end
    mean_image(:,:,attribute)=mean_image(:,:,attribute)./k;
    % plot it
    subplot(3,3,attribute)
    imagesc(mean_image(:,:,attribute));
    caxis([70 140]);% min and max values from mean_image(:);
    colormap(gray); colormap;
    title(sprintf('Mean attribute: %i',attribute-1));
end
toc
shg