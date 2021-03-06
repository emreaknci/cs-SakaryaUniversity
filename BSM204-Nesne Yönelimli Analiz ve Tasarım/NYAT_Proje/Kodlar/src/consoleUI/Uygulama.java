package consoleUI;

import business.concretes.SogutucuManager;
import business.concretes.DbDriverFactory;
import business.concretes.EyleyiciManager;
import business.concretes.KullaniciManager;
import business.concretes.SicaklikAlgilayiciManager;
import business.concretes.ArayuzManager;
import core.dataAccess.IDbRepository;
import dataAccess.DbDriverType;


public class Uygulama {

	public static void main(String[] args) {
		/*----- Factory Method kullanimi -----*/
		var dbDriverFactory = new DbDriverFactory();
		IDbRepository sqlSurucusu = dbDriverFactory.getDbDriverByType(DbDriverType.Postgre);
		/*------------------------------------*/

		EyleyiciManager eyleyici = new EyleyiciManager(sqlSurucusu);
		SicaklikAlgilayiciManager sicaklikAlgilayici = new SicaklikAlgilayiciManager(sqlSurucusu);
		ArayuzManager arayuz = new ArayuzManager(eyleyici, sicaklikAlgilayici);
		
		KullaniciManager kullaniciManager = new KullaniciManager(sqlSurucusu);
	
		SogutucuManager sogutucu = new SogutucuManager(arayuz, kullaniciManager);
		sogutucu.basla();

	}

}
