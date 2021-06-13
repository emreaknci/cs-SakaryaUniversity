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
    class SatrancTahtasi
    {
        public void Cerceve(int x, int y)//Program.cs de cagirmak uzere method olusturdum
        {
            //Dongulerin 10'a kadar devam etmesinin sebebi =>
            //10x10 luk bir alanin icine 8x8 lik satranc tahtasini yerlestirmek .
            //Bu dort dongu dıs cerceveyi cizer.
            for (int i = 0; i < 10; i++) //sol taraf
            {
                Console.BackgroundColor = ConsoleColor.DarkRed;//Arka plan rengini koyu kirmizi yapmak istedim
                Console.SetCursorPosition(x, y + i);
                Console.Write(" ");
                Console.ResetColor();
            }
            for (int i = 0; i < 10; i++)//ust taraf
            {
                Console.BackgroundColor = ConsoleColor.DarkRed;//Arka plan rengini koyu kirmizi yapmak istedim
                Console.SetCursorPosition(i + x, y);
                Console.Write(" ");
                Console.ResetColor();
            }
            for (int i = 0; i < 10; i++)// sag taraf
            {
                Console.BackgroundColor = ConsoleColor.DarkRed;//Arka plan rengini koyu kirmizi yapmak istedim
                Console.SetCursorPosition(x + 9, i + y);
                Console.Write(" ");
                Console.ResetColor();
            }
            for (int i = 0; i < 10; i++) //alt taraf
            {
                Console.BackgroundColor = ConsoleColor.DarkRed;//Arka plan rengini koyu kirmizi yapmak istedim
                Console.SetCursorPosition(i + x, y + 9);
                Console.Write(" ");
                Console.ResetColor();
            }

            //Dongulerin 8'e kadar devam etmesinin sebebi =>
            //1 2 ... 8 seklinde sayilari,
            //A B .. H seklinde harfleri yazdirmak.
            //Bu dort dongu satranc tahtasinin etrafindaki sayi ve harfleri yazdirir.
            for (int i = 0; i < 8; i++) // sol taraf numaralandırma
            {
                Console.SetCursorPosition(x - 1, y + i + 1);
                Console.WriteLine(i + 1);
            }
            for (int i = 0; i < 8; i++)// ust taraf harflendirme
            {                
                //alfabetik sirayi diziye atip tek tek cagirmak yerine int degeri char a donusturdum
                int sayi = 65;
                char harf = Convert.ToChar(sayi + i);

                Console.SetCursorPosition(i + x + 1, y - 1);
                Console.WriteLine(harf);

            }
            for (int i = 0; i < 8; i++) //sag taraf numaralandırma
            {
                Console.SetCursorPosition(x + 10, i + y + 1);
                Console.WriteLine(i + 1);
            }
            for (int i = 0; i < 8; i++)// alt taraf harflendirme
            {
                //alfabetik sirayi diziye atip tek tek cagirmak yerine int degeri char a donusturdum
                int sayi = 65;
                char harf = Convert.ToChar(sayi + i);

                Console.SetCursorPosition(i + 1 + x, y + 10);
                Console.WriteLine(harf);
            }
        }
    }
}
