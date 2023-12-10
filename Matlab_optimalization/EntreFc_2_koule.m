
%% spuštění simulace

        
sim('Prst_2.slx')

%% načtení hodnot ze simulace 

load Prubeh_Fi21, load Prubeh_Fi22, load Prubeh_Fi23
load Distance21, load Distance22, load Distance23


%% načtení úhlů 

for i = 1:size(Distance21,2)
    Touch21 =  Distance21(2,i);
    if Touch21 <= 0;
        R21=Touch21;
  
[Touch21_pos]=find(R21 == Distance21(2,:));
T21 = Distance21(1,Touch21_pos);
T21 = T21(1,1);
  break 
    else
        T21 = 5000; 
    end
end
             
for i = 1:size(Distance22,2)
    Touch22 =  Distance22(2,i);
    if Touch22 <= 0;
        R22=Touch22;
     
[Touch22_pos]=find(R22 == Distance22(2,:));
T22 = Distance22(1,Touch22_pos);
T22 = T22(1,1);
break
    else
        T22 = 5000; 
    end
end

for i = 1:size(Distance23,2)
    Touch23 =  Distance23(2,i);
    if Touch23 <= 0;
        R23=Touch23; 
[Touch23_pos]=find(R23 == Distance23(2,:));
T23 = Distance23(1,Touch23_pos);
T23 = T23(1,1);
    break
    else
        T23 = 5000; 
    end
end

V_2 = [T21;T22;T23];

Fi2=(Fi21s(2,:).*(-180/pi))';

%{
%% načtení hodnot dotyku (C1, C22, C23)
%T1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero1=0;
for i = 1:size(T1,1)
    C21 = T1(i,1);
    if C21 == 0 ;
        alliszero1=0;
    else
        alliszero1=1;
       C21 = T1(i,1);
       break
    end
    
end
if alliszero1==0
    C21=5000;
end

%T2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero2=0;
for i = 1:size(T2,1)
    C22 = T2(i,1);
    if C22 == 0 
        alliszero2=0;
    else
        alliszero2=1;
       C22 = T2(i,1);
       break
    end
end
if alliszero2==0
    C22=5000;
end

%T3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
alliszero3=0;
for i = 1:size(T3,1)
    C23 = T3(i,1);
    if C23 == 0 
        alliszero3=0;
    else
        alliszero3=1;
       C23 = T3(i,1);
       break
    end
    
end
if alliszero3==0
    C23=5000;
end




save C21, save C22, save C23
T21 = T1; 
T22 = T2;
T23 = T3; 

save T21, save T22, save T23
%% Kriterium 1 
F1 =0 ; %kriterium dotyku 
%% Přiřazení váhy podle typu kontaktu 

%Krit za 0 dotyk 
if ((C21+C22+C23) == 15000) 
    F1 = 20000;
    else
    F1=0;
end
%  VSECHNY CLANKY%%%%%%%%%%%
% Dotek 1 + 2 + 3 => penalizace 0
D1 = 0;
if 	C23 ~= 5000  &&  C22 ~= 5000  &&  C21 ~= 5000
    F1 = (F1+D1)*v132; 
end

%  DVA     CLANKY%%%%%%%%%%%
%Dotek dva clanky => penalizace 1000
D2 = 1000;

% Dotek 3 + 2 

if 	C23 ~= 5000  &&  C22 ~= 5000  &&  C21 == 5000
    F1 = (F1+D2);
end

%Dotek 1 + 2 

if 	C21 ~= 5000  &&  C22 ~= 5000  &&  C23 == 5000
    F1 = (F1+D2);
end  

%Dotek 3 + 1  

if 	C21 ~= 5000  &&  C23 ~= 5000  &&  C22 == 5000
    F1 = (F1+D2);
end  

%  JEDEN     CLANEK %%%%%%%%%%%
%Dotek 1 =>penalizace 2000
D1= 10000;

if 	C21 ~= 5000  &&  C23 == 5000  &&  C22 == 5000
    F1 = (F1+D1);
end  

%Dotek 2 

if 	C22 ~= 5000  &&  C23 == 5000  &&  C21 == 5000
    F1 = (F1+D1);
end  

%Dotek 3 
if 	C23 ~= 5000  &&  C21 == 5000  &&  C22 == 5000
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
if C21 ~= 5000
    R21 =0;
end

if C22 ~= 5000
    R22 =0;
end

if C23 ~= 5000
    R23 =0;
end

F4= (R21+R22+R23)*1e5;
%% Finalni funkce 
%}
%F2_koule= F1+F2+F3+F4;  % Finální kriteriální funkce 