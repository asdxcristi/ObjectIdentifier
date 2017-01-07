function [H S V] = RGB2HSV(R,G,B)

%%La fel ca cel din enunt exceptie facand vectorizarile folosite 
R1=R/255;
G1=G/255;
B1=B/255;

m=size(R1)(1);
n=size(R1)(2);

Cmax=max(max(R1,G1),B1);
Cmin=min(min(R1,G1),B1);

H=zeros(m,n);#rezolvarea if-urilor in caz ca iau valori 0
S=zeros(m,n);

delta=Cmax-Cmin;
delta(delta==0)=inf;#rezolvarea problemei din vectorizarea de mai jos in cazul incare delta==0


#if-urile din algoritm,mai putin cele cu =0
H((Cmax==R1))=60*(mod( (G1((Cmax==R1))-B1((Cmax==R1)))./delta((Cmax==R1)),6));
H(Cmax==G1)=60*((B1(Cmax==G1)-R1(Cmax==G1))./delta(Cmax==G1)+2);
H(Cmax==B1)=60*((R1(Cmax==B1)-G1(Cmax==B1))./delta(Cmax==B1)+4);

S(Cmax!=0)=delta(Cmax!=0)./Cmax(Cmax!=0);

H=H/360;

V=Cmax;
endfunction
