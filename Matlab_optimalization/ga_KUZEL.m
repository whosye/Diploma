
clc
clear all 
params_one;
Bound_V; 


fileID = fopen('Values_KUZEL.txt','w');                       
fprintf(fileID,'%4s %21s %11s %14s %12s %18s %12s %6s %14s %11s  %12s  %12s %16s %13s %12s %13s %12s %12s %13s %12s %13s %12s   \n' ,'Fv','k31' ,'k32','k33','k34','k3_thumb' , 'P1_length', 'Pfi' ,'Pfiz','x_k', 'y_k', 'z_k','Tau_1kP', 'Tau_2kP' ,'Tau_3kP' ,'Tau_4kP','Tau_pkP' ,'Tau_1kS','Tau_2kS','Tau_3kS','Tau_4kS','Tau_pkS');
fclose(fileID);


options = gaoptimset('Display','iter',... 
'PopulationSize',200,... 
'Generations',50,...
'TolFun',1e-2,... 
'TolCon',1e-2,...
'PlotFcns',@gaplotbestf);
[F,fval,exitflag,output, population] = ga(@Enter_Kuzel,21,[],[],[],[],lb,ub,[],options);
  

