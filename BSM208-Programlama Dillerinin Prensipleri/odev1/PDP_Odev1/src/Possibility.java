
/**
*
* @author Yunus Emre Akinci yunus.akinci1@ogr.sakarya.edu.tr
* @since 23.03.2022-03.04.2022
* <p>
* 	Yorum satirlarini silmek icin kullandigim yardimci fonksiyonlar burada yer aliyor
* 	Detaylarina rapordan ulasabilirsiniz
* </p>
*/

import java.io.BufferedReader;
import java.io.IOException;

public class Possibility {
	public static String fft(String satir, int iYBitis) {
		iYBitis = satir.indexOf("*/"); // "*/" indisi bulundu
		satir = satir.substring(iYBitis + 2);
		// satirin "*/" ifadesinden sonraki kismi alindi
		return satir; // yeni satir dondu
	}

	public static String tft(String satir, int iYorum, int iYBitis) {
		iYorum = satir.indexOf("//"); // "//" indisi bulundu
		iYBitis = satir.indexOf("*/"); // "*/" indisi bulundu
		if (iYorum > iYBitis)// eger "*/" daha once geliyorsa
		{
			satir = satir.substring(iYBitis + 2, iYorum);
			// satirda "ab*/ cd //ef" seklinde birsey varsa satirin sadece cd kismini aldik
		}

		else if (iYBitis > iYorum)// eger "*/" daha sonra geliyorsa
		{
			satir = satir.substring(0, iYorum);
			// satirda "ab//cd ef*/gh" seklinde birsey varsa satirin sadece ab kismini aldik
		}
		return satir; // yeni satir dondu
	}

	public static String tff(String satir, int iYorum) {
		iYorum = satir.indexOf("//"); // "//" indisi bulundu
		satir = satir.substring(0, iYorum);
		// satirda "ab//cd" seklinde birsey varsa satirin sadece ab kismini aldik
		return satir;// yeni satir dondu
	}

	public static String ttf(String satir, int iYorum, int iYBaslangıc) {
		iYorum = satir.indexOf("//"); // "//" indisi bulundu
		iYBaslangıc = satir.indexOf("/*"); // "/*" indisi bulundu

		if (iYorum > iYBaslangıc) // eger "/*" daha once geliyorsa
		{
			satir = satir.substring(0, iYBaslangıc);
			// satirda "ab/* cd //ef " seklinde birsey varsa satirin sadece ab kismini aldik
		}

		else if (iYBaslangıc > iYorum) // eger "/*" daha sonra geliyorsa
		{
			satir = satir.substring(0, iYorum);
			// satirda "ab//cd /*ef " seklinde birsey varsa satirin sadece ab kismini aldik
		}
		return satir; // yeni satir dondu
	}

	public static String ftf(String satir, int iYBaslangıc) {
		iYBaslangıc = satir.indexOf("/*"); // "/*" indisi bulundu
		satir = satir.substring(0, iYBaslangıc);
		// satirda "ab/*cd " seklinde birsey varsa satirin sadece ab kismini aldik
		return satir; // yeni satir dondu
	}

	public static String ftt(String satir, int iYBaslangıc, int iYBitis) {
		iYBaslangıc = satir.indexOf("/*"); // "/*" indisi bulundu
		iYBitis = satir.indexOf("*/"); // "*/" indisi bulundu
		if (iYBaslangıc > iYBitis) // eger "*/" daha once geliyorsa
		{
			satir = satir.substring(iYBitis + 2, iYBaslangıc);
			// satirda "ab*/ cd /*ef " seklinde birsey varsa satirin sadece cd kismini aldik
		}

		else if (iYBaslangıc < iYBitis) // eger "*/" daha sonra geliyorsa
		{
			satir = satir.substring(0, iYBaslangıc) + satir.substring(iYBitis + 2);
			// satirda "ab /* cd */ ef " seklinde birsey varsa satirin sadece ab ef kismini
			// aldik

		}
		return satir; // yeni satir dondu
	}

	public static String ttt(String satir, int iYorum, int iYBaslangıc, int iYBitis) {
		iYorum = satir.indexOf("//"); // "//" indisi bulundu
		iYBaslangıc = satir.indexOf("/*"); // "/*" indisi bulundu
		iYBitis = satir.indexOf("*/"); // "*/" indisi bulundu

		if (iYBaslangıc < iYBitis && iYBaslangıc < iYorum) // "/*" en once geliyorsa
		{
			if (iYorum < iYBitis)// "//" "*/" dan once geliyorsa
			{
				satir = satir.substring(0, iYBaslangıc) + satir.substring(iYBitis + 2);
				// satirda "ab /* cd // ef */gh " seklinde birsey varsa satirin sadece ab gh
				// kismini aldik

			}

			else if (iYorum > iYBitis)// "//" "*/" dan sonra geliyorsa
			{
				satir = satir.substring(0, iYBaslangıc) + satir.substring(iYBitis + 2, iYorum);
				// satirda "ab /* cd */ ef //gh " seklinde birseyvarsa satirin sadece ab ef
				// kismini aldik

			}
		}

		else if (iYBitis < iYBaslangıc && iYBitis < iYorum)// "*/" en once geliyorsa
		{
			if (iYorum < iYBaslangıc)// "//" "/*" dan once geliyorsa
			{
				satir = satir.substring(iYBitis + 2, iYorum);
				// satirda "ab */ cd // ef /* gh" seklinde birsey varsa satirin sadece cd
				// kismini aldik

			}

			else if (iYorum > iYBaslangıc)// "//" "/*" dan sonra geliyorsa
			{
				satir = satir.substring(iYBitis + 2, iYBaslangıc);
				// satirda "ab */ cd /* ef // gh " seklinde birsey varsa satirin sadece cd
				// kismini aldik
			}
		}

		else if (iYorum < iYBaslangıc && iYorum < iYBitis) // "//" en once geliyorsa
		{
			satir = satir.substring(0, iYorum);
			// satirda "ab // ef /* cd */ gh" veya "ab // ef */ cd /* gh" şeklinde birşey
			// varsa satirin sadece ab kismini aldik
		}

		return satir; // yeni satir dondu
	}

	public static String ySatiriSil(String satir, int iYBaslangıc, BufferedReader bf, String metin) throws IOException {
		if (satir.contains("/*")) {
			int iYBitis = 0;
			iYBaslangıc = satir.indexOf("/*"); // "/*" indisi bulundu
			if (satir.contains("//")) {
				iYBitis = satir.indexOf("//"); // "/*" indisi bulundu
				if (iYBitis > iYBaslangıc) {
					satir = satir.substring(0, iYBaslangıc);
				} else if (iYBaslangıc > iYBitis) {
					satir = satir.substring(0, iYBitis);
				}
			} else if (!satir.contains("//")) {
				satir = satir.substring(0, iYBaslangıc);
			}
			metin += satir + '\n';
			while ((satir = bf.readLine()) != null) {
				if (satir.contains("*/") && !satir.contains("//")) {
					iYBitis = satir.indexOf("*/"); // "//" indisi bulundu
					satir = satir.substring(iYBitis + 2);
					metin += satir + '\n';
					break;
				} else if (satir.contains("*/") && satir.contains("//")) {
					iYBitis = satir.indexOf("*/"); // "*/" indisi bulundu
					iYBaslangıc = satir.indexOf("//"); // "//" indisi bulundu
					if (iYBaslangıc > iYBitis) {
						satir = satir.substring(iYBitis + 2, iYBaslangıc - 4);
					} else if (iYBitis > iYBaslangıc) {
						satir = satir.substring(0, iYBaslangıc);

					}
					metin += satir + '\n';
					break;

				}
			}
		} else {
			metin += satir + '\n';
		}
		return metin; // yeni satir dondu
	}

	public static String genericSil(String satir) {
		int baslangic = satir.indexOf("<"); // "<" indisi bulundu
		int bitis = satir.lastIndexOf(">"); // ">" indisi bulundu

		if (Lexical.genericMi(satir)) {
			satir = satir.substring(0, baslangic) + satir.substring(bitis + 1);
			// satirda "list<int> abc" seklinde birsey varsa satirin sadece list abc kismini
			// aldik
		}

		return satir; // yeni satir dondu
	}

}
