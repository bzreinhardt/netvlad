classdef dbMS7Heads < dbBase
    
    methods
        function db= dbMS7Heads()
            % possibly add thing for different sequences later
            db.name= sprintf('ms7_heads');
            paths= localPaths();
            dbRoot= paths.dsetRootMS7;
            db.dbPath= [dbRoot, '/'];
            db.qPath= [dbRoot, '/'];
            
            db.dbLoad();
        end
        
    end
    
end

