function [R, L] = CoordinateColore(Coordinate)
    R = Coordinate(1:1:3,:)';
    L = Coordinate(4:1:6,:)';
end