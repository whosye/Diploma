  function F_koule = EnterK(p)

%% spusteni simulace

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
    F_koule = 1e8;
else
    
Tmax = min(Vo)

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
D1 = ((Dist11*c1+Dist12*c4+Dist13).^2)*c1;
D2 = ((Dist21*c2+Dist22*c4+Dist23).^2)*c2;
D3 = ((Dist31*c3+Dist32*c4+Dist33).^2)*c3;
D4 = ((Dist41*c4+Dist42*c4+Dist43).^2)*c4;
Dp = ((Dist1p*c4+Dist2p).^2)*c4;

F_koule = D1+D2+D3+D4+Dp

end

%% Penalizace za kolizi 
if size(Fi1,1) <= 40  | size(Fi2,1) <= 40 | size(Fi3,1) <= 40 | size(Fi4,1) <= 40 | size(Fip,1) <= 40
    F_koule = 1e8
end