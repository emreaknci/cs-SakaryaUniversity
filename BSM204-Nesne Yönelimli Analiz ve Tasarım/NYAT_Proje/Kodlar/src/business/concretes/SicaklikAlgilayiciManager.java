package business.concretes;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import business.abstracts.ISicaklikAlgiliayiciService;
import business.abstracts.Observer;
import core.dataAccess.IDbRepository;
import entity.Kullanici;

public class SicaklikAlgilayiciManager implements ISicaklikAlgiliayiciService {

	private int sicaklik;
	private Random rnd;
	private List<Observer> observers;
	private IDbRepository db;

	public SicaklikAlgilayiciManager(IDbRepository db) {
		rnd = new Random();
		sicaklik = rnd.nextInt(15, 25);
		this.db = db;
		observers = new ArrayList<Observer>();
	}

	@Override
	public int sicaklikOku(Kullanici kullanici) {
		if (db.mevcutDurumGonder() == 1)
			sicaklik -= 5;
		else if (db.mevcutDurumGonder() == 2)
			sicaklik += 5;

		if (sicaklik <= 0)
			sicaklik = 0;
		return sicaklik;
	}

	@Override
	public void subscribeObserver(Observer observer) {
		observers.add(observer);
	}

	@Override
	public void unsubscribeObserver(Observer observer) {
		observers.remove(observer);
	}

	@Override
	public void notifyObserver() {
		observers.forEach(o -> o.sicaklikBildir(sicaklik));
	}

}
