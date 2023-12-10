
%% spuštění simulace
sim('Prst_1.slx')
%% načtení hodnot ze simulace 
load Prubeh_Fi11, load Prubeh_Fi12, load Prubeh_Fi13
load Distance13, load Distance12, load Distance11
%% kontakt
for i = 1:size(Distance11,2)
    Touch11 =  Distance11(2,i);
    if Touch11 <= 0;
        R11=Touch11;
  
[Touch11_pos]=find(R11 == Distance11(2,:));
T11 = Distance11(1,Touch11_pos);
T11 = T11(1,1);
  break 
    else
        T11 = 5000; 
    end
end
             
for i = 1:size(Distance12,2)
    Touch12 =  Distance12(2,i);
    if Touch12 <= 0;
        R12=Touch12;
     
[Touch12_pos]=find(R12 == Distance12(2,:));
T12 = Distance12(1,Touch12_pos);
T12 = T12(1,1);
break
    else
        T12 = 5000; 
    end
end
for i = 1:size(Distance13,2)
    Touch13 =  Distance13(2,i);
    if Touch13 <= 0;
        R13=Touch13; 
[Touch13_pos]=find(R13 == Distance13(2,:));
T13 = Distance13(1,Touch13_pos);
T13 = T13(1,1);
    break
    else
        T13 = 5000; 
    end
end

V_1 = [T11;T12;T13];



%% načtení úhlů 
Fi1=(Fi11s(2,:).*(-180/pi))';
% Fi2=(Fi12s(2,:).*(-180/pi))';
% Fi3=(Fi13s(2,:).*(-180/pi))';
% %% načtení úhlů 
% Fi1=(Fi1ps(2,:).*(-180/pi))';
% Fi2=(Fi2ps(2,:).*(-180/pi))';
% Delta12_p =norm(abs(Fi1-Fi2));
% save Delta12_p

%{
%% načtení hodnot dotyku (C11, C21, C31)
%T1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero1=0;
for i = 1:size(T1,1)
    C11 = T1(i,1);
    if C11 == 0 ;
        alliszero1=0;
    else
        alliszero1=1;
       C11 = T1(i,1);
       break
    end
    
end
if alliszero1==0
    C11=5000;
end

%T2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alliszero2=0;
for i = 1:size(T2,1)
    C12 = T2(i,1);
    if C12 == 0 
        alliszero2=0;
    else
        alliszero2=1;
       C12= T2(i,1);
       break
    end
end
if alliszero2==0
    C12=5000;
end

%T3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
alliszero3=0;
for i = 1:size(T3,1)
    C13 = T3(i,1);
    if C13 == 0 
        alliszero3=0;
    else
        alliszero3=1;
       C13 = T3(i,1);
       break
    end
    
end
if alliszero3==0
    C13=5000;
end



    

save C11, save C12, save C13
T11 = T1; 
T12 = T2;
T13 = T3; 

save T11, save T12, save T13

%% Kriterium 2 
F1 = 0 ; %penalizace kriteria dotyku 
%% Přiřazení penalizace podle typu kontaktu 
%Krit za 0 dotyk 
if (( C11+ C12+ C13) == 15000) 
    F123 = 20000;
    else
    F123=0;
end
F1 = F123;

%  VSECHNY CLANKY%%%%%%%%%%%
% Dotek 1 + 2 + 3 => penalizace 0

D1 = 0;
if 	C13 ~= 5000  &&  C12 ~= 5000  &&  C11 ~= 5000
    F1 = (F1+D1); 
end

%  DVA     CLANKY%%%%%%%%%%%
%Dotek dva clanky => penalizace 1000
D2 = 5000;

% Dotek 3 + 2 
if 	C13  ~= 5000  &&   C12 ~= 5000  &&  C11 == 5000
    F1 = (F1+D2);
end

%Dotek 1 + 2 
if 	 C11 ~= 5000  &&   C12 ~= 5000  &&  C13  == 5000
    F1 = (F1+D2);
end  

%Dotek 3 + 1  
if 	 C11 ~= 5000  &&  C13  ~= 5000  &&   C12 == 5000
    F1 = (F1+D2);
end  

%  JEDEN     CLANEK %%%%%%%%%%%
%Dotek 1 =>penalizace 2000
D1= 10000;
if 	 C11 ~= 5000  &&  C13  == 5000  &&   C12 == 5000
    F1 = (F1+D1);
end  

%Dotek 2 
 if 	 C12 ~= 5000  &&  C13  == 5000  &&  C11 == 5000
    F1 = (F1+D1);
end  

%Dotek 3 
if 	C13  ~= 5000  &&  C11 == 5000  &&   C12 == 5000
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
if C11 ~= 5000
    R11 =0;
end

if C12 ~= 5000
    R12 =0;
end

if C13 ~= 5000
    R13 =0;
end

F4= (R11+R12+R13)*1e5;
%}
%% Finalni funkce 
%F1_koule=F1+F2+F3+F4; % Finální kriteriální funkce 

