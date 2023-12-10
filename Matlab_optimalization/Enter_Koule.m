 function Fk = Enter_Koule(p)
%% Optimalizační parametry 
%%%% spolecne 
        k3_thumb   =  p(1);
        k34        =  p(2);
        k33        =  p(3);
        k32        =  p(4);
        k31        =  p(5);
        P1_length  =  p(6);
        Pfi        =  p(7);
        Pfiz       =  p(8);
%%%% Koule            
        x_k         =  p(9);
        y_k         =  p(10);
        z_k         =  p(11);
%%% spolecne w = fi/Tau 
        Tau_1kP     =  p(12);
        Tau_2kP     =  p(13);
        Tau_3kP     =  p(14);
        Tau_4kP     =  p(15);
        Tau_pkP     =  p(16);
        Tau_1kS     =  p(17);
        Tau_2kS     =  p(18);
        Tau_3kS     =  p(19);
        Tau_4kS     =  p(20);
        Tau_pkS     =  p(21);

%% ulozeni hodnot pro sim. model 

save k34 k34, save k33 k33, save k32 k32, save k31 k31, save k3_thumb
save P1_length P1_length, save Pfi Pfi, save Pfiz Pfiz

save Tau_1kP Tau_1kP, save Tau_2kP Tau_2kP, save Tau_3kP Tau_3kP, save Tau_4kP Tau_4kP
save Tau_1kS Tau_1kS, save Tau_2kS Tau_2kS, save Tau_3kS Tau_3kS, save Tau_4kS Tau_4kS
save Tau_pkP Tau_pkP, save Tau_pkS Tau_pkS 

save x_k x_k, save y_k y_k, save z_k z_k
F_koule   = EnterK(p);


Fk = F_koule;
%{
%%% spusteni simulace

EntreFc_1_koule;
EntreFc_2_koule;
EntreFc_3_koule;
EntreFc_4_koule;
EntreFc_p_koule;
%%

Vin=[V_1; V_2; V_3; V_4; V_p];
Vo=[];
Compare2 = 0;
Compare1 = (1:size(Vin,1))
for i = 1:size(Vin,1)
    if Vin(i,1) ~= 5000
        Vo = [Vo;Vin(i,1)];
         
    else
        Compare2 =Compare2+1; 
    end
end


    
if size(Compare1,2) == Compare2
    F = 1e8;
else
    
Tmax = min(Vo);

%% Dist1 
DD11=[];
for i = 1:size(Distance11,2)
    D11(i) = abs(abs(Distance11(1,i))-Tmax);
    DD11= [DD11, D11(i)];

end
    T1 = min(min(DD11));
    [T1_pos] = find(T1 == DD11(1,:));
    Dist11 = Distance11(2,T1_pos)*1e3;
    if Dist11 < 0 
       Dist11 =0;
    end
    Dist12 = Distance12(2,T1_pos)*1e3;
    if Dist12 < 0 
       Dist12 =0;
    end
    Dist13 = Distance13(2,T1_pos)*1e3;
    if Dist13 < 0 
       Dist13 =0;
    end
%% D2
DD21=[];
for i = 1:size(Distance21,2)
    D21(i) = abs(abs(Distance21(1,i))-Tmax);
    DD21= [DD21, D21(i)];

end
T2 = min(min(DD21));
    [T2_pos] = find(T2 == DD21(1,:));
    Dist21 = Distance21(2,T2_pos)*1e3;
    if Dist21 < 0 
       Dist21 =0;
    end
    Dist22 = Distance22(2,T2_pos)*1e3;
    if Dist22 < 0 
       Dist22 =0;
    end
    Dist23 = Distance23(2,T2_pos)*1e3;
    if Dist23 < 0 
       Dist23 =0;
    end
%% D3
DD31=[];
for i = 1:size(Distance31,2)
    D31(i) = abs(abs(Distance31(1,i))-Tmax);
    DD31= [DD31, D31(i)];

end
T3 = min(min(DD31));
    [T3_pos] = find(T3 == D31(1,:));
    Dist31 = Distance31(2,T3_pos)*1e3;
    if Dist31 < 0 
       Dist31 =0;
    end
    Dist32 = Distance32(2,T3_pos)*1e3;
    if Dist32 < 0 
       Dist32 =0;
    end
    Dist33 = Distance33(2,T3_pos)*1e3;
    if Dist33 < 0 
       Dist33 =0;
    end
%% D4
DD41=[];
for i = 1:size(Distance41,2)
    D41(i) = abs(abs(Distance41(1,i))-Tmax);
    DD41= [DD41, D41(i)];

end
T4 = min(min(DD41));
    [T4_pos] = find(T4 == D41(1,:));
    Dist41 = Distance41(2,T4_pos)*1e3;
    if Dist41 < 0 
       Dist41 =0;
    end
    Dist42 = Distance42(2,T4_pos)*1e3;
    if Dist42 < 0 
       Dist42 =0;
    end
    Dist43 = Distance43(2,T4_pos)*1e3;
    if Dist43 < 0 
       Dist43 =0;
    end
%% Dp
DDp1=[];
for i = 1:size(Distance1p,2)
    Dp1(i) = abs(abs(Distance1p(1,i))-Tmax);
    DDp1= [DDp1, Dp1(i)];

end
Tp = min(min(DDp1))
    [Tp_pos] = find(Tp == Dp1(1,:));
    Dist1p = Distance1p(2,Tp_pos)*1e3;
    if Dist1p < 0 
       Dist1p =0;
    end
    Dist2p = Distance2p(2,Tp_pos)*1e3;
    if Dist2p < 0 
       Dist2p =0;
end  
%    %% Soucet 
% D1 = (Dist11+Dist12+Dist13).^2;
% D2 = (Dist21+Dist22+Dist23).^2;
% D3 = (Dist31+Dist32+Dist33).^2;
% D4 = (Dist41+Dist42+Dist43).^2;
% Dp = (Dist1p+Dist2p).^2;
% F = D1+D2+D3+D4+Dp

   %% Soucet s váhama 
   % váhy na první clánek prstu + největší váhy od palec+ ukazovak po
   % nejmenší - malíček 
   c1 = 10;, c2 = 8;, c3 = 5;, c4 = 2;
D1 = ((Dist11*c4+Dist12+Dist13).^2)*c4;
D2 = ((Dist21*c4+Dist22+Dist23).^2)*c3;
D3 = ((Dist31*c4+Dist32+Dist33).^2)*c2;
D4 = ((Dist41*c4+Dist42+Dist43).^2)*c1;
Dp = ((Dist1p*c4+Dist2p).^2)*c1;
F = D1+D2+D3+D4+Dp
end

%% Penalizace za kolizi 
if size(Fi1,1) <= 80  | size(Fi2,1) <= 80 | size(Fi3,1) <= 80 | size(Fi4,1) <= 80 | size(Fip,1) <= 80
    F = 1e8;
end
%% zápis hodnot do Values.txt
%}
A=[Fk;p(1);p(2);p(3);p(4);p(5);p(6);p(7);p(8);p(9);p(10);p(11);p(12);p(13);p(14);p(15);p(16);p(17);p(18);p(19);p(20);p(21)]%;p(22);p(23);p(24);p(25);p(26);p(27)];
fileID = fopen('Values_KOULE_V2.txt','a');
fprintf(fileID,'%16.4f %12.4f %12.4f  %12.4f %12.4f  %12.4f %12.4f %12.4f  %12.4f %12.4f  %12.4f %12.4f %12.4f  %12.4f %12.4f  %12.4f %12.4f %12.4f  %12.4f %12.4f  %12.4f %12.4f \n',A)
fclose(fileID);;


