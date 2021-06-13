                                                   /*****************************************************************************
                                                   **					          SAKARYA ÜNİVERSİTESİ                         **
                                                   **			       BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ               **
                                                   **				        BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ                     **
                                                   **				          PROGRAMLAMAYA GİRİŞİ DERSİ                       **
                                                   **                                                                          **
                                                   **                                                                          **
                                                   **				           ÖDEV NUMARASI: 2                                **
                                                   **				           ÖĞRENCİ ADI: Yunus Emre Akıncı                  **
                                                   **				           ÖĞRENCİ NUMARASI: b201210101                    **
                                                   **				           DERS GRUBU: 1. Öğretim B Grubu                  **
                                                   *****************************************************************************/
/*
Istenenler:
1.	Proje icin gerekli islemleri yapan tek bir C++ kaynak kod dosyasi

Istenenlerde rapor hazirlama olmadıgı icin hazırlamadım
*/

#include <iostream>
#include <Windows.h>//Komut satirinda istenilen koordinata gitmek icin kullandik

using namespace std;


const int yazdirmaSuresi = 20;//animasyonlu gecis yapması icin

int genislik = 0, yukseklik = 0, x = 0, y = 0, catiYuksekligi = 0, kapiGenislik = 0, kapiYukseklik = 0;
//degiskenleri 0'dan baslatmamim sebebi Classları tek tek cagirdigimizda da sekil cizdirecekleri icin orada kullanılmayan degerleri etkisiz kilmak
//Ornegin Cati sinifindaki fonksiyonda genislik degiskenini kullandım. Sadece cati cizdirirken genislikle isim olmadığı icin genislik=0 dir.

const char a = 219;//evin duvarlarini olusturmak icin kullandım

void gotoxy(int x, int y)
{
    COORD coord;
    coord.X = x;
    coord.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}

//Ev classinda degiskenlerin degerlerini almak icin bu fonksiyonu kullandım
void veriGirEv()
{
    cout << "Genislik: "; cin >> genislik;
    cout << "\nYukseklik: "; cin >> yukseklik;
    cout << "\nCati Yuksekligi: "; cin >> catiYuksekligi;
    cout << "\nKapi Genisligi: "; cin >> kapiGenislik;
    cout << "\nKapi Yuksekligi: "; cin >> kapiYukseklik;
    cout << "\nX: "; cin >> x;
    cout << "\nY: "; cin >> y;
    system("cls");
}

class Cati
{
public:

    // catiCiz() fonksiyonundaki değerleri kullanicidan almak için kullandim
    void veriGirCati()
    {
        cout << "Genislik: "; cin >> genislik;
        cout << "\nCati Yuksekligi: "; cin >> catiYuksekligi;
        cout << "\nX: "; cin >> x;
        cout << "\nY: "; cin >> y;
        system("cls");
    }

    void catiCiz()
    {
        for (int i = 0; i <= catiYuksekligi - 1; i++)// satir basi icin
        {
            gotoxy(0, y + i - 1);

            for (int j = 0; j < catiYuksekligi + x - i - 2; j++)//bosluk icin
            {
                cout << " ";
                Sleep(yazdirmaSuresi);
            }

            for (int k = 1; k <= genislik - 2 * (catiYuksekligi - 1 - i); k++)//cizmek icin
            {
                cout << "*";
                Sleep(yazdirmaSuresi);
            }
            cout << "\n";
        }
        cin.get();
    }

};

class Kat
{
public:

    // katCiz() fonksiyonundaki değerleri kullanicidan almak için kullandim
    void veriGirKat()
    {
        cout << "Genislik: "; cin >> genislik;
        cout << "\nYukseklik: "; cin >> yukseklik;
        cout << "\nX: "; cin >> x;
        cout << "\nY: "; cin >> y;
        system("cls");
    }

    void katCiz()
    {

        // Soldan saga duvar cizmek icin
        for (int i = 0; i < genislik; i++)
        {
            gotoxy(x + i - 1, y + catiYuksekligi - 1);
            cout << a;
            Sleep(yazdirmaSuresi);
        }

        // Yukaridan asagi duvar cizmek icin
        for (int i = 0; i < yukseklik; i++)
        {
            gotoxy(x + genislik - 2, y + i + catiYuksekligi - 1);
            cout << a;
            Sleep(yazdirmaSuresi);
        }

        // Sagdan sola duvar cizmek icin
        for (int i = 0; i < genislik; i++)
        {
            gotoxy(x + genislik - i - 2, y + yukseklik - 2 + catiYuksekligi);
            cout << a;
            Sleep(yazdirmaSuresi);
        }

        // Asagidan yukari duvar cizmek icin
        for (int i = 0; i < yukseklik; i++)
        {
            gotoxy(x - 1, y + yukseklik - i - 2 + catiYuksekligi);
            cout << a;
            Sleep(yazdirmaSuresi);
        }
        cin.get();
    }
};

class Kapi {
public:

    // kapiCiz() fonksiyonundaki değerleri kullanicidan almak için kullandim
    void veriGirKapi()
    {
        cout << "Kapi Genisligi: "; cin >> kapiGenislik;
        cout << "\nKapi Yuksekligi: "; cin >> kapiYukseklik;
        cout << "\nX: "; cin >> x;
        cout << "\nY: "; cin >> y;
        system("cls");
    }

    void kapiCiz()
    {
        //dongu ile kapiyi cizdirdim
        for (int i = 0; i < kapiYukseklik; i++)//satırbasi yapar
        {
            //nereden baslayacagini belirlemek icin
            gotoxy(x - 1, y - 1 + i);
            for (int j = 0; j < kapiGenislik; j++)//satıra # bastırır
            {
                cout << "#";
                Sleep(yazdirmaSuresi);
            }
            cout << endl;
        }
        cin.get();
    }
};

class Ev :public Cati, public Kat
{
public:

    void evCiz()
    {
        // ev cizdirmek icin kullanicidan olculer aldim
        veriGirEv();
        if (kapiGenislik < genislik - 3 && kapiYukseklik < yukseklik - 1)// kapi ve duvarlar arası en az 1 birim bosluk olması icin kosul koydum
        {
            /*----------CATİ----------*/
                    // Cati classındaki catiCiz() fonksiyonunu cagirdim

            catiCiz();

            /*----------KAT----------*/
            // Kat classındaki katCiz() fonksiyonunu cagirdim
            katCiz();

            /*----------KAPİ----------*/
            //kapi class 'ini hata vermesinden dolayı kullanmadım

            for (int i = 0; i < kapiYukseklik; i++)
            {
                gotoxy(x + 1, y + yukseklik - i - 2 + catiYuksekligi);
                for (int j = 0; j < kapiGenislik; j++)
                {
                    cout << "#";
                    Sleep(yazdirmaSuresi);

                }
                cout << endl;
            }
        }
        else // kapi duvarlari asarsa diye kosul koydum
        {
            cout << "Kapi evden buyuk olamaz" << endl;
        }


    }
};

int main()

{
    //Ev classini cagirdik
    Ev ev;
    ev.evCiz();


    //Cati classini cagirdik
    Cati cati;
    /* cati.veriGirCati();
    cati.catiCiz();*/


    //Katclassini cagirdik
    Kat kat;
    /* kat.veriGirKat();
    kat.katCiz();*/


    //Kapi classini cagirdik
    Kapi kapi;
    /*kapi.veriGirKapi();
    kapi.kapiCiz();*/

    cin.get();
    return 0;
}