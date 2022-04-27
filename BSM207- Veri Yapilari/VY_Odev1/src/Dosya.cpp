#include "Dosya.hpp"
#include<string>
using namespace std;

Dosya::Dosya(string dosyaYolu)
{
	_dosyaYolu = dosyaYolu;
	cout<<"\n--------------------------------------\n"<<_dosyaYolu<<" acildi\n--------------------------------------"<<endl;
	liste=new IkiYonlu();
}
Dosya::~Dosya()
{
	dosyaOku.close();
	cout<<"--------------------------------------\n"<<_dosyaYolu<<" kapandi\n--------------------------------------"<<endl;
	delete liste; //Olusturulan liste silindi
}
void Dosya::Oku()
{
	dosyaOku.open(_dosyaYolu);
	if (dosyaOku.is_open())
	{
		cout<<"\nSatir satir islemler\n------------------------------------\n";
		while (getline(dosyaOku, satir))
		{			
			durDiyez = satir.find_first_of('#');
			indis = stoi(satir.substr(2, durDiyez - 2));
			durParantez = satir.find_first_of(')') - durDiyez - 1;
			isim = satir.substr(durDiyez + 1, durParantez);
			if (toupper(satir[0]) == 'E')
			{
				liste->Ekle(indis, isim);
				liste->Yazdir();
			}
			else if (toupper(satir[0]) == 'S') {
				liste->Cikar(indis);
				liste->Yazdir(); 
			}
		}
		cout<<"Listenin Son Hali\n------------------------------------\n";
		liste->Yazdir();
		
	}
	else cout << "Dosya acilamadi\n";
}