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
using System.Linq;

namespace b201210101_Odev1_Soru1
{
    class Program
    {
        static void Main(string[] args)
        {
            int x = 50, y = 10;  //x ve y degerlerini degistirerek istediginiz yerde ekrana bastirabilirsiniz
           
            //Olusturdugum siniflari cagirdim
            KaleYerlestirme kale = new KaleYerlestirme();
            RndSayi random = new RndSayi();
            SatrancTahtasi satrancTahtasi = new SatrancTahtasi();
           
            //Siniflara ait methodlari cagirdim
            satrancTahtasi.Cerceve(x,y);
            random.RandomSayi();
            kale.KaleCiz(x,y);
            
            Console.ReadKey();
        }
    }
}
