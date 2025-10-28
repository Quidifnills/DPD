function z = Pre (x)
global a;
global minq;
global k;
global d;
    %记忆多项式
for iq=1:(minq+1)
   for ik = 0:d:(k-1)
        Xikq = x(:,iq).*abs(x(:,iq)).^ik;
        if ik==0 && iq==1
            X = x(:,iq);    
        else
            X = cat(2,X,Xikq);     
        end
   end
end   
    %预失真校正后的信号输出z
     z = (X)*a;      
end
