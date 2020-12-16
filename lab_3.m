%% Task 1
% Generate UE-Specific Reference Symbols and map them on the DL LTE
% resource grid for any two different chosen enb configuration.
% Take antenna ports as port5 and port8.
% Explain the differences observed on the grid.
enb1 = lteRMCDL('R.0'); % change with 'R.4'
enb1.PDSCH.TxScheme = 'Port5'; % change with 'Port8'
enb1.PDSCH.NLayers = 1;
resource_grid1 = lteDLResourceGrid(enb1);
dmrs = lteDMRS(enb1,enb1.PDSCH);
ind1 = lteDMRSIndices(enb1,enb1.PDSCH);
resource_grid1 (ind1) = dmrs;

mesh(abs(resource_grid1))
view(2)
xlabel('LTE Symbols in a sub-frame')
ylabel('Sub-carriers')

%% Task 2
% Generate Positioning Reference Symbols and map them on the DL LTE
% resource grid for any two different chosen enb configuration.
% Take all and half of the DL resource blocks for PRS mapping.
% Explain the differences observed on the grid.
enb2 = lteRMCDL('R.2'); % change with 'R.6'
enb2.NPRSRB = enb2.NDLRB; % varies from 0 to NDLRB, change with NDLRB/2
enb2.PRSPeriod = [0]; % [0] or [160 0]
resource_grid2 = lteDLResourceGrid(enb2);
prs = ltePRS(enb2);
ind2 = ltePRSIndices(enb2);
resource_grid2 (ind2) = prs;

mesh(abs(resource_grid2))
view(2)
xlabel('LTE Symbols in a sub-frame')
ylabel('Sub-carriers')

%% Task 3
% Generate Channel State Information Reference Symbols and map them on the
% DL LTE resource grid for any two different chosen enb configuration.
% Take CSI-RS configurations 2 and 4.
% Explain the differences observed on the grid.
enb3 = lteRMCDL('R.0'); % change with 'R.2'
enb3.CSIRefP = 1;
enb3.CSIRSConfig = 2; % change with 4
resource_grid3 = lteDLResourceGrid(enb3);
csi = lteCSIRS(enb3);
ind3 = lteCSIRSIndices(enb3);
resource_grid3 (ind3) = csi;

mesh(abs(resource_grid3))
view(2)
xlabel('LTE Symbols in a sub-frame')
ylabel('Sub-carriers')

%% Task 4
% Generate and map PSS, SSS, Cell-specific RS, UE-specific RS, PRS and
% CSI-RS on the DL LTE resource grid for at least two different enb
% configurations. Explain the differences observed on the grid.
enb4 = lteRMCDL('R.0'); % change with 'R.4'
enb4.PDSCH.TxScheme = 'Port5'; % change with 'Port8'
enb4.NPRSRB = enb4.NDLRB; % change with NDLRB/2
enb4.CSIRefP = 1;
enb4.CSIRSConfig = 2; % change with 4
antPort = 0;
resource_grid4 = lteDLResourceGrid(enb4);

pss = ltePSS(enb4);
PSSind = ltePSSIndices(enb4);
resource_grid4 (PSSind) = pss;

sss = lteSSS(enb4);
SSSind = lteSSSIndices(enb4);
resource_grid4 (SSSind) = sss;

crs = lteCellRS(enb4,antPort);
CRSind = lteCellRSIndices(enb4,antPort);
resource_grid4 (CRSind) = crs;

dmrs = lteDMRS(enb4,enb4.PDSCH);
DMRSind = lteDMRSIndices(enb4,enb4.PDSCH);
resource_grid4 (DMRSind) = dmrs;

prs = ltePRS(enb4);
PRSind = ltePRSIndices(enb4);
resource_grid4 (PRSind) = prs;

csi = lteCSIRS(enb4);
CSIind = lteCSIRSIndices(enb4);
resource_grid4 (CSIind) = csi;

mesh(abs(resource_grid4))
view(2)
xlabel('LTE Symbols in a sub-frame')
ylabel('Sub-carriers')
