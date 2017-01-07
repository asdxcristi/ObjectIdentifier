function [X t] = preprocess(path_to_dataset, hist_type, count_bins)


M=count_bins*3;#calculam numarul de coloane al matricei X
	path_to_dataset1=strcat(path_to_dataset,"cats/");
	ImaginiCats=getImgNames(path_to_dataset1);#scoteam imaginile din folderul cats/
	NrImaginiCats=size(ImaginiCats)(1);#calculam cate imagini is in folderul cats

	path_to_dataset2=strcat(path_to_dataset,"not_cats/");
	ImaginiNotCats=getImgNames(path_to_dataset2);#scoteam imaginile din folderul not_cats/
	NrImaginiNotCats=size(ImaginiNotCats)(1);#calculam cate imagini is in folderul not_cats

N=NrImaginiCats+NrImaginiNotCats;#calculam numarul de linii al matricei X

#initializam cu 0 corespunzator,t si X
t=zeros(N,1);
X=zeros(N,M);


if(hist_type=="RGB")#tratam cazul pt RGB


	k=1;
	for i=1:NrImaginiCats
		img = ImaginiCats(i,:);#extragem fiecare imagine din matrice
		in = strcat(path_to_dataset1, img);#o adaugam la pathul ei
		t(k)=1;#o etichetam corespunzator
		X(k++,:)=rgbHistogram(in,count_bins);#ne folosim de histograma creata cu ajutorul in(path/img)
	endfor



	tic;
	for i=1:NrImaginiNotCats
		img = ImaginiNotCats(i,:);#extragem fiecare imagine din matrice
		in = strcat(path_to_dataset2, img);#o adaugam la pathul ei
		t(k)=-1;#o etichetam corespunzator
		X(k++,:)=rgbHistogram(in,count_bins);#ne folosim de histograma creata cu ajutorul in(path/img) in apelul functiei scrisa anterior: rgbHistogram
	endfor

endif

if(hist_type=="HSV")#tratam cazul pt HSV


	k=1;
	for i=1:NrImaginiCats
		img = ImaginiCats(i,:);#extragem fiecare imagine din matrice
		in = strcat(path_to_dataset1, img);#o adaugam la pathul ei
		t(k)=1;#o etichetam corespunzator
		X(k++,:)=hsvHistogram(in,count_bins);#ne folosim de histograma creata cu ajutorul in(path/img) in apelul functiei scrisa anterior: rgbHistogram
	endfor




	for i=1:NrImaginiNotCats
		img = ImaginiNotCats(i,:);#extragem fiecare imagine din matrice
		in = strcat(path_to_dataset2, img);#o adaugam la pathul ei
		t(k)=-1;#o etichetam corespunzator
		X(k++,:)=hsvHistogram(in,count_bins);#ne folosim de histograma creata cu ajutorul in(path/img) in apelul functiei scrisa anterior: rgbHistogram
	endfor

endif

endfunction
