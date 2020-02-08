function R = MamToSug(fis)
    
    g = 1;
    for i = 1:2:15
        fis.output.mf(i).name = ['Piccolo',num2str(g)];
        fis.output.mf(i).type = 'trimf';
        fis.output.mf(i).params = [-2 0 3.5];
        fis.output.mf(i+1).name = ['Grande',num2str(g)];
        fis.output.mf(i+1).type = 'trimf';
        fis.output.mf(i+1).params = [3 5 7];
        g = g + 1;
    end

    for i = 1:16
        fis.rule(i).consequent = i;
    end
    
    R = mam2sug(fis);

end