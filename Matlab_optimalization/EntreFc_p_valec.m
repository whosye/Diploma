
%% spuštění simulace

sim('palecV.slx')

%% načtení hodnot ze simulace 

load Prubeh_Fi1p, load Prubeh_Fi2p
load Distance1p, load Distance2p
%% Cas kontaktu 
%R_i_p vzdálenost mezi geometriema 2 teles pri prvnim doteku 
for i = 1:size(Distance1p,2)
    Touch1p =  Distance1p(2,i);
    if Touch1p <= 0;
        R1p=Touch1p;
[Touch1p_pos]=find(R1p == Distance1p(2,:));
T1p = Distance1p(1,Touch1p_pos);
T1p = T1p(1,1);
 break
    else
        T1p = 5000; 
    end
end
             

for i = 1:size(Distance2p,2)
    Touch2p =  Distance2p(2,i);
    if Touch2p <= 0;
        R2p=Touch2p
[Touch2p_pos]=find(R2p == Distance2p(2,:));
T2p = Distance2p(1,Touch2p_pos)
T2p = T2p(1,1);
break 
    else
        T2p = 5000; 
    end
    
end

V_p = [T1p;T2p]


%% načtení úhlů 
Fip=(Fi1ps(2,:).*(-180/pi))';


%{
%% načtení hodnot dotyku (C1, C2p, C3)
%T1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero1=0;
for i = 1:size(T1,1)
    C1p = T1(i,1);
    if C1p == 0 ;
        alliszero1=0;
    else
        alliszero1=1;
       C1p = T1(i,1);
       break
    end
    
end
if alliszero1==0
    C1p=5000;
end

%T2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero2=0;
for i = 1:size(T2,1)
    C2p = T2(i,1);
    if C2p == 0 
        alliszero2=0;
    else
        alliszero2=1;
       C2p = T2(i,1);
       break
    end
end
if alliszero2==0
    C2p=5000;
end



save C1p, save C2p
T1p = T1; 
T2p = T2;
save T1p, save T2p
%% Kriterium 1 

F1 = 0 ; %kriterium dotyku 
%% Přiřazení váhy podle typu kontaktu 

%Krit za 0 dotyk 
if ((C1p+C2p) == 10000) 
    F1 = 20000;
    else
    F1=0;
end
%  VSECHNY CLANKY%%%%%%%%%%%
% Dotek 1 + 2  => penalizace 0
D1 = 0;

if 	 C2p ~= 5000  &&  C1p ~= 5000
    F1 = (F1+D1); 
end

%  DVA     CLANKY%%%%%%%%%%%
%Dotek jeden clanek => penalizace 1000
D2 = 1000;

% Dotek 1

if  C1p ~= 5000
    F1 = (F1+D2);
end

%Dotek 2 

if  C2p ~= 5000
    F1 = (F1+D2);
end  

%% Kriterium 2 - penalizace pro casove narocnou sim.
Check = ans.yout{1}.Values.Data; % nacteni hodnoty ze Simul Time Check 

stateC4=1;
for i=1:size(Check,1)
    C4 =Check(i,1);
    if C4 == 0
        F2 = 0; 
    else
        stateC4 =1;
        F2 = 50000;
    end
end

%% Kriterium 3 

Delta12 =norm(abs(Fi1-Fi2));
F3t =0;
if Fi1 == 0;
    F3t = 50000;
end
F3 = Delta12+ F3t;% Kriterium pro rovnoměrnost pohybu
%% Kriterium 4 
if C1p ~= 5000
    R1p =0;
end

if C2p ~= 5000
    R2p =0;
end

F4= (R1p+R2p)*1e5;
%}
%% Finalni funkce 

%Fp_koule= F1+F2+F3+F4;  % Finální kriteriální funkce 
