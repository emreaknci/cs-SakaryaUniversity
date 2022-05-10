package entity;

import business.abstracts.Observer;

public class Kullanici extends Observer {

	private int id;
	private String kullaniciAdi;
	private String sifre;

	public Kullanici() {
		super();
	}

	public Kullanici(int id, String kullaniciAdi, String sifre) {
		super();
		this.id = id;
		this.kullaniciAdi = kullaniciAdi;
		this.sifre = sifre;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getKullaniciAdi() {
		return kullaniciAdi;
	}

	public void setKullaniciAdi(String kullaniciAdi) {
		this.kullaniciAdi = kullaniciAdi;
	}

	public String getSifre() {
		return sifre;
	}

	public void setSifre(String sifre) {
		this.sifre = sifre;
	}

	@Override
	public String toString() {
		return "Kullanici [id=" + id + ", kullaniciAdi=" + kullaniciAdi + ", sifre=" + sifre + "]";
	}

	@Override
	public void sicaklikBildir(int sicaklik) {
		System.out.println("----------------------------------------------");
		System.out.println("\"" + getKullaniciAdi() + "\" mevcut sicaklik degeri " + sicaklik + " derece.");
		System.out.println("----------------------------------------------");

	}
}
