sequences = {'chess','fire','heads','office','pumpkin','redkitchen','stairs'};
root = '~/Data/ms7';
mat_target = '~/Data/netvlad/datasets';
for sequence = sequences
    dbStruct = processMS7(sequence{1}, root);
    target_file = sprintf('%s/ms7_%s.mat',mat_target,sequence{1});
    save(target_file, 'dbStruct');
end