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
    abstract class SikilabilenMeyveler : IMeyve
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

            //verim degeri 30-70 arası rastgele bir sayiya atandi
            verim = Rnd.Next(30, 70);
            return verim;
        }
        public double VitA(double vitDeger)
        {
            //Dokumanda 100 g içindeki vitamin degeri verildiği icin 
            //Agirlik() methodundan gelen agirliga gore VitA() degeri hesaplandi
            return Agirlik() * vitDeger / 100;
        }
        public double VitB(double vitDeger)
        {
            //Dokumanda 100 g içindeki vitamin degeri verildiği icin 
            //Agirlik() methodundan gelen agirliga gore VitB() degeri hesaplandi
            return Agirlik() * vitDeger / 100;
        }
        public Image MeyveResim { get; set; }
    }

    class Portakal : SikilabilenMeyveler
    {
        public Portakal(Image portakal)
        {
            //Base siniftaki MeyveResim nesnesine parametredeki nesneyi atadim
            MeyveResim = portakal;
        }
    }
    class Mandalina : SikilabilenMeyveler
    {
        public Mandalina(Image mandalina)
        {            
            //Base siniftaki MeyveResim nesnesine parametredeki nesneyi atadim
            MeyveResim = mandalina;
        }
    }
    class Greyfurt : SikilabilenMeyveler
    {
        public Greyfurt(Image greyfurt)
        {
            //Base siniftaki MeyveResim nesnesine parametredeki nesneyi atadim
            MeyveResim = greyfurt;
        }
    }
}
