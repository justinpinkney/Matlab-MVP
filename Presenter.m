classdef Presenter < handle
    % Presenter handles user input behaviour received from the View,
    % co-ordinates and communicates action between the Model and thew View
    
    properties (Access = private)
        View
        Model
    end
    
    methods
        
        function this = Presenter()
            % Create a new View and a Model, passing each a reference to
            % the Presenter (this)
            this.View = SimpleGuiView(this);
            this.Model = Model(this);
            
        end
        
        function pushButtonPressed(this)
            % Get new data from the model then plot
           this.Model.refreshData();
           data = this.Model.getData();
           this.View.plotData(data);
        end
        
        function closeWindowPressed(this)
            % Delete everything
           this.View.deleteWindow();
           delete(this)
           clear this
        end
        
    end
end