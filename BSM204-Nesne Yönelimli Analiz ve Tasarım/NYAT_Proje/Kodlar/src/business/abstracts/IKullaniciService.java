package business.abstracts;

import entity.Kullanici;

public interface IKullaniciService {

	Kullanici kullaniciDondur(String ad, String sifre);

	boolean kullaniciAdiDogrula(String ad);

	boolean sifreDogrula(String ad, String sifre);
}
