
%% spuštění simulace

sim('Prst_4V.slx')

%% načtení hodnot ze simulace 

load Prubeh_Fi41, load Prubeh_Fi42, load Prubeh_Fi43
load Distance41, load Distance42, load Distance43




for i = 1:size(Distance41,2)
    Touch41 =  Distance41(2,i);
    if Touch41 <= 0;
        R41=Touch41;
  
[Touch41_pos]=find(R41 == Distance41(2,:));
T41 = Distance41(1,Touch41_pos);
T41 = T41(1,1);
  break 
    else
        T41 = 5000; 
    end
end
             
for i = 1:size(Distance42,2)
    Touch42 =  Distance42(2,i);
    if Touch42 <= 0;
        R42=Touch42;
     
[Touch42_pos]=find(R42 == Distance42(2,:));
T42 = Distance42(1,Touch42_pos);
T42 = T42(1,1);
break
    else
        T42 = 5000; 
    end
end

for i = 1:size(Distance43,2)
    Touch43 =  Distance43(2,i);
    if Touch43 <= 0;
        R43=Touch43; 
[Touch43_pos]=find(R43 == Distance43(2,:));
T43 = Distance43(1,Touch43_pos);
T43 = T43(1,1);
    break
    else
        T43 = 5000; 
    end
end

V_4 = [T41;T42;T43]

%% načtení úhlů 
Fi4=(Fi41s(2,:).*(-180/pi))';



%{
%% načtení hodnot dotyku (C1, C2, C3)
%T1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero1=0;
for i = 1:size(T1,1)
    C41 = T1(i,1);
    if C41 == 0 ;
        alliszero1=0;
    else
        alliszero1=1;
       C41 = T1(i,1);
       break
    end
    
end
if alliszero1==0
    C41=5000;
end

%T2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero2=0;
for i = 1:size(T2,1)
    C42 = T2(i,1);
    if C42 == 0 
        alliszero2=0;
    else
        alliszero2=1;
       C42 = T2(i,1);
       break
    end
end
if alliszero2==0
    C42=5000;
end

%T3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
alliszero3=0;
for i = 1:size(T3,1)
    C43 = T3(i,1);
    if C43 == 0 
        alliszero3=0;
    else
        alliszero3=1;
       C43 = T3(i,1);
       break
    end
    
end
if alliszero3==0
    C43=5000;
end




save C41, save C42, save C43
T41 = T1; 
T42 = T2;
T43 = T3; 

save T41, save T42, save T43

%% Kriterium 1

F1 =0 ; %kriterium dotyku 
%% Přiřazení váhy podle typu kontaktu 
%Krit za 0 dotyk 
if ((C41+C42+C43) == 15000) 
    F1 = 20000;
    else
    F1=0;
end
%  VSECHNY CLANKY%%%%%%%%%%%
% Dotek 1 + 2 + 3 => penalizace 0
D1 = 0;

if 	C43 ~= 5000  &&  C42 ~= 5000  &&  C41 ~= 5000
    F1 = (F1+D1); 
end

%  DVA     CLANKY%%%%%%%%%%%
%Dotek dva clanky => penalizace 1000
D2 = 1000;

% Dotek 3 + 2 

if 	C43 ~= 5000  &&  C42 ~= 5000  &&  C41 == 5000
    F1 = (F1+D2);
end

%Dotek 1 + 2 
if 	C41 ~= 5000  &&  C42 ~= 5000  &&  C43 == 5000
    F1 = (F1+D2);
end  

%Dotek 3 + 1  

if 	C41 ~= 5000  &&  C43 ~= 5000  &&  C42 == 5000
    F1 = (F1+D2);
end  

%  JEDEN     CLANEK %%%%%%%%%%%
%Dotek 1 =>penalizace 2000
D1= 10000;
if 	C41 ~= 5000  &&  C43 == 5000  &&  C42 == 5000
    F1 = (F1+D1);
end  

%Dotek 2 
if 	C42 ~= 5000  &&  C43 == 5000  &&  C41 == 5000
    F1 = (F1+D1);
end  

%Dotek 3 
if 	C43 ~= 5000  &&  C41 == 5000  &&  C42 == 5000
    F1 = (F1+D1);
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
Delta13 =norm(abs(Fi1-Fi3));
Delta23 =norm(abs(Fi2-Fi3)); 
F3t =0;
if Fi1 == 0;
    F3t = 50000;
end

F3 = Delta13 + Delta23 + F3t; % Kriterium pro rovnoměrnost pohybu
%% Kriterium 4 
if C41 ~= 5000
    R41 =0;
end

if C42 ~= 5000
    R42 =0;
end

if C43 ~= 5000
    R43 =0;
end

F4= (R41+R42+R43)*1e5;

%% Finalni funkce 
%}
%F4_koule= F1+F2+F3+F4;  % Finální kriteriální funkce 