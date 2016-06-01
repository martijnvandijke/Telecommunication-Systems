% Made by Martyn van Dijke
% Student number 0887668
% Hamming coding(11,7) excersie for the Tu/e course Telecommunication Systems

clear variables;
clc; 
%Gp = [ p_1 , p_2, p_3, p_4, d_1, d_2, d_3, d_4, d_5, d_6, d_7];
%G = [ p_1 , p_2, d_1, p_3,d_2,d_3,d_4,p_4,d_5,d_6,d_7];
%G = [d_7, d_6,d_5,d_4,d_3,d_2,d_1,p_4,p_3,p_2,p_1];
%D3 = [d_7',1,1,0,1;d_6', 0,1,0,1;d_5',1,0,0,1;d_4',1,1,1,0;d_3',0,1,1,0;d_2',1,0,1,0;d_1',1,1,0,0];
%D4 = [1,1,0,1,d_7'; 0,1,0,1,d_6';1,0,0,1,d_5';1,1,1,0,d_4';0,1,1,0,d_3';1,0,1,0,d_2';1,1,0,0,d_1'];
%D5 = [d_1',1,1,0,1;d_2', 0,1,0,1;d_3',1,0,0,1;d_4',1,1,1,0;d_5',0,1,1,0;d_6',1,0,1,0;d_7',1,1,0,0];
%D6 = [d_7',1,1,0,1;d_6', 0,1,0,1;d_5',1,0,0,1;d_4',1,1,1,0;d_3',0,1,1,0;d_2',1,0,1,0;d_1',1,1,0,0];
%D2 = D';
%general variables for the generator matrix

%%to encode bit stream
x =   [1;1;0;0;1;0;1];

%% static variables needed in order to produce the matrix's
%data coloum vectors
d_1 = [1;0;0;0;0;0;0];
d_2 = [0;1;0;0;0;0;0];
d_3 = [0;0;1;0;0;0;0];
d_4 = [0;0;0;1;0;0;0];
d_5 = [0;0;0;0;1;0;0];
d_6 = [0;0;0;0;0;1;0];
d_7 = [0;0;0;0;0;0;1];
%parity bit colum vectors
p_1 = [1;1;0;1;1;0;1];
p_2 = [1;0;1;1;0;1;1];
p_3 = [0;1;1;1;0;0;0];
p_4 = [0;0;0;0;1;1;1];
%construct the generator matrix
Generator = [p_1,p_2,p_3,p_4, d_1,d_2,d_3,d_4,d_5,d_6,d_7];
Encoder = [ 1, 0, 0 ,0, p_1'; 0,1,0,0 , p_2'; 0,0,1,0, p_3'; 0,0,0,1,p_4'];
Decoder = [0,0,0,0,d_1';0,0,0,0,d_2';0,0,0,0,d_3';0,0,0,0,d_4';0,0,0,0,d_5';0,0,0,0,d_6';0,0,0,0,d_7';];
Null = [0;0;0;0];

%% do the actual computational work
disp('Encoding the bistream');
Encoded = mod( (Generator'*x),2);

%load other faulty encoded bit stream debugging purpose
load('matlab.mat')



%no erros if this contains all zero's
disp('Caclulting the syndrome matrix');
Syndrome = mod((Encoder*Encoded),2);
if Syndrome == Null
    disp('No Errors recived');
else
    disp('Errors recived');
    disp('Going to fix the errors');
    
end
disp('Decoding the bitstream');
Decode = mod((Decoder*Encoded),2);
