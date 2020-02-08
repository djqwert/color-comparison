% La funzione conta il numero di uno nella matrice M, per colonna
function R = Conta1(M,dim)
    U = zeros(1,dim);
    for i = 1:1:dim
        U(1,i) = sum(M(:,i) == 1);
    end
    R = U;
end