classdef SimpleGuiView < handle
    % Class controlled gui adapted from:
    % http://uk.mathworks.com/matlabcentral/fileexchange/33816-example-using-a-matlab-class-to-control-a-gui
    
    properties (Access = private)
        guiH;
        Presenter;
    end
    
    methods
        
        function this = SimpleGuiView(Presenter)
            % Create the gui and set the appropriate callbacks
            
            % Store a reference to the presenter
            this.Presenter = Presenter;
                      
            % Make the figure
            this.guiH = guihandles(simplegui);
            
            % Close function
            set(this.guiH.figure1,  'closerequestfcn', ...
                @(src,event) this.Presenter.closeWindowPressed());
            
            % Button callback
            set(this.guiH.pushbutton1, 'callback', ...
                @(src, event) this.Presenter.pushButtonPressed());
        end
        
        function deleteWindow(this)
            %remove the closerequestfcn from the figure, this prevents an
            %infitie loop with the following delete command
            set(this.guiH.figure1,  'closerequestfcn', '');
            %delete the figure
            delete(this.guiH.figure1);
            %clear out the pointer to the figure - prevents memory leaks
            this.guiH = [];
        end
        
        function plotData(this, data)
            % Plot data
            axes(this.guiH.axes1)
            plot(data)
        end
       
    end
    
end