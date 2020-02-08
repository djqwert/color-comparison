function R = CreaInput(LAB,D76)
    input = lab2lch(LAB);
    input(:,2) = input(:,2) * 100/128;
    input(:,4) = D76;
    R = input;
end

