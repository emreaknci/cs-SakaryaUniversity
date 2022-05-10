package business.concretes;

import business.abstracts.IEyleyiciService;
import core.Araclar;
import core.dataAccess.IDbRepository;
import entity.Kullanici;

public class EyleyiciManager implements IEyleyiciService {

	private IDbRepository db;

	public EyleyiciManager(IDbRepository db) {
		super();
		this.db = db;
	}

	@Override
	public void sogutucuAc(Kullanici kullanici) {
		System.out.println("Sogutucunun mevcut durumu kontrol ediliyor...");
		Araclar.bekle(750);
		if (db.mevcutDurumGonder() == 1) {
			System.out.println("Sogutucu zaten acik!");
			return;
		}
		db.durumGuncelle(1, kullanici);
		System.out.println("Sogutucu durumu acik olarak guncellendi!");
	}

	@Override
	public void sogutucuKapat(Kullanici kullanici) {
		System.out.println("Sogutucunun mevcut durumu kontrol ediliyor...");
		Araclar.bekle(750);
		if (db.mevcutDurumGonder() == 2) {
			System.out.println("Sogutucu zaten kapali!");
			return;
		}
		db.durumGuncelle(2, kullanici);
		System.out.println("Sogutucu durumu kapali olarak guncellendi!");
	}

}
