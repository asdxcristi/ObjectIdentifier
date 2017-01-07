function [ListaFinala] = rgbHistogram(cale,count_bins)

%Citim matricea RGB
imagine=imread(cale);

%o spargem in 3 matrici r g si b
r=imagine(:,:,1);
g=imagine(:,:,2);
b=imagine(:,:,3);


#initializam nrul de aparitii din fiecare interval cu 0
bincountsr=zeros(1,count_bins);
bincountsg=zeros(1,count_bins);
bincountsb=zeros(1,count_bins);






IDIntervalCurent=1;
MarimeIntervale=256/count_bins;%Calculam marimea intervalului

for i=0:count_bins-1%Topaim prin fiecare interval

		%calculam capetele intervalului curent
		CapatStangaInterval=i*MarimeIntervale;
		CapatDreaptaInterval=(i+1)*MarimeIntervale;
								
		%insumam numarul de aparitii al elemtelor ce respecta conditia sa apartina intervalului
		
		RNumarElementeIntervalCurent=sum(r(r>=CapatStangaInterval)<CapatDreaptaInterval);
		GNumarElementeIntervalCurent=sum(g(g>=CapatStangaInterval)<CapatDreaptaInterval);
		BNumarElementeIntervalCurent=sum(b(b>=CapatStangaInterval)<CapatDreaptaInterval);

		#adaugam numarul de aparitii din intervalul curent in ListaFinala prin intermediul contoarelor auxiliare

		bincountsr(IDIntervalCurent)=bincountsr(IDIntervalCurent)+RNumarElementeIntervalCurent;
		bincountsg(IDIntervalCurent)=bincountsg(IDIntervalCurent)+GNumarElementeIntervalCurent;
		bincountsb(IDIntervalCurent)=bincountsb(IDIntervalCurent)+BNumarElementeIntervalCurent;

		IDIntervalCurent++;
endfor




ListaFinala=[bincountsr bincountsg bincountsb];%punem la un loc toate cele 3 pt cele 3 matrice


endfunction

