classdef dbMS7Fire < dbBase
    
    methods
        function db= dbMS7Fire()
            % possibly add thing for different sequences later
            db.name= sprintf('ms7_fire');
            paths= localPaths();
            dbRoot= paths.dsetRootMS7;
            db.dbPath= [dbRoot, '/'];
            db.qPath= [dbRoot, '/'];
            
            db.dbLoad();
        end
        
    end
    
end

