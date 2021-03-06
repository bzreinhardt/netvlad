paths= localPaths();

run( fullfile(paths.libMatConvNet, 'matlab', 'vl_setupnn.m') );

addpath( genpath(paths.libReljaMatlab) );
addpath( genpath(paths.libYaelMatlab) );
addpath( genpath(paths.libJsonLab) );

NetVLADRoot= fileparts(mfilename('fullpath'));
addpath(NetVLADRoot);
addpath(fullfile(NetVLADRoot, 'datasets/'));
clear NetVLADRoot;
