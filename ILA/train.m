function a = train(y)
global a;
global minq;
global k;
global d;
%k q ��inialFcn�и�����ֵ
%a,d ��inialFcn��ģʽѡ���й�
%minq ��ʱ�����Ϊ10
%�������ʽ
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
    %z��Ӧ��·�����12��
z = y(:,12);  
a= pinv(Ukq'*Ukq)*Ukq'*z;
    %ϵ��Ϊ0ʱ���ֵ�һ������
if a(1)==0
       a(1)=1; 
end
end
