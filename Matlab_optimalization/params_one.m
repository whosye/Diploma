

Tau =1; % [s] doba simulace
k2 = 1; 
k2_thumb = 1;
ServoDp = 0.008;
Servo   = 0.008;

%% Ukazovak 
R_koule=35*10^-3;
k_lower=1e10;
ki=0;
bi =0.001;
b=bi;
space = 8*10^-3; % mezera mezi prsty
Lp_END = 0.0050; %m
L_END = 0.0010; %m
L1_pull =  0.0030; %m
L2_pull = 0.0030; %m
L3_pull = 10*10^-3;%m
L4_pull =  0.001; %m
Lp_pull = 1 *10^-3;%m
l3=28*10^-3;%m
l2=30*10^-3;%m
l11=30*10^-3; %m
l12=35*10^-3; %m
l13=45*10^-3; %m
l1 = 20*10^-3;
l14=38*10^-3; %m
Z_Fi = 15; % základní natočení prstů [°]
Z_Fip = 25;
td = 1*10^-3; %m
Slope= pi/(Tau); %rad/s
D1=8*10^-3;%m
D2=7*10^-3;%m
D3=6*10^-3;%m
ro=1600; % hustota pla kg/m^3
%% PALEC
D1p=7*10^-3;%m
D2p=6*10^-3;%m
l2p=25*10^-3;%m
l1p=35*10^-3; %m
tdp=1 *10^-3;%m

