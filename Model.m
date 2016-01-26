classdef Model < handle
    % Simple model to provide a set of random number data
    
    properties (Access = private)
        Presenter
        Data
    end
    
    
    methods
        
        function this = Model(Presenter)
            % Store a reference to the Presenter, and generate a new set of
            % data
            this.Presenter = Presenter;
            this.Data = rand(10000,1);
        end
        
        function data = getData(this)
            % Getter for the data
            data = this.Data;
        end
        
        function refreshData(this)
            % Generate new random data
            this.Data = rand(100,1);
        end
        
    end
end