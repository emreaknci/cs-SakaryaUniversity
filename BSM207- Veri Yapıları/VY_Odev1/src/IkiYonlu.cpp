#include "IkiYonlu.hpp"
using namespace std;
IkiYonlu::IkiYonlu() {
	ilk = 0;
	dugumSayisi = 0;
	cout<<"--------------------------------------\nIkiYonlu::IkiYonlu() olusturuldu\n--------------------------------------"<<endl;
}
IkiYonlu::~IkiYonlu() {
	Dugum* gecici = ilk;

	for (int i = 0; i < dugumSayisi; i++)
	{
		Dugum* silinecek = gecici;

		gecici = gecici->sonraki;
		delete silinecek;
	}
	cout << "--------------------------------------\nIkiYonlu::~IkiYonlu() silindi\n--------------------------------------\n"<<endl;
}
void IkiYonlu::Ekle(string isim) {
	Dugum* yeniDugum = new	Dugum(isim);
	if (ilk == 0)
	{
		ilk = yeniDugum;
	}
	else
	{
		Dugum* gecici = ilk;
		while (gecici->sonraki != 0)
		{
			gecici = gecici->sonraki;
		}
		gecici->sonraki = yeniDugum;
		yeniDugum->onceki = gecici;
	}
	dugumSayisi++;
}
void IkiYonlu::Ekle(int sira, string isim) {
	if (ilk == 0 && sira == 0)
	{
		ilk = new Dugum(isim);
		dugumSayisi++;
	}

	//Listede olmayan bir "sira" gelirse diye kosul
	//Burada bu kontrolu yapmak yerine DugumGetir() fonksiyonunda istenen "sira" yoksa son dugumu dondurebilirdik
	//ya da daha duzenli olmasi icin sonDugumGetir() adinda bir fonksiyon yazip ayni isi yapabilirdik.  
	else if (sira >= dugumSayisi) 
	{
		Ekle(isim);
	}
	
	//Listede "sira" mevcutsa yapilan islemler
	else
	{
		Dugum* d = DugumGetir(sira);
		if (d == 0) return;
		Dugum* yeniDugum = new Dugum(isim);
		Dugum* oncekiDugum = d->onceki;
		d->onceki = yeniDugum;
		yeniDugum->sonraki = d;
		yeniDugum->onceki = oncekiDugum;
		if (oncekiDugum)
			oncekiDugum->sonraki = yeniDugum;
		else
			ilk = yeniDugum;
		dugumSayisi++;
	}
}
void IkiYonlu::Cikar() {
	if (ilk == 0)
	{
		return;
	}
	else {
		if (ilk->sonraki == 0) {
			ilk = 0;
		}
		else {
			Dugum* gecici = ilk;
			while (gecici->sonraki->sonraki != 0)
				gecici = gecici->sonraki;
			Dugum* lastNode = gecici->sonraki;
			delete gecici->sonraki;
			gecici->sonraki = 0;
		}
	}
	dugumSayisi--;
}
void IkiYonlu::Cikar(int sira) {
	Dugum* sil = DugumGetir(sira);
	//Listede girilen "sira" degeri yoksa listenin sonundaki elemani cikaran Cikar() fonksiyonunu cagirdim
	if (sil == 0)
		Cikar();
	//Listede "sira" indisi varsa gerceklesen olaylar	
	else
	{
		Dugum* onceki = sil->onceki;
		Dugum* sonraki = sil->sonraki;
		delete sil;
		if (sonraki)
			sonraki->onceki = onceki;
		if (onceki)
			onceki->sonraki = sonraki;
		else
			ilk = sonraki;
		dugumSayisi--;
	}
}
void IkiYonlu::Yazdir() {
	Dugum* gecici = ilk;

	while (gecici != 0)
	{
		if (gecici->sonraki) //Mevcut dugumden sonra baska dugum varsa ekrana yazdırırken fazladan " <=> " yazdirdim
			cout << gecici->isim << " <=> ";
		else //Mevcut dugum son .dugumse ekrana sadece isim yazdirdim
			cout << gecici->isim;			
		gecici = gecici->sonraki;
	}
	cout << endl<<endl;
}
int IkiYonlu::dugumSayisiGetir() {
	return dugumSayisi;
}
Dugum* IkiYonlu::DugumGetir(int sira) {
	int sayac = 0;
	Dugum* gecici = ilk;
	while (gecici != 0)
	{
		if (sayac == sira)
			return gecici;
		gecici = gecici->sonraki;

		sayac++;
	}
	return 0;
}