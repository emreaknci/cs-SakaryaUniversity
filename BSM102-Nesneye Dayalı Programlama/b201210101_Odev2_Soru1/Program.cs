                        /****************************************************************************
                         **				 	           SAKARYA ÜNİVERSİTESİ                         **		
                          **				  BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ              **	
                           **				       BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ                     **	
                            **				      NESNEYE DAYALI PROGRAMLAMA DERSİ                     **	
                             **				 	       2020-2021 BAHAR DÖNEMİ                           **	
                             **	                                                                        **	
                            **				        ÖDEV NUMARASI: 2                                   **	
                           **				        ÖĞRENCİ ADI: Yunus Emre Akıncı                    **	
                          **				        ÖĞRENCİ NUMARASI: b201210101                     **	
                         **                         DERSİN ALINDIĞI GRUP: 1B                        **     
                        ****************************************************************************/

using System;

namespace b201210101_Odev2_Soru1
{
    class Program
    {
        static void Main(string[] args)
        {
            char sec;
            //Test sinifi olusturulacak'dan kast edilen seyi anlamadigim icin menu seklinde yapmak istedim.
            do
            {
                Console.Clear();// Ekrani her defasinda temizledim
                BenimString benimString = new BenimString();
                string str1;
                Console.WriteLine(" -------MENU--------\n");
                Console.WriteLine(" 1- Eleman Sayisi");
                Console.WriteLine(" 2- Birlestir");
                Console.WriteLine(" 3- Araya Gir");
                Console.WriteLine(" 4- Deger Al");
                Console.WriteLine(" 5- Diziyi Ayir");
                Console.WriteLine(" 6- Char Diziye Donustur");
                Console.WriteLine(" 7- Deger Indis");
                Console.WriteLine(" 8- Sirala (A-Z)");
                Console.WriteLine(" 9- Sirala (Z-A)");
                Console.WriteLine("10- Ters Cevir");
                Console.Write("\nSecim Yapiniz...:");
                int secim = Convert.ToInt32(Console.ReadLine());

                //Girilen secim degerine gore islemler gerceklesir
                if (secim == 1)
                {
                    Console.WriteLine("\nString giriniz...");
                    str1 = Console.ReadLine();
                    Console.WriteLine("Eleman Sayisi: " + benimString.ElemanSayisi(str1));
                }

                else if (secim == 2)
                    benimString.Birlestir();
                
                else if (secim == 3)
                    benimString.ArayaGir();
                
                else if (secim == 4)
                    benimString.DegerAl();
                
                else if (secim == 5)
                    benimString.DiziyiAyir();
                
                else if (secim == 6)
                    benimString.CharDiziyeDonustur();

                else if (secim == 7)
                    benimString.DegerIndis();
                
                else if (secim == 8)                
                    benimString.SiralaAZ();
                
                else if (secim == 9)
                    benimString.SiralaZA();
                
                else if (secim == 10)
                    benimString.TersCevir();
                
                //Kullanici basa donmek isterse diye secenek eklenmistir.
                Console.WriteLine("\nBasa donmek ister misiniz? (E/H)");
                sec = Convert.ToChar(Console.ReadLine().ToLower());
            } while (sec=='e');//secenek e ise dongu devam eder
            
            Console.WriteLine("\nIyi gunler dilerim.\n-Yunus Emre Akinci");
            Console.ReadKey();
        }
      
    }

}
