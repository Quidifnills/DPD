% 估计全速率的PA输出
% 输入为全速率x
% MP 模型和PA_Forward一致

function yout = Output_Estimation(in)

    global PA_coe;
    global K_PA; 
    global Q_PA;

    X = [];
    for k = 1:K_PA
        for q = 1:Q_PA
            tmp = in(:,q).*abs(in(:,q)).^(k-1);
            X = [X tmp];
        end
    end

    yout = X * PA_coe;

end