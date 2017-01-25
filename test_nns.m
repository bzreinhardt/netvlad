setup;
dbs = {dbMS7Chess(), dbMS7Fire(), dbMS7Heads(), dbMS7Office(), dbMS7Pumpkin(), dbMS7RedKitchen(), dbMS7Stairs()};
for i = 1:length(dbs)
    dbTest= dbs{i}

    netID= 'vd16_tokyoTM_conv5_3_vlad_preL2_intra_white';
    paths= localPaths();

    dbFeatFn= sprintf('%s%s_%s_db.bin', paths.outPrefix, netID, dbTest.name);
    qFeatFn = sprintf('%s%s_%s_q.bin', paths.outPrefix, netID, dbTest.name);

    qFeat= fread( fopen(qFeatFn, 'rb'), inf, 'float32=>single');
    qFeat= reshape(qFeat, [], dbTest.numQueries);
    nDims= size(qFeat, 1);
    dbFeat= fread( fopen(dbFeatFn, 'rb'), [nDims, dbTest.numImages], 'float32=>single');
    assert(size(dbFeat,2)==dbTest.numImages);

    [ids, ds] = rawNnSearch(qFeat, dbFeat, 5);

    jsonFile = sprintf('%snetvlad_%s_db.json', paths.outPrefix, dbTest.name);
    savejson('', ids', jsonFile);
end
