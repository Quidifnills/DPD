% 估计预失真信号
% 输入为全速率x
% MP 模型和Train一致

function x = Pre(u)
    global DPD_coe;
    global K_DPD; 
    global Q_DPD;
    U = [];
    for k = 1:K_DPD
        for q = 1:Q_DPD
            tmp = u(:,q).*abs(u(:,q)).^(k-1);
            U = [U tmp];
        end
    end
    
    x = U * DPD_coe;

end