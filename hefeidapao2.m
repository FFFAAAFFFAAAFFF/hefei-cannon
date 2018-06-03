v_z=0.6;
error=100;
temp=0;
load('matlab.mat');
val=zeros(1,1000000);
for v_x=1.000:0.001:2.000
    for v_y=0.500:0.001:1.000
       
        temp=temp+1; 
        [t,X]=ode45(@(t,X) f_core1(t,X,k,g,w,m,co,si,R),[0,80],[v_x,v_y,v_z,0,0,0],odeset('RelTol',1e-8,'AbsTol',1e-8));
        
        a=find(X(:,6)>10);
        vx=interp1(X(1:a(1),6),X(1:a(1),1),10,'spline');
        vy=interp1(X(1:a(1),6),X(1:a(1),2),10,'spline');
        vz=interp1(X(1:a(1),6),X(1:a(1),3),10,'spline');
        y=interp1(X(1:a(1),6),X(1:a(1),5),10,'spline');
        x=interp1(X(1:a(1),6),X(1:a(1),4),10,'spline');
        [t,X1]=ode45(@(t,X1) f_core2(t,X1,g,w,co,si,R),[0,80],[vx,vy,vz,x,y,10]);
        
        b(1)=find(X1(:,6)==max(X1(:,6)));
        b(2)=find(X1(:,6)==X1(end,6));
        vx1=interp1(X1(b(1):b(2),6),X1(b(1):b(2),1),10,'spline');
        vy1=interp1(X1(b(1):b(2),6),X1(b(1):b(2),2),10,'spline');
        vz1=interp1(X1(b(1):b(2),6),X1(b(1):b(2),3),10,'spline');
        y1=interp1(X1(b(1):b(2),6),X1(b(1):b(2),5),10,'spline');
        x1=interp1(X1(b(1):b(2),6),X1(b(1):b(2),4),10,'spline');
        [t,X2]=ode45(@(t,X2) f_core1(t,X2,k,g,w,m,co,si,R),[0,80],[vx1,vy1,vz1,x1,y1,10]);
        
        y2=interp1(X2(:,6),X2(:,5),0,'spline');
        x2=interp1(X2(:,6),X2(:,4),0,'spline');
        
        
        %%坐标纠正到作图
        %%a=find(X(:,6)<0);
        %%plot3(X(1:a(1)-1,5),-X(1:a(1)-1,4),X(1:a(1)-1,6));
        
        
        val(temp)=(-x2-D_y)^2+(y2-D_x)^2-0.025^2;
        if val(temp)<0
            error=0;
            break;
        end
    end
    if error==0
        break;
    end
    if v_x>1.998
        error=1;
        break;
    end
end
if error==0
    b1=find(X1(:,6)>10);
    c1=find(X2(:,6)>0);
   Ans=[[X(1:a(1)-1,5);y;X1(b1,5);y1;X2(c1,5);y2],...
        [-X(1:a(1)-1,4);-x ;-X1(b1,4);-x1;-X2(c1,4);-x2],...
        [X(1:a(1)-1,6);10;X1(b1,6);10;X2(c1,6);0]];
end