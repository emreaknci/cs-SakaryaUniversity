                                                    /****************************************************************************
                                                    **					         SAKARYA ÜNİVERSİTESİ                          **
                                                    **			       BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ               **
                                                    **				         BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ                    **
                                                    **				           PROGRAMLAMAYA GİRİŞİ DERSİ                      **
                                                    **                                                                         **
                                                    **				                  PROJE ÖDEVİ                              **
                                                    **				            ÖĞRENCİ ADI: Yunus Emre Akıncı                 **
                                                    **				            ÖĞRENCİ NUMARASI: B201210101                   **
                                                    **				            DERS GRUBU: 1. Öğretim B Grubu                 **
                                                    ****************************************************************************/

#include <iostream>

#include <ctime>     // giris-cikis
#include<chrono>    // saatlerini yazmak icin 

#include<fstream> //dosya islemleri kutuphanesi

#include<string> 

using namespace std;

int main()
{
    //giris saatini yazmak icin
    auto start = chrono::system_clock::now();
    auto giris = chrono::system_clock::to_time_t(start);
    char Giris_Saati[30];
    ctime_s(Giris_Saati, sizeof(Giris_Saati), &giris);

    cout << "Giris Saati: " << Giris_Saati << endl;


    int   uyeNO, maks_Kitap;                                      // Okuyucu bilgileri
    string telNO, ad, soyad, gorev, dogumTarihi;                 // icin 
    long long  Tc;                                              // degiskenler
                                                               //
    int  sayfaSayisi;                                         // Kitap bilgileri
    string kitapAdi, yazarAdi, yazarSoyadi, konu, tur;       // icin 
    long long ISBN;                                         // degiskenler
                                                           //
    string oduncTarihi, donusTarihi;                      // Odunc verilen dosya icin degiskenler (ISBN ve Tc  dosyalar arasi iliskiyi saglayacaktir)

    char cevap = 'e';                                       
    int secim, basamakSayisi;

    string k_adi, k_sifre, geciciAd, geciciSifre; //kullanici girisi isterken gerekli degiskenler

    ofstream dosyaYaz;
    ifstream dosyaOku;

    
    ofstream kullaniciEkle("kullanıcılar.txt", ios::app);

    cout << "Kullanici eklemek ister misiniz? (e/h) "; cin >> cevap;
    if (cevap == 'e')//kullanici eklenmek isterse döngüye girecek
    {
        do//baska kullini eklenmek istenirse diye dongu kullandim
        {
            cout << "Yeni kullanici bilgilerini giriniz...\n" << endl;
            cout << "Kullanici Adi: "; cin >> geciciAd;
            cout << "Kullanici Sifre: "; cin >> geciciSifre;

            kullaniciEkle << geciciAd << " " << geciciSifre << "\n";
            cout << "\nBaska kullanici ekleyecek misiniz? (e/h) "; cin >> cevap;
        } while (cevap == 'e');
    }
    kullaniciEkle.close();

    ifstream kullaniciOku("kullanıcılar.txt", ios::app);
    cout << "Giris yapmak icin kullanici bilgilerini giriniz.\n";
    cout << "\nKullanici Adi: "; cin >> geciciAd;
    cout << "Kullanici Sifre: "; cin >> geciciSifre;
    cout << endl;

    int sonuc = 0;

    while (kullaniciOku >> k_adi >> k_sifre)//dosyadan veriler okunur
    {
        //Kullanici adi ve sifresi dogruysa if bloguna girer
        if (k_adi == geciciAd && k_sifre == geciciSifre)
        {
            cout << "\nGiris: Basarili!\n" << endl;

            do
            {
                cout << "Islem yapmak istediginiz numarayi giriniz...\n" << endl;
                cout << "\tMENU\n" << endl;
                cout << " 1 - Okuyucu kaydi" << endl
                    << " 2 - Okuyucu kaydi guncelleme" << endl
                    << " 3 - Okuyucu silme" << endl
                    << " 4 - Okuyucu uzerindeki kitaplar listesi" << endl
                    << " 5 - Okuyucu kitap odunc alma" << endl
                    << " 6 - Okuyucu kitap geri dondurme" << endl
                    << " 7 - Kitap ekleme" << endl
                    << " 8 - Kitap silme" << endl
                    << " 9 - Kitap duzeltme" << endl;

                cout << endl;
                cout << "Secim: "; cin >> secim;

                //eger secim 1 ise bu donguye girer
                if (secim == 1)
                {
                    cout << "\nSecilen Islem: Okuyucu kaydi" << endl;

                    dosyaYaz.open("okuyucu.txt", ios::app);//bilgileri yazmak icin dosya acilir
                    do
                    {
                        cout << "\nOkuyucu T.C.: "; cin >> Tc;
                        long long geciciTc = Tc;
                        //girilen Tc degiskeninin basamak sayisini bu dongu ile buluyorum
                        for (basamakSayisi = 1; geciciTc > 10; basamakSayisi++)
                        {
                            geciciTc = geciciTc / 10;
                        }
                        if (basamakSayisi == 11) // Tc nin basamak sayisinin kontrolunu yapiyorum
                        {
                            cout << "\nOkuyucu Adi (Bosluk birakmadan yaziniz ornegin -> Yunus_Emre): "; cin >> ad;
                            cout << "\nOkuyucu Soyadi: "; cin >> soyad;
                            cout << "\nUye No: "; cin >> uyeNO;
                            cout << "\nTelefon Numarasi: "; cin >> telNO;
                            cout << "\nDogum Tarihi: "; cin >> dogumTarihi;
                            cout << "\nGorevi (Bosluk birakmadan yaziniz ornegin -> Bilgisayar_Muh): "; cin >> gorev;
                            cout << "\nAlabilecegi Kitap Sayisi: "; cin >> maks_Kitap;

                            //veriler dosyaya yazdirilir
                            dosyaYaz << "\n" << Tc << " " <<
                                ad << " " <<
                                soyad << " " <<
                                uyeNO << " " <<
                                telNO << " " <<
                                dogumTarihi << " " <<
                                gorev << " " <<
                                maks_Kitap << "\n ";

                            cout << "\nOkuyucu basariyla kaydedildi!";
                        }
                        else //basamak sayisi 11 degilse bu blok calisir
                        {
                            cout << "\nGirilen T.C kimlik numarasi " << basamakSayisi << " haneli olamaz!" << endl;
                        }

                        cout << "\nOkuyucu eklemeye devam etmek ister misiniz? (e/h) "; cin >> cevap;
                        // girilen cevaba gore kayit ekleme islemi devam edecektir
                    } while (cevap == 'e');

                    dosyaYaz.close();
                    cout << endl;
                    cout << "Islem tamamlandi!\n";
                }

                //eger secim 2 ise bu donguye girer
                else if (secim == 2)
                {
                    long long  geciciTC;
                    cout << "\nSecilen Islem: Okuyucu kaydi guncelleme" << endl;

                    dosyaOku.open("okuyucu.txt", ios::app); //Dosya okuma yapabilmek icin gerekli kodu yazdim.
                    dosyaYaz.open("gecici.tmp", ios::app); //Gecici bir dosya acilir.

                    cout << "Duzenlenecek Kullanicinin T.C. Kimlik Numarasi: "; cin >> geciciTC;

                    //dosyaOku da belirttigim okuyucu.txt dosyasini sonuna kadar okuttum.
                    while (dosyaOku >> Tc >> ad >> soyad >> uyeNO >> telNO >> dogumTarihi >> gorev >> maks_Kitap)
                    {
                        if (geciciTC == Tc)//Sorgulanan T.C. Kimlik numarası varsa okuyucu bilgilerini gösterir.
                        {
                            cout << "========== Okuyucu Bilgileri ==========" << endl << endl;//dosyadaki okuyucu bilgieri ekrana yazdirilir
                            cout << "Okuyucu T.C.: " << Tc << endl;
                            cout << "Okuyucu Adi: " << ad << endl;
                            cout << "Okuyucu Soyadi: " << soyad << endl;
                            cout << "Uye No: " << uyeNO << endl;
                            cout << "Telefon Numarasi: " << telNO << endl;
                            cout << "Dogum Tarihi: " << dogumTarihi << endl;
                            cout << "Gorevi: " << gorev << endl;
                            cout << "Alabilecegi Kitap Sayisi: " << maks_Kitap << endl;
                            cout << endl;

                            cout << "\nOkuyucu bilgilerini yenileyiniz.\n" << endl;//okuyucu bilgileri duzenlenir
                            cout << "\nOkuyucu T.C.: " << geciciTC;
                            cout << "\nOkuyucu Adi (Bosluk birakmadan yaziniz ornegin -> Yunus_Emre): "; cin >> ad;
                            cout << "\nOkuyucu Soyadi: "; cin >> soyad;
                            cout << "\nUye No: "; cin >> uyeNO;
                            cout << "\nTelefon Numarasi: "; cin >> telNO;
                            cout << "\nDogum Tarihi: "; cin >> dogumTarihi;
                            cout << "\nGorevi (Bosluk birakmadan yaziniz ornegin -> Bilgisayar_Muh): "; cin >> gorev;
                            cout << "\nAlabilecegi Kitap Sayisi: "; cin >> maks_Kitap;

                            cout << "\nOkuyucu bilgileri basariyla guncellendi!" << endl;

                            //Duzenlenen kisinin bilgileri dosyaya yazdirilir
                            dosyaYaz << "\n" << geciciTC << " " << ad
                                << " " << soyad << " " << uyeNO
                                << " " << telNO << " " << dogumTarihi << " "
                                << gorev << " " << maks_Kitap << "\n";
                            sonuc = 1;
                        }
                        else
                            //Duzenlenmeyen kisilerin bilgileri dosyaya yazdirilir
                            dosyaYaz << "\n" << Tc << " "
                            << ad << " " << soyad << " "
                            << uyeNO << " " << telNO << " "
                            << dogumTarihi << " "
                            << gorev << " " << maks_Kitap << "\n";
                    }


                    dosyaYaz.close();
                    dosyaOku.close();


                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısmayacaktır.   
                    if (sonuc == 0)
                    {
                        cout << "Boyle bir okuyucu kaydi bulunmamaktadir!" << endl;
                        remove("gecici.tmp"); //okuyucu bulunmazsa dosya silinir
                    }
                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısacaktır.   
                    if (sonuc == 1)
                    {
                        remove("okuyucu.txt");                //okuyucu.txt dosyasi silinirken
                        rename("gecici.tmp", "okuyucu.txt"); //gecici.tmp dosyasi okuyucu.txt dosyasi olarak degistirirlir.

                    }
                }

                //eger secim 3 ise bu donguye girer
                else if (secim == 3)
                {

                    long long  sil_TC, Tc_odunc;

                    cout << "\nSecilen Islem: Okuyucu silme" << endl;
                    cout << "\nSilinecek Kullanicinin T.C. Kimlik Numarasi: "; cin >> sil_TC;

                    dosyaOku.open("okuyucu.txt", ios::app); //Dosyayi okuma yapabilmek icin gerekli kodu yazdim.
                    dosyaYaz.open("gecici.tmp", ios::app);//Gecici bir dosya acilir
                    ifstream dosyaOku1("odunc.txt", ios::app);
                    ofstream dosyaYaz1("geciciOduncYaz.tmp", ios::app);

                    //dosyaOku da belirttigim okuyucu.txt dosyasini sonuna kadar okuttum.
                    while (dosyaOku >> Tc >> ad >> soyad >> uyeNO >> telNO >> dogumTarihi >> gorev >> maks_Kitap)
                    {
                        if (Tc == sil_TC)//Girilen T.C. Kimlik numarasi kayitlarda var ise okuyucu kaydini goruntuler.
                        {
                            cout << "========== Okuyucu Bilgileri ==========" << endl << endl;//okuyucu bilgieri yazdirilir.
                            cout << "Okuyucu T.C.: " << Tc << endl;
                            cout << "Okuyucu Adi: " << ad << endl;
                            cout << "Okuyucu Soyadi: " << soyad << endl;
                            cout << "Uye No: " << uyeNO << endl;
                            cout << "Telefon Numarasi: " << telNO << endl;
                            cout << "Dogum Tarihi: " << dogumTarihi << endl;
                            cout << "Gorevi: " << gorev << endl;
                            cout << "Alabilecegi Kitap Sayisi: " << maks_Kitap << endl;
                            cout << "\nOkuyucu bilgileri silme islemi basariyla tamamlandi!\n";
                        }
                        else
                        {
                            //Silinmeyen kisiler dosyaya tekrardan yazdirilir
                            dosyaYaz << "\n" << Tc << " "
                                << ad << " " << soyad << " "
                                << uyeNO << " " << telNO << " "
                                << dogumTarihi << " "
                                << gorev << " " << maks_Kitap << "\n";
                        }
                        sonuc = 1;
                    }

                    while (dosyaOku1 >> ISBN >> Tc_odunc >> oduncTarihi >> donusTarihi) //odunc.txt yi taradim
                    {
                        if (sil_TC == Tc_odunc) //odunc.txt dosyasında okuyucuya ait kitap varsa onlari da siler
                        {
                            cout << "Odunc kitaplar basariyla silindi!\n" << endl;
                        }
                        else
                        {
                            //Silinmeyen kisilerin oduncleri varsa geri yazdirilir
                            dosyaYaz1 << "\n" << ISBN << " "
                                << Tc_odunc << " "
                                << oduncTarihi << " "
                                << donusTarihi << "\n";
                        }
                    }



                    dosyaYaz.close();
                    dosyaOku.close();
                    dosyaYaz1.close();
                    dosyaOku1.close();

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısmayacaktır.   
                    if (sonuc == 0)
                    {
                        cout << "Boyle bir okuyucu kaydi bulunmamaktadir!" << endl;
                        remove("geciciOduncYaz.tmp"); // okuyucu bulunmazsa dosya silinir
                        remove("gecici.tmp");        // okuyucu bulunmazsa dosya silinir
                    }

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısacaktır. 
                    if (sonuc == 1)
                    {
                        remove("odunc.txt");                        //Dosya silindi
                        rename("geciciOduncYaz.tmp", "odunc.txt"); //Gecici dosyalar kayit silindikten sonra .tmp dosyasi .txt dosyasina aktarilir.

                        remove("okuyucu.txt");                //Dosya silindi
                        rename("gecici.tmp", "okuyucu.txt"); //Gecici dosyalar kayit silindikten sonra .tmp dosyasi .txt dosyasina aktarilir.
                    }
                }

                //eger secim 4 ise bu donguye girer
                else if (secim == 4)
                {
                    cout << "\nSecilen Islem: Okuyucu uzerindeki kitaplar listesi" << endl;
                    long long okuyucu_TC, oduncTC, ISBN2;
                    cout << "Okuyucu T.C.: "; cin >> okuyucu_TC;

                    dosyaOku.open("odunc.txt", ios::app);
                    ifstream dosyaOku1("okuyucu.txt", ios::app);
                    ifstream dosyaOku2("kitaplar.txt", ios::app);

                    while (dosyaOku1 >> Tc >> ad >> soyad >> uyeNO >> telNO >> dogumTarihi >> gorev >> maks_Kitap) //okuyucu.txt sonuna kadar okunur
                    {
                        if (Tc == okuyucu_TC) // eger okuyucu.txt deki T.C ile  okuyucu_TC esitse kosula girer
                        {
                            cout << "\n========== Okuyucu Bilgileri ==========" << endl << endl;
                            cout << "Okuyucu T.C.: " << Tc << endl;
                            cout << "Okuyucu Adi: " << ad << endl;
                            cout << "Okuyucu Soyadi: " << soyad << endl;
                            cout << "Alabilecegi Kitap Sayisi: " << maks_Kitap << endl;
                            cout << endl;

                            while (dosyaOku >> ISBN >> oduncTC >> oduncTarihi >> donusTarihi) // odunc.txt sonuna kadar okutulur
                            {

                                if (Tc == oduncTC) // odunc.txt deki T.C. ile okuyucu.txt deki T.C. ler esitse kosula girer
                                {
                                    while (!(dosyaOku2.eof())) // kitaplar.txt sonuna kadar okutulur
                                    {
                                        dosyaOku2 >> ISBN2 >> kitapAdi >> yazarAdi >> yazarSoyadi >> konu >> tur >> sayfaSayisi;
                                        if (ISBN == ISBN2) // eger odunc.txt deki ISBN kitaplar.txt deki bir ISBN ile eslesirse kitap bilgileri yazdirilir
                                        {
                                            cout << "\n========== Kitap Bilgileri ==========\n" << endl;
                                            cout << "ISBN: " << ISBN2 << endl;
                                            cout << "Kitap Adi: " << kitapAdi << endl;
                                            cout << "Yazar Adi: " << yazarAdi << endl;
                                            cout << "Yazar Soyadi: " << yazarSoyadi << endl;
                                            cout << "Konu: " << konu << endl;
                                            cout << "Tur: " << tur << endl;
                                            cout << "Sayfa Sayisi: " << sayfaSayisi << endl;
                                            cout << endl;
                                            sonuc = 1;
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }

                    dosyaOku.close();
                    dosyaOku1.close();
                    dosyaOku2.close();

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısmayacaktır.   
                    if (sonuc == 0)
                    {
                        cout << "\n" << okuyucu_TC << " T.C. numarali kisi odunc kitap almamis...\n" << endl;
                    }

                }

                //eger secim 5 ise bu donguye girer
                else if (secim == 5)
                {
                    long long  odunc_TC;
                    string gecici_kitapAdı;

                    cout << "\nSecilen Islem: Okuyucu kitap odunc alma\n" << endl;
                    cout << "Okuyucu T.C. Kimlik Numarasi: "; cin >> odunc_TC;

                    dosyaOku.open("okuyucu.txt", ios::app);//okuyucu dosyasini okumak icin
                    dosyaYaz.open("gecici.tmp", ios::app);//Gecici bir dosya açılır =>alabilcegi kitap sayisini azaltmak icin

                    while (dosyaOku >> Tc >> ad >> soyad >> uyeNO >> telNO >> dogumTarihi >> gorev >> maks_Kitap) //dosyaOku da belirttiğim okuyucu.txt dosyasını sonuna kadar okuttum.
                    {
                        if (Tc == odunc_TC)//Once tc lerin esitligini sorguluyoruz.
                        {
                            if (maks_Kitap > 0)// Eger okuyucunun alabilecegi kitap sayisi 0 dan buyukse bu donguye giriyor
                            {
                                cout << "\n========== Okuyucu Bilgileri ==========" << endl << endl;//kullanıcı bilgieri yazdırılır.
                                cout << "Okuyucu T.C.: " << Tc << endl;
                                cout << "Okuyucu Adi: " << ad << endl;
                                cout << "Okuyucu Soyadi: " << soyad << endl;
                                cout << "Uye No: " << uyeNO << endl;
                                cout << "Telefon Numarasi: " << telNO << endl;
                                cout << "Dogum Tarihi: " << dogumTarihi << endl;
                                cout << "Görevi: " << gorev << endl;
                                cout << "Alabilecegi Kitap Sayisi: " << maks_Kitap << endl;

                                ifstream okuDosya("kitaplar.txt", ios::app);
                                ofstream yazDosya("odunc.txt", ios::app);

                                cout << "\n\nOdunc almak istediginiz kitabin adini giriniz: "; cin >> gecici_kitapAdı;

                                while (okuDosya >> ISBN >> kitapAdi >> yazarAdi >> yazarSoyadi >> konu >> tur >> sayfaSayisi) //okuDosya da belirttiğim kitaplar.txt dosyasını sonuna kadar okuttum.
                                {
                                    if (kitapAdi == gecici_kitapAdı)
                                    {
                                        cout << "\n========== Kitap Bilgileri ==========" << endl << endl;
                                        cout << "ISBN: " << ISBN << endl;
                                        cout << "Kitap Adi: " << kitapAdi << endl;
                                        cout << "Yazar Adi: " << yazarAdi << endl;
                                        cout << "Yazar Soyadi: " << yazarSoyadi << endl;
                                        cout << "Konu: " << konu << endl;
                                        cout << "Tur: " << tur << endl;
                                        cout << "Sayfa Sayisi: " << sayfaSayisi << endl;

                                        cout << endl << endl;

                                        cout << "Kitabi odunc aldiginiz tarihi giriniz (GG/AA/YY): "; cin >> oduncTarihi;
                                        cout << "\nKitabi en gec 1 ay sonra iade ediniz.\nIade edeceginiz tarihi giriniz (GG/AA/YY): "; cin >> donusTarihi;
                                        cout << endl;
                                        yazDosya << "\n" << ISBN << " "
                                            << Tc << " "
                                            << oduncTarihi << " "
                                            << donusTarihi << "\n";

                                        cout << "\Odunc kitap alma islemi basariyla tamamlandi!\n" << endl;
                                    }
                                }

                                yazDosya.close();
                                okuDosya.close();

                                //Yanlis kitap adi girdigimizde maks_kitap 0 olsa bile azaltiyordu. Bunu gidermek icin bir kosul koydum.
                                if (maks_Kitap > 0)
                                {
                                    maks_Kitap--;
                                    int maks_Kitap1 = maks_Kitap;

                                    //okuyucu her kitap odunc aldıgında alabilecegi kitap sayisini 1 azaltip tekrar dosyaya yazdirilir
                                    dosyaYaz << "\n" << Tc << " " <<
                                        ad << " " <<
                                        soyad << " " <<
                                        uyeNO << " " <<
                                        telNO << " " <<
                                        dogumTarihi << " " <<
                                        gorev << " " <<
                                        maks_Kitap1 << "\n ";
                                }
                                else
                                { 
                                    dosyaYaz << "\n" << Tc << " " <<
                                        ad << " " <<
                                        soyad << " " <<
                                        uyeNO << " " <<
                                        telNO << " " <<
                                        dogumTarihi << " " <<
                                        gorev << " " <<
                                        maks_Kitap << "\n ";
                                }
                                sonuc = 1;
                            }
                            else if (!(maks_Kitap > 0))// Eger okuyucunun alabilecegi kitap sayisi 0 dan kucukse bu donguye giriyor
                            {
                                cout << "\nUzgunuz... Daha fazla kitap alamazsiniz.\n" << endl;

                                dosyaYaz << "\n" << Tc << " " <<
                                    ad << " " <<
                                    soyad << " " <<
                                    uyeNO << " " <<
                                    telNO << " " <<
                                    dogumTarihi << " " <<
                                    gorev << " " <<
                                    "0" << "\n ";
                                sonuc = 1;
                            }
                        }
                        else
                            //Duzenlenmeyen kisilerin bilgileri dosyaya yazdirilir
                            dosyaYaz << "\n" << Tc << " "
                            << ad << " " << soyad << " "
                            << uyeNO << " " << telNO << " "
                            << dogumTarihi << " "
                            << gorev << " " << maks_Kitap << "\n";
                    }
                    dosyaOku.close();
                    dosyaYaz.close();

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısmayacaktır.   
                    if (sonuc == 0)
                    {
                        cout << "\nBoyle bir kullanici kaydi bulunmamaktadir!" << endl;
                        remove("gecici.tmp"); //okuyucu bulunmazsa dosya silinir
                    }

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısacaktır.   
                    if (sonuc == 1)
                    {
                        remove("okuyucu.txt");                //okuyucu.txt dosyası silinirken
                        rename("gecici.tmp", "okuyucu.txt"); //gecici.tmp dosyası okuyucu.txt dosyası olarak değiştirirlir.
                    }
                }

                //eger secim 6 ise bu donguye girer**
                else if (secim == 6)
                {
                    string  iadeKitap;
                    long long  silTC, oduncTC, oduncTC2, ISBN2;
                    cout << "\nSecilen Islem: Okuyucu kitap geri dondurme" << endl;
                    cout << "Okuyucu T.C.: "; cin >> silTC;
                    cout << endl;

                    dosyaOku.open("odunc.txt", ios::app);
                    ofstream geciciOduncYaz("geciciOdunc.tmp", ios::app);
                    ofstream geciciOkuyucuYaz("geciciOkuyucu.tmp", ios::app);
                    ifstream dosyaOku1("okuyucu.txt", ios::app);
                    ifstream dosyaOku2("kitaplar.txt", ios::app);

                    while (dosyaOku1 >> Tc >> ad >> soyad >> uyeNO >> telNO >> dogumTarihi >> gorev >> maks_Kitap) //okuyucu.txt sonuna kadar okunur
                    {
                        if (Tc == silTC) // eger okuyucu.txt deki T.C ile  silTC esitse kosula girer
                        {
                            cout << "\n========== Okuyucu Bilgileri ==========" << endl << endl;
                            cout << "Okuyucu T.C.: " << Tc << endl;
                            cout << "Okuyucu Adi: " << ad << endl;
                            cout << "Okuyucu Soyadi: " << soyad << endl;
                            cout << "Alabilecegi Kitap Sayisi: " << maks_Kitap << endl;
                            cout << endl;
                            cout << "\n========== Kitaplar ==========\n" << endl;

                            while (dosyaOku >> ISBN >> oduncTC2 >> oduncTarihi >> donusTarihi) // odunc.txt sonuna kadar okutulur
                            {
                                oduncTC = oduncTC2;
                                if (oduncTC == Tc) //eger odunc.txt deki T.C ile  okuyucu.txt deki T.C. esitse kosula girer
                                {
                                    while (dosyaOku2 >> ISBN2 >> kitapAdi >> yazarAdi >> yazarSoyadi >> konu >> tur >> sayfaSayisi)
                                    {
                                        if (ISBN == ISBN2) //eger odunc.txt deki ISBN ile  kitaplar.txt deki ISBN. esitse kosula girer
                                        {
                                            cout << "Kitap Adi: " << kitapAdi << endl;
                                            cout << "Yazar Adi: " << yazarAdi << endl;
                                            cout << "Yazar Soyadi: " << yazarSoyadi << endl;
                                            cout << endl;
                                            break;
                                        }
                                    }
                                }
                                else
                                {
                                    geciciOduncYaz << "\n" << ISBN << " "
                                        << oduncTC2 << " "
                                        << oduncTarihi << " "
                                        << donusTarihi << "\n";


                                }
                            }
                            do
                            {
                                cout << "Lutfen iade etmek istediginiz kitabin adini dogru bir sekilde giriniz: "; cin >> iadeKitap;
                                //kitap adi dogru girilene kadar devam eder
                            } while (!(kitapAdi == iadeKitap));

                            while (dosyaOku2 >> ISBN2 >> kitapAdi >> yazarAdi >> yazarSoyadi >> konu >> tur >> sayfaSayisi)
                            {
                                if (kitapAdi == iadeKitap)
                                {
                                    cout << "\nKitap geri dondurme islemi tamamlandi!\n" << endl;

                                    maks_Kitap++;
                                    int guncelMaks_Kitap = maks_Kitap;

                                    geciciOkuyucuYaz << "\n" << Tc << " "
                                        << ad << " " << soyad << " "
                                        << uyeNO << " " << telNO << " "
                                        << dogumTarihi << " "
                                        << gorev << " " << guncelMaks_Kitap << "\n";
                                }
                                else
                                {
                                    geciciOduncYaz << "\n" << ISBN << " "
                                        << oduncTC2 << " "
                                        << oduncTarihi << " "
                                        << donusTarihi << "\n";
                                }
                                sonuc = 1;
                            }

                        }

                        else
                        {
                            geciciOkuyucuYaz << "\n" << Tc << " "
                                << ad << " " << soyad << " "
                                << uyeNO << " " << telNO << " "
                                << dogumTarihi << " "
                                << gorev << " " << maks_Kitap << "\n";
                        }

                    }

                    dosyaOku.close();
                    dosyaOku1.close();
                    dosyaOku2.close();
                    geciciOduncYaz.close();
                    geciciOkuyucuYaz.close();

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısmayacaktır.   
                    if (sonuc == 0)
                    {
                        cout << "Boyle bir okuyucu bulunamadi!" << endl;

                        remove("geciciOkuyucu.tmp");
                        remove("geciciOdunc.tmp");

                    }

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısacaktır.   
                    if (sonuc == 1)
                    {
                        remove("okuyucu.txt");
                        rename("geciciOkuyucu.tmp", "okuyucu.txt");

                        remove("odunc.txt");
                        rename("geciciOdunc.tmp", "odunc.txt");
                    }
                }

                //eger secim 7 ise bu donguye girer
                else if (secim == 7)
                {
                    cout << "\nSecilen Islem: Kitap ekleme" << endl;

                    dosyaYaz.open("kitaplar.txt", ios::app);//kitaplar dosyasini okumak icin
                    do
                    {
                        cout << "\nISBN: "; cin >> ISBN;
                        long long gecici_ISBN = ISBN;

                        //girilen ISBN degiskeninin basamak sayisini bu dongu ile buluyorum
                        for (basamakSayisi = 1; gecici_ISBN > 10; basamakSayisi++)
                        {
                            gecici_ISBN = gecici_ISBN / 10;
                        }

                        if (basamakSayisi == 13) // Tc nin basamak sayisinin kontrolunu yapiyorum
                        {
                            cout << "\nKitap Adi (Bosluk birakmadan yaziniz ornegin -> Hayvan_Ciftligi): "; cin >> kitapAdi;
                            cout << "\nYazar Adi (Bosluk birakmadan yaziniz ornegin -> George_Orwell): "; cin >> yazarAdi;
                            cout << "\nYazar Soyadi: "; cin >> yazarSoyadi;
                            cout << "\nKonu (Bosluk birakmadan yaziniz): "; cin >> konu;
                            cout << "\nTur (Bosluk birakmadan yaziniz): "; cin >> tur;
                            cout << "\nSayfa Sayisi: "; cin >> sayfaSayisi;

                            //bilgiler kitaplar dosyasina aktarilir
                            dosyaYaz << "\n" << ISBN << " " <<
                                kitapAdi << " " <<
                                yazarAdi << " " <<
                                yazarSoyadi << " " <<
                                konu << " " <<
                                tur << " " <<
                                sayfaSayisi << "\n ";

                            cout << "\nKitap ekleme islemi basariyla tamamlandi!\n";
                        }
                        else //basamak sayisi 13 degilse bu blok calisir
                        {
                            cout << "\nGirilen ISBN numarasi " << basamakSayisi << " haneli olamaz!" << endl;
                        }
                        
                        cout << "\Kitap eklemeye devam etmek ister misiniz? (e/h) "; cin >> cevap;
                        //Cevaba gore islem tekrarlanacak
                    } while (cevap == 'e');

                    dosyaYaz.close();
                    cout << endl;
                    cout << "Islem tamamlandi!\n";
                }

                //eger secim 8 ise bu donguye girer
                else if (secim == 8)
                {
                    long long sil_ISBN;
                    cout << "\nSecilen Islem: Kitap silme" << endl;
                    cout << "\nSilinecek kitabin ISBN numarasini giriniz: "; cin >> sil_ISBN;

                    dosyaOku.open("kitaplar.txt", ios::app);    //kitaplar dosyasindaki bilgileri okumak icin
                    dosyaYaz.open("gecici.tmp", ios::app);     //gecici dosya acilir

                    while (dosyaOku >> ISBN >> kitapAdi >> yazarAdi >> yazarSoyadi >> konu >> tur >> sayfaSayisi)//kitaplar dosyasi donguyle okunur
                    {

                        if (ISBN == sil_ISBN)   //dosyadaki ISBN ile girilen ISBN esitse kitap silinir
                        {
                            cout << "\n========== Kitap Bilgileri ==========\n" << endl << endl;//kullanıcı bilgieri yazdırılır.
                            cout << "ISBN: " << sil_ISBN << endl;
                            cout << "Kitap Adi: " << kitapAdi << endl;
                            cout << "Yazar Adi: " << yazarAdi << endl;
                            cout << "Yazar Soyadi: " << yazarSoyadi << endl;
                            cout << "Konu: " << konu << endl;
                            cout << "Tur: " << tur << endl;
                            cout << "Sayfa Sayisi: " << sayfaSayisi << endl;
                            cout << "\nKitap silme islemi basariyla tamamlandi!\n" << endl;
                            sonuc = 1;
                        }
                        else
                            //Duzenlenmeyen kitaplar kaybolmasin diye dosyaya yazdirilir
                            dosyaYaz << "\n" << ISBN << " "
                            << kitapAdi << " "
                            << yazarAdi << " "
                            << yazarSoyadi << " "
                            << konu << " "
                            << tur << " " << sayfaSayisi << "\n";
                    }

                    dosyaYaz.close();
                    dosyaOku.close();



                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısmayacaktır.   
                    if (sonuc == 0)
                    {
                        cout << "\nBoyle bir kitap kaydi bulunmamaktadir!\n" << endl;
                        remove("gecici.tmp"); //kitap bulunmazsa dosya silinir
                    }

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısacaktır.   
                    if (sonuc == 1)
                    {
                        remove("kitaplar.txt");                 //Dosya silindi
                        rename("gecici.tmp", "kitaplar.txt");  //Gecici dosyalar kayit silindikten sonra .tmp dosyasi .txt dosyasina aktarilir.
                    }

                }

                //eger secim 9 ise bu donguye girer
                else if (secim == 9)
                {
                    long long gecici_ISBN;

                    cout << "\nSecilen Islem: Kitap duzeltme" << endl;
                    cout << "\nDuzeltilecek kitabin ISBN numarasini giriniz: "; cin >> gecici_ISBN;

                    dosyaOku.open("kitaplar.txt", ios::app);   //kitaplar dosyasini okumak icin
                    dosyaYaz.open("gecici.tmp", ios::app);    //gecici dosya acilir

                    while (dosyaOku >> ISBN >> kitapAdi >> yazarAdi >> yazarSoyadi >> konu >> tur >> sayfaSayisi)   //kitaplar dosyasini okuttum
                    {

                        if (gecici_ISBN == ISBN)//dosyadaki ISBN ile girilen ISBN esitse kitap bilgileri guncellemek icin bu kosula girer
                        {
                            cout << "\n========== Kitap Bilgileri ==========\n" << endl << endl;//kitap bilgieri yazdırılır.
                            cout << "ISBN: " << ISBN << endl;
                            cout << "Kitap Adi: " << kitapAdi << endl;
                            cout << "Yazar Adi: " << yazarAdi << endl;
                            cout << "Yazar Soyadi: " << yazarSoyadi << endl;
                            cout << "Konu: " << konu << endl;
                            cout << "Tur: " << tur << endl;
                            cout << "Sayfa Sayisi: " << sayfaSayisi << endl << endl;

                            cout << "Kitap bilgilerini yenileyiniz.\n" << endl;
                            cout << "\nISBN: " << gecici_ISBN;
                            cout << "\nKitap Adi (Bosluk birakmadan yaziniz ornegin -> Hayvan_Ciftligi): "; cin >> kitapAdi;
                            cout << "\nYazar Adi (Bosluk birakmadan yaziniz ornegin -> George_Orwell): "; cin >> yazarAdi;
                            cout << "\nYazar Soyadi: "; cin >> yazarSoyadi;
                            cout << "\nKonu (Bosluk birakmadan yaziniz): "; cin >> konu;
                            cout << "\nTur (Bosluk birakmadan yaziniz): "; cin >> tur;
                            cout << "\nSayfa Sayisi: "; cin >> sayfaSayisi;

                            cout << "\nKitap bilgileri basarıyla guncellendi!\n" << endl;

                            //Yenilenen bilgiler tekrardan dosyaya yazilir
                            dosyaYaz << "\n" << gecici_ISBN << " " <<
                                kitapAdi << " " <<
                                yazarAdi << " " <<
                                yazarSoyadi << " " <<
                                konu << " " <<
                                tur << " " <<
                                sayfaSayisi << "\n ";
                            sonuc = 1;

                        }
                        else
                            //Duzenlenmeyen bilgiler kaybolmasın diye dosyaya yazilir
                            dosyaYaz << "\n"
                            << ISBN << " " << kitapAdi << " "
                            << yazarAdi << " " << yazarSoyadi << " "
                            << konu << " " << tur << " "
                            << sayfaSayisi << "\n";
                    }

                    dosyaYaz.close();
                    dosyaOku.close();

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısmayacaktır.   
                    if (sonuc == 0)
                    {
                        cout << "\nBoyle bir kitap kaydi bulunmamaktadir!\n" << endl;
                        remove("gecici.tmp"); // kitap bulunmazsa dosya silinir
                    }

                    //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısacaktır.   
                    if (sonuc == 1)
                    {
                        remove("kitaplar.txt");               //Dosya silindi
                        rename("gecici.tmp", "kitaplar.txt");// .tmp dosyasi .txt dosyasina aktarilir
                    }
                }

                //eger  0 < secim < 10  araliginda degil ise bu donguye girer
                else
                    cout << "\nGecersiz tuslama yaptiniz!" << endl;

                cout << "Ana menuye donmek ister misiniz? (e/h)"; cin >> cevap;
                system("cls");

                //baska islem yapmak isterse komut ekranini kapatmadan hizli bir sekilde gecsin diye do-while dongusu yazdim
            } while (cevap == 'e');

            cout << "Program sonlandirildi.\n" << endl;

           //Yukarda do-while dongusu bitince system("cls") komutu ile ekrani daha temiz gostermek adina temizledim.
          //Program sonunda sadece cikis saati gozukmesin diye sisteme girilen saati tekrar yazdirdim
            cout << "Giris Saati: " << Giris_Saati << endl;

            sonuc = 1;
        }
    }

    if (sonuc == 0)
    {
        //sonuc degiskeninin baslangıc degeri 0 dır. Eger yukaridaki islemler gerceklesirse sonuc=1 olarak guncellenecektir. Dolayısıyla bu kosul calısmayacaktır.   
        cout << "Kullanici adiniz veya sifreniz hatali!\n" << endl;
    }

    kullaniciOku.close();

    // cikis saatini yazmak icin
    auto finish = chrono::system_clock::now();
    auto cikis = chrono::system_clock::to_time_t(finish);
    char Cikis_Saati[30];
    ctime_s(Cikis_Saati, sizeof(Cikis_Saati), &cikis);
    cout << "\nCikis Saati: " << Cikis_Saati << endl;

    system("pause");
    return 0;

}
