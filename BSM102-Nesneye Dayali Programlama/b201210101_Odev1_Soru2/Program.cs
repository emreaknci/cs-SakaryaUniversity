                            /****************************************************************************
                             **				 	       SAKARYA ÜNİVERSİTESİ                             **		
                              **				  BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ              **	
                               **				        BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ                    **	
                                **				       NESNEYE DAYALI PROGRAMLAMA DERSİ                    **	
                                 **				 	   2020-2021 BAHAR DÖNEMİ                               **	
                                 **	                                                                        **	
                                **				        ÖDEV NUMARASI: 1                                   **	
                               **				        ÖĞRENCİ ADI: Yunus Emre Akıncı                    **	
                              **				        ÖĞRENCİ NUMARASI: b201210101                     **	
                             **                        DERSİN ALINDIĞI GRUP: 1B                         **     
                            ****************************************************************************/
using System;

namespace b201210101_Ö1_S1
{
    class Program
    {
        static void Main(string[] args)
        {
            double secim;
            string cevap;
            Secimler sec = new Secimler();
            do
            {
                Console.Clear();
                Console.WriteLine("                 ----------MENU----------");
                Console.WriteLine("1-)String bir değişkende, substring() kullanmadan string değer ara");
                Console.WriteLine("2-)String bir değişkende, substring() kullanarak string değer ara");
                Console.WriteLine("3-)Alfabenin karakterlerini bir string de ara. Kaç adet geçtiğini bul ve çiz.");

                Console.Write("Seçim Yapınız... ");
                secim = Convert.ToDouble(Console.ReadLine());

                if (secim == 1)
                    sec.secim1();
                else if (secim == 2)
                    sec.secim2();
                else if (secim == 3)
                    sec.secim3();
                else
                {
                    Console.BackgroundColor = ConsoleColor.Red;
                    Console.ForegroundColor = ConsoleColor.Black;
                    Console.WriteLine("\n                                                             \n" +
                                      "  Lütfen tekrar deneyin ve geçerli bir değer aralığı girin!  " +
                                      "\n                                                             \n");
                    Console.ResetColor();
                }
                Console.WriteLine("Başa dönmek ister misiniz? (E/H)");
                cevap = Console.ReadLine().ToLower();

            } while (cevap == "e" && secim != 1 && secim != 2 && secim != 3);

            Console.ReadKey();
        }
    }
}
