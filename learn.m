function w = learn(X, t)

sizeX=size(X)(1);
X=[X ones(sizeX,1)];#adaugam o coloana de 1 la finalul matricei X
w=X\t;#calculam valoarea lui w

endfunction
