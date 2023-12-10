 function F_kr = Enter_Krychle(p)
%% Optimalizační parametry 
%%%% spolecne 

        k3_thumb   =  p(1);
        k34        =  p(2);
        k33        =  p(3);
        k32        =  p(4);
        k31        =  p(5);
        P1_length  =  p(6);
        Pfi        =  p(7);
        Pfiz       =  p(8);
   
%%%% Koule        
        
        x_kr         =  p(9);
        y_kr         =  p(10);
        z_kr         =  p(11);

%%% spolecne w = fi/Tau 
        Tau_1kP     =  p(12);
        Tau_2kP     =  p(13);
        Tau_3kP     =  p(14);
        Tau_4kP     =  p(15);
        Tau_pkP     =  p(16);
        Tau_1kS     =  p(17);
        Tau_2kS     =  p(18);
        Tau_3kS     =  p(19);
        Tau_4kS     =  p(20);
        Tau_pkS     =  p(21);


     
%% ulozeni hodnot pro sim. model 

save k34 k34, save k33 k33, save k32 k32, save k31 k31, save k3_thumb
save P1_length P1_length, save Pfi Pfi, save Pfiz Pfiz

save Tau_1kP Tau_1kP, save Tau_2kP Tau_2kP, save Tau_3kP Tau_3kP, save Tau_4kP Tau_4kP
save Tau_1kS Tau_1kS, save Tau_2kS Tau_2kS, save Tau_3kS Tau_3kS, save Tau_4kS Tau_4kS
save Tau_pkP Tau_pkP, save Tau_pkS Tau_pkS 

save x_kr x_kr, save y_kr y_kr, save z_kr z_kr


F_krychle = EnterKr(p);

F_kr = F_krychle;

A=[F_kr;p(1);p(2);p(3);p(4);p(5);p(6);p(7);p(8);p(9);p(10);p(11);p(12);p(13);p(14);p(15);p(16);p(17);p(18);p(19);p(20);p(21)]%;p(22);p(23);p(24);p(25);p(26);p(27)];
fileID = fopen('Values_KRYCHLE.txt','a');
fprintf(fileID,'%16.4f %12.4f %12.4f  %12.4f %12.4f  %12.4f %12.4f %12.4f  %12.4f %12.4f  %12.4f %12.4f %12.4f  %12.4f %12.4f  %12.4f %12.4f %12.4f  %12.4f %12.4f  %12.4f %12.4f \n',A)
fclose(fileID);;


