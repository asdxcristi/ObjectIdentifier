function [ListaFinala] = hsvHistogram(cale,count_bins)

%Citim matricea RGB

imagine=imread(cale);

%o spargem in 3 matrici r g si b

r=imagine(:,:,1);
g=imagine(:,:,2);
b=imagine(:,:,3);


MarimeIntervale=double(1.01/count_bins);%Calculam marimea intervalului

Roar=size(r)(1);

H=zeros(Roar,1);#initializam nrul de aparitii din fiecare interval cu 0
S=zeros(Roar,1);
V=zeros(Roar,1);




#scoatem matricile H S V folosindu-ne de functia de transformare RGB2HSV
[H S V]=RGB2HSV(double(r),double(g),double(b));





bincountsr=zeros(1,count_bins);
bincountsg=zeros(1,count_bins);
bincountsb=zeros(1,count_bins);



IDIntervalCurent=1;


%sum de matricea cu 1-uri udne e elementu <capat interval hehe pwp


for i=0:count_bins-1%Topaim prin fiecare interval

		%calculam capetele intervalului curent
		CapatStangaInterval=i*MarimeIntervale;
		CapatDreaptaInterval=(i+1)*MarimeIntervale;
		%insumam numarul de aparitii al elemtelor ce respecta conditia sa apartina intervalului

		HNumarElementeIntervalCurent=sum(H(H>=CapatStangaInterval)<CapatDreaptaInterval);
		SNumarElementeIntervalCurent=sum(S(S>=CapatStangaInterval)<CapatDreaptaInterval);
		VNumarElementeIntervalCurent=sum(V(V>=CapatStangaInterval)<CapatDreaptaInterval);

		#adaugam numarul de aparitii din intervalul curent in ListaFinala prin intermediul contoarelor auxiliare

		bincountsr(IDIntervalCurent)=bincountsr(IDIntervalCurent)+HNumarElementeIntervalCurent;
		bincountsg(IDIntervalCurent)=bincountsg(IDIntervalCurent)+SNumarElementeIntervalCurent;
		bincountsb(IDIntervalCurent)=bincountsb(IDIntervalCurent)+VNumarElementeIntervalCurent;

		IDIntervalCurent++;
endfor



ListaFinala=[bincountsr bincountsg bincountsb];%punem la un loc toate cele 3 pt cele 3 matrice


endfunction
