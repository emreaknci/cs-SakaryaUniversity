package business.concretes;

import java.util.Scanner;

import business.abstracts.ISogutucuService;
import business.abstracts.IKullaniciService;
import business.abstracts.IArayuzService;
import core.Araclar;
import entity.Kullanici;

public class SogutucuManager implements ISogutucuService {

	private Scanner input;

	private IArayuzService arayuz;
	private IKullaniciService kullaniciService;

	public SogutucuManager(IArayuzService arayuz, IKullaniciService kullaniciService) {
		super();
		this.arayuz = arayuz;
		this.kullaniciService = kullaniciService;
	}

	@Override
	public void basla() {
		String kullaniciAdi = "";
		String sifre = "";
		Kullanici kullanici = null;
		do {
			System.out.println("Kullanici adinizi giriniz...");
			kullaniciAdi = veriAl();
			boolean kullaniciVarMi = kullaniciService.kullaniciAdiDogrula(kullaniciAdi);
			if (kullaniciVarMi) {
				System.out.println("Sifrenizi giriniz...");
				sifre = veriAl();
				boolean sifreDogruMu = kullaniciService.sifreDogrula(kullaniciAdi, sifre);
				int hak = 3;
				while (!sifreDogruMu) {
					hak--;
					if (hak >= 1) {
						System.out.println(" " + hak + " hakkiniz kaldi.");
						System.out.println("Lutfen sifrenizi tekrar giriniz...");
						sifre = veriAl();
						sifreDogruMu = kullaniciService.sifreDogrula(kullaniciAdi, sifre);
					}

					else if (hak < 1) {
						System.out.println(
								"Hesabiniz gecici sureligine bloke edilmistir! Daha hizli bir cozum icin bizimle iletisime gecin.\n");
						break;
					}
				}
				if (sifreDogruMu) {
					kullanici = kullaniciService.kullaniciDondur(kullaniciAdi, sifre);
					arayuz.subscribe(kullanici);
					islemYap(kullanici);
				}
			}
		} while (kullanici == null || kullaniciAdi == "" || kullaniciAdi == " ");

	}

	private void islemYap(Kullanici kullanici) {
		int secim = 0;
		do {
			Araclar.bekle(750);
			System.out.println("\nAna menu yukleniyor...\n");
			anaMenu();
			System.out.println("Secim yapiniz");
			secim = Integer.parseInt(veriAl());
			if (secim == 1) {
				arayuz.sogutucuAc(kullanici);
			}

			else if (secim == 2) {
				arayuz.sogutucuKapat(kullanici);
			}

			else if (secim == 3) {
				arayuz.sicaklikGonder(kullanici);
			}

			else if (secim == 4) {
				cikisYap(kullanici);
			}

			else {
				System.out.println("Hatali secim! Lutfen yeniden deneyiniz.");
			}
		} while (secim != 4);
	}

	private void cikisYap(Kullanici kullanici) {
		System.out.println("Cikis yapiliyor...");
		Araclar.bekle(1000);
		System.out.println("Uygulama sonlandiriliyor...");
		Araclar.bekle(1000);
		System.out.println("Uygulama sonlandirildi.\n");
	}

	private void anaMenu() {
		Araclar.bekle(1500);
		System.out.println("**********************************************");
		System.out.println("Ana Menu");
		System.out.println("1-Sogutucuyu ac");
		System.out.println("2-Sogutucuyu kapat");
		System.out.println("3-Sicakligi goruntule");
		System.out.println("4-Cikis");
		System.out.println("**********************************************");
	}

	private String veriAl() {
		input = new Scanner(System.in);
		return input.nextLine();
	}
}
