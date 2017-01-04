classdef dbMS7 < dbBase
    
    methods
    
        function db= dbMS7Chess()
            % possibly add thing for different sequences later
            db.name= sprintf('ms7_chess');
     
            paths= localPaths();
            dbRoot= paths.dsetRootMS7;
            db.dbPath= [dbRoot, '/'];
            db.qPath= [dbRoot, '/'];
            
            db.dbLoad();
        end
        
    end
    
end

