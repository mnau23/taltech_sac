%% Task 1
% Generate PUCCH format 1,2 and 3 sequences and map them on the UL LTE
% resource grid for any chosen waveform configuration and for normal and
% extended CP. Explain the differences observed on the grid.
ue = lteRMCUL('A3-3');
ue.NCellID = 1;
ue.CyclicPrefixUL = 'Normal'; % change with 'Extended'

chs.ResourceIdx = 0;
chs.DeltaShift = 1;
chs.CyclicShift = 0;
chs.ResourceSize = 0;
chs.Shortened = 0;

% PUCCH format 1
resource_grid11 = lteULResourceGrid(ue);
pucch1Sym = ltePUCCH1(ue,chs,[]);
ind11 = ltePUCCH1Indices(ue,chs);
resource_grid11 (ind11) = pucch1Sym;
figure(1)
mesh(abs(resource_grid11));
view(2);

% PUCCH format 2
resource_grid12 = lteULResourceGrid(ue);
pucch2Sym = ltePUCCH2(ue,chs,ones(20,1));
ind12 = ltePUCCH2Indices(ue,chs);
resource_grid12 (ind12) = pucch2Sym;
figure(2)
mesh(abs(resource_grid12));
view(2);

% PUCCH format 3
resource_grid13 = lteULResourceGrid(ue);
pucch3Sym = ltePUCCH3(ue,chs,ones(48,1));
ind13 = ltePUCCH3Indices(ue,chs);
resource_grid13 (ind13) = pucch3Sym;
figure(3)
mesh(abs(resource_grid13));
view(2);

%% Task 2
% Generate DMRS sequences for PUCCH format 1,2 and 3 and map them on the UL
% LTE resource grid for any chosen waveform configuration and for normal
% and extended CP. Explain the differences observed on the grid.

% DMRS for PUCCH format 1
resource_grid21 = lteULResourceGrid(ue);
drsSeq1 = ltePUCCH1DRS(ue,chs);
ind21 = ltePUCCH1DRSIndices(ue,chs);
resource_grid21 (ind21) = drsSeq1;
figure(4)
mesh(abs(resource_grid21));
view(2);

% DMRS for PUCCH format 2
resource_grid22 = lteULResourceGrid(ue);
drsSeq2 = ltePUCCH2DRS(ue,chs,[]);
ind22 = ltePUCCH2DRSIndices(ue,chs);
resource_grid22 (ind22) = drsSeq2;
figure(5)
mesh(abs(resource_grid22));
view(2);

% DMRS for PUCCH format 3
resource_grid23 = lteULResourceGrid(ue);
drsSeq3 = ltePUCCH3DRS(ue,chs);
ind23 = ltePUCCH3DRSIndices(ue,chs);
resource_grid23 (ind23) = drsSeq3;
figure(6)
mesh(abs(resource_grid23));
view(2);

%% Task 3
% Generate SRS sequences and map them on the UL LTE resource grid for any
% chosen waveform configuration and for normal and extended CP.
% Explain the differences observed on the grid.
resource_grid3 = lteULResourceGrid(ue);
srs = lteSRS(ue,chs);
ind3 = lteSRSIndices(ue,chs);
resource_grid3 (ind3) = srs;
figure(7)
mesh(abs(resource_grid3));
view(2);

%% Task 4
% Generate PUSCH, PUCCH format 1 and 2, DMRS for PUCCH format 1 and 2 and
% SRS sequences and map them on the UL LTE resource grid for any two
% different chosen waveform configurations.
% Explain the differences observed on the grid.
pusch.Modulation = 'QPSK'; % change with '256QAM'
pusch.PRBSet = [0:8].';
pusch.RV = 0;
% change 'A8-5'
trBlk = randi([0,1],ue.PUSCH.TrBlkSizes(1),1);
cw = lteULSCH(ue,pusch,trBlk);

resource_grid4 = lteULResourceGrid(ue);
% PUSCH
puschSym = ltePUSCH(ue,pusch,cw);
puschInd = ltePUSCHIndices(ue,pusch);
resource_grid4 (puschInd) = puschSym;
% PUCCH format 1
pucch1Sym = ltePUCCH1(ue,chs,[]);
pucch1Ind = ltePUCCH1Indices(ue,chs);
resource_grid4 (pucch1Ind) = pucch1Sym;
% PUCCH format 2
pucch2Sym = ltePUCCH2(ue,chs,ones(20,1));
pucch2Ind = ltePUCCH2Indices(ue,chs);
resource_grid4 (pucch2Ind) = pucch2Sym;
% SRS
srsSym = lteSRS(ue,chs);
srsInd = lteSRSIndices(ue,chs);
resource_grid4 (srsInd) = srsSym;

figure(8)
mesh(abs(resource_grid4));
view(2);
