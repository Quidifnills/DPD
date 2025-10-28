function uMatrix = GMPMatrix( in, K1, Q1, K2, Q2, M2, K3, Q3, M3 )
%����EGMPNLCģ�;���ĺ���
%   KΪ���ڵ���3��������M1Ϊ���ڵ���1��������M2Ϊ���ڵ���0������
x = in;
Nlen = length(x);
xMRow = Q1 + M2 + M3;
xM = zeros(Nlen,xMRow);

for m = 1:xMRow
    xM(m:end,m) = x(1:end+1-m);
end


u = [];

%%%%%%������
for m = 1:Q1
    uT = xM(:,m);
    u = [u,uT];
end

%% MPģ����
for k = 3:2:K1
    for m = 1:Q1
        uT = xM(:,m).*abs(xM(:,m)).^(k-1);
        u = [u,uT];
    end
end

%% �ͺ󽻲���
for k = 3:2:K2
    for q = 1:Q2
        for m = 1:M2 
            uT = xM(:,q).*abs(xM(:,q+m)).^(k-1);
            u = [u,uT];
        end
    end
end

%% ��ǰ������
for k = 3:2:K3
    for q = 1:Q3
        for m = 1:M3 
            uT = xM(:,q+m).*abs(xM(:,q)).^(k-1);
            u = [u,uT];
        end
    end
end

M1 = 2;M2 = 3;
for mT = 1 :M1
    
%%%%%%%%%%%%%
for m = 1:M2
    uT = xM(:,mT).*(abs(xM(:,mT)).^2).*(abs(xM(:,m+mT)).^2);
    u = [u,uT];
end

for m = 1:M2
    uT = xM(:,m+mT).*(abs(xM(:,m+mT)).^2).*(abs(xM(:,mT)).^2);
    u = [u,uT];
end
%%%%%%%%%%%%%
for m = 1:M2
    uT = xM(:,mT).*(abs(xM(:,mT)).^2).*(abs(xM(:,m+mT)).^4);
    u = [u,uT];
end

for m = 1:M2
    uT = xM(:,m+mT).*(abs(xM(:,m+mT)).^2).*(abs(xM(:,mT)).^4);
    u = [u,uT];
end

%%%%%%%%%%%%%%%%%%%%%
for m = 1:M2
    uT = xM(:,mT).*xM(:,mT).*conj(xM(:,m+mT));
    u = [u,uT];
end

for m = 1:M2
    uT = xM(:,m+mT).*xM(:,m+mT).*conj(xM(:,mT));
    u = [u,uT];
end
end

uMatrix = u;

end

