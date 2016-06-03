% Made by Martyn van Dijke
% Student number 0887668
% Hamming coding(11,7) and coding(20,15) excersie for the Tu/e course Telecommunication Systems

clear variables;
clc; 

%general variables for the generator matrix

%%the to encode bit stream
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

%%second matrix for the 15 bit transmisson
d_11 = [1;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
d_21 = [0;1;0;0;0;0;0;0;0;0;0;0;0;0;0];
d_31 = [0;0;1;0;0;0;0;0;0;0;0;0;0;0;0];
d_41 = [0;0;0;1;0;0;0;0;0;0;0;0;0;0;0];
d_51 = [0;0;0;0;1;0;0;0;0;0;0;0;0;0;0];
d_61 = [0;0;0;0;0;1;0;0;0;0;0;0;0;0;0];
d_71 = [0;0;0;0;0;0;1;0;0;0;0;0;0;0;0];
d_8 =  [0;0;0;0;0;0;0;1;0;0;0;0;0;0;0];
d_9 =  [0;0;0;0;0;0;0;0;1;0;0;0;0;0;0];
d_10 = [0;0;0;0;0;0;0;0;0;1;0;0;0;0;0];
d_11 = [0;0;0;0;0;0;0;0;0;0;1;0;0;0;0];
d_12 = [0;0;0;0;0;0;0;0;0;0;0;1;0;0;0];
d_13 = [0;0;0;0;0;0;0;0;0;0;0;0;1;0;0];
d_14 = [0;0;0;0;0;0;0;0;0;0;0;0;0;1;0];
d_15 = [0;0;0;0;0;0;0;0;1;0;0;0;0;0;1];

%parity bit colum vectors
p_1 = [1;1;0;1;1;0;1];
p_2 = [1;0;1;1;0;1;1];
p_3 = [0;1;1;1;0;0;0];
p_4 = [0;0;0;0;1;1;1]

% second matrix for the 15 bit transmission
p_11 = [1;1;0;1;1;0;1;0;0;0;0;0;0;0;0];
p_21 = [1;0;1;1;0;1;1;0;0;0;0;0;0;0;0];
p_31 = [0;1;1;1;0;0;0;0;0;0;0;0;0;0;0];
p_41 = [0;0;0;0;1;1;1;0;0;0;0;0;0;0;0];
p_5  = [0;0;0;0;1;1;1;0;0;0;0;0;0;0;0];

%construct the generator matrix
Generator = [p_1,p_2,p_3,p_4, d_1,d_2,d_3,d_4,d_5,d_6,d_7];
Encoder = [ 1, 0, 0 ,0, p_1'; 0,1,0,0 , p_2'; 0,0,1,0, p_3'; 0,0,0,1,p_4'];
Decoder = [0,0,0,0,d_1';0,0,0,0,d_2';0,0,0,0,d_3';0,0,0,0,d_4';0,0,0,0,d_5';0,0,0,0,d_6';0,0,0,0,d_7';];

%second matrix for the 15 bit transmission
Generator1 = [p_11,p_21,p_31,p_41, p_5, d_11,d_21,d_31,d_41,d_51,d_61,d_71,d_8,d_9,d_10,d_11,d_12,d_13,d_14,d_15];
Encoder1 = [ 1, 0, 0 ,0, 0 p_11'; 0,1,0,0,0, p_21'; 0,0,1,0,0, p_31'; 0,0,0,1,0,p_41' ; 0,0,0,0,1 p_5' ];
Decoder1 = [0,0,0,0,0,d_11';0,0,0,0,0,d_21';0,0,0,0,0,d_31';0,0,0,0,0,d_41';0,0,0,0,0,d_51';0,0,0,0,0,d_61';0,0,0,0,0,d_71';0,0,0,0,0,d_8';0,0,0,0,0,d_9';0,0,0,0,0,d_10';0,0,0,0,0,d_11';0,0,0,0,0,d_12';0,0,0,0,0,d_13';0,0,0,0,0,d_14';0,0,0,0,0,d_15'];

Null = [0;0;0;0];
Null1 = [0;0;0;0;0];

%% do the actual computational work
disp('Encoding the bistream');
Encoded = mod( (Generator'*x),2);

%load other faulty encoded bit stream debugging purpose
load('matlab.mat')


disp('Caclulting the syndrome matrix');
Syndrome = mod((Encoder*encode2),2)
if Syndrome == Null;
    disp('No Errors recived');
else
    disp('Errors recived');
    disp('Going to fix the bit errors');
    for j=1:1:4
        if Syndrome(j) ~= 0;
            disp(j)
            
        end
        
    end

end
disp('Decoding the bitstream');
Decode = mod((Decoder*Encoded),2);

%% PRBS
%enb = lteRMCDL('R.0');
%seq = ltePRBS(162,4);
%seq = ltePRBS(162,4);
