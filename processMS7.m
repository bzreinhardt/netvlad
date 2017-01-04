function dbStruct = processMS7(sequence, rootDir)
    if strcmp(sequence,'chess')
       sequences = [1,2,3,4,5,6];
       test = [3,5];
       train = [1,2,4,6];
    elseif strcmp(sequence, 'fire')
       sequences = [1,2,3,4];
       test = [3,4];
       train = [1,2];
    elseif strcmp(sequence, 'heads')
       sequences = [1,2];
       test = [1];
       train = [2];
    elseif strcmp(sequence, 'office')
       sequences = [1,2,3,4,5,6,7,8,9,10];
       test = [2,6,7,9];
       train = [1,3,4,5,8,10];
    elseif strcmp(sequence, 'pumpkin')
       sequences = [1,2,3,6,7,8];
       test = [1,7];
       train = [2,3,6,8];
    elseif strcmp(sequence, 'redkitchen')
       sequences = [1,2,3,4,5,6,7,8,11,12,13,14];
       test = [3,4,6,12,14];
       train = [1,2,5,7,8,11,13];
    elseif strcmp(sequence, 'stairs')
       sequences = [1,2,3,4,5,6];
       test = [1,4];
       train = [2,3,5,6];
    end
    currentDir = pwd();
    cd(rootDir);
    qImageFns = {};
    dbImageFns = {};
    utmDb = [];
    utmQ = [];
    for i = 1:length(sequences)
        seqNum = sequences(i);
        folder = sprintf('%s/seq-0%d',sequence, seqNum);
        out_folder = sprintf('%s/seq-0%d-jpg',sequence, seqNum);
        mkdir(out_folder);
        % this is the super hacky way
        all_files = dir(folder);
        num_files = length(all_files)-2;
        all_poses = [];
        
        for j = 0:(num_files/3-1)
            pose_file = sprintf('%s/frame-%s.pose.txt',folder,sprintf('%06d',j));
            img_file = sprintf('%s/frame-%s.color.png',folder,sprintf('%06d',j));
            out_file = sprintf('%s/frame-%s.color.jpg',out_folder,sprintf('%06d',j));
            img = imread(img_file);
            imwrite(img,out_file);
            %ignoring poses for now because of 3d and using own evaluation
            pose = [0;0];
            if any(seqNum == test)
                utmQ = [utmQ, pose];
                qImageFns{end + 1} = out_file;
            elseif any(seqNum == train)
                utmDb = [utmDb, pose];
                dbImageFns{end + 1} = out_file;
            end
        end
    end
    dbStruct = struct();
    dbStruct.dbImageFns = dbImageFns;
    dbStruct.qImageFns = qImageFns;
    dbStruct.utmDb = utmDb;
    dbStruct.utmQ = utmQ;
    dbStruct.posDistThr = 0.01;
    dbStruct.nonTrivPosDistSqThr = 0.01;
    cd(currentDir);
end
    