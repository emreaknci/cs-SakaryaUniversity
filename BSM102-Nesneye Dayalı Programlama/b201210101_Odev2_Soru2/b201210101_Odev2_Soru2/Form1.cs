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
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO; //dosyalama işlemleri için

namespace b201210101_Odev2_Soru2
{
    public partial class Form1 : Form
    {
        static class Islemler
        {
            //Nesneler olusturuldu
            public static TextBox[,] matris1;
            public static TextBox[,] matris2;
            public static TextBox[,] sonuc;
            public static NumericUpDown numeric;
            public static Label izToplam1 = new Label();
            public static Label izToplam2 = new Label();
            public static StreamWriter yaz;
            public static StreamReader oku;
            public static RichTextBox richTXT;

            public static void MatrisOlustur(int boyut)
            {
                
                #region Form elemanlarina referans verdim
                matris1 = new TextBox[boyut, boyut];
                matris2 = new TextBox[boyut, boyut];
                sonuc = new TextBox[boyut, boyut];
                numeric = new NumericUpDown();
                #endregion
                
                //matris1[,] olusturuldu, konum,boyut ve ilk degerler atandi
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        matris1[i, j] = new TextBox();
                        matris1[i, j].Text = "0";
                        matris1[i, j].Size = new Size(40, 20);
                        matris1[i, j].Location = new Point(150 + 45 * (j + 1), 40 * (i + 1));
                    }
                }
                //matris2[,] olusturuldu, konum,boyut ve ilk degerler atandi
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        matris2[i, j] = new TextBox();
                        matris2[i, j].Text = "0";
                        matris2[i, j].Size = new Size(40, 20);
                        matris2[i, j].Location = new Point(420 + 45 * (j + 1), 40 * (i + 1));
                    }
                }
                //sonuc[,] olusturuldu, konum,boyut ve ilk degerler atandi
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        int[,] toplam = new int[boyut, boyut];
                        //toplam[i, j] = Convert.ToInt32(matris1[i, j].Text) + Convert.ToInt32(matris2[i, j].Text);
                        sonuc[i, j] = new TextBox();
                        sonuc[i, j].Size = new Size(40, 20);
                        sonuc[i, j].Location = new Point(285 + 45 * (j + 1), 250 + 40 * (i + 1));
                        sonuc[i, j].Text = "";
                    }
                }
            }
            public static void MatrisTopla(int boyut)
            {
                double[,] toplam = new double[boyut, boyut];
                //matris1 ve matris2 nin ayni indisteki degerleri double'a donusturerek toplam dizisindeki ayni indise atadim.
                //Daha sonra toplam dizisindeki elemanlari indis indis sonuc matrisindeki textBox'lara atadim.
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {                        
                        toplam[i, j] += Convert.ToDouble(matris1[i, j].Text) + Convert.ToDouble(matris2[i, j].Text);
                        sonuc[i, j].Text = toplam[i, j].ToString();
                    }
                }
            }
            public static void MatrisCarp(int boyut)
            {
                double[,] carpim = new double[boyut, boyut];
                //matris1 ve matris2 nin ayni indisteki degerleri double'a donusturerek carpim dizisindeki ayni indise atadim.
                //Daha sonra carpim dizisindeki elemanlari indis indis sonuc matrisindeki textBox'lara atadim.
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        sonuc[i, j].Text = "0";
                        for (int k = 0; k < boyut; k++)
                        {
                            //matrislerde carpma yaptim
                            carpim[i, j] += Convert.ToDouble(matris1[i, k].Text) * Convert.ToDouble(matris2[k, j].Text);
                        }
                        sonuc[i, j].Text = carpim[i, j].ToString();
                    }
                }
            }
            public static void MatrisIz(int boyut)
            {
                //Matrislerin izlerine baslangic degeri atadim.
                double matrisinIzi1 = 0;
                double matrisinIzi2 = 0;
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        //Matris izi , matrisin [i,i]'nci elemanindaki degerlerin toplamidir.
                        if (i == j)
                        {
                            matrisinIzi1 += Convert.ToDouble(matris1[i, j].Text);
                            matrisinIzi2 += Convert.ToDouble(matris2[i, j].Text);
                        }
                    }
                }
                //Ekrana yazilacak ifadeleri atadim.
                izToplam1.Text = "1. Matrisin izi: " + matrisinIzi1;
                izToplam2.Text = "2. Matrisin izi: " + matrisinIzi2;

                //Label'lara konum atadim.
                izToplam1.Location = new Point(380, 240);
                izToplam2.Location = new Point(380, 265);

            }
            public static void Transpoze(int boyut)
            {
                //Transpoze, bir matrisin [i,j]'nci elemaninin [j,i]'nci elemanla yer degistirmesidir.
                //Asagidaki for dongusunde bu islem gerceklesmistir.
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)                   
                        matris2[i, j].Text = matris1[j, i].Text;                  
                }
            }
            public static void TersAl(int boyut)
            {
                double[,] A = new double[boyut, boyut];
                //Matematiksel islemleri daha kolay yapabilmek icin matris1 in elemanlarini double A dizisine atadim.
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0;  j< boyut; j++)                   
                        A[i, j] = Convert.ToDouble(matris1[i, j].Text);                 
                }
                //153.-175. satirlar arasi ters alma islemi yaptim
                for (int k = 0; k < boyut; k++)
                {
                    for (int i = 0; i < boyut; i++)
                        for (int j = 0; j < boyut; j++)
                            if (!(i == k || j == k))
                                A[i, j] = A[i, j] - A[i, k] * A[k, j] / A[k, k];


                    A[k, k] = -1 / A[k, k];
                    for (int i = 0; i < boyut; i++)
                        if (!(i == k))
                            A[i, k] = A[i, k] * A[k, k];


                    for (int j = 0; j < boyut; j++)
                        if (!(j == k))
                            A[k, j] = A[k, j] * A[k, k];
                }
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)                    
                        sonuc[i, j].Text = (-1 * A[i, j]).ToString();
                }
                //Matrisin tersi yoksa uyari mesaji vermesini istedim
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        if (double.IsNaN(A[i, j]))
                        {
                            MessageBox.Show("Bu matrisin tersi yoktur!");
                        }
                        break;
                    }
                    break;
                }
            }
            public static void Yazdirma(int boyut)
            {               
                //Proje klasorunun bin>debug kisminda "kaydet" adinda bir .txt dosyasi olusturdum.
                Directory.CreateDirectory("kaydet");

                //Dosyaya ekleme yapabilmek icin bu kodu yazdim.
                yaz = File.AppendText("kaydet.txt");

                //Asagidaki for dongulerinde matrislerin elemanlarini dosyaya yazdim.
                yaz.WriteLine("------------------------------------------");
                yaz.WriteLine("A Matrisi:");
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        yaz.Write("[ "+matris1[i, j].Text+" ]" + " ");            
                    }
                    yaz.WriteLine();
                    
                }
                yaz.WriteLine("\nB Matrisi:");
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        yaz.Write("[ " + matris2[i, j].Text + " ]" + " ");
                    }
                    yaz.WriteLine();

                }
                yaz.WriteLine("\nSONUC Matrisi:");
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        yaz.Write("[ " + sonuc[i, j].Text + " ]" + " ");
                    }
                    yaz.WriteLine();

                }
                yaz.WriteLine("------------------------------------------");

                yaz.Close();   
                
            }
            public static void Okuma(int boyut)
            {
                //kaydet.txt dosyasini okudum.
                oku = new StreamReader("kaydet.txt");
                //Dosyadaki verileri bir string'e atadim.
                string metin = oku.ReadLine();
                richTXT = new RichTextBox();

                richTXT.Location = new Point(10, 325);
                richTXT.Size = new Size(200, 200);

                //Dosyanin ici null olmadigi surece dongu devam edecek ve richTXT'ye dosya icindeki verileri yazdirdim.
                while (metin != null)
                {
                    richTXT.Text += "\n" + metin;
                    metin = oku.ReadLine();
                }
                oku.Close();
            }

        }
        public Form1()
        {
            InitializeComponent();
        }
        public void numericBoyut_ValueChanged(object sender, EventArgs e)
        {      
            //numericUpDown'daki sayiyi degiskene atadim.
            int boyut = (int)numericBoyut.Value;
            this.Size = new Size(750, 600);

            #region ACIKLAMA
              /*
              Burada control elemanlarinin sayisini sayi degiskenine atadim. 
              Amac: Matris boyutu degistiginde eski matrisi silmek. 

              Formda halihazirda 7 tane nesne vardir(son nesne 6. indise denk gelir).
              Eklenen matrisler 7. indisten baslar.

              Breakpoint'lerle yaptigim calismalar sonucu RemoveAt() metodunun kullanimini anladim.
              Ornegin matris boyutunu 3 sectik. 2 tane 3x3'luk matris(textBox) olusur.
              Baslangicta 7 tane control elemanim vardi. Matris boyutunu degistirdigim zaman sadece textBox'larin silinmesi gerekiyordu.
              RemoveAt() burada devreye girdi. RemoveAt(), sildigim ilk textBox'in indisini ondan bir sonrakine aktariyordu. 
              Boylece anladim ki her defasinda 7. indisteki form elemanini silmeliyim.

              Form'a yeni nesne eklenirse 284. ve 285. satirdaki 7 yerine 8 yazilmali.
             */                  
        #endregion                                                                                    
            int sayi = Controls.Count;
            for (int i = 7; i < sayi; i++)              
                Controls.RemoveAt(7);                
            
            //Fonksiyon cagrisi
            Islemler.MatrisOlustur(boyut);

            //Matrisleri form'a ekledim
            for (int i = 0; i < boyut; i++)
            {
                for (int j = 0; j < boyut; j++)
                {                  
                    Controls.Add(Islemler.matris1[i, j]);
                    Controls.Add(Islemler.matris2[i, j]);
                }
            }          
        }     
        private void btnIslem_Click(object sender, EventArgs e)
        {
            int boyut = (int)numericBoyut.Value;
            
            if (rdbToplama.Checked == true)
            {            
                //Fonksiyon cagrisi
                Islemler.MatrisTopla(boyut);

                //Sonuc matrisini form'a ekledim
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        Controls.Add(Islemler.sonuc[i, j]);
                    }
                }
            }
            else if (rdbCarpma.Checked == true)
            {
                //Fonksiyon cagrisi
                Islemler.MatrisCarp(boyut);

                //Matrisleri form'a ekledim
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        Controls.Add(Islemler.sonuc[i, j]);
                    }
                }
            }
            else if (rdbIz.Checked == true)
            {
                //Fonksiyon cagrisi
                Islemler.MatrisIz(boyut);

                //Label'lari form'a ekledim
                Controls.Add(Islemler.izToplam1);
                Controls.Add(Islemler.izToplam2);
            }
            else if (rdbTranspoze.Checked == true)
            {
                //Fonksiyon cagrisi
                Islemler.Transpoze(boyut);
            }
            else if (rdbTers.Checked == true)
            {
                //Fonksiyon cagrisi
                Islemler.TersAl(boyut);

                //Matrisleri form'a ekledim
                for (int i = 0; i < boyut; i++)
                {
                    for (int j = 0; j < boyut; j++)
                    {
                        Controls.Add(Islemler.sonuc[i, j]);
                    }
                }
            }
            else if (rdbOkuma.Checked == true)
            {
                //Fonksiyon cagrisi
                Islemler.Okuma(boyut);

                //richTextBox form'a eklendi
                Controls.Add(Islemler.richTXT);

                //Yeni cagrilan richTXT'yi en one getirdim
                Islemler.richTXT.BringToFront();


            }
            else if (rdbYazdirma.Checked == true)
            {
                //Fonksiyon cagrisi
                Islemler.Yazdirma(boyut);

                //Uyari mesaji ekledim
                MessageBox.Show("Matrisler dosyaya basariyla kaydedildi!");
            }
        }

        
    }
}
