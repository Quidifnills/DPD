function z = Pre (x)
global a;
global minq;
global k;
global d;
    %�������ʽ
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
    %Ԥʧ��У������ź����z
     z = (X)*a;      
end
