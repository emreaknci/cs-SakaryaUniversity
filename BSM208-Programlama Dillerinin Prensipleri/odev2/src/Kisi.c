/**
 *
 * @authors Yunus Emre AKINCI
 * @since 06.05.2022
 * <p>
 *  Kisi yapisinin govdesi olusturuldu
 * </p>
 */

#include "Kisi.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

Kisi new_Kisi(char *isim, double para, float oran, int sansliSayi)
{
    //bellekten yer tahsis ediliyor
    Kisi this;
    this = (Kisi)malloc(sizeof(struct KISI));
    this->isim = isim;
    this->para = para;
    this->oran = oran;
    this->sansliSayi = sansliSayi;
    this->delete_Kisi = &delete_Kisi;

    return this;
}

void delete_Kisi(Kisi this)
{ 
    //bellekteki alanlar serbest birakiliyor
    if (this == NULL)
        return;
    free(this);
    free(this->isim); 
}