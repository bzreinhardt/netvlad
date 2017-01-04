classdef dbMS7Pumpkin < dbBase
    
    methods
        function db= dbMS7Pumpkin()
            % possibly add thing for different sequences later
            db.name= sprintf('ms7_pumpkin');
            paths= localPaths();
            dbRoot= paths.dsetRootMS7;
            db.dbPath= [dbRoot, '/'];
            db.qPath= [dbRoot, '/'];
            
            db.dbLoad();
        end
        
    end
    
end

