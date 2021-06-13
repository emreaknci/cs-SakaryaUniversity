                                                    /****************************************************************************
                                                    **					          SAKARYA ÜNİVERSİTESİ                         **
                                                    **			         BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ             **
                                                    **				         BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ                    **
                                                    **				            PROGRAMLAMAYA GİRİŞİ DERSİ                     **
                                                    **                                                                         **
                                                    **				               ÖDEV NUMARASI: 1                            **
                                                    **				               ÖĞRENCİ ADI: Yunus Emre Akıncı              **
                                                    **				               ÖĞRENCİ NUMARASI: B201210101                **
                                                    **				               DERS GRUBU: 1. Öğretim B Grubu              **
                                                    ****************************************************************************/


#include <iostream>
#include<locale.h>              // Diller ve karakter setleri kütüphanesi

using namespace std;            

struct Zaman              //Yapı tanımlama
{
    int saat, dakika, saniye;
    long toplam_saniye;   
};

Zaman SaatGir() {
    Zaman sure;

    char ikiNokta;      // Birimleri ayırmak amacıyla kullannılan ":" char veri tipinde bir dizi tanımladım.

   cout << "Saat:Dakika:Saniye biçiminde zamanı giriniz." << endl;
   cin >> sure.saat>> ikiNokta>> sure.dakika>> ikiNokta >> sure.saniye;

   // Bir saat  maksimum 23:59:59 olabilir. Bu durumun sağlanıp sağlanmadığını kontrol etmek için if kullandım.
   if ((sure.saat < 24 && sure.saat >= 0) && (sure.dakika < 60 && sure.dakika >= 0) && (sure.saniye < 60 && sure.saniye >= 0))
   {
           long toplamSecs = sure.saat * 3600 + sure.dakika * 60 + sure.saniye;        //İf bloğunun dışında tanımlamak istedim ama başlatılmamış yerel değişken hatası verdi.
           sure.toplam_saniye=toplamSecs;                                              //İf bloğunun içinde bu hatanın çalışmadığını fark ettim. O yüzden burada kullandım.
           cout << "Saniye olarak hesaplanan değer: " << sure.toplam_saniye << endl;
   }
   
   // Eğer 34. satırdaki if koşul bloğu sağlanmazsa else koşul bloğuna geçer
   else 
   {            // Saat değerine 0 ile 23 arasındaki değerlerden başka bir değer girilirse sistemin bizi uyarması için if kullandım.
                //Ödev dosyasında 12 lik saat dilimini kullanın veya kullanmayın şeklinde bir uyarı olmadığı için 12 lik saati kullanmadım.
                if (!(sure.saat < 24 && sure.saat >= 0))
                    cout << "Girilen saat değeri " << sure.saat << " yanlış girilmiştir." << endl;


                // Dakika değeri 0 ile 59 arasındaki değerlerden başka bir değer girilirse sistemin bizi uyarması için if kullandım.
                if (!(sure.dakika < 60 && sure.dakika >= 0))
                    cout << "Girilen dakika değeri " << sure.dakika << " yanlış girilmiştir." << endl;


                // Saniye değeri 0 ile 59 arasındaki değerlerden başka bir değer girilirse sistemin bizi uyarması için if kullandım.
                if (!(sure.saniye < 60 && sure.saniye >= 0))
                    cout << "Girilen saniye değeri " << sure.saniye << " yanlış girilmiştir." << endl;
   }
   return sure; //dönüş değeri
}

int main()
{
    // Sonuç ekranında Türkçe karakterleri kullanabilmek için
    setlocale(LC_ALL, "Turkish");
    
    Zaman sure;            // Yapıyı ana fonksiyonda çağırmak için bir değişken atama
    sure = SaatGir();      // Önceden taımlanan VeriGir() fonksiyonunu sure1 değişkenine atayarak elde etmek istenen ekran çıktısına ulaşılır.
  
    system("pause");	   // Bir tuşa basıncaya kadar bekle
  
    return 0; //dönüş değeri
}
