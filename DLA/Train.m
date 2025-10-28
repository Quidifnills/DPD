% DLA 训练模型
% 牛顿迭代法
function DPD_coe = Train( in )
%% DPD 模型系数
global K_DPD; 
global Q_DPD;
global DPD_coe;
global iter;

mu = 0.99;
% global flag;
% flag = 1;
% %% 控制迭代终止
%     ITR_MAX = 100000;
%     iter = iter + 1;
%     if iter > ITR_MAX
%         mu = 0;
%         flag = 0;
%     end
%% 拼接矩阵
    Y = in (:,1);
    u = in (:,2);
    ud = in (:,2:end);

    U = [];
    for k = 1:K_DPD
        for q = 1:Q_DPD
            tmp = ud(:,q).*abs(ud(:,q)).^(k-1);
            U = [U tmp];
        end
    end

    DPD_coe = DPD_coe + mu * (pinv(U'*U)*U'*(u - Y));

    %系数为0时保持第一列数据
    if DPD_coe(1) == 0
       DPD_coe(1) = 1; 
    end

end