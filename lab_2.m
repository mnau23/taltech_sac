enb.CyclicPrefix = 'Normal'; % cyclic prefix type
enb.NDLRB = 6; % nr of resource blocks in the grid
enb.CellRefP = 1; % antenna ports
enb.NCellID = 1; % cell ID
enb.NSubframe = 0;
enb.DuplexMode = 'FDD';
antPort = 0;
resource_grid = lteDLResourceGrid(enb);

%% Task 1
% Generate primary and secondary synchronization signals
% and map on LTE downlink resource grid (FDD mode).
%%% Primary
pss = ltePSS(enb);
PSSind = ltePSSIndices(enb);
resource_grid1 (PSSind) = pss;
%%% Secondary
sss = lteSSS(enb);
SSSind = lteSSSIndices(enb);
resource_grid1 (SSSind) = sss;

figure(1)
mesh(abs(resource_grid1));
view(2);
xlabel('LTE symbols in a sub-frame');
ylabel('Sub-carriers');

%% Task 2
% Generate Cell specific reference signals and map on
% LTE downlink resource grid (FDD mode).
rs = lteCellRS(enb,antPort);
CRSind = lteCellRSIndices(enb,antPort);
resource_grid2 (CRSind) = rs;

figure(2)
mesh(abs(resource_grid2));
view(2);
xlabel('LTE symbols in a sub-frame');
ylabel('Sub-carriers');

%% Task 3
% Change cell ID in Task 2 and comment about the
% position of cell specific reference symbols
enb3 = enb;
enb3.NCellID = 100;
resource_grid3 = lteDLResourceGrid(enb3);

pss3 = ltePSS(enb3);
PSSind3 = ltePSSIndices(enb3);
resource_grid3 (PSSind3) = pss3;

sss3 = lteSSS(enb3);
SSSind3 = lteSSSIndices(enb3);
resource_grid3 (SSSind3) = sss3;

rs3 = lteCellRS(enb3,antPort);
CRSind3 = lteCellRSIndices(enb3,antPort);
resource_grid3 (CRSind3) = rs3;

figure(3)
mesh(abs(resource_grid3));
view(2);
xlabel('LTE symbols in a sub-frame');
ylabel('Sub-carriers');

%% Task 4
% Modify the number of resource blocks and cyclic prefix
% types for Task 1 and Task 2 and discuss the results
enb4 = enb;
enb4.NDLRB = 12;
enb4.CyclicPrefix = 'Extended';
resource_grid41 = lteDLResourceGrid(enb4);

%%% Task 1
pss41 = ltePSS(enb4);
PSSind41 = ltePSSIndices(enb4);
resource_grid41 (PSSind41) = pss41;

sss41 = lteSSS(enb4);
SSSind41 = lteSSSIndices(enb4);
resource_grid41 (SSSind41) = sss41;

figure(4)
mesh(abs(resource_grid41));
view(2);
xlabel('LTE symbols in a sub-frame');
ylabel('Sub-carriers');

%%% Task 2
resource_grid42 = resource_grid41;

pss42 = ltePSS(enb4);
PSSind42 = ltePSSIndices(enb4);
resource_grid42 (PSSind42) = pss42;

sss42 = lteSSS(enb4);
SSSind42 = lteSSSIndices(enb4);
resource_grid42 (SSSind42) = sss42;

rs42 = lteCellRS(enb4,antPort);
CRSind42 = lteCellRSIndices(enb4,antPort);
resource_grid42 (CRSind42) = rs42;

figure(5)
mesh(abs(resource_grid42));
view(2);
xlabel('LTE symbols in a sub-frame');
ylabel('Sub-carriers');
