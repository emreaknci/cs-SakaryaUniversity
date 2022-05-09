/**
 *
 * @authors Yunus Emre AKINCI
 * @since 06.05.2022
 * <p>
 *  Oyun yapisinin govdesi olusturuldu
 * </p>
 */

#include "Oyun.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <Windows.h>

Oyun new_Oyun(const Dosya dosya)
{
    // bellekten yer tahsis ediliyor

    Oyun this;
    this = (Oyun)malloc(sizeof(struct OYUN));
    this->dosya = dosya;
    this->sayilar = this->dosya->sayilariDondur(this->dosya);
    this->kisiler = this->dosya->kisileriDondur(this->dosya);
    this->masaParasi = 0;
    this->oyna = &oyna;
    this->delete_Oyun = &delete_Oyun;

    return this;
}

void oyna(const Oyun this)
{
    Kisi enZengin = this->kisiler[0]; // enZengin default olarak dizinin ilk elemanina atandi
    double kazanilanPara = 0, kaybedilenPara = 0;
    int tur = 1;
    int sayilarCount = this->dosya->uzunlukBul(this->dosya->sayilarDosya); // sayilar dosyasinin uzunlugu hesaplandi
    int kisilerCount = this->dosya->uzunlukBul(this->dosya->kisilerDosya); // kisiler dosyasinin uzunlugu hesaplandi

    for (int i = 0; i < sayilarCount; i++)
    {
        int sayac = 0; // parasi 1000'den az olan kisilerin sayisini tutacak degisken
        for (int j = 0; j < kisilerCount; j++)
        {
            if (this->kisiler[j]->para >= 1000)
            {
                // kisi sayiyi tutturunca
                if (this->kisiler[j]->sansliSayi == this->sayilar[i])
                {
                    kazanilanPara = (this->kisiler[j]->para * this->kisiler[j]->oran) * 9;
                    this->kisiler[j]->para += kazanilanPara;
                    this->masaParasi -= kazanilanPara;
                }
                // kisi sayiyi tutturamayinca
                else if (this->kisiler[j]->sansliSayi != this->sayilar[i])
                {
                    kaybedilenPara = this->kisiler[j]->para * this->kisiler[j]->oran;
                    this->kisiler[j]->para -= kaybedilenPara;
                    this->masaParasi += kaybedilenPara;
                }
            }
            else if (this->kisiler[j]->para < 1000)
            {
                // Siradaki kisinin 1000'den azsa sayac arttirilacak
                sayac++;
            }

            if (j == kisilerCount - 1) // tur sonu
            {
                // her tur sonunda en zengin kisi hesaplaniyor
                for (int i = 0; i < kisilerCount; i++)
                {
                    if (enZengin->para < this->kisiler[i]->para)
                        enZengin = this->kisiler[i];
                }
                // ekrana bastirma
                //system("cls");
                printf("\t\t\t\t\t##########################################\n");
                printf("\t\t\t\t\t##\t\tSANSLI SAYI: %i\t\t##\n", this->sayilar[i]);
                printf("\t\t\t\t\t##########################################\n");
                printf("\t\t\t\t\t##########################################\n");
                printf("\t\t\t\t\t##\t\tTUR: %i \t\t##\n", tur);
                printf("\t\t\t\t\t##\tMASA PARASI: %.2f\t##\n", this->masaParasi);
                printf("\t\t\t\t\t##\t\t\t\t\t##\n");
                printf("\t\t\t\t\t##--------------------------------------##\n");
                printf("\t\t\t\t\t##\t\tEN ZENGIN KISI\t\t##\n");
                printf("\t\t\t\t\t##\t\t%s\t\t##\n", enZengin->isim);
                printf("\t\t\t\t\t##\tBAKIYESİ: %.2f\t\t##\n", enZengin->para);
                printf("\t\t\t\t\t##\t\t\t\t\t##\n");
                printf("\t\t\t\t\t##########################################\n");
                Sleep(100);
            }
        }
        tur++;
        if (sayac == kisilerCount)
        {
            // Dosyadaki sayilar bitmeden oyunun bitebilme ihtimali vardır.
            // Bu ihtimal tüm kisilerin parasinin 1000'den az olmasi ihtimalidir.
            // Bunun kontrolunu bu blokta saglıyorum.
            break;
        }
    }

    // oyun bittikten sonra yazilacaklar
    Sleep(2000);
    system("cls");
    printf("\t\t\t\t##########################################\n");
    printf("\t\t\t\t##\t\tTUR: %i\t\t##\n", (tur - 1));
    printf("\t\t\t\t##\tMASA PARASI: %.2f\t##\n", this->masaParasi);
    printf("\t\t\t\t##\t\t\t\t\t##\n");
    printf("\t\t\t\t##--------------------------------------##\n");
    printf("\t\t\t\t##\t\tOYUN BITTI\t\t##\n");
    printf("\t\t\t\t##\t\t\t\t\t##\n");
    printf("\t\t\t\t##\t\t\t\t\t##\n");
    printf("\t\t\t\t##\t\t\t\t\t##\n");
    printf("\t\t\t\t##########################################\n");
}

void delete_Oyun(const Oyun this)
{
    // bellekteki alanlar serbest birakiliyor
    if (this == NULL)
        return;

    free(this);
    free(this->sayilar);

    int uzunluk = this->dosya->uzunlukBul(this->dosya->kisilerDosya);
    for (int i = 0; i < uzunluk; i++)
        this->kisiler[i]->delete_Kisi(this->kisiler[i]);
    free(this->kisiler);
    this->dosya->delete_Dosya(this->dosya);
}