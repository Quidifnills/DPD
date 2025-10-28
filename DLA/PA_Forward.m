% PA 正向模型估计 
% 使用欠采样信号xd, yd估计PA系数

function PA_coe = PA_Forward (in)

    global PA_coe; 
    global K_PA; 
    global Q_PA;
    global D;
    global Samplesperframe;
    global Upsmp;

    xd = in(1:(end-Samplesperframe*Upsmp/D),1);
    xd = reshape(xd,[Samplesperframe*Upsmp,6]);
    yd = in(end-Samplesperframe*Upsmp/D+1:end,1);

    X = [];
    for k = 1:K_PA
        for q = 1:Q_PA
            tmp = xd(:,q).*abs(xd(:,q)).^(k-1);
            X = [X tmp];
        end
    end

    [numRows,~] = size(X);
    U = [];
    for m = 0:numRows/D-1
        tmp = X(m*D+1,:);
        U = [U;tmp];
    end
    PA_coe = pinv(U'*U)*U'*yd;

    %系数为0时保持第一列数据
    if PA_coe(1) == 0
       PA_coe(1) = 1; 
    end
end

