function Output = DataDecoder(start,EncodedData)
%   Decoder for the data of the hamming Encoder n stands for the number of bits to
%   be coded (7 or 15)

n = 7;                % Code length for the 7 bit transmission
k = 4;                % Message length for the 7bit transmisiion
n1 = 15;              % Code length for the 15 bit transmission
k1 = 11;              % Code length for the 15 bit transmission
Var3 = 0;
%EncodedData = bi2de(EncodedData);

if start ==1
   Var = decode(EncodedData,n,k,'hamming');
elseif start == 2
   Var = decode(EncodedData,n1,k1,'hamming');
else
    disp('Wrong input');
end

%Var(1:7:end) = NaN;

% for i = (n+1):(n+1):length(Var)
%     disp(i);
%     if length(Var) == i
%         
%     else
%     disp(Var(i));
%     %disp(length(Var));
%    Var2= Var( i: i+n   );
%    Var3= [Var3;Var2];
%     end
% end

Output = Var;
end

