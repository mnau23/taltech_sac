%% Task 1
% Generate an empty LTE downlink resource grid using lteDLResourceGrid()
% command, defining cell wide settings in enb structure.
% Choose FDD as the duplex mode.
enb1.CyclicPrefix = 'Normal'; % cyclic prefix type
enb1.NDLRB = 6; % nr of resource blocks in the grid
enb1.CellRefP = 1; % antenna ports
enb1.NCellID = 1; % cell ID
enb1.NSubframe = 0;
enb1.DuplexMode = 'FDD';

resource_grid1 = lteDLResourceGrid(enb1);

figure(1)
mesh(abs(resource_grid1));
view(2);

%% Task 2
% Map LTE symbols to (single port) LTE resource grid.
enb2 = enb1;
antPort = 0;

resource_grid2 = lteDLResourceGrid(enb2);
ind = lteCellRSIndices(enb2,antPort);
rs = lteCellRS(enb2,antPort);
resource_grid2 (ind) = rs;

figure(2)
mesh(abs(resource_grid2));
view(2);
xlabel('LTE symbols in a sub-frame');
ylabel('Sub-carriers');

%% Task 3
% Change the number of resource blocks and cyclic prefix type.
enb3 = enb1;
enb3.NDLRB = 12;
enb3.CyclicPrefix = 'Extended';

resource_grid3 = lteDLResourceGrid(enb3);

figure(3)
mesh(abs(resource_grid3));
view(2);

%% Task 4
% Create downlink resource grid with and without using lteDLResourceGrid()
% command. Change the number of antenna ports and check grid size for both
% cases.
enb4 = enb1;
enb4.CellRefP = 2;

% First case (with)
resource_grid41 = lteDLResourceGrid(enb4);

% Second case (without)
noSymbolsSlot = 7;
resource_grid42 = zeros(enb4.NDLRB*12, noSymbolsSlot*2, enb4.CellRefP);

% Check sizes in both cases
check = isequal(resource_grid41,resource_grid42);
