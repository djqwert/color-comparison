% La funzione genera disposizioni semplici senza ripetizione per n.
function R = gendis(n)
    
    dim = zeros(n,1);

    for i = 1:n
        dim(i) = size(nchoosek(1:n,i),1);
    end

    dis = zeros(sum(dim),n);
    
    prec = 1;
    
    for i = 1:n
        
        dim = nchoosek(1:n,i);
        rows = size(dim,1);
        for r = 1:rows
           bin = zeros(1,n);
           for c = 1:i
               index = dim(r,c);
               bin(index) = 1;
           end
           dis(prec,:) = bin;
           prec = prec + 1;
        end
                
    end
    
    R = dis;
    
end