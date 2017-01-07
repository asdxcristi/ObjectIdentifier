function p = evaluate(path_to_testset, w, hist_type,  count_bins)

corecte=0;

if(hist_type=="RGB")#tratam cazul pt RGB
	[X t]=preprocess(path_to_testset, hist_type, count_bins);#scoatem matricea X si vectorul eticheta t cu ajutorul functie preprocess
	sizeX=size(X)(1);#calculam numarul total de imagini care coincide cu numarul de linii al matricei
	total_img=sizeX;
	
	X=[X ones(sizeX,1)];#adaugam matricei X la final coloana de 1

	for i=1:sizeX 
		y=w'*X(i,:)';#calculam y-ul aferent w si vectorlui feature corespunzator imaginii curente
		if(sign(y)>=0 && t(i)==1)#verificam daca prezicerea este ca imaginea e cu pisici si concide cu adevarul
			corecte++;#incrementam numarul de imagini corecte
			continue;#daca e alba n-are cum sa fie si neagra deci trecem la urmatoarea
		endif
		if(sign(y)<0 && t(i)==-1)#verificam daca prezicerea este ca imaginea nu e cu pisici si concide cu adevarul
			corecte++;
		endif
	endfor
	if(total_img!=0)#conditie de siguranta
		p=(corecte/total_img)*100;#calculam procentul de imagini prezise bine
	endif


endif
corecte=-1;#rezolvare inginereasca pt o problema cu calculul acuratei
if(hist_type=="HSV")#tratam cazul pt HSV
	[X t]=preprocess(path_to_testset, hist_type, count_bins);#scoatem matricea X si vectorul eticheta t cu ajutorul functie preprocess
	sizeX=size(X)(1);#calculam numarul total de imagini care coincide cu numarul de linii al matricei
	total_img=sizeX;
	
	X=[X ones(sizeX,1)];

	for i=1:sizeX 
		y=w'*X(i,:)';#calculam y-ul aferent w si vectorlui feature corespunzator imaginii curente
		if(sign(y)>=0 && t(i)==1)#verificam daca prezicerea este ca imaginea  e cu pisici si concide cu adevarul
			corecte++;#incrementam numarul de imagini corecte
			continue;#daca e alba n-are cum sa fie si neagra deci trecem la urmatoarea
		endif
		if(sign(y)<0 && t(i)==-1)#verificam daca prezicerea este ca imaginea nu e cu pisici si concide cu adevarul
			corecte++;#incrementam numarul de imagini corecte
		endif
	endfor
	if(total_img!=0)#conditie de siguranta
		p=(corecte/total_img)*100;#calculam procentul de imagini prezise bine
	endif


endif
endfunction
