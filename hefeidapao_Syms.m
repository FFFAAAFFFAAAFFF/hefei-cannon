syms g g0 R h w v ;
syms co si;
W=[-co*w,0,si*w];
syms Dx Dy Dz D2x D2y D2z x y z;
syms m;
F_cor=cross([Dx,Dy,Dz],W)*2*m;
G=[0,0,-m*g0*R^2/(R^2+z^2)];
syms k;
F_=-k*sqrt(Dx^2+Dy^2+Dz^2).*[Dx,Dy,Dz];
Ma=F_+G+F_cor;
D2x=Ma(1)/m;
D2y=Ma(2)/m;
D2z=Ma(3)/m;
Ma=F_cor+G;
D2x_2=Ma(1)/m;
D2y_2=Ma(2)/m;
D2z_2=Ma(3)/m;