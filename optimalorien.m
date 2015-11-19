function phi = optimalorien (usx,usy,ujx,ujy,N)

L = 2/N;
m = 0;
flag = 1;
dsj = sqrt((usx-ujx)^2+(usy-ujy)^2);
if (L>dsj)
    dp(1) = dsj;
end
while (flag == 1)
    m = m+1;
    l = L*m;
    if(l<=dsj)
        dp(m) = l;
        flag = 1;
    else
        flag = 0;
    end
end
for i = 1:length(dp)
    gamma(i) = acos(dp(i)/dsj);  
end
phi_0 = atan((usy-ujy)/(usx-ujx));
if (phi_0 < 0)
   phi_0 = pi+phi_0;
end
index = 0;
phi = zeros(length(gamma)*2,1);
for i = 1:length(gamma)
    index = index + 1;
    phi(index) = phi_0+gamma(i);
    index = index + 1;
    phi(index) = phi_0-gamma(i);   
end

for i = 1:length(phi)
    if (phi(i)>pi)
        phi(i) = phi(i)-pi;
    elseif(phi(i)<0)
        phi(i) = phi(i)+pi;   
    end
end
end
