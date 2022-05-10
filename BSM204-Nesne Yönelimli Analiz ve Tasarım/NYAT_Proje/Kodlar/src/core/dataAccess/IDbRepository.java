package core.dataAccess;

import entity.Kullanici;

public interface IDbRepository {
	public Kullanici kullaniciDondur(String ad, String sifre);

	public boolean kullaniciAdiDogrula(String ad);

	public boolean sifreDogrula(String ad, String sifre);

	public void durumGuncelle(int durumId, Kullanici kullanici);

	public int mevcutDurumGonder();
}
