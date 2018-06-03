function  dydt= f_core2(t,X_1,g0,w,co,si,R)
    dydt=zeros(6,1);
    dydt(1)=2*X_1(2)*si*w;
    dydt(2)=-2*X_1(3)*co*w-2*X_1(1)*si*w;
    dydt(3)=-R^2*g0/(R^2+X_1(6)^2)+2*X_1(2)*co*w;
    dydt(4)=X_1(1);
    dydt(5)=X_1(2);
    dydt(6)=X_1(3);
end