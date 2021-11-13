#ifndef Dugum_hpp
#define Dugum_hpp
#include <iostream>
using namespace std;
class Dugum
{
public:
	Dugum(string isim);
	Dugum* onceki;
	Dugum* sonraki;
	string isim;

};
#endif // !Dugum_hpp
