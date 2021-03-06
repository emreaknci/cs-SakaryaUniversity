package business.concretes;

import business.abstracts.IKullaniciService;
import core.Araclar;
import core.dataAccess.IDbRepository;
import entity.Kullanici;

public class KullaniciManager implements IKullaniciService {

	private IDbRepository db;

	public KullaniciManager(IDbRepository db) {
		super();
		this.db = db;
	}

	@Override
	public Kullanici kullaniciDondur(String ad, String sifre) {
		System.out.println("Hosgeldiniz!");
		return db.kullaniciDondur(ad, sifre);
	}

	@Override
	public boolean kullaniciAdiDogrula(String ad) {
		System.out.println("\nKullanici adi dogrulaniyor...");
		Araclar.bekle(750);
		if (db.kullaniciAdiDogrula(ad)) {
			System.out.println("Kullanici adi dogrulandi!\n");
			return true;
		}
		System.out.println("Kullanici adi dogrulanamadi!\n");
		return false;
	}

	@Override
	public boolean sifreDogrula(String ad, String sifre) {
		System.out.println("Sifre dogrulaniyor...");
		Araclar.bekle(750);
		if (db.sifreDogrula(ad, sifre)) {
			System.out.println("Sifre dogrulandi!\n");
			return true;
		}
		System.out.print("Yanlis sifre girdiniz!");
		return false;
	}

}
