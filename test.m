%http://nl.mathworks.com/help/comm/ref/hammgen.html 

%Gp = [ 1,1,0,1; 1,0,1,1; 1, 0, 0,0; 0,1,1,1;0,1,0,0; 0, 0,1,0;0,0,0,1]
x = [0;1;1;0;1;0;1];
d_1 = [1;0;0;0;0;0;0];
d_2 = [0;1;0;0;0;0;0];
d_3 = [0;0;1;0;0;0;0];
d_4 = [0;0;0;1;0;0;0];
d_5 = [1;0;0;0;1;0;0];
d_6 = [1;0;0;0;0;1;0];
d_7 = [1;0;0;0;0;0;1];

p_1 = [1;1;0;1;1;0;1];
p_2 = [1;0;1;1;0;1;1];
p_3 = [1;1;0;1;1;0;1];
p_4 = [1;0;1;1;0;1;1];

Gp = [ 
%Gp*x