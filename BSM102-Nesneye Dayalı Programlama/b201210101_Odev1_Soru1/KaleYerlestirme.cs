                                /****************************************************************************
                                 **				 	        SAKARYA ÜNİVERSİTESİ                            **	
                                  **				  BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ              **	
                                   **				   BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ                         **
                                    **				  NESNEYE DAYALI PROGRAMLAMA DERSİ                         **
                                     **				 	   2020-2021 BAHAR DÖNEMİ                               **
                                     **	                                                                        **
                                    **				        ÖDEV NUMARASI: 1                                   **
                                   **				        ÖĞRENCİ ADI: Yunus Emre Akıncı                    **
                                  **				        ÖĞRENCİ NUMARASI: b201210101                     **	
                                 **                         DERSİN ALINDIĞI GRUP: 1B                        **    
                                ****************************************************************************/
using System;
using System.Collections.Generic;
using System.Text;

namespace b201210101_Odev1_Soru1
{
    //rndSayilar[] dizisini kullanabilmek icin RndSayi class'indan kalitim aldim.
    class KaleYerlestirme: RndSayi
    {
        public void KaleCiz(int x,int y)//Program.cs de cagirmak uzere method olusturdum
        {
            RandomSayi();
            for (int i = 0; i < 8; i++) //Ekrana 8 kere kale yerlestirmek icin dongu kullandım.
            {
                Console.ForegroundColor = ConsoleColor.Green; //Yazi rengini yesil yapmak istedim 

                //Kalelerın rastgele dagılmasını saglamak ve birbirlerini yememeleri icin koordinatlarini bu şekilde girdim.
                Console.SetCursorPosition(x + rndSayilar[i], y + rndSayilar[7 - i]);
                Console.Write("K");

                Console.ResetColor();//Yazi rengini default yapmak icin
            }
        }
    }
}
