package dataAccess;

import java.util.Random;

import core.dataAccess.IDbRepository;
import entity.Kullanici;

public class SanalVeritabaniSurucusu implements IDbRepository {

	@Override
	public Kullanici kullaniciDondur(String ad, String sifre) {
		Kullanici kullanici = new Kullanici(1, ad, sifre);
		return kullanici;
	}

	@Override
	public boolean kullaniciAdiDogrula(String ad) {
		if (ad.equals("emreaknci"))
			return true;

		return false;
	}

	@Override
	public boolean sifreDogrula(String ad, String sifre) {
		if (ad.equals("emreaknci") && sifre.equals("123456"))
			return true;

		return false;
	}

	@Override
	public void durumGuncelle(int durum, Kullanici kullanici) {
		
	}

	@Override
	public int mevcutDurumGonder() {
		Random rnd=new Random();
		int durum=rnd.nextInt(1,3);
		return durum;
	}

}
