
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

	public static String ttf(String satir, int iYorum, int iYBaslangýc) {
		iYorum = satir.indexOf("//"); // "//" indisi bulundu
		iYBaslangýc = satir.indexOf("/*"); // "/*" indisi bulundu

		if (iYorum > iYBaslangýc) // eger "/*" daha once geliyorsa
		{
			satir = satir.substring(0, iYBaslangýc);
			// satirda "ab/* cd //ef " seklinde birsey varsa satirin sadece ab kismini aldik
		}

		else if (iYBaslangýc > iYorum) // eger "/*" daha sonra geliyorsa
		{
			satir = satir.substring(0, iYorum);
			// satirda "ab//cd /*ef " seklinde birsey varsa satirin sadece ab kismini aldik
		}
		return satir; // yeni satir dondu
	}

	public static String ftf(String satir, int iYBaslangýc) {
		iYBaslangýc = satir.indexOf("/*"); // "/*" indisi bulundu
		satir = satir.substring(0, iYBaslangýc);
		// satirda "ab/*cd " seklinde birsey varsa satirin sadece ab kismini aldik
		return satir; // yeni satir dondu
	}

	public static String ftt(String satir, int iYBaslangýc, int iYBitis) {
		iYBaslangýc = satir.indexOf("/*"); // "/*" indisi bulundu
		iYBitis = satir.indexOf("*/"); // "*/" indisi bulundu
		if (iYBaslangýc > iYBitis) // eger "*/" daha once geliyorsa
		{
			satir = satir.substring(iYBitis + 2, iYBaslangýc);
			// satirda "ab*/ cd /*ef " seklinde birsey varsa satirin sadece cd kismini aldik
		}

		else if (iYBaslangýc < iYBitis) // eger "*/" daha sonra geliyorsa
		{
			satir = satir.substring(0, iYBaslangýc) + satir.substring(iYBitis + 2);
			// satirda "ab /* cd */ ef " seklinde birsey varsa satirin sadece ab ef kismini
			// aldik

		}
		return satir; // yeni satir dondu
	}

	public static String ttt(String satir, int iYorum, int iYBaslangýc, int iYBitis) {
		iYorum = satir.indexOf("//"); // "//" indisi bulundu
		iYBaslangýc = satir.indexOf("/*"); // "/*" indisi bulundu
		iYBitis = satir.indexOf("*/"); // "*/" indisi bulundu

		if (iYBaslangýc < iYBitis && iYBaslangýc < iYorum) // "/*" en once geliyorsa
		{
			if (iYorum < iYBitis)// "//" "*/" dan once geliyorsa
			{
				satir = satir.substring(0, iYBaslangýc) + satir.substring(iYBitis + 2);
				// satirda "ab /* cd // ef */gh " seklinde birsey varsa satirin sadece ab gh
				// kismini aldik

			}

			else if (iYorum > iYBitis)// "//" "*/" dan sonra geliyorsa
			{
				satir = satir.substring(0, iYBaslangýc) + satir.substring(iYBitis + 2, iYorum);
				// satirda "ab /* cd */ ef //gh " seklinde birseyvarsa satirin sadece ab ef
				// kismini aldik

			}
		}

		else if (iYBitis < iYBaslangýc && iYBitis < iYorum)// "*/" en once geliyorsa
		{
			if (iYorum < iYBaslangýc)// "//" "/*" dan once geliyorsa
			{
				satir = satir.substring(iYBitis + 2, iYorum);
				// satirda "ab */ cd // ef /* gh" seklinde birsey varsa satirin sadece cd
				// kismini aldik

			}

			else if (iYorum > iYBaslangýc)// "//" "/*" dan sonra geliyorsa
			{
				satir = satir.substring(iYBitis + 2, iYBaslangýc);
				// satirda "ab */ cd /* ef // gh " seklinde birsey varsa satirin sadece cd
				// kismini aldik
			}
		}

		else if (iYorum < iYBaslangýc && iYorum < iYBitis) // "//" en once geliyorsa
		{
			satir = satir.substring(0, iYorum);
			// satirda "ab // ef /* cd */ gh" veya "ab // ef */ cd /* gh" þeklinde birþey
			// varsa satirin sadece ab kismini aldik
		}

		return satir; // yeni satir dondu
	}

	public static String ySatiriSil(String satir, int iYBaslangýc, BufferedReader bf, String metin) throws IOException {
		if (satir.contains("/*")) {
			int iYBitis = 0;
			iYBaslangýc = satir.indexOf("/*"); // "/*" indisi bulundu
			if (satir.contains("//")) {
				iYBitis = satir.indexOf("//"); // "/*" indisi bulundu
				if (iYBitis > iYBaslangýc) {
					satir = satir.substring(0, iYBaslangýc);
				} else if (iYBaslangýc > iYBitis) {
					satir = satir.substring(0, iYBitis);
				}
			} else if (!satir.contains("//")) {
				satir = satir.substring(0, iYBaslangýc);
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
					iYBaslangýc = satir.indexOf("//"); // "//" indisi bulundu
					if (iYBaslangýc > iYBitis) {
						satir = satir.substring(iYBitis + 2, iYBaslangýc - 4);
					} else if (iYBitis > iYBaslangýc) {
						satir = satir.substring(0, iYBaslangýc);

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
