classdef dbMS7Office < dbBase
    
    methods
        function db= dbMS7Office()
            % possibly add thing for different sequences later
            db.name= sprintf('ms7_office');
            paths= localPaths();
            dbRoot= paths.dsetRootMS7;
            db.dbPath= [dbRoot, '/'];
            db.qPath= [dbRoot, '/'];
            
            db.dbLoad();
        end
        
    end
    
end

