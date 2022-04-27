#ifndef IkiYonlu_hpp
#define IkiYonlu_hpp
#include "Dugum.hpp"
#include <iostream>
#include <iomanip>

class IkiYonlu
{
public:
	IkiYonlu();
	~IkiYonlu();
	void Ekle(string isim);
	void Ekle(int sira, string isim);
	void Cikar();
	void Cikar(int sira);
	void Yazdir();
	int dugumSayisiGetir();
private:
	Dugum* DugumGetir(int sira);
	Dugum* ilk;
	int dugumSayisi;
};
#endif // !IkiYonlu_hpp
