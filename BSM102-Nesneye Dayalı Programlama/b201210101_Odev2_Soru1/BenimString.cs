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
using System.Collections.Generic;
using System.Text;

namespace b201210101_Odev2_Soru1
{
    class BenimString
    {
        //Asagidaki fonksiyonlarda kullandigim stringleri tanimladim
        private string str1 { get; set; }
        private string str2 { get; set; }

        public int ElemanSayisi(string str1)
        {
            int sayac = 0;
            //str1 dizisinin elemanlarini dongu ile gezdim. Her elemanda syaci 1 arttirdim.
            foreach (var index in str1)
                sayac++;
            return sayac;
        }
        public void Birlestir()
        {
            //Basit bir sekilde iki matrisi birbirine ekledim
            Console.WriteLine("\nBirinci stringi giriniz..");
            str1 = Console.ReadLine();

            Console.WriteLine("\nIkinci stringi giriniz..");
            str2 = Console.ReadLine();

            Console.Write("\nBirlestirilmis hali...: " + (str1 + str2));
        }
        public void ArayaGir()
        {
            Console.WriteLine("\nStringi giriniz..");
            str1 = Console.ReadLine();

            Console.WriteLine("\nStringin arasina ne yazmak istiyorsunuz?");
            str2 = Console.ReadLine();

            Console.WriteLine("\nKacinci indisten itibaren {0}'yi eklemek istersiniz?", str2);
            int indis = Convert.ToInt32(Console.ReadLine());

            //Kullanicinin girdigi indis sayisina kadar olan str1 elemanlari yazdirdim.
            for (int i = 0; i < indis; i++)
                Console.Write(str1[i]);

            Console.Write(str2 + " ");//str2'yi ekledim

            //Kullanicinin girdigi indis sayisindan sonra gelen str1 elemanlari yazdirdim.
            for (int i = indis; i < ElemanSayisi(str1); i++)
                Console.Write(str1[i]);

        }
        public void DegerAl()
        {
            Console.WriteLine("\nStringi giriniz...");
            str1 = Console.ReadLine();

            Console.WriteLine("\nBaslangıc indisini giriniz...:");
            int baslangıc = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("\nBitis indisini giriniz...:");
            int bitis = Convert.ToInt32(Console.ReadLine());

            //Kullanicidan alinan araliga gore string'in elemanlarini yazdirdim
            for (int i = 0; i < bitis - baslangıc; i++)
                Console.Write(str1[baslangıc + i]);
        }
        public void DiziyiAyir()
        {
            Console.WriteLine("\nStringi giriniz..");
            str1 = Console.ReadLine();
            Console.WriteLine("\nDiziyi ayirmak istediginiz karakteri giriniz...\n" +
                "(Lutfen tek karakter giriniz!)");

            char ayir = Convert.ToChar(Console.ReadLine());

            //str1 dizisinde "ayir" karakterine rastlanirsa alt satira gecilir, rastlanmazsa girilen karaktere kadar olan str1 ekrana yazilir
            for (int i = 0; i < ElemanSayisi(str1); i++)
            {
                if (str1[i] == ayir)
                    Console.WriteLine();
                else
                    Console.Write(str1[i]);
            }
        }
        public void CharDiziyeDonustur()
        {
            Console.WriteLine("\nStringi giriniz..");
            str1 = Console.ReadLine();

            //Odevde ne denmek istedigini tam anlamidigim icin aklima ilk geleni yaptim.
            //str1'in boyutunda char dizisi olusturdum ve indis indis str1'in elemanlarini bu diziye atadim.
            char[] dizi = new char[ElemanSayisi(str1)];
            for (int i = 0; i < ElemanSayisi(str1); i++)
                dizi[i] = str1[i];

            foreach (var a in dizi)
                Console.Write(a);
        }
        public void DegerIndis()
        {
            Console.WriteLine("\nStringi giriniz...(Turkce karakter kullanmayiniz!)");
            str1 = Console.ReadLine();

            Console.WriteLine("\nAranan ifadeyi giriniz...(Turkce karakter kullanmayiniz!)");
            str2 = Console.ReadLine();

            //Bu kismi hazir fonksiyon olmadan kullanamaycagimi dusundugum icin bir onceki odevde kullandigim kelime arama fonksiyonunu burada tekrardan kullandim.
            int indis = str1.IndexOf(str2);
            while (indis != -1)
            {
                Console.WriteLine("\nGirilen kelimenin bulunduğu indisler:" + indis);
                indis = str1.IndexOf(str2, indis + 1);
            }
        }
        public void SiralaAZ()
        {
            Console.WriteLine("Stringi giriniz...(Turkce karakter kullanmayiniz!)");
            str1 = Console.ReadLine();

            //str1 boyutunda char dizi olusturup str1'in elemanlarini bu diziye aktardim.
            char[] dizi = new char[ElemanSayisi(str1)];
            for (int i = 0; i < ElemanSayisi(str1); i++)
                dizi[i] = str1[i];

            //str1 boyutunda integer bir dizi olusturdum.
            //char dizideki elemanlarin ascii tablosundaki degerlerini integer dizime atadim.
            int[] asciDeger = new int[ElemanSayisi(str1)];
            for (int i = 0; i < ElemanSayisi(str1); i++)
                asciDeger[i] = Convert.ToInt32(dizi[i]);

            //asciDeger dizisindeki elemanlari kucukten buyuge siraladim
            for (int i = 0; i < ElemanSayisi(str1) - 1; i++)
            {
                for (int j = 0; j < ElemanSayisi(str1) - 1; j++)
                {
                    if (asciDeger[j] > asciDeger[j + 1])
                    {
                        int temp = asciDeger[j];
                        asciDeger[j] = asciDeger[j + 1];
                        asciDeger[j + 1] = temp;
                    }
                }
            }

            //Siralanmis dizideki elemanlari ascii tablosunda karsilik gelen karakterlere donusturup char dizime atadim.
            for (int i = 0; i < ElemanSayisi(str1); i++)
                dizi[i] = Convert.ToChar(asciDeger[i]);

            //char dizimi ekrana yazdirdim
            for (int i = 0; i < ElemanSayisi(str1); i++)
                Console.Write(dizi[i]);

        }
        public void SiralaZA()
        {
            Console.WriteLine("Stringi giriniz...(Turkce karakter kullanmayiniz!)");
            str1 = Console.ReadLine();
            
            //str1 boyutunda char dizi olusturup str1'in elemanlarini bu diziye aktardim.
            char[] dizi = new char[ElemanSayisi(str1)];
            for (int i = 0; i < ElemanSayisi(str1); i++)
                dizi[i] = str1[i];

            //str1 boyutunda integer bir dizi olusturdum.
            //char dizideki elemanlarin ascii tablosundaki degerlerini integer dizime atadim.
            int[] asciDeger = new int[ElemanSayisi(str1)];
            for (int i = 0; i < ElemanSayisi(str1); i++)
                asciDeger[i] = Convert.ToInt32(dizi[i]);

            //asciDeger dizisindeki elemanlari buyugten kucuge siraladim
            for (int i = 0; i < ElemanSayisi(str1) - 1; i++)
            {
                for (int j = 0; j < ElemanSayisi(str1) - 1; j++)
                {
                    if (asciDeger[j] < asciDeger[j + 1])
                    {
                        int temp = asciDeger[j + 1];
                        asciDeger[j + 1] = asciDeger[j];
                        asciDeger[j] = temp;
                    }
                }
            }

            //Siralanmis dizideki elemanlari ascii tablosunda karsilik gelen karakterlere donusturup char dizime atadim.
            for (int i = 0; i < ElemanSayisi(str1); i++)
                dizi[i] = Convert.ToChar(asciDeger[i]);

            //char dizimi ekrana yazdirdim
            for (int i = 0; i < ElemanSayisi(str1); i++)
                Console.Write(dizi[i]);

        }
        public void TersCevir()
        {
            Console.WriteLine("Stringi giriniz..");
            str1 = Console.ReadLine();

            //str1'in elemanlarini son indisten baslayarak ekrana yazdirdim.
            for (int i = 0; i < ElemanSayisi(str1); i++)
                Console.Write(str1[ElemanSayisi(str1) - 1 - i]);
        }
    }
}
