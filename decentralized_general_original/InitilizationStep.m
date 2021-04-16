%% initilization step
% initilize shared variable values
%     for NS = 1:NumInterval     %NS defines the subsystem number
%         if NS ==1
%                         Horizon = (OveralHorizon/NumInterval)+1;
%             clear D Pforecast
%             D = DTotal(:,1:Horizon);
%             Pforecast = PforecastTotal(1:Horizon);
%
%
%         elseif (1< NS) && ( NS< NumInterval)
%             Horizon = (OveralHorizon/NumInterval)+2;
%             clear D Pforecast
%             D = DTotal(:,1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1));
%             Pforecast = PforecastTotal(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1));
%         else
%             Horizon = (OveralHorizon/NumInterval)+1;
%             clear D Pforecast
%             D = DTotal(:,1+(NS-1)*(Horizon):OveralHorizon);
%             Pforecast = PforecastTotal(1+(NS-1)*(Horizon):OveralHorizon);
%         end
%         run SCUCSubproblem118_Initilization
%
%         Objective_ini = 0;
%         for h = 1:(OveralHorizon/NumInterval)
%             Objective_ini = Objective_ini + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
%         end
%                 if NS==1
%             P_val_first_ini(:,:,NS) = double(P);
%                 elseif (1< NS) && ( NS< NumInterval)
%             P_val_ini(:,:,NS) = double(P);
%         else
%             P_val_last_ini(:,:,NumInterval) = double(P);
%         end
%         Objective_val_ini(NS,1) = double(Objective_ini);
%         Cost_matrix_ini(NS,1,1)=Objective_val_ini(NS,1);
%         CplexTime_ini(NS,1) = Solution.solvertime;
%
%     end
for NS = 1:NumInterval     %NS defines the subsystem number
    if NS < NumInterval
        Horizon = (OveralHorizon/NumInterval)+1;
        clear D Pforecast
        D = DTotal(:,1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1));
        Pforecast = PforecastTotal(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1));
    else
        Horizon = (OveralHorizon/NumInterval);
        clear D Pforecast
        D = DTotal(:,1+(NS-1)*(Horizon):OveralHorizon);
        Pforecast = PforecastTotal(1+(NS-1)*(Horizon):OveralHorizon);
    end
    run SCUCSubproblem118_Initilization
    Objective_ini = 0;
    for h = 1:(OveralHorizon/NumInterval)
        Objective_ini = Objective_ini + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    end
    if NS<NumInterval
        P_val(:,:,NS) = double(P);
    else
        P_val_last(:,:,NumInterval) = double(P);
    end
    Objective_val_ini(NS,1) = double(Objective_ini);
    Cost_matrix_ini(NS,1,1)=Objective_val_ini(NS,1);
    CplexTime_Initialization(NS) = Solution.solvertime;
    
end
for NS_read=1:NumInterval-1
    if NS_read<NumInterval-1
        r(1:Nunits,NS_read) = [P_val(1:Nunits,(OveralHorizon/NumInterval)+1,NS_read)];
        
        t(1:Nunits,NS_read) = [P_val(1:Nunits,1,NS_read+1)];
    else
        r(1:Nunits,NS_read) = [P_val(1:Nunits,(OveralHorizon/NumInterval)+1,NS_read)];
        t(1:Nunits,NS_read) = [P_val_last(1:Nunits,1,NS_read+1)];
    end
end
firsterr=t-r
if contingency==1
    %% insert contingency scenarios
    % Outage_Horizon = round((Nbranch-1).*rand(Horizon,1) + 1);
    Outage_Horizon1 = [94;155;18;163;20;93;26;101;2;137;152;164;177;91;38;19;91;105;137;16;119;93;31;168;106;79;169;118;81;150;96;100;122;66;44;104;155;73;21;80;54;164;149;73;70;65;26;47;16;77;47;54;77;22;89;127;44;141;14;71;2;40;1;35;26;49;32;26;108;161;168;40;87;68;94;48;13;79;32;6;6;78;172;137;2;122;127;116;99;40;138;42;67;20;153;73;58;109;163;163;106;60;153;80;162;1;96;164;33;61;34;58;73;99;10;99;50;44;44;28;17;168;147;131;32;65;35;1;57;126;112;98;79;52;90;137;137;104;6;116;23;91;63;17;27;36;185;78;125;47;3;96;51;169;162;71;5;185;150;174;11;81;105;123;164;117;130;38];
    Outage_Horizon2=[69;117;145;16;173;145;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;69;117;145;16;173;145;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;69;117;145;16;173;145;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;69;117;145;16;173;145;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;69;117;145;16;173;145;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;69;117;145;16;173;145;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;69;117;145;16;173;145;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110];
    Outage_Horizon3 = [43;66;54;173;10;111;31;156;32;94;186;67;10;41;75;63;43;174;127;179;82;175;2;114;43;66;54;173;10;111;31;156;32;94;186;67;10;41;75;63;43;174;127;179;82;175;2;114;43;66;54;173;10;111;31;156;32;94;186;67;10;41;75;63;43;174;127;179;82;175;2;114;43;66;54;173;10;111;31;156;32;94;186;67;10;41;75;63;43;174;127;179;82;175;2;114;43;66;54;173;10;111;31;156;32;94;186;67;10;41;75;63;43;174;127;179;82;175;2;114;43;66;54;173;10;111;31;156;32;94;186;67;10;41;75;63;43;174;127;179;82;175;2;114;43;66;54;173;10;111;31;156;32;94;186;67;10;41;75;63;43;174;127;179;82;175;2;114];
    Outage_Horizon4 =[45;112;90;167;174;152;132;138;167;13;63;2;154;95;69;43;100;55;14;17;14;77;24;83;45;112;90;167;174;152;132;138;167;13;63;2;154;95;69;43;100;55;14;17;14;77;24;83;45;112;90;167;174;152;132;138;167;13;63;2;154;95;69;43;100;55;14;17;14;77;24;83;45;112;90;167;174;152;132;138;167;13;63;2;154;95;69;43;100;55;14;17;14;77;24;83;45;112;90;167;174;152;132;138;167;13;63;2;154;95;69;43;100;55;14;17;14;77;24;83;45;112;90;167;174;152;132;138;167;13;63;2;154;95;69;43;100;55;14;17;14;77;24;83;45;112;90;167;174;152;132;138;167;13;63;2;154;95;69;43;100;55;14;17;14;77;24;83];
    Outage_Horizon5=[91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;39;57;88;44;157;37;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;39;57;88;44;157;37;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;39;57;88;44;157;37;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;39;57;88;44;157;37;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;39;57;88;44;157;37;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;39;57;88;44;157;37;91;82;84;58;95;95;152;148;120;71;151;100;66;175;163;103;116;110;39;57;88;44;157;37];
    Outage_Horizon6 =[34;68;11;98;63;33;40;168;126;88;170;20;139;137;105;35;111;56;26;40;167;14;46;11;34;68;11;98;63;33;40;168;126;88;170;20;139;137;105;35;111;56;26;40;167;14;46;11;34;68;11;98;63;33;40;168;126;88;170;20;139;137;105;35;111;56;26;40;167;14;46;11;34;68;11;98;63;33;40;168;126;88;170;20;139;137;105;35;111;56;26;40;167;14;46;11;34;68;11;98;63;33;40;168;126;88;170;20;139;137;105;35;111;56;26;40;167;14;46;11;34;68;11;98;63;33;40;168;126;88;170;20;139;137;105;35;111;56;26;40;167;14;46;11;34;68;11;98;63;33;40;168;126;88;170;20;139;137;105;35;111;56;26;40;167;14;46;11];
    Outage_Horizon7 = [83;3;167;37;18;58;85;20;185;62;56;12;56;10;95;142;118;18;16;145;168;100;21;154;83;3;167;37;18;58;85;20;185;62;56;12;56;10;95;142;118;18;16;145;168;100;21;154;83;3;167;37;18;58;85;20;185;62;56;12;56;10;95;142;118;18;16;145;168;100;21;154;83;3;167;37;18;58;85;20;185;62;56;12;56;10;95;142;118;18;16;145;168;100;21;154;83;3;167;37;18;58;85;20;185;62;56;12;56;10;95;142;118;18;16;145;168;100;21;154;83;3;167;37;18;58;85;20;185;62;56;12;56;10;95;142;118;18;16;145;168;100;21;154;83;3;167;37;18;58;85;20;185;62;56;12;56;10;95;142;118;18;16;145;168;100;21;154];
    Outage_Horizon8 =[31;141;162;66;128;55;99;155;112;63;56;85;79;68;104;138;80;80;24;6;55;60;122;178;31;141;162;66;128;55;99;155;112;63;56;85;79;68;104;138;80;80;24;6;55;60;122;178;31;141;162;66;128;55;99;155;112;63;56;85;79;68;104;138;80;80;24;6;55;60;122;178;31;141;162;66;128;55;99;155;112;63;56;85;79;68;104;138;80;80;24;6;55;60;122;178;31;141;162;66;128;55;99;155;112;63;56;85;79;68;104;138;80;80;24;6;55;60;122;178;31;141;162;66;128;55;99;155;112;63;56;85;79;68;104;138;80;80;24;6;55;60;122;178;31;141;162;66;128;55;99;155;112;63;56;85;79;68;104;138;80;80;24;6;55;60;122;178];
    Outage_Horizon9 = [104;144;59;34;64;40;95;169;117;20;73;11;94;81;186;151;91;166;26;73;173;173;173;115;104;144;59;34;64;40;95;169;117;20;73;11;94;81;186;151;91;166;26;73;173;173;173;115;104;144;59;34;64;40;95;169;117;20;73;11;94;81;186;151;91;166;26;73;173;173;173;115;104;144;59;34;64;40;95;169;117;20;73;11;94;81;186;151;91;166;26;73;173;173;173;115;104;144;59;34;64;40;95;169;117;20;73;11;94;81;186;151;91;166;26;73;173;173;173;115;104;144;59;34;64;40;95;169;117;20;73;11;94;81;186;151;91;166;26;73;173;173;173;115;104;144;59;34;64;40;95;169;117;20;73;11;94;81;186;151;91;166;26;73;173;173;173;115];
    Outage_Horizon10 =[61;47;64;71;102;105;74;75;96;123;177;135;75;155;26;12;17;31;61;57;3;101;19;28;61;47;64;71;102;105;74;75;96;123;177;135;75;155;26;12;17;31;61;57;3;101;19;28;61;47;64;71;102;105;74;75;96;123;177;135;75;155;26;12;17;31;61;57;3;101;19;28;61;47;64;71;102;105;74;75;96;123;177;135;75;155;26;12;17;31;61;57;3;101;19;28;61;47;64;71;102;105;74;75;96;123;177;135;75;155;26;12;17;31;61;57;3;101;19;28;61;47;64;71;102;105;74;75;96;123;177;135;75;155;26;12;17;31;61;57;3;101;19;28;61;47;64;71;102;105;74;75;96;123;177;135;75;155;26;12;17;31;61;57;3;101;19;28];
    
    %% create contingency matrices for line flow constraints
    A_cont_inc1_Total = ones(OveralHorizon,Nbranch);
    A_cont_inc2_Total = ones(OveralHorizon,Nbranch);
    A_cont_inc3_Total = ones(OveralHorizon,Nbranch);
    A_cont_inc4_Total = ones(OveralHorizon,Nbranch);
    A_cont_inc5_Total = ones(OveralHorizon,Nbranch);
    A_cont_inc6_Total = ones(OveralHorizon,Nbranch);
    A_cont_inc7_Total = ones(OveralHorizon,Nbranch);
    A_cont_inc8_Total = ones(OveralHorizon,Nbranch);
    A_cont_inc9_Total = ones(OveralHorizon,Nbranch);
    A_cont_inc10_Total = ones(OveralHorizon,Nbranch);
    for h = 1:OveralHorizon
        A_cont_inc1_Total(h,Outage_Horizon1(h)) = 0;
        A_cont_inc2_Total(h,Outage_Horizon2(h)) = 0;
        A_cont_inc3_Total(h,Outage_Horizon3(h)) = 0;
        A_cont_inc4_Total(h,Outage_Horizon4(h)) = 0;
        A_cont_inc5_Total(h,Outage_Horizon5(h)) = 0;
        A_cont_inc6_Total(h,Outage_Horizon6(h)) = 0;
        A_cont_inc7_Total(h,Outage_Horizon7(h)) = 0;
        A_cont_inc8_Total(h,Outage_Horizon8(h)) = 0;
        A_cont_inc9_Total(h,Outage_Horizon9(h)) = 0;
        A_cont_inc10_Total(h,Outage_Horizon10(h)) = 0;
    end
   


end
    %     for NS_read=1:NumInterval-1
    %                         if NS==1
    %                                         r(1:Nunits,NS_read) = [P_val_first_ini(1:Nunits,(OveralHorizon/NumInterval)+1,NS_read)];
    %
    %                         elseif NS_read<NumInterval-1
    %             r(1:Nunits,NS_read) = [P_val_ini(1:Nunits,(OveralHorizon/NumInterval)+2,NS_read)];
    %
    %             t(1:Nunits,NS_read) = [P_val_ini(1:Nunits,1,NS_read+1)];
    %         else
    %             r(1:Nunits,NS_read) = [P_val_ini(1:Nunits,(OveralHorizon/NumInterval)+1,NS_read)];
    %             t(1:Nunits,NS_read) = [P_val_last_ini(1:Nunits,1,NS_read+1)];
    %         end
    %     end
    %% solve subproblems 1 to NumInterval-1 and initilize shared variables
    % % % % % % % % % % % % % % % % for NS = 1:NumInterval
    % % % % % % % % % % % % % % % %     if NS == 1
    % % % % % % % % % % % % % % % %         Horizon = 25;
    % % % % % % % % % % % % % % % %         Pforecast(1:25) = PforecastTotal(1:25);
    % % % % % % % % % % % % % % % %         D(:,1:25) = DTotal(:,1:25);
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         run SCUCSubproblem118_Initilization
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         r1(1:Nunits,1) = [double(P(1:Nunits,25))];
    % % % % % % % % % % % % % % % %         Objective_ini1 = 0;
    % % % % % % % % % % % % % % % %         for h = 1:24
    % % % % % % % % % % % % % % % %             Objective_ini1 = Objective_ini1 + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    % % % % % % % % % % % % % % % %         end
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %     elseif NS == 2
    % % % % % % % % % % % % % % % %         Horizon = 26;
    % % % % % % % % % % % % % % % %         Pforecast(1:26) = PforecastTotal(24:49);
    % % % % % % % % % % % % % % % %         D(:,1:26) = DTotal(:,24:49);
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         run SCUCSubproblem118_Initilization
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         t1(1:Nunits,1) = [double(P(1:Nunits,2))];
    % % % % % % % % % % % % % % % %         r2(1:Nunits,1) = [double(P(1:Nunits,26))];
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         Objective_ini2 = 0;
    % % % % % % % % % % % % % % % %         for h = 2:25
    % % % % % % % % % % % % % % % %             Objective_ini2 = Objective_ini2 + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    % % % % % % % % % % % % % % % %         end
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %     elseif NS == 3
    % % % % % % % % % % % % % % % %         Horizon = 26;
    % % % % % % % % % % % % % % % %         Pforecast(1:26) = PforecastTotal(48:73);
    % % % % % % % % % % % % % % % %         D(:,1:26) = DTotal(:,48:73);
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         run SCUCSubproblem118_Initilization
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         t2(1:Nunits,1) = [double(P(1:Nunits,2))];
    % % % % % % % % % % % % % % % %         r3(1:Nunits,1) = [double(P(1:Nunits,26))];
    % % % % % % % % % % % % % % % %         Objective_ini3 = 0;
    % % % % % % % % % % % % % % % %         for h = 2:25
    % % % % % % % % % % % % % % % %             Objective_ini3 = Objective_ini3 + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    % % % % % % % % % % % % % % % %         end
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %     elseif NS == 4
    % % % % % % % % % % % % % % % %         Horizon = 26;
    % % % % % % % % % % % % % % % %         Pforecast(1:26) = PforecastTotal(72:97);
    % % % % % % % % % % % % % % % %         D(:,1:26) = DTotal(:,72:97);
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         run SCUCSubproblem118_Initilization
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         t3(1:Nunits,1) = [double(P(1:Nunits,2))];
    % % % % % % % % % % % % % % % %         r4(1:Nunits,1) = [double(P(1:Nunits,26))];
    % % % % % % % % % % % % % % % %         Objective_ini4 = 0;
    % % % % % % % % % % % % % % % %         for h = 2:25
    % % % % % % % % % % % % % % % %             Objective_ini4 = Objective_ini4 + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    % % % % % % % % % % % % % % % %         end
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %     elseif NS == 5
    % % % % % % % % % % % % % % % %         Horizon = 26;
    % % % % % % % % % % % % % % % %         Pforecast(1:26) = PforecastTotal(96:121);
    % % % % % % % % % % % % % % % %         D(:,1:26) = DTotal(:,96:121);
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         run SCUCSubproblem118_Initilization
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         t4(1:Nunits,1) = [double(P(1:Nunits,2))];
    % % % % % % % % % % % % % % % %         r5(1:Nunits,1) = [double(P(1:Nunits,26))];
    % % % % % % % % % % % % % % % %         Objective_ini5 = 0;
    % % % % % % % % % % % % % % % %         for h = 2:25
    % % % % % % % % % % % % % % % %             Objective_ini5 = Objective_ini5 + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    % % % % % % % % % % % % % % % %         end
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %     elseif NS == 6
    % % % % % % % % % % % % % % % %         Horizon = 26;
    % % % % % % % % % % % % % % % %         Pforecast(1:26) = PforecastTotal(120:145);
    % % % % % % % % % % % % % % % %         D(:,1:26) = DTotal(:,120:145);
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         run SCUCSubproblem118_Initilization
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         t5(1:Nunits,1) = [double(P(1:Nunits,2))];
    % % % % % % % % % % % % % % % %         r6(1:Nunits,1) = [double(P(1:Nunits,26))];
    % % % % % % % % % % % % % % % %         Objective_ini6 = 0;
    % % % % % % % % % % % % % % % %         for h = 2:25
    % % % % % % % % % % % % % % % %             Objective_ini6 = Objective_ini6 + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    % % % % % % % % % % % % % % % %         end
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %     elseif NS == 7
    % % % % % % % % % % % % % % % %         Horizon = 25;
    % % % % % % % % % % % % % % % %         Pforecast(1:25) = PforecastTotal(144:168);
    % % % % % % % % % % % % % % % %         D(:,1:25) = DTotal(:,144:168);
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         run SCUCSubproblem118_Initilization
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %         t6(1:Nunits,1) = [double(P(1:Nunits,2))];
    % % % % % % % % % % % % % % % %         Objective_ini7 = 0;
    % % % % % % % % % % % % % % % %         for h = 2:25
    % % % % % % % % % % % % % % % %             Objective_ini7 = Objective_ini7 + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    % % % % % % % % % % % % % % % %         end
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %     end
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %
    % % % % % % % % % % % % % % % %     CplexTime_Initialization(NS) = Solution.solvertime;
    % % % % % % % % % % % % % % % % end