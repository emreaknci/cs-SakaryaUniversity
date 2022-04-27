
/**
*
* @author Yunus Emre Akinci yunus.akinci1@ogr.sakarya.edu.tr
* @since 23.03.2022-03.04.2022
* <p>
* 	Dosyadaki operatorleri kontrol etme islemini gerceklestiren fonksiyonlar burada yer aliyor
* </p>
*/

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Lexical {
	public static int sayisalMi(String str) {
		//sayisal operatorleri bulacak regex ifade tanimlandi
		Pattern pattern = Pattern.compile(
				"((?<!=|!)[\\+\\-\\/*%&\\|^]?\\=(?!=|!)|-{1,2}|\\+{1,2}|\\*|\\/|%|(?<!=|!|&)&(?!=|!|&)|\\||\\^)",
				Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(str);

		int sayac = 0;
		//regex deki ifade varsa sayac arttirilacak
		while (matcher.find()) {
			sayac++;
		}
		return sayac;
	}

	public static int mantiksalMi(String str) {
		//mantiksal operatorleri bulacak regex ifade tanimlandi
		Pattern pattern = Pattern.compile("&{2}|(?<!\\!)\\!{1}(?!\\!|\\=)|\\|{2}", Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(str);

		int sayac = 0;
		//regex deki ifade varsa sayac arttirilacak
		while (matcher.find()) {
			sayac++;
		}
		return sayac;
	}

	public static int iliskselMi(String str) {
		//iliskisel operatorleri bulacak regex ifade tanimlandi
		Pattern pattern = Pattern.compile("(?:<=?|>=?|==|!=)");
		Matcher matcher = pattern.matcher(str);

		int sayac = 0;
		//regex deki ifade varsa sayac arttirilacak
		while (matcher.find()) {
			sayac++;
		}
		return sayac;
	}

	public static int tekliMi(String str) {
		//tekli operatorleri bulacak regex ifade tanimlandi
		Pattern pattern = Pattern.compile("(-{2}|\\+{2}|(?<!\\!|=)\\!)(?!\\!|=)");
		Matcher matcher = pattern.matcher(str);

		int sayac = 0;
		//regex deki ifade varsa sayac arttirilacak
		while (matcher.find()) {
			sayac++;
		}
		return sayac;

	}

	public static int ikiliMi(String str) {
		//ikili operatorleri bulacak regex ifade tanimlandi
		Pattern pattern = Pattern.compile("((?<!\\!|\\=|\\-|\\+)[-+*/=%]{1}(?!=\\!|\\=|\\-|\\+))");
		Matcher matcher = pattern.matcher(str);

		int sayac = 0;
		//regex deki ifade varsa sayac arttirilacak
		while (matcher.find()) {
			sayac++;
		}
		return sayac;

	}

	public static boolean genericMi(String str) {
		//generic yapilari bulacak regex ifade tanimlandi
		Pattern pattern = Pattern.compile("\\<[ +\\w +]+\\>|\\<\\>");
		Matcher matcher = pattern.matcher(str);
		
		//regex deki ifade varsa true dondurulecek 
		if (matcher.find()) {
			return true;
		}
		return false;
	}
}
