function out=mucoh(D)
D=normc(D);
G=D'*D;
A=G-eye(size(G));
out=max(abs(A(:)));
return