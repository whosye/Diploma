
%% spuštění simulace


sim('Prst_3.slx')

%% načtení hodnot ze simulace 

load Prubeh_Fi31, load Prubeh_Fi32, load Prubeh_Fi33
load Distance31, load Distance32, load Distance33

for i = 1:size(Distance31,2)
    Touch31 =  Distance31(2,i);
    if Touch31 <= 0;
        R31=Touch31;
  
[Touch31_pos]=find(R31 == Distance31(2,:));
T31 = Distance31(1,Touch31_pos);
T31 = T31(1,1);
  break 
    else
        T31 = 5000; 
    end
end
             
for i = 1:size(Distance32,2)
    Touch32 =  Distance32(2,i);
    if Touch32 <= 0;
        R32=Touch32;
     
[Touch32_pos]=find(R32 == Distance32(2,:));
T32 = Distance32(1,Touch32_pos);
T32 = T32(1,1);
break
    else
        T32 = 5000; 
    end
end

for i = 1:size(Distance33,2)
    Touch33 =  Distance33(2,i);
    if Touch33 <= 0;
        R33=Touch33; 
[Touch33_pos]=find(R33 == Distance33(2,:));
T33 = Distance33(1,Touch33_pos);
T33 = T33(1,1);
    break
    else
        T33 = 5000; 
    end
end

V_3 = [T31;T32;T33]
%% načtení úhlů 
Fi3=(Fi31s(2,:).*(-180/pi))';



%{
%% načtení hodnot dotyku (C1, C2, C3)
%T1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero1=0;
for i = 1:size(T1,1)
   C31 = T1(i,1);
    if C31 == 0 ;
        alliszero1=0;
    else
        alliszero1=1;
      C31 = T1(i,1);
       break
    end
    
end
if alliszero1==0
   C31=5000;
end

%T2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero2=0;
for i = 1:size(T2,1)
    C32 = T2(i,1);
    if C32 == 0 
        alliszero2=0;
    else
        alliszero2=1;
       C32 = T2(i,1);
       break
    end
end
if alliszero2==0
    C32=5000;
end
%T3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
alliszero3=0;
for i = 1:size(T3,1)
    C33 = T3(i,1);
    if C33 == 0 
        alliszero3=0;
    else
        alliszero3=1;
       C33 = T3(i,1);
       break
    end
    
end
if alliszero3==0
    C33=5000;
end




save C31, save C32, save C33
T31 = T1; 
T32 = T2;
T33 = T3; 

save T31, save T32, save T33
%% Kriterium 2 

F1 = 0 ; %kriterium dotyku 
%% Přiřazení váhy podle typu kontaktu 

%Krit za 0 dotyk 
if ((C31+C32+C33) == 15000) 
    F1 = 20000;
    else
    F1=0;
end
%  VSECHNY CLANKY%%%%%%%%%%%
% Dotek 1 + 2 + 3 => penalizace 0
D1 = 0;

if 	C33 ~= 5000  &&  C32 ~= 5000  && C31 ~= 5000
    F1 = (F1+D1); 
end

%  DVA     CLANKY%%%%%%%%%%%
%Dotek dva clanky => penalizace 1000
D2 = 1000;

% Dotek 3 + 2 

if 	C33 ~= 5000  &&  C32 ~= 5000  && C31 == 5000
    F1 = (F1+D2);
end

%Dotek 1 + 2 

if 	C31 ~= 5000  &&  C32 ~= 5000  &&  C33 == 5000
    F1 = (F1+D2)*v1;
end  

%Dotek 3 + 1  

if 	C31 ~= 5000  &&  C33 ~= 5000  &&  C32 == 5000
    F1 = (F1+D2);
end  

%  JEDEN     CLANEK %%%%%%%%%%%
%Dotek 1 =>penalizace 2000
D1= 10000;

if 	C31 ~= 5000  &&  C33 == 5000  &&  C32 == 5000
    F1 = (F1+D1);
end  

%Dotek 2 

if 	C32 ~= 5000  &&  C33 == 5000  && C31 == 5000
    F1 = (F1+D1);
end  

%Dotek 3 

if 	C33 ~= 5000  && C31 == 5000  &&  C32 == 5000
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
Delta33 =norm(abs(Fi2-Fi3)); 
F3t =0;
if Fi1 == 0;
    F3t = 50000;
end

F3 = Delta13 + Delta33 + F3t; % Kriterium pro rovnoměrnost pohybu
%% Kriterium 4 
if C31 ~= 5000
    R31 =0;
end

if C32 ~= 5000
    R32 =0;
end

if C33 ~= 5000
    R33 =0;
end

F4= (R31+R32+R33)*1e5;
%% Finalni funkce 
%}
%F3_koule= F1+F2+F3+F4;  % Finální kriteriální funkce 

