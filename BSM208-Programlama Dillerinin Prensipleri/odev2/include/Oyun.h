/**
 *
 * @authors Yunus Emre AKINCI
 * @since 06.05.2022
 * <p>
 *  Oyun yapisinin basligi olusturuldu
 * </p>
 */

#ifndef Oyun_h
#define Oyun_h
#include <stdio.h>
#include "Kisi.h"
#include "Dosya.h"
struct OYUN
{
    double masaParasi;
    Kisi *kisiler;
    int *sayilar;
    void (*oyna)(struct OYUN *);
    void (*delete_Oyun)(struct OYUN *);
    Dosya dosya;
};

typedef struct OYUN *Oyun;
Oyun new_Oyun(Dosya);
void oyna(const Oyun);
void delete_Oyun(const Oyun);

#endif // !Oyun_h