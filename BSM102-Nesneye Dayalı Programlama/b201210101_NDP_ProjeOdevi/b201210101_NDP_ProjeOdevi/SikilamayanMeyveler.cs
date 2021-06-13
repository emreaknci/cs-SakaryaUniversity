                                    /****************************************************************************
                                     **				 	           SAKARYA ÜNİVERSİTESİ                         **		
                                      **				  BİLGİSAYAR VE BİLİŞİM BİLİMLERİ FAKÜLTESİ              **	
                                       **				       BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ                     **	
                                        **				      NESNEYE DAYALI PROGRAMLAMA DERSİ                     **	
                                         **				 	       2020-2021 BAHAR DÖNEMİ                           **	
                                         **	                                                                        **	
                                        **				        ÖDEV NUMARASI: PROJE                               **	
                                       **				        ÖĞRENCİ ADI: Yunus Emre Akıncı                    **	
                                      **				        ÖĞRENCİ NUMARASI: b201210101                     **	
                                     **                         DERSİN ALINDIĞI GRUP: 1B                        **     
                                    ****************************************************************************/

using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace b201210101_NDP_ProjeOdevi
{
    abstract class SikilamayanMeyveler : IMeyve
    {
        public Random Rnd { get; set; }
        public double Agirlik()
        {
            
            double agirlik;
            //Her defa farklı degerler gelmesi icin Rnd'yi her defasında referansını yeniledim.
            Rnd = new Random();

            //agirlik degeri 70-120 arası rastgele bir sayiya atandi
            agirlik = Rnd.Next(70, 120);
            return agirlik;
        }
        public double Verim()
        {
            double verim;
            //Her defa farklı degerler gelmesi icin Rnd'yi her defasında referansını yeniledim.
            Rnd = new Random();

            //verim degeri 80-95 arası rastgele bir sayiya atandi
            verim = Rnd.Next(80, 95);
            return verim;
        }
        public double VitA(double VitDeger)
        {
            //Dokumanda 100 g içindeki vitamin degeri verildiği icin 
            //Agirlik() methodundan gelen agirliga gore VitA() degeri hesaplandi
            return Agirlik() * VitDeger / 100;
        }
        public double VitB(double VitDeger)
        {
            //Dokumanda 100 g içindeki vitamin degeri verildiği icin 
            //Agirlik() methodundan gelen agirliga gore VitB() degeri hesaplandi
            return Agirlik() * VitDeger / 100;
        }
        public Image MeyveResim { get; set; }
    }


    class Elma : SikilamayanMeyveler
    {
        public Elma(Image elma)
        {
            //Base siniftaki MeyveResim nesnesine parametredeki nesneyi atadim
            MeyveResim = elma;
        }
    }
    class Armut : SikilamayanMeyveler
    {
        public Armut(Image armut)
        {
            //Base siniftaki MeyveResim nesnesine parametredeki nesneyi atadim
            MeyveResim = armut;
        }
    }
    class Cilek : SikilamayanMeyveler
    {
        public Cilek(Image cilek)
        {
            //Base siniftaki MeyveResim nesnesine parametredeki nesneyi atadim
            MeyveResim = cilek;
        }
    }
}
