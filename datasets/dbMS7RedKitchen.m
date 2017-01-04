classdef dbMS7RedKitchen < dbBase
    
    methods
        function db= dbMS7RedKitchen()
            % possibly add thing for different sequences later
            db.name= sprintf('ms7_redkitchen');
            paths= localPaths();
            dbRoot= paths.dsetRootMS7;
            db.dbPath= [dbRoot, '/'];
            db.qPath= [dbRoot, '/'];
            
            db.dbLoad();
        end
        
    end
    
end

