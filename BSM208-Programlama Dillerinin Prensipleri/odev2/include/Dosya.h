/**
 *
 * @authors Yunus Emre AKINCI
 * @since 06.05.2022
 * <p>
 *  Dosya yapisinin basligi olusturuldu
 * </p>
 */

#ifndef Dosya_h
#define Dosya_h
#include <stdio.h>
#include <stdlib.h>
#include "Kisi.h"
struct DOSYA
{
    char *kisilerDosya; //Kisiler.txt yi tutacak
    char *sayilarDosya; //Sayilar.txt yi tutacak
    Kisi *(*kisileriDondur)(struct DOSYA *);
    int *(*sayilariDondur)(struct DOSYA *);
    int (*uzunlukBul)(char *);
    void (*delete_Dosya)(struct DOSYA *);
};
typedef struct DOSYA *Dosya;
Dosya new_Dosya(char *, char *);
Kisi *kisileriDondur(const Dosya);
int *sayilariDondur(const Dosya);
int uzunlukBul(char *);
void delete_Dosya(const Dosya);
#endif // !Dosya_h