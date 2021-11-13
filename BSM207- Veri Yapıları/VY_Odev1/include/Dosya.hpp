#ifndef Dosya_hpp
#define Dosya_hpp
#include<iostream>
#include "IkiYonlu.hpp"
#include <fstream>
using namespace std;
class Dosya
{
private:
	int durDiyez;
	int durParantez;
	string _dosyaYolu;
	string satir;
	ifstream dosyaOku;
	IkiYonlu* liste;
public:
	Dosya(string dosyaYolu);
	~Dosya();
	void Oku();		
	int indis;  	//ekleme isleminde kullanildigi icin public eleman
	string isim; 	//ekleme isleminde kullanildigi icin public eleman
};
#endif // !Dosya_hpp
