/**
 *
 * @authors Yunus Emre AKINCI
 * @since 06.05.2022
 * <p>
 *  Kisi yapisinin basligi olusturuldu
 * </p>
 */

#ifndef Kisi_h
#define Kisi_h
#include <stdio.h>
struct KISI
{
    char *isim;
    double para;
    float oran;
    int sansliSayi;

    void (*delete_Kisi)(struct KISI *);
};
typedef struct KISI *Kisi;
Kisi new_Kisi(char *, double, float, int);
void delete_Kisi(Kisi);

#endif // !Kisi_h