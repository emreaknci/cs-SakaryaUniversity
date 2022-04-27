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
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace b201210101_NDP_ProjeOdevi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        //Asagidaki form elemanlarinda kullandigim degiskenler tanımlandı ve ilk degerleri verildi
        int sure = 60;
        Random rnd = new Random();
        double toplamMeyve = 0;

        double vitAToplamNarenciye = 0;
        double vitBToplamNarenciye = 0;
        double toplamNarenciye = 0;

        double vitAToplamKati = 0;
        double vitBToplamKati = 0;
        double toplamKati = 0;
        
        private void Form1_Load(object sender, EventArgs e)
        {
            //Sayac durduruldu
            timer1.Stop();
            //Sikacak butonlarini inaktif hale getirdim
            btnKati.Enabled = false;
            btnNarenciye.Enabled = false;

        }

        private void timer1_Tick_1(object sender, EventArgs e)
        {
            if (sure >= 0) //Sure 0 dan buyuk oldugu surece azalmaya devam eder
            {
                timer1.Interval = 1000; //Timer'in suresi 1 sn olarak ayarlandi
                int sayac = sure--;
                sayacLabel.Text = sayac.ToString();
                btnBasla.Enabled = false; //Sure 0 dan buyukken btnBasla inaktif hale getirildi

                //Sure 0 dan buyukken sikacak butonlari aktif hale getirildi
                btnNarenciye.Enabled = true;
                btnKati.Enabled = true;
            }
            else //Sure 0 oldugu surece sadece yeni oyun butonuna erisilebilir
            {
                btnBasla.Enabled = true; //Sure 0 dan kucukken btnBasla aktif hale getirildi
               
                //Sure 0 dan kucukken sikacak butonlari inaktif hale getirildi
                btnNarenciye.Enabled = false; 
                btnKati.Enabled = false;
                timer1.Stop();
            }
        }

        private void btnBasla_Click(object sender, EventArgs e)
        {
            //listBox'lar temizlendi
            listBoxKati.Items.Clear();
            listBoxNarenciye.Items.Clear();

            //sayacLabel'larinin görünürlüğü aktif edildi
            sayacLabel.Visible = true;
            
            //Degiskenlere ilk degerleri verildi
            sure = 60; 
            timer1.Start();
            toplamMeyve = 0; 

            vitAToplamNarenciye = 0;
            vitBToplamNarenciye = 0;
            toplamNarenciye = 0;

            vitAToplamKati = 0;
            vitBToplamKati = 0;
            toplamKati = 0;

            //Rastgele resim ekrana getirildi
            pictureBox.Image = meyve[rnd.Next(0, 6)].MeyveResim;
            
            //listBox'lara eleman eklendi
            listBoxNarenciye.Items.Add("Meyve\tAğırlık(g)\tVitA(iu)\tVitB(iu)\t Meyve Suyu Ağırlığı(g)");
            listBoxNarenciye.Items.Add("");
            listBoxKati.Items.Add("Meyve\tAğırlık(g)\tVitA(iu)\tVitB(iu)\t Püre Ağırlığı(g)");
            listBoxKati.Items.Add("");

            //label'lara text verildi
            lblToplamKati.Text = "Toplam VitA(iu): " + vitAToplamKati + "\n Toplam VitB(iu): " + vitBToplamKati +
                    "\n Toplam Meyve Suyu(kg): " + toplamKati;
            lblToplamNarenciye.Text = "Toplam VitA(iu): " + vitAToplamKati + "\n Toplam VitB(iu): " + vitBToplamKati +
                   "\n Toplam Narenciye Suyu(kg): " + toplamKati;
            lblToplamMeyve.Text = "Sıkılan Toplam Meyve(kg):\n" + toplamMeyve;

        }

        private void btnNarenciye_Click(object sender, EventArgs e)
        {
            //Kosul bloklarında gelen resme gore meyvelerin agirligi,vitamin degerleri ve
            //sikacak sonrası verime gore agirligi listBox'lara eklendi

            //listBox'larin altindaki label'larin icine yazilacak her bir degere
            //meyvelerin ilgili degerleri eklendi  
            if (pictureBox.Image == meyve[0].MeyveResim)
            {
                pictureBox.Image = meyve[rnd.Next(0, 6)].MeyveResim;
                listBoxNarenciye.Items.Add("Portakal\t" + meyve[0].Agirlik() +
                    "\t" + meyve[0].VitA(225) + "\t" + meyve[0].VitB(45) + "\t" +
                    meyve[0].Verim() * meyve[0].Agirlik() / 100);

                toplamMeyve += meyve[0].Agirlik()/ 1000;
                vitAToplamNarenciye += meyve[0].VitA(225);
                vitBToplamNarenciye += meyve[0].VitB(45);

                toplamNarenciye += meyve[0].Verim() * meyve[0].Agirlik() / 100;
            }

            else if (pictureBox.Image == meyve[1].MeyveResim)
            {
                pictureBox.Image = meyve[rnd.Next(0, 6)].MeyveResim;
                listBoxNarenciye.Items.Add("Mandalin\t" + meyve[1].Agirlik() +
                    "\t" + meyve[1].VitA(681) + "\t" + meyve[1].VitB(26) + "\t" +
                    meyve[1].Verim() * meyve[1].Agirlik() / 100);

                toplamMeyve += meyve[1].Agirlik() / 1000;
                vitAToplamNarenciye += meyve[1].VitA(681);
                vitBToplamNarenciye += meyve[1].VitB(26);

                toplamNarenciye += meyve[1].Verim() * meyve[1].Agirlik() / 100;
            }

            else if (pictureBox.Image == meyve[2].MeyveResim)
            {
                pictureBox.Image = meyve[rnd.Next(0, 6)].MeyveResim;
                listBoxNarenciye.Items.Add("Greyfurt\t" + meyve[2].Agirlik() +
                    "\t" + meyve[2].VitA(3) + "\t" + meyve[2].VitB(44) +
                    "\t" + meyve[2].Verim() * meyve[2].Agirlik() / 100);

                toplamMeyve += meyve[2].Agirlik() / 1000;
                vitAToplamNarenciye += meyve[2].VitA(3);
                vitBToplamNarenciye += meyve[2].VitB(44);

                toplamNarenciye += meyve[2].Verim() * meyve[2].Agirlik() / 100;
            }

            //Label'larin text'leri guncellendi
            lblToplamNarenciye.Text = "Toplam VitA(iu): " + vitAToplamNarenciye + "\n Toplam VitB(iu): " + vitBToplamNarenciye +
                    "\n Toplam Narenciye Suyu(kg): " + (toplamNarenciye/1000);
            lblToplamMeyve.Text = "Sıkılan Toplam Meyve(kg):\n" + toplamMeyve;
                       
        }

        private void btnKati_Click(object sender, EventArgs e)
        {
            //Kosul bloklarında gelen resme gore meyvelerin agirligi,vitamin degerleri ve
            //sikacak sonrası verime gore agirligi listBox'lara eklendi

            //listBox'larin altindaki label'larin icine yazilacak her bir degere
            //meyvelerin ilgili degerleri eklendi  
            if (pictureBox.Image == meyve[3].MeyveResim)
            {
                pictureBox.Image = meyve[rnd.Next(0, 6)].MeyveResim;
                listBoxKati.Items.Add("Elma\t" + meyve[3].Agirlik() +
                    "\t" + meyve[3].VitA(54) + "\t" + meyve[3].VitB(5) + "\t" +
                    meyve[3].Verim() * meyve[3].Agirlik() / 100);

                toplamMeyve += meyve[3].Agirlik() / 1000;
                vitAToplamKati += meyve[3].VitA(54);
                vitBToplamKati += meyve[3].VitB(5);

                toplamKati += meyve[3].Verim() * meyve[3].Agirlik() / 100;
            }

            else if (pictureBox.Image == meyve[4].MeyveResim)
            {
                pictureBox.Image = meyve[rnd.Next(0, 6)].MeyveResim;
                listBoxKati.Items.Add("Armut\t" + meyve[4].Agirlik() +
                    "\t" + meyve[4].VitA(25) + "\t" + meyve[4].VitB(5) + "\t" +
                    meyve[4].Verim() * meyve[4].Agirlik() / 100);

                toplamMeyve += meyve[4].Agirlik() / 1000;
                vitAToplamKati += meyve[4].VitA(25);
                vitBToplamKati += meyve[4].VitB(5);

                toplamKati += meyve[4].Verim() * meyve[4].Agirlik() / 100;
            }

            else if (pictureBox.Image == meyve[5].MeyveResim)
            {
                pictureBox.Image = meyve[rnd.Next(0, 6)].MeyveResim;
                listBoxKati.Items.Add("Çilek\t" + meyve[5].Agirlik() +
                    "\t" + meyve[5].VitA(12) + "\t" + meyve[5].VitB(60) +
                    "\t" + meyve[5].Verim() * meyve[5].Agirlik() / 100);

                toplamMeyve += meyve[5].Agirlik() / 1000;
                vitAToplamKati += meyve[5].VitA(12);
                vitBToplamKati += meyve[5].VitB(60);

                toplamKati += meyve[5].Verim() * meyve[5].Agirlik() / 100;
            }

            //Label'larin text'leri guncellendi
            lblToplamKati.Text = "Toplam VitA(iu): " + vitAToplamKati + "\n Toplam VitB(iu): " + vitBToplamKati +
                "\n Toplam Meyve Suyu(kg): " + (toplamKati/1000);
            lblToplamMeyve.Text = "Sıkılan Toplam Meyve(kg):\n" + toplamMeyve;         
        }

        List<IMeyve> meyve = new List<IMeyve>()
        {
            //Meyvelere ait classlar new'lendi
            new Portakal(Image.FromFile("portakal.jpg")),
            new Mandalina(Image.FromFile("mandalina.jpg")),
            new Greyfurt(Image.FromFile("greyfurt.jpg")),
            new Elma(Image.FromFile("elma.jpg")),
            new Armut(Image.FromFile("armut.jpg")),
            new Cilek(Image.FromFile("cilek.jpg")),
        };
    }
}
