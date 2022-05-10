package business.abstracts;

import entity.Kullanici;

public interface ISicaklikAlgiliayiciService extends Observable{
	int sicaklikOku(Kullanici kullanici);

}
