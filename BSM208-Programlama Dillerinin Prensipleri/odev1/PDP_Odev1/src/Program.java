
/**
*
* @author Yunus Emre Akinci yunus.akinci1@ogr.sakarya.edu.tr
* @since 23.03.2022-03.04.2022
* <p>
* 	main.java burada yer aliyor
* 	x.java dosyasindaki yorum satirlarini silen static fonksiyon burada yer aliyor
* 	Yorum satirlari silindikten sonra operatorlerin ve operandlarin sayisini bulan fonksiyon burada yer aliyor
* </p>
*/

import java.io.BufferedReader;
import java.io.FileReader;

public class Program {

	public static void main(String[] args) {

		operatorSayisiHesapla(args[0]);	
	}

	private static void operatorSayisiHesapla(String dosya) // operator ve operand sayilarini bulur
	{
		String[] satirlar = templateSil(dosya).split("\n"); /* yorum satirsiz ve generic ifadesiz .java uzerinden islemler gerceklesiyor
		fonksiyondan gelen String'de "\n" ifadesinini gorunce split metodu ile ayirdim ve String array'e atadim
		boylece satir satir dolasacagim */
		
		
		int sayisalSayac = 0, mantiksalSayac = 0, iliskiselSayac = 0, tekliSayac = 0, ikiliSayac = 0;

		for (String satir : satirlar) {
			//operatorler satirda bulunuyorsa degerleri arttiriliyor
			sayisalSayac += Lexical.sayisalMi(satir);
			mantiksalSayac += Lexical.mantiksalMi(satir);
			iliskiselSayac += Lexical.iliskselMi(satir);
			tekliSayac += Lexical.tekliMi(satir);
			ikiliSayac += Lexical.ikiliMi(satir);
		}

		//operand sayisi hesaplandi
		int operandSayac = (tekliSayac * 1) + ((sayisalSayac - tekliSayac) * 2) + ((mantiksalSayac) * 2)
				+ iliskiselSayac * 2;

		System.out.println("Operator Bilgisi:" + "\n\tTekli Operator Sayisi: " + tekliSayac
				+ "\n\tIkili Operator Sayisi: " + ikiliSayac + "\n\tSayisal Operator Sayisi: " + sayisalSayac
				+ "\n\tIlýskisel Operator Sayisi: " + iliskiselSayac + "\n\tMantiksal Operator Sayisi: "
				+ mantiksalSayac + "\nOperand Bilgisi:" + "\n\tToplam Operand Sayisi: " + operandSayac);

	}

	private static String yorumSatiriSil(String dosya) // yorum satirlari olmadan .java'yi dondurur
	{
		String metin = "";

		try {

			BufferedReader bf = new BufferedReader(new FileReader(dosya));
			String satir;

			int iYorum = 0, iYBaslangic = 0, iYBitis = 0;   
			// iYorum "//" indisini, iYBaslangic "/*" indisini, iYBitis "*/" indisini temsil ediyor. 
			//Bu indisler silme islemlerinde kullaniliyor
			while ((satir = bf.readLine()) != null) //satir satir okuma
			{
				//olasi ihtimaller kontrol ediliyor
				if (satir.contains("//") && !satir.contains("/*") && !satir.contains("*/")) { // 100
					metin += Possibility.tff(satir, iYorum) + '\n';
				}

				else if (satir.contains("//") && !satir.contains("/*") && satir.contains("*/")) {// 101
					metin += Possibility.tft(satir, iYorum, iYBitis) + '\n';
				}

				else if (satir.contains("//") && satir.contains("/*") && !satir.contains("*/")) {// 110
					metin = Possibility.ySatiriSil(satir, iYBaslangic, bf, metin);
					metin += Possibility.ttf(satir, iYorum, iYBaslangic) + '\n';
				}

				else if (satir.contains("//") && satir.contains("/*") && satir.contains("*/")) {// 111
					metin += Possibility.ttt(satir, iYorum, iYBaslangic, iYBitis) + '\n';
				}

				else if (!satir.contains("//") && satir.contains("/*") && satir.contains("*/")) {// 011
					for (int i = 0; i < satir.length(); i++) {
						if (satir.contains("/*") || satir.contains("*/"))
							satir = Possibility.ftt(satir, iYBaslangic, iYBitis);
					}

					metin += satir + '\n';
				}

				else if (!satir.contains("//") && satir.contains("/*") && !satir.contains("*/")) {// 010
					metin = Possibility.ySatiriSil(satir, iYBaslangic, bf, metin);
					metin += Possibility.ftf(satir, iYBaslangic) + '\n';
				}

				else if (!satir.contains("//") && !satir.contains("/*") && satir.contains("*/")) { // 001
					for (int i = 0; i < satir.length(); i++) {
						if (satir.contains("*/"))
							satir = Possibility.fft(satir, iYBitis) + '\n';
					}
					metin += satir;
				}

				else { // 000
					metin += satir + '\n';
				}
			}
			bf.close();
		} catch (Exception e) {
			System.out.print("Dosya okuma basarisiz");
		}
		return metin;
	}

	private static String templateSil(String dosya) // .javada ArrayList<> gibi ifadeler varsa onlari siliyoruz
	{
		String[] satirlar = yorumSatiriSil(dosya).split("\n"); /*yorum satirlari silinmis dosya uzerinden islemler gerceklesiyor
		fonksiyondan gelen String'de "\n" ifadesinini gorunce split metodu ile ayirdim ve String array'e atadim
		boylece satir satir dolasacagim */
		String metin = "";
		for (String satir : satirlar) {
			if (satir.contains("<") && satir.contains(">")) {
				for (int i = 0; i < satir.length(); i++) {
					satir = Possibility.genericSil(satir);
				}
			}
			metin += satir + '\n';

		}
		return metin;

	}
}
