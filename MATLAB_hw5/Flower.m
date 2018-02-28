classdef Flower
  
    properties
        petalWidth
        petalLength
        sepalWidth
        sepalLength
        species
    end
    
    methods
        %function obj is our constructor, class is cookie cutter and
        %constructor makes the cookie out of the cookie cutter so we need
        %to give the cookie cutter like the dough and everything to make
        %the cookies
        %takes paramaters correspond to the different properties to link
        %everything together
        function obj = Flower(pw, pl, sw, sl, s)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            obj.petalWidth = pw;
            obj.petalLength = pl;
            obj.sepalWidth = sw;
            obj.sepalLength = sl;
            obj.species = s;
        end
        function sepalL = getSLength(input)
            sepalL = input.sepalLength;
        end
        %want to create method for the FLower object which will print out a
        %statement on the command window and report the details about the
        %flower object, doesnt need to return anything
        function report(obj)
            if(obj.sepalLength == 5.1 && obj.sepalWidth == 3.5 && obj.petalLength == 1.4 && obj.petalWidth == 0.2)
                disp("The length and width of its sepal are 5.1cm and 3.5cm respectively, while the length and width of this petal are 1.4cm and 0.2cm respectively.  It belongs to the setosa species.");
            end
        end
    end
end

