Tau=1;
lb = zeros(1,21);
ub = zeros(1,21);
tk = 4; 
%% Společné low 
       
k31L          =  0.05;
k32L          =  0.05;
k33L          =  0.05;
k34L          =  0.05;
k3_thumbL     =  0.05;
P1_lengthL    =  10;
PfiL          =  30; 
PfizL         =  40;
     
lb(1,1) =  k31L;    
lb(1,2) =  k32L;
lb(1,3) =  k33L;
lb(1,4) =  k34L;
lb(1,5) =  k3_thumbL;       
lb(1,6) =  P1_lengthL; 
lb(1,7) =  PfiL;         
lb(1,8) =  PfizL;        

%% Společné upper         
k31U          =  1;
k32U          =  1;
k33U          =  1;
k34U          =  1;
k3_thumbU     =  1;
P1_lengthU    =  30;%%
PfiU          =  60; %%
PfizU         =  90;  %% 

ub(1,1) =  k31U;    
ub(1,2) =  k32U;
ub(1,3) =  k33U;
ub(1,4) =  k34U;
ub(1,5) =  k3_thumbU;       
ub(1,6) =  P1_lengthU; 
ub(1,7) =  PfiU;         
ub(1,8) =  PfizU;         
        
        
%% Koule low 

x_vL = -25;
y_vL = -60;
z_vL = -10;
Tau_1kPL    =   Tau;
Tau_2kPL    =   Tau;
Tau_3kPL    =   Tau;
Tau_4kPL    =   Tau;
Tau_pkPL    =   Tau;
Tau_1kSL    =   Tau;
Tau_2kSL    =   Tau;
Tau_3kSL    =   Tau;
Tau_4kSL    =   Tau;
Tau_pkSL    =   Tau;
   
lb(1,9)   =  x_vL;  
lb(1,10)  =  y_vL;           
lb(1,11)  =  z_vL;        
lb(1,12)  =  Tau_1kPL;    
lb(1,13)  =  Tau_2kPL;        
lb(1,14)  =  Tau_3kPL;     
lb(1,15)  =  Tau_4kPL; 
lb(1,16)  =  Tau_pkPL;         
lb(1,17)  =  Tau_1kSL;
lb(1,18)  =  Tau_2kSL;        
lb(1,19)  =  Tau_3kSL; 
lb(1,20)  =  Tau_4kSL;         
lb(1,21)  =  Tau_pkSL; 




         
%% Koule upper        
   
        
       
x_vU = -10;
y_vU = -40;
z_vU =   5;
Tau_1kPU     =   Tau+tk;
Tau_2kPU     =   Tau+tk;
Tau_3kPU     =   Tau+tk;
Tau_4kPU     =   Tau+tk;
Tau_pkPU     =   Tau+tk;
Tau_1kSU     =   Tau+tk;
Tau_2kSU     =   Tau+tk;
Tau_3kSU     =   Tau+tk;
Tau_4kSU     =   Tau+tk;
Tau_pkSU     =   Tau+tk;

ub(1,9)   =  x_vU;  
ub(1,10)  =  y_vU;           
ub(1,11)  =  z_vU;        
ub(1,12)  =  Tau_1kPU;    
ub(1,13)  =  Tau_2kPU;        
ub(1,14)  =  Tau_3kPU;     
ub(1,15)  =  Tau_4kPU; 
ub(1,16)  =  Tau_pkPU;         
ub(1,17)  =  Tau_1kSU;
ub(1,18)  =  Tau_2kSU;        
ub(1,19)  =  Tau_3kSU; 
ub(1,20)  =  Tau_4kSU;         
ub(1,21)  =  Tau_pkSU;



