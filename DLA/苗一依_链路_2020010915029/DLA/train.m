function a = train(y)
global a;
global minq;
global k;
global d;
%k q 在inialFcn中更改数值
%a,d 与inialFcn中模式选择有关
%minq 延时项最大为10
%记忆多项式
for iq=1:(minq+1) 
    for ik = 0:d:(k-1)
    Uikq = y(:,iq).*abs(y(:,iq)).^ik;
       if ik==0 && iq==1
       Ukq = y(:,iq);    
       else
       Ukq = cat(2,Ukq,Uikq);     
       end
    end
end  
    %z对应链路输入第12列
z = y(:,12);  
a= pinv(Ukq'*Ukq)*Ukq'*z;
    %系数为0时保持第一列数据
if a(1)==0
       a(1)=1; 
end
end
