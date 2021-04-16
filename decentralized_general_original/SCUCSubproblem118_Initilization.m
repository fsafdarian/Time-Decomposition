%% Define problem variables
P = sdpvar(Nunits,Horizon,'full');
Del = sdpvar(Nbus,Horizon,'full');
KpGen = sdpvar(Nbus,Horizon,'full');

if contingency==1
P_c1 = sdpvar(Nunits,Horizon,'full');
Del_c1 = sdpvar(Nbus,Horizon,'full');
KpGen_c1 = sdpvar(Nbus,Horizon,'full');

P_c2 = sdpvar(Nunits,Horizon,'full');
Del_c2 = sdpvar(Nbus,Horizon,'full');
KpGen_c2 = sdpvar(Nbus,Horizon,'full');

P_c3 = sdpvar(Nunits,Horizon,'full');
Del_c3 = sdpvar(Nbus,Horizon,'full');
KpGen_c3 = sdpvar(Nbus,Horizon,'full');

P_c4 = sdpvar(Nunits,Horizon,'full');
Del_c4 = sdpvar(Nbus,Horizon,'full');
KpGen_c4 = sdpvar(Nbus,Horizon,'full');

P_c5 = sdpvar(Nunits,Horizon,'full');
Del_c5 = sdpvar(Nbus,Horizon,'full');
KpGen_c5 = sdpvar(Nbus,Horizon,'full');

P_c6 = sdpvar(Nunits,Horizon,'full');
Del_c6 = sdpvar(Nbus,Horizon,'full');
KpGen_c6 = sdpvar(Nbus,Horizon,'full');

P_c7 = sdpvar(Nunits,Horizon,'full');
Del_c7 = sdpvar(Nbus,Horizon,'full');
KpGen_c7 = sdpvar(Nbus,Horizon,'full');

P_c8 = sdpvar(Nunits,Horizon,'full');
Del_c8 = sdpvar(Nbus,Horizon,'full');
KpGen_c8 = sdpvar(Nbus,Horizon,'full');

P_c9 = sdpvar(Nunits,Horizon,'full');
Del_c9 = sdpvar(Nbus,Horizon,'full');
KpGen_c9 = sdpvar(Nbus,Horizon,'full');

P_c10 = sdpvar(Nunits,Horizon,'full');
Del_c10 = sdpvar(Nbus,Horizon,'full');
KpGen_c10 = sdpvar(Nbus,Horizon,'full');
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


%% solve subproblems 1 to NumInterval-1 and initilize shared variables
clear A_cont_inc1 A_cont_inc2 A_cont_inc3 A_cont_inc4  A_cont_inc5 A_cont_inc6 A_cont_inc7 A_cont_inc8  A_cont_inc9 A_cont_inc10
if NS == 1
    A_cont_inc1(1:Horizon,:) = A_cont_inc1_Total(1:Horizon,:);
    A_cont_inc2(1:Horizon,:) = A_cont_inc2_Total(1:Horizon,:);
    A_cont_inc3(1:Horizon,:) = A_cont_inc3_Total(1:Horizon,:);
    A_cont_inc4(1:Horizon,:) = A_cont_inc4_Total(1:Horizon,:);
    A_cont_inc5(1:Horizon,:) = A_cont_inc5_Total(1:Horizon,:);
    A_cont_inc6(1:Horizon,:) = A_cont_inc6_Total(1:Horizon,:);
    A_cont_inc7(1:Horizon,:) = A_cont_inc7_Total(1:Horizon,:);
    A_cont_inc8(1:Horizon,:) = A_cont_inc8_Total(1:Horizon,:);
    A_cont_inc9(1:Horizon,:) = A_cont_inc9_Total(1:Horizon,:);
    A_cont_inc10(1:Horizon,:) = A_cont_inc10_Total(1:Horizon,:);
elseif NS < NumInterval && NS>1
    A_cont_inc1(1:Horizon,:) = A_cont_inc1_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    A_cont_inc2(1:Horizon,:) = A_cont_inc2_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    A_cont_inc3(1:Horizon,:) = A_cont_inc3_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    A_cont_inc4(1:Horizon,:) = A_cont_inc4_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    A_cont_inc5(1:Horizon,:) = A_cont_inc5_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    A_cont_inc6(1:Horizon,:) = A_cont_inc6_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    A_cont_inc7(1:Horizon,:) = A_cont_inc7_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    A_cont_inc8(1:Horizon,:) = A_cont_inc8_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    A_cont_inc9(1:Horizon,:) = A_cont_inc9_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    A_cont_inc10(1:Horizon,:) = A_cont_inc10_Total(1+(NS-1)*(Horizon-1):1+(NS)*(Horizon-1),:);
    
elseif NS == NumInterval
    A_cont_inc1(1:Horizon,:) = A_cont_inc1_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
    A_cont_inc2(1:Horizon,:) = A_cont_inc2_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
    A_cont_inc3(1:Horizon,:) = A_cont_inc3_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
    A_cont_inc4(1:Horizon,:) = A_cont_inc4_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
    A_cont_inc5(1:Horizon,:) = A_cont_inc5_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
    A_cont_inc6(1:Horizon,:) = A_cont_inc6_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
    A_cont_inc7(1:Horizon,:) = A_cont_inc7_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
    A_cont_inc8(1:Horizon,:) = A_cont_inc8_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
    A_cont_inc9(1:Horizon,:) = A_cont_inc9_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
    A_cont_inc10(1:Horizon,:) = A_cont_inc10_Total(1+(NS-1)*(Horizon):OveralHorizon,:);
end

% if NS == 1
%     A_cont_inc1(1:25,:) = A_cont_inc1_Total(1:25,:);
%     A_cont_inc2(1:25,:) = A_cont_inc2_Total(1:25,:);
%     A_cont_inc3(1:25,:) = A_cont_inc3_Total(1:25,:);
%     A_cont_inc4(1:25,:) = A_cont_inc4_Total(1:25,:);
%     A_cont_inc5(1:25,:) = A_cont_inc5_Total(1:25,:);
%     A_cont_inc6(1:25,:) = A_cont_inc6_Total(1:25,:);
%     A_cont_inc7(1:25,:) = A_cont_inc7_Total(1:25,:);
%     A_cont_inc8(1:25,:) = A_cont_inc8_Total(1:25,:);
%     A_cont_inc9(1:25,:) = A_cont_inc9_Total(1:25,:);
%     A_cont_inc10(1:25,:) = A_cont_inc10_Total(1:25,:);
%
% elseif NS == 2
%     A_cont_inc1(1:25,:) = A_cont_inc1_Total(25:49,:);
%     A_cont_inc2(1:25,:) = A_cont_inc2_Total(25:49,:);
%     A_cont_inc3(1:25,:) = A_cont_inc3_Total(25:49,:);
%     A_cont_inc4(1:25,:) = A_cont_inc4_Total(25:49,:);
%     A_cont_inc5(1:25,:) = A_cont_inc5_Total(25:49,:);
%     A_cont_inc6(1:25,:) = A_cont_inc6_Total(25:49,:);
%     A_cont_inc7(1:25,:) = A_cont_inc7_Total(25:49,:);
%     A_cont_inc8(1:25,:) = A_cont_inc8_Total(25:49,:);
%     A_cont_inc9(1:25,:) = A_cont_inc9_Total(25:49,:);
%     A_cont_inc10(1:25,:) = A_cont_inc10_Total(25:49,:);
%
% elseif NS == 3
%     A_cont_inc1(1:25,:) = A_cont_inc1_Total(49:73,:);
%     A_cont_inc2(1:25,:) = A_cont_inc2_Total(49:73,:);
%     A_cont_inc3(1:25,:) = A_cont_inc3_Total(49:73,:);
%     A_cont_inc4(1:25,:) = A_cont_inc4_Total(49:73,:);
%     A_cont_inc5(1:25,:) = A_cont_inc5_Total(49:73,:);
%     A_cont_inc6(1:25,:) = A_cont_inc6_Total(49:73,:);
%     A_cont_inc7(1:25,:) = A_cont_inc7_Total(49:73,:);
%     A_cont_inc8(1:25,:) = A_cont_inc8_Total(49:73,:);
%     A_cont_inc9(1:25,:) = A_cont_inc9_Total(49:73,:);
%     A_cont_inc10(1:25,:) = A_cont_inc10_Total(49:73,:);
%
% elseif NS == 4
%     A_cont_inc1(1:25,:) = A_cont_inc1_Total(73:97,:);
%     A_cont_inc2(1:25,:) = A_cont_inc2_Total(73:97,:);
%     A_cont_inc3(1:25,:) = A_cont_inc3_Total(73:97,:);
%     A_cont_inc4(1:25,:) = A_cont_inc4_Total(73:97,:);
%     A_cont_inc5(1:25,:) = A_cont_inc5_Total(73:97,:);
%     A_cont_inc6(1:25,:) = A_cont_inc6_Total(73:97,:);
%     A_cont_inc7(1:25,:) = A_cont_inc7_Total(73:97,:);
%     A_cont_inc8(1:25,:) = A_cont_inc8_Total(73:97,:);
%     A_cont_inc9(1:25,:) = A_cont_inc9_Total(73:97,:);
%     A_cont_inc10(1:25,:) = A_cont_inc10_Total(73:97,:);
%
% elseif NS == 5
%     A_cont_inc1(1:25,:) = A_cont_inc1_Total(97:121,:);
%     A_cont_inc2(1:25,:) = A_cont_inc2_Total(97:121,:);
%     A_cont_inc3(1:25,:) = A_cont_inc3_Total(97:121,:);
%     A_cont_inc4(1:25,:) = A_cont_inc4_Total(97:121,:);
%     A_cont_inc5(1:25,:) = A_cont_inc5_Total(97:121,:);
%     A_cont_inc6(1:25,:) = A_cont_inc6_Total(97:121,:);
%     A_cont_inc7(1:25,:) = A_cont_inc7_Total(97:121,:);
%     A_cont_inc8(1:25,:) = A_cont_inc8_Total(97:121,:);
%     A_cont_inc9(1:25,:) = A_cont_inc9_Total(97:121,:);
%     A_cont_inc10(1:25,:) = A_cont_inc10_Total(97:121,:);
%
% elseif NS == 6
%     A_cont_inc1(1:25,:) = A_cont_inc1_Total(121:145,:);
%     A_cont_inc2(1:25,:) = A_cont_inc2_Total(121:145,:);
%     A_cont_inc3(1:25,:) = A_cont_inc3_Total(121:145,:);
%     A_cont_inc4(1:25,:) = A_cont_inc4_Total(121:145,:);
%     A_cont_inc5(1:25,:) = A_cont_inc5_Total(121:145,:);
%     A_cont_inc6(1:25,:) = A_cont_inc6_Total(121:145,:);
%     A_cont_inc7(1:25,:) = A_cont_inc7_Total(121:145,:);
%     A_cont_inc8(1:25,:) = A_cont_inc8_Total(121:145,:);
%     A_cont_inc9(1:25,:) = A_cont_inc9_Total(121:145,:);
%     A_cont_inc10(1:25,:) = A_cont_inc10_Total(121:145,:);
%
% elseif NS == 7
%     A_cont_inc1(1:24,:) = A_cont_inc1_Total(145:168,:);
%     A_cont_inc2(1:24,:) = A_cont_inc2_Total(145:168,:);
%     A_cont_inc3(1:24,:) = A_cont_inc3_Total(145:168,:);
%     A_cont_inc4(1:24,:) = A_cont_inc4_Total(145:168,:);
%     A_cont_inc5(1:24,:) = A_cont_inc5_Total(145:168,:);
%     A_cont_inc6(1:24,:) = A_cont_inc6_Total(145:168,:);
%     A_cont_inc7(1:24,:) = A_cont_inc7_Total(145:168,:);
%     A_cont_inc8(1:24,:) = A_cont_inc8_Total(145:168,:);
%     A_cont_inc9(1:24,:) = A_cont_inc9_Total(145:168,:);
%     A_cont_inc10(1:24,:) = A_cont_inc10_Total(145:168,:);
%
% end
end
%% Constraints
Constraints = [];
k = 0;
for j = 1:Nbus
    if KpIndicator(j) == 1
        k = k + 1;
        KpGen(j,:) = P(k,1:Horizon);
       
    end
end

for h = 1:Horizon
    % upper/lower band of units
    Constraints = [Constraints, Pmin <= P(1:Nunits,h) <= Pmax];
    
    
    % total power balance
    Constraints = [Constraints, sum(P(1:Nunits,h)) >= Pforecast(h)];
   

    
    % line flow
    PLine(1:Nbranch,h) = 100*(Del(BranchData(1:Nbranch,1),h)-Del(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3));

    % nodal power balance
    Constraints = [Constraints, Kl*PLine(:,h) == Kp*KpGen(:,h) - Kd.*D(:,h)];

    
    % line flow limits
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    
    % angle of reference bus = 0
    Constraints = [Constraints, Del(ReferenceBus,h) == 0];

end
if contingency==1
 
k = 0;
for j = 1:Nbus
    if KpIndicator(j) == 1
        k = k + 1;
        KpGen_c1(j,:) = P_c1(k,1:Horizon);
        KpGen_c2(j,:) = P_c2(k,1:Horizon);
        KpGen_c3(j,:) = P_c3(k,1:Horizon);
        KpGen_c4(j,:) = P_c4(k,1:Horizon);
        KpGen_c5(j,:) = P_c5(k,1:Horizon);
        KpGen_c6(j,:) = P_c6(k,1:Horizon);
        KpGen_c7(j,:) = P_c7(k,1:Horizon);
        KpGen_c8(j,:) = P_c8(k,1:Horizon);
        KpGen_c9(j,:) = P_c9(k,1:Horizon);
        KpGen_c10(j,:) = P_c10(k,1:Horizon);
        
    end
end

for h = 1:Horizon
    % upper/lower band of units
    Constraints = [Constraints, Pmin <= P_c1(1:Nunits,h) <= Pmax];
    Constraints = [Constraints, Pmin <= P_c2(1:Nunits,h) <= Pmax];
    Constraints = [Constraints, Pmin <= P_c3(1:Nunits,h) <= Pmax];
    Constraints = [Constraints, Pmin <= P_c4(1:Nunits,h) <= Pmax];
    Constraints = [Constraints, Pmin <= P_c5(1:Nunits,h) <= Pmax];
    Constraints = [Constraints, Pmin <= P_c6(1:Nunits,h) <= Pmax];
    Constraints = [Constraints, Pmin <= P_c7(1:Nunits,h) <= Pmax];
    Constraints = [Constraints, Pmin <= P_c8(1:Nunits,h) <= Pmax];
    Constraints = [Constraints, Pmin <= P_c9(1:Nunits,h) <= Pmax];
    Constraints = [Constraints, Pmin <= P_c10(1:Nunits,h) <= Pmax];
    
    
    % total power balance
    Constraints = [Constraints, sum(P_c1(1:Nunits,h)) >= Pforecast(h)];
    Constraints = [Constraints, sum(P_c2(1:Nunits,h)) >= Pforecast(h)];
    Constraints = [Constraints, sum(P_c3(1:Nunits,h)) >= Pforecast(h)];
    Constraints = [Constraints, sum(P_c4(1:Nunits,h)) >= Pforecast(h)];
    Constraints = [Constraints, sum(P_c5(1:Nunits,h)) >= Pforecast(h)];
    Constraints = [Constraints, sum(P_c6(1:Nunits,h)) >= Pforecast(h)];
    Constraints = [Constraints, sum(P_c7(1:Nunits,h)) >= Pforecast(h)];
    Constraints = [Constraints, sum(P_c8(1:Nunits,h)) >= Pforecast(h)];
    Constraints = [Constraints, sum(P_c9(1:Nunits,h)) >= Pforecast(h)];
    Constraints = [Constraints, sum(P_c10(1:Nunits,h)) >= Pforecast(h)];
    
    
    % preventing action
    Constraints = [Constraints, P(1:Nunits,h)-P_c1(1:Nunits,h) == 0 ];
    Constraints = [Constraints, P(1:Nunits,h)-P_c2(1:Nunits,h) == 0 ];
    Constraints = [Constraints, P(1:Nunits,h)-P_c3(1:Nunits,h) == 0 ];
    Constraints = [Constraints, P(1:Nunits,h)-P_c4(1:Nunits,h) == 0 ];
    Constraints = [Constraints, P(1:Nunits,h)-P_c5(1:Nunits,h) == 0 ];
    Constraints = [Constraints, P(1:Nunits,h)-P_c6(1:Nunits,h) == 0 ];
    Constraints = [Constraints, P(1:Nunits,h)-P_c7(1:Nunits,h) == 0 ];
    Constraints = [Constraints, P(1:Nunits,h)-P_c8(1:Nunits,h) == 0 ];
    Constraints = [Constraints, P(1:Nunits,h)-P_c9(1:Nunits,h) == 0 ];
    Constraints = [Constraints, P(1:Nunits,h)-P_c10(1:Nunits,h) == 0 ];
    
    % line flow
    PLine_c1(1:Nbranch,h) = 100*A_cont_inc1(h,1:Nbranch)'.*((Del_c1(BranchData(1:Nbranch,1),h)-Del_c1(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    PLine_c2(1:Nbranch,h) = 100*A_cont_inc2(h,1:Nbranch)'.*((Del_c2(BranchData(1:Nbranch,1),h)-Del_c2(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    PLine_c3(1:Nbranch,h) = 100*A_cont_inc3(h,1:Nbranch)'.*((Del_c3(BranchData(1:Nbranch,1),h)-Del_c3(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    PLine_c4(1:Nbranch,h) = 100*A_cont_inc4(h,1:Nbranch)'.*((Del_c4(BranchData(1:Nbranch,1),h)-Del_c4(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    PLine_c5(1:Nbranch,h) = 100*A_cont_inc5(h,1:Nbranch)'.*((Del_c5(BranchData(1:Nbranch,1),h)-Del_c5(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    PLine_c6(1:Nbranch,h) = 100*A_cont_inc6(h,1:Nbranch)'.*((Del_c6(BranchData(1:Nbranch,1),h)-Del_c6(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    PLine_c7(1:Nbranch,h) = 100*A_cont_inc7(h,1:Nbranch)'.*((Del_c7(BranchData(1:Nbranch,1),h)-Del_c7(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    PLine_c8(1:Nbranch,h) = 100*A_cont_inc8(h,1:Nbranch)'.*((Del_c8(BranchData(1:Nbranch,1),h)-Del_c8(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    PLine_c9(1:Nbranch,h) = 100*A_cont_inc9(h,1:Nbranch)'.*((Del_c9(BranchData(1:Nbranch,1),h)-Del_c9(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    PLine_c10(1:Nbranch,h) = 100*A_cont_inc10(h,1:Nbranch)'.*((Del_c10(BranchData(1:Nbranch,1),h)-Del_c10(BranchData(1:Nbranch,2),h))./(BranchData(1:Nbranch,3)));
    
    % nodal power balance
    Constraints = [Constraints, Kl*PLine_c1(:,h) == Kp*KpGen_c1(:,h) - Kd.*D(:,h)];
    Constraints = [Constraints, Kl*PLine_c2(:,h) == Kp*KpGen_c2(:,h) - Kd.*D(:,h)];
    Constraints = [Constraints, Kl*PLine_c3(:,h) == Kp*KpGen_c3(:,h) - Kd.*D(:,h)];
    Constraints = [Constraints, Kl*PLine_c4(:,h) == Kp*KpGen_c4(:,h) - Kd.*D(:,h)];
    Constraints = [Constraints, Kl*PLine_c5(:,h) == Kp*KpGen_c5(:,h) - Kd.*D(:,h)];
    Constraints = [Constraints, Kl*PLine_c6(:,h) == Kp*KpGen_c6(:,h) - Kd.*D(:,h)];
    Constraints = [Constraints, Kl*PLine_c7(:,h) == Kp*KpGen_c7(:,h) - Kd.*D(:,h)];
    Constraints = [Constraints, Kl*PLine_c8(:,h) == Kp*KpGen_c8(:,h) - Kd.*D(:,h)];
    Constraints = [Constraints, Kl*PLine_c9(:,h) == Kp*KpGen_c9(:,h) - Kd.*D(:,h)];
    Constraints = [Constraints, Kl*PLine_c10(:,h) == Kp*KpGen_c10(:,h) - Kd.*D(:,h)];
    
    % line flow limits
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c1(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c2(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c3(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c4(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c5(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c6(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c7(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c8(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c9(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    Constraints = [Constraints, -BranchData(1:Nbranch,4) <= PLine_c10(1:Nbranch,h) <= BranchData(1:Nbranch,4) ];
    
    % angle of reference bus = 0
    Constraints = [Constraints, Del_c1(ReferenceBus,h) == 0];
    Constraints = [Constraints, Del_c2(ReferenceBus,h) == 0];
    Constraints = [Constraints, Del_c3(ReferenceBus,h) == 0];
    Constraints = [Constraints, Del_c4(ReferenceBus,h) == 0];
    Constraints = [Constraints, Del_c5(ReferenceBus,h) == 0];
    Constraints = [Constraints, Del_c6(ReferenceBus,h) == 0];
    Constraints = [Constraints, Del_c7(ReferenceBus,h) == 0];
    Constraints = [Constraints, Del_c8(ReferenceBus,h) == 0];
    Constraints = [Constraints, Del_c9(ReferenceBus,h) == 0];
    Constraints = [Constraints, Del_c10(ReferenceBus,h) == 0];
end
end
%% Ramping constraints
if RampingConstraints == 1
    for h = 2:Horizon
        Constraints = [Constraints, P(1:Nunits,h) - P(1:Nunits,h-1) <= RU];
        Constraints = [Constraints, P(1:Nunits,h-1) - P(1:Nunits,h) <= RD];
    end
end

%% Building objective function
Objective = 0;
for h = 1:Horizon
    Objective = Objective + P(1:Nunits,h)'*A*P(1:Nunits,h) + B*P(1:Nunits,h) + sum(C);
    %     Objective = Objective + B*P(1:Nunits,h) + C*onoff(1:Nunits,h);
    
end

%% Solve the Optimization Problem
% ops = sdpsettings('solver','cplex','cplex.mip.tolerances.mipgap',1e-4);
% Solution = solvesdp(Constraints,Objective,ops)
Solution = solvesdp(Constraints,Objective)
P = double(P(1:Nunits,1:Horizon));
