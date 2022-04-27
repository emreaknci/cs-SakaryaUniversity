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
using System.Linq;
using System.Text;

namespace b201210101_Odev1_Soru1
{
    class RndSayi
    {           
        public int[] rndSayilar = new int[8]; // Asagida olusan rastgele sayilari dizide tutmak icin 
        int baslangıc = 0;
        public void RandomSayi() //Program.cs de cagirmak uzere method olusturdum
        {
            Random rastgele = new Random(); //Random class'ina referans verdim
            while (baslangıc < 8)
            {
                int sayi = rastgele.Next(0, 9); //sayi degerini 0-9 arasında rastgele bir degere atadim
                
                //Burada her seferinde *farkli rastgele* sayi uretmek icin kosul kullandim
                //Bu sayede hicbir zaman kaleler birbirini yiyemeyecek
                if (rndSayilar.Contains(sayi))
                    continue;
                rndSayilar[baslangıc] = sayi; // diziye atama yaptim
                baslangıc++;
            }
          
        }
    }
}
