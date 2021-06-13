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
    interface IMeyve
    {     
        //Method ve Nesneler tanimlandi
        double Agirlik();
        double Verim();
        double VitA(double vitDeger);
        double VitB(double vitDeger);
        Image MeyveResim { get; set; }
        Random Rnd { get; set; }
    }
}
