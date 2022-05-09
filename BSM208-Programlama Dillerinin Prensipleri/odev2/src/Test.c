/**
 *
 * @authors Yunus Emre AKINCI
 * @since 06.05.2022
 * <p>
 *  Olusturulan yapilari cagirmak icin main fonksiyonunu burada olusturdum 
 * </p>
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include "Dosya.h"
#include "Oyun.h"

int main()
{
    Dosya dosya = new_Dosya("./doc/Kisiler.txt", "./doc/Sayilar.txt");
    Oyun oyun = new_Oyun(dosya);
    oyun->oyna(oyun);
    dosya->delete_Dosya(dosya);
    oyun->delete_Oyun(oyun);

    return 0;
}