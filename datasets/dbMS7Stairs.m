classdef dbMS7Stairs < dbBase
    
    methods
        function db= dbMS7Stairs()
            % possibly add thing for different sequences later
            db.name= sprintf('ms7_stairs');
            paths= localPaths();
            dbRoot= paths.dsetRootMS7;
            db.dbPath= [dbRoot, '/'];
            db.qPath= [dbRoot, '/'];
            
            db.dbLoad();
        end
        
    end
    
end

