package business.abstracts;

import entity.Kullanici;

public interface IArayuzService {

	void sogutucuAc(Kullanici kullanici);

	void sogutucuKapat(Kullanici kullanici);

	void sicaklikGonder(Kullanici kullanici);

	void subscribe(Observer observer);

	void unsubscribe(Observer observer);
}
