%% Task 1
% Generate PUSCH sequences and map them on the UL LTE Resource grid for
% any two different chosen waveform configurations with normal and
% extended CP. Explain the differences observed on the grid
ue1.NCellID = 1;
ue1.NSubframe = 0;
ue1.RNTI = 1;
ue1.NULRB = 15;

pusch.Modulation = 'QPSK'; % change with '256QAM'
pusch.PRBSet = [0:8].';
pusch.RV = 0;

frc = lteRMCUL('A8-5');   % change with 'A3-3'
trBlk = randi([0,1],frc.PUSCH.TrBlkSizes(1),1);
cw = lteULSCH(ue1,pusch,trBlk);

resourceGrid1 = lteULResourceGrid(ue1);
puschSym = ltePUSCH(ue1,pusch,cw);
ind1 = ltePUSCHIndices(ue1,pusch);
resourceGrid1 (ind1) = puschSym;

mesh(abs(resourceGrid1));
view(2);

%% Task 2
% Generate DMRS sequences for PUSCH and map them on the UL LTE Resource
% grid along with PUSCH sequences for any two different chosen waveform
% configurations with normal and extended CP. Explain the differences
% observed on the grid
ue2.NULRB = 15;
ue2.NCellID = 1;
ue2.NSubframe = 0;
ue2.CyclicPrefixUL = 'Normal'; % change with Extended
ue2.Hopping = 'Off';
ue2.SeqGroup = 0;
ue2.CyclicShift = 0;
ue2.NTxAnts = 1;

chs.PRBSet = (0:9).';
chs.NLayers = 1;
chs.OrthCover = 'Off';
chs.DynCyclicShift = 0;

resourceGrid2 = lteULResourceGrid(ue2);
puschSeq = ltePUSCHDRS(ue2,chs);
ind = ltePUSCHDRSIndices(ue2,chs);
resourceGrid2 (ind) = puschSeq;

mesh(abs(resourceGrid2));
view(2);
