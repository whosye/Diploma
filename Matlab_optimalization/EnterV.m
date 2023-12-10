function F_valec = EnterV(p)

%% spusteni simulace

EntreFc_1_valec;
EntreFc_2_valec;
EntreFc_3_valec;
EntreFc_4_valec;
EntreFc_p_valec;
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
   F_valec = 1e8;
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
   %% Cílová funkce s váhovými koeficienty  
  
   c1 = 10;, c2 = 8;, c3 = 5;, c4 = 2;
D1 = ((Dist11+Dist12+Dist13*c1).^2)*c4;
D2 = ((Dist21+Dist22+Dist23*c1).^2)*c3;
D3 = ((Dist31+Dist32+Dist33*c1).^2)*c2;
D4 = ((Dist41+Dist42+Dist43*c1).^2)*c1;
Dp = ((Dist1p+Dist2p*c1).^2)*c1;
F_valec = D1+D2+D3+D4+Dp

end

%% Penalizace za kolizi 
if size(Fi1,1) <= 80  | size(Fi2,1) <= 80 | size(Fi3,1) <= 80 | size(Fi4,1) <= 80 | size(Fip,1) <= 80
    F_valec = 1e8;
end






