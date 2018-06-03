function dydt= f_core1(t,X,k,g0,w,m,co,si,R)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
dydt=zeros(6,1);
dydt(1)=-(X(1)*k*sqrt(X(1)^2+X(2)^2+X(3)^2)-2*X(2)*m*si*w)/m;
dydt(2)=-(2*X(3)*co*w+2*X(1)*si*w+X(2)*k*sqrt(X(1)^2+X(2)^2+X(3)^2)/m);
dydt(3)=-g0*R^2/(R^2+X(6)^2)-X(3)*k*sqrt(X(1)^2+X(2)^2+X(3)^2)/m+2*X(2)*co*w;
dydt(4)=X(1);
dydt(5)=X(2);
dydt(6)=X(3);
end

