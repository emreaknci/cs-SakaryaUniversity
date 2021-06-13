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
using System.Collections.Generic;
using System.Text;

namespace b201210101_Ö1_S1
{
    class Secimler
    {
        public void secim1()
        {
            int sayac = 0, indis;
            string metin, arananIfade;

            Console.WriteLine("\nSeçiminiz => String bir değişkende, substring() kullanmadan string değer ara");
            Console.WriteLine("\nMetini giriniz...");
            metin = Console.ReadLine().ToLower();

            Console.Write("\nAranacak ifade: ");
            arananIfade = Console.ReadLine().ToLower();

            indis = metin.IndexOf(arananIfade); //Hafta 3'ün notlarında gördüğüm IndexOf()'un kullanımına bakarak yaptım

            while (indis != -1) //IndexOf() arananIfade'yi bulamazsa değeri -1 olur. O yüzden değerin -1 olmadığı durumlarda döngü devam etmeli.
            {
                sayac++;
                Console.WriteLine("\nAranan ifadenin bulunduğu " + sayac + ". indis: " + indis);
                indis = metin.IndexOf(arananIfade, indis + 1);
            }
        }
        public void secim2()
        {
            int sayac = 0;
            string metin, arananIfade, aranan;

            Console.WriteLine("\nSeçiminiz => String bir değişkende, substring() kullanarak string değer ara");
            Console.WriteLine("\nMetini giriniz...");
            metin = Console.ReadLine().ToLower();

            Console.Write("\nAranacak ifade: ");
            arananIfade = Console.ReadLine().ToLower();

            for (int i = 0; i < metin.Length; i++)//Aranan ifadenin cümlede kaçıncı indiste başladığnı bulmak için döngü yazdım  
            {
                if (metin.Length - i >= arananIfade.Length)
                {
                    aranan = metin.Substring(i, arananIfade.Length); //Substring() ile aranan ifadenin varlığını kontrol ettim
                    {
                        if (aranan == arananIfade)
                        {
                            sayac++;
                            Console.WriteLine("\nAranan ifadenin bulunduğu " + sayac + ". indis: " + i);
                        }
                    }
                }
            }
        }
        public void secim3()
        {
            char[] alfabe = new char[32];
            int[] sayac = new int[32];
            int baslangıc = 97;
            string metin;

            //sayac[] dizisinin tüm elemanlarını 0'a eşitledim
            for (int i = 0; i < sayac.Length; i++)
                sayac[i] = 0;

            Console.WriteLine("\nSeçiminiz => Alfabenin karakterlerini bir string de ara. Kaç adet geçtiğini bul ve çiz.");
            Console.WriteLine("\nMetini giriniz...");
            metin = Console.ReadLine().ToLower();

            //32 elemanlı bir dizi oluşturdum. Bunların 26 tanesini ASCII tablosundan char'a dönüştürdüm.
            //Kalan 6 tanesine İngilizce'de olmayan 6 türk harfini ekledim.
            #region alfabe

            for (int i = 0; i < alfabe.Length - 6; i++)
                alfabe[i] = Convert.ToChar(baslangıc + i);
            alfabe[26] = 'ç';
            alfabe[27] = 'ğ';
            alfabe[28] = 'ı';
            alfabe[29] = 'ö';
            alfabe[30] = 'ş';
            alfabe[31] = 'ü';

            #endregion

            //Metindeki her bir harfi oluşturduğum alfabe[] dizisindeki harflerle karşılaştırdım.
            //Eğer karşılaştırılan harf varsa o harfin sayacını arttırdım.
            for (int i = 0; i < metin.Length; i++)
            {
                for (int j = 0; j < alfabe.Length; j++)
                {
                    if (metin[i] == alfabe[j])
                        sayac[j]++;
                }
            }

            Console.WriteLine("Harf    Harf Sayısı    Grafik");
            Console.WriteLine("----    -----------    ------");

            //Tüm harfleri, harflerin sayısını ve sayı grafiğini ekrana yazdırdım.
            for (int i = 0; i < alfabe.Length; i++)
            {
                Console.Write(i + " " + alfabe[i] + "\t" + sayac[i] + "\t\t");

                for (int j = 0; j < sayac[i]; j++)//Grafiği çizmek için döngü oluşturdum.                
                    Console.Write("*");

                Console.WriteLine("");
            }
        }
    }
}
