clear P Del KpGen P_c1 Del_c1 KpGen_c1 P_c2 Del_c2 KpGen_c2 P_c3 Del_c3 KpGen_c3 P_c4 Del_c4 KpGen_c4 P_c5 Del_c5 KpGen_c5 P_c6 Del_c6 KpGen_c6 P_c7 Del_c7 KpGen_c7 P_c8 Del_c8 KpGen_c8 P_c9 Del_c9 KpGen_c9 P_c10 Del_c10 KpGen_c10 Constraints
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



%% initilization step
% initilize shared variable values

%% insert contingency scenarios
% Outage_Horizon = round((Nbranch-1).*rand(Horizon,1) + 1);
%24 bus
% Outage_Horizon1 =[32,16,9,26,26,25,26,4,23,16,8,4,28,7,6,23,31,18,24,6,32,19,23,2,28,26,5,18,12,19,14,15,7,9,2,31,23,32,6,31,27,20,16,10,26,9,3,26,23,25,22,15,14,28,11,28,27,29,18,22,32,16,3,30,22,13,34,8,23,21,14,6,32,16,9,26,26,25,26,4,23,16,8,4,28,7,6,23,31,18,24,6,32,19,23,2,28,26,5,18,12,19,14,15,7,9,2,31,23,32,6,31,27,20,16,10,26,9,3,26,23,25,22,15,14,28,11,28,27,29,18,22,32,16,3,30,22,13,34,8,23,21,14,6,32,16,9,26,26,25,26,4,23,16,8,4,28,7,6,23,31,18,24,6,32,19,23,2];
% Outage_Horizon2=[5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4,4,6,6,21,20,3,32,25,25,3,29,32,33,29,27,18,7,14,5,2,32,11,11,12,16,22,2,29,19,29,12,16,3,7,23,12,31,5,34,19,24,34,10,15,16,26,28,4,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4,4,6,6,21,20,3,32,25,25,3,29,32,33,29,27,18,7,14,5,2,32,11,11,12,16,22,2,29,19,29,12,16,3,7,23,12,31,5,34,19,24,34,10,15,16,26,28,4,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4];
% Outage_Horizon3 = [26,7,29,34,18,30,20,6,8,14,26,28,27,12,19,4,5,5,23,17,7,17,6,3,29,19,32,24,20,28,30,34,1,30,21,34,18,17,27,9,17,31,20,29,25,20,9,23,4,22,23,25,30,33,26,20,32,20,2,5,29,17,29,8,19,22,2,21,13,3,17,7,26,7,29,34,18,30,20,6,8,14,26,28,27,12,19,4,5,5,23,17,7,17,6,3,29,19,32,24,20,28,30,34,1,30,21,34,18,17,27,9,17,31,20,29,25,20,9,23,4,22,23,25,30,33,26,20,32,20,2,5,29,17,29,8,19,22,2,21,13,3,17,7,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4];
% Outage_Horizon4 = [32,16,9,26,26,25,26,4,23,16,8,4,28,7,6,23,31,18,24,6,32,19,23,2,28,26,5,18,12,19,14,15,7,9,2,31,23,32,6,31,27,20,16,10,26,9,3,26,23,25,22,15,14,28,11,28,27,29,18,22,32,16,3,30,22,13,34,8,23,21,14,6,32,16,9,26,26,25,26,4,23,16,8,4,28,7,6,23,31,18,24,6,32,19,23,2,28,26,5,18,12,19,14,15,7,9,2,31,23,32,6,31,27,20,16,10,26,9,3,26,23,25,22,15,14,28,11,28,27,29,18,22,32,16,3,30,22,13,34,8,23,21,14,6,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4];
% Outage_Horizon5= [2,15,7,25,13,29,25,20,7,33,10,32,8,13,4,22,7,2,25,12,23,14,22,2,31,27,26,28,14,21,20,18,10,9,16,9,28,34,2,19,4,27,34,3,32,2,24,27,19,30,31,22,6,8,7,2,5,21,32,13,15,33,32,23,34,26,12,23,9,11,23,18,2,15,7,25,13,29,25,20,7,33,10,32,8,13,4,22,7,2,25,12,23,14,22,2,31,27,26,28,14,21,20,18,10,9,16,9,28,34,2,19,4,27,34,3,32,2,24,27,19,30,31,22,6,8,7,2,5,21,32,13,15,33,32,23,34,26,12,23,9,11,23,18,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4];
% Outage_Horizon6 = [2,20,30,23,7,13,16,33,6,29,22,13,7,15,17,5,20,8,14,20,9,11,21,10,28,33,25,12,20,5,31,30,28,10,21,2,15,11,6,7,15,4,21,17,24,24,22,2,3,12,19,23,14,28,25,33,19,12,4,21,27,15,4,10,6,10,16,18,16,30,18,32,2,20,30,23,7,13,16,33,6,29,22,13,7,15,17,5,20,8,14,20,9,11,21,10,28,33,25,12,20,5,31,30,28,10,21,2,15,11,6,7,15,4,21,17,24,24,22,2,3,12,19,23,14,28,25,33,19,12,4,21,27,15,4,10,6,10,16,18,16,30,18,32,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4];
% Outage_Horizon7 = [28,20,7,9,30,2,17,7,33,25,18,17,3,24,2,3,18,4,28,28,25,6,23,18,33,22,27,16,15,28,4,5,7,14,28,28,3,14,18,15,23,22,11,15,2,33,7,5,13,8,17,12,32,31,3,25,10,15,19,32,15,33,11,24,23,19,24,23,7,5,34,7,28,20,7,9,30,2,17,7,33,25,18,17,3,24,2,3,18,4,28,28,25,6,23,18,33,22,27,16,15,28,4,5,7,14,28,28,3,14,18,15,23,22,11,15,2,33,7,5,13,8,17,12,32,31,3,25,10,15,19,32,15,33,11,24,23,19,24,23,7,5,34,7,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4];
% Outage_Horizon8 = [12,32,5,25,22,28,14,26,29,12,19,33,19,12,21,13,26,15,17,24,33,12,29,25,32,2,13,23,10,9,24,22,20,23,3,13,16,9,25,29,10,25,6,29,6,20,13,28,18,17,30,13,16,33,2,33,7,23,20,23,13,21,28,2,4,33,22,9,14,5,10,10,12,32,5,25,22,28,14,26,29,12,19,33,19,12,21,13,26,15,17,24,33,12,29,25,32,2,13,23,10,9,24,22,20,23,3,13,16,9,25,29,10,25,6,29,6,20,13,28,18,17,30,13,16,33,2,33,7,23,20,23,13,21,28,2,4,33,22,9,14,5,10,10,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4];
% Outage_Horizon9 = [12,6,12,5,30,4,32,14,3,12,25,27,19,24,30,3,11,3,7,25,25,30,20,3,31,27,10,19,33,25,29,15,17,20,10,26,18,22,11,6,17,13,27,27,23,5,2,19,11,32,33,10,27,31,21,30,32,19,25,20,2,16,22,18,13,32,28,29,13,21,30,32,12,6,12,5,30,4,32,14,3,12,25,27,19,24,30,3,11,3,7,25,25,30,20,3,31,27,10,19,33,25,29,15,17,20,10,26,18,22,11,6,17,13,27,27,23,5,2,19,11,32,33,10,27,31,21,30,32,19,25,20,2,16,22,18,13,32,28,29,13,21,30,32,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4];
% Outage_Horizon10 = [28,31,5,31,22,4,10,19,33,33,6,33,33,17,27,6,15,31,27,33,23,2,29,32,23,26,26,14,23,7,24,2,10,3,4,28,24,11,32,2,15,14,26,27,7,17,16,22,24,26,10,23,23,6,5,17,33,12,20,8,26,9,18,24,30,33,19,6,6,9,29,9,28,31,5,31,22,4,10,19,33,33,6,33,33,17,27,6,15,31,27,33,23,2,29,32,23,26,26,14,23,7,24,2,10,3,4,28,24,11,32,2,15,14,26,27,7,17,16,22,24,26,10,23,23,6,5,17,33,12,20,8,26,9,18,24,30,33,19,6,6,9,29,9,5,8,6,7,2,22,10,19,24,17,19,16,5,17,29,30,10,8,20,22,15,8,32,4];
%118 bus

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
    
end
% if NS == 1
% for unit=1:Nunits
%  Objective = Objective +1*((P(unit,25)-r(unit,1))'*ro(unit)*(P(unit,25)-r(unit,1))+gama(unit)*P(unit,25)*(r(unit,1)-t(unit,1))+g(unit,1)*P(unit,25));
% end
% elseif NS == 2
% for unit=1:Nunits
%          Objective = Objective + 1*((P(unit,1)-t(unit,1))'*ro(unit)*(P(unit,1)-t(unit,1))+gama(unit)*P(unit,1)*(t(unit,1)-r(unit,1))-g(unit,1)*P(unit,1) ...
%          + (P(unit,25)-r(unit,2))'*ro(unit)*(P(unit,25)-r(unit,2))+gama(unit)*P(unit,25)*(r(unit,2)-t(unit,2))- g(unit,2)*P(unit,25));
% end
% elseif NS == 3
% for unit=1:Nunits
%          Objective = Objective + 1*((P(unit,1)-t(unit,2))'*ro(unit)*(P(unit,1)-t(unit,2))+gama(unit)*P(unit,1)*(t(unit,2)-r(unit,2))+g(unit,2)*P(unit,1) ...
%          + (P(unit,25)-r(unit,3))'*ro(unit)*(P(unit,25)-r(unit,3))+gama(unit)*P(unit,25)*(r(unit,3)-t(unit,3))+ g(unit,3)*P(unit,25));
% end
% elseif NS == 4
% for unit=1:Nunits
%          Objective = Objective + 1*((P(unit,1)-t(unit,3))'*ro(unit)*(P(unit,1)-t(unit,3))+gama(unit)*P(unit,1)*(t(unit,3)-r(unit,3))-g(unit,3)*P(unit,1)...
%         + (P(unit,25)-r(unit,4))'*ro(unit)*(P(unit,25)-r(unit,4))+gama(unit)*P(unit,25)*(r(unit,4)-t(unit,4))-g(unit,4)*P(unit,25));
% end
% elseif NS == 5
% for unit=1:Nunits
%          Objective = Objective + 1*((P(unit,1)-t(unit,4))'*ro(unit)*(P(unit,1)-t(unit,4))+gama(unit)*P(unit,1)*(t(unit,4)-r(unit,4))+g(unit,4)*P(unit,1) ...
%         + (P(unit,25)-r(unit,5))'*ro(unit)*(P(unit,25)-r(unit,5))+gama(unit)*P(unit,25)*(r(unit,5)-t(unit,5)) + g(unit,5)*P(unit,25));
% end
% elseif NS == 6
% for unit=1:Nunits
%          Objective = Objective + 1*((P(unit,1)-t(unit,5))'*ro(unit)*(P(unit,1)-t(unit,5))+gama(unit)*P(unit,1)*(t(unit,5)-r(unit,5))-g(unit,5)*P(unit,1)...
%         + (P(unit,25)-r(unit,6))'*ro(unit)*(P(unit,25)-r(unit,6))+gama(unit)*P(unit,25)*(r(unit,6)-t(unit,6))- g(unit,6)*P(unit,25));
% end
% elseif NS == 7
%     for unit=1:Nunits
%     Objective = Objective + 1*((P(unit,1)-t(unit,6))'*ro(unit)*(P(unit,1)-t(unit,6))+gama(unit)*P(unit,1)*(t(unit,6)-r(unit,6))+g(unit,6)*P(unit,1));
%     end
% end
if NS==1
    for unit=1:Nunits
        Objective = Objective +1*((P(unit,Horizon)-r(unit,NS))'*ro(unit)*(P(unit,Horizon)-r(unit,NS))+gama(unit)*P(unit,Horizon)*(r(unit,NS)-t(unit,NS))+g(unit,NS)*P(unit,Horizon));
    end
elseif mod(NS,2)==0 && NS<NumInterval
    for unit=1:Nunits
        Objective = Objective + 1*((P(unit,1)-t(unit,NS-1))'*ro(unit)*(P(unit,1)-t(unit,NS-1))+gama(unit)*P(unit,1)*(t(unit,NS-1)-r(unit,NS-1))-g(unit,NS-1)*P(unit,1) ...
            + (P(unit,Horizon)-r(unit,NS))'*ro(unit)*(P(unit,Horizon)-r(unit,NS))+gama(unit)*P(unit,Horizon)*(r(unit,NS)-t(unit,NS))- g(unit,NS)*P(unit,Horizon));
    end
elseif mod(NS,2)==0 && NS==NumInterval
    for unit=1:Nunits
        Objective = Objective + 1*((P(unit,1)-t(unit,NS-1))'*ro(unit)*(P(unit,1)-t(unit,NS-1))+gama(unit)*P(unit,1)*(t(unit,NS-1)-r(unit,NS-1))-g(unit,NS-1)*P(unit,1));
    end
elseif mod(NS,2)==1 && NS<NumInterval && NS>1
    for unit=1:Nunits
        Objective = Objective + 1*((P(unit,1)-t(unit,NS-1))'*ro(unit)*(P(unit,1)-t(unit,NS-1))+gama(unit)*P(unit,1)*(t(unit,NS-1)-r(unit,NS-1))+g(unit,NS-1)*P(unit,1) ...
            + (P(unit,Horizon)-r(unit,NS))'*ro(unit)*(P(unit,Horizon)-r(unit,NS))+gama(unit)*P(unit,Horizon)*(r(unit,NS)-t(unit,NS))+ g(unit,NS)*P(unit,Horizon));
    end
elseif mod(NS,2)==1 && NS==NumInterval
    for unit=1:Nunits
        Objective = Objective + 1*((P(unit,1)-t(unit,NS-1))'*ro(unit)*(P(unit,1)-t(unit,NS-1))+gama(unit)*P(unit,1)*(t(unit,NS-1)-r(unit,NS-1))+g(unit,NS-1)*P(unit,1));
    end
    
end
%% Solve the Optimization Problem
% ops = sdpsettings('solver','cplex','cplex.mip.tolerances.mipgap',1e-3);
% Solution = solvesdp(Constraints,Objective,ops)
Solution = solvesdp(Constraints,Objective)

