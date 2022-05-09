/**
 *
 * @authors Yunus Emre AKINCI
 * @since 06.05.2022
 * <p>
 *  Dosya yapisinin govdesi olusturuldu
 * </p>
 */

#include "Dosya.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

Dosya new_Dosya(char *dosyaKisi, char *dosyaSayi)
{
    // bellekten yer tahsis ediliyor

    Dosya this;
    this = (Dosya)malloc(sizeof(struct DOSYA));
    this->sayilarDosya = dosyaSayi;
    this->kisilerDosya = dosyaKisi;
    this->kisileriDondur = &kisileriDondur;
    this->sayilariDondur = &sayilariDondur;
    this->uzunlukBul = &uzunlukBul;
    this->delete_Dosya = &delete_Dosya;

    return this;
}

Kisi *kisileriDondur(const Dosya this)
{
    // dosyadaki kisileri dizide tutar
    FILE *kisiTXT = fopen(this->kisilerDosya, "r"); // dosya okuma modu aktif ediliyor
    char satir[250];

    int satirSayisi = this->uzunlukBul(this->kisilerDosya);
    Kisi *kisiler = (Kisi *)malloc(satirSayisi * sizeof(struct KISI));
    char *isim;
    Kisi ekle = NULL;
    double para;
    float oran;
    int sansliSayi;
    if (kisiTXT != NULL)
    {
        satirSayisi = 0;
        while (fgets(satir, sizeof(satir), kisiTXT)) // dosya satir satir okunuyor
        {
            char *parca;
            parca = strtok(satir, "#"); // satirin 0. indisinden # in indisine kadar alacak
            int sayac = 0;              // # işaretinin sayisini tutacak degisken
            isim = (char *)malloc(50);  // isim için bellekten yer tahsis ediliyor
            para = 0;
            oran = 0;
            sansliSayi = 0;
            while (parca != NULL)
            {
                // satir parcalara ayriliyor
                if (sayac == 0)
                {
                    strcpy(isim, parca);
                }
                else if (sayac == 1)
                {
                    para = atof(parca);
                }
                else if (sayac == 2)
                {
                    oran = atof(parca);
                }
                else if (sayac == 3)
                {
                    sansliSayi = atoi(parca);
                }

                parca = strtok(NULL, "#");
                sayac++;
            }
            ekle = new_Kisi(isim, para, oran, sansliSayi);
            kisiler[satirSayisi] = ekle;
            ekle = NULL;
            satirSayisi++;
        }
        fclose(kisiTXT);
    }
    else
    {
        printf("\"%s\" yolunda \"Kisiler.txt\" dosyasi bulunamadi!\n\n", this->kisilerDosya);
    }
    return kisiler;
}

int *sayilariDondur(const Dosya this)
{
    // dosyadaki sayilari dizide tutar

    FILE *sayiTXT = fopen(this->sayilarDosya, "r"); // dosya okuma modu aktif ediliyor
    char satir[250];
    int satirSayisi = this->uzunlukBul(this->sayilarDosya);
    int *sayilar = NULL;
    if (sayiTXT != NULL)
    {
        sayilar = (int *)malloc(satirSayisi * sizeof(int));
        satirSayisi = 0;
        while (fgets(satir, sizeof(satir), sayiTXT))
        {
            sayilar[satirSayisi] = atoi(satir);
            satirSayisi++;
        }
        fclose(sayiTXT);
    }
    else
    {
        printf("\"%s\" yolunda \"Sayilar.txt\" dosyasi bulunamadi!", this->sayilarDosya);
    }

    return sayilar;
}

int uzunlukBul(char *dosyaAdi)
{
    // dosyanin kac satir oldugunu hesaplar

    FILE *dosya = fopen(dosyaAdi, "r"); // dosya okuma modu aktif ediliyor
    int satirSayisi = 0;
    char satir[250];

    while (fgets(satir, sizeof(satir), dosya))
        satirSayisi++;
    fclose(dosya);

    return satirSayisi;
}

void delete_Dosya(const Dosya this)
{
    // bellekteki alanlar serbest birakiliyor

    if (this == NULL)
        return;

    free(this);
    free(this->kisilerDosya);
    free(this->sayilarDosya);
}