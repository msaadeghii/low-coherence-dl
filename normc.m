function Y=normc(X)

N = size(X,2);
Y = X;


for i=1:N
    Y(:,i) = X(:,i)/norm(X(:,i));
end