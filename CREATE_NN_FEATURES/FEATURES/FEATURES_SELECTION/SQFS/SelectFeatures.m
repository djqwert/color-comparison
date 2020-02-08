function R = SelectFeatures(input,target,hiddenLayerSize)

    hidden = zeros(size(input,1),size(input,2));
    hidden(1,1) = hiddenLayerSize;
    opts = statset('display','iter');
    cvp = cvpartition(length(input),'kfold',10);
    [fs,history] = sequentialfs(@Criterion,input,target,hidden,'cv','none',...
                                    'direction','forward','options',opts);
    R = fs;

end