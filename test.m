setup;
% Load our network
netID= 'vd16_tokyoTM_conv5_3_vlad_preL2_intra_white';
paths= localPaths();
load( sprintf('%s%s.mat', paths.ourCNNs, netID), 'net' );
net= relja_simplenn_tidy(net);

im= vl_imreadjpeg({which('football.jpg')}); im= im{1}; % slightly convoluted because we need the full image path for `vl_imreadjpeg`, while `imread` is not appropriate - see `help computeRepresentation`
feats= computeRepresentation(net, im, 'useGPU', false); % add `'useGPU', false` if you want to use the CPU

%  To test the network on a place recognition dataset, set up the test dataset
dbs = {dbMS7Chess(), dbMS7Fire(), dbMS7Heads(), dbMS7Office(), dbMS7Pumpkin(), dbMS7RedKitchen(), dbMS7Stairs()};
for i = 1:length(dbs)
    dbTest= dbs{i}
    

    % Set the output filenames for the database/query image representations
    paths= localPaths();
    dbFeatFn= sprintf('%s%s_%s_db.bin', paths.outPrefix, netID, dbTest.name);
    qFeatFn = sprintf('%s%s_%s_q.bin', paths.outPrefix, netID, dbTest.name);

    % Compute db/query image representations
    serialAllFeats(net, dbTest.dbPath, dbTest.dbImageFns, dbFeatFn, 'batchSize', 10, 'useGPU', false); % adjust batchSize depending on your GPU / network size
    serialAllFeats(net, dbTest.qPath, dbTest.qImageFns, qFeatFn, 'batchSize', 1, 'useGPU', false); % Tokyo 24/7 query images have different resolutions so batchSize is constrained to 1

   
end

 % Measure recall@N
    %[recall, ~, ~, opts]= testFromFn(dbTest, dbFeatFn, qFeatFn);
    %plot(opts.recallNs, recall, 'ro-'); grid on; xlabel('N'); ylabel('Recall@N');