package business.concretes;



import business.abstracts.IEyleyiciService;
import business.abstracts.ISicaklikAlgiliayiciService;
import business.abstracts.IArayuzService;
import business.abstracts.Observer;
import entity.Kullanici;

public class ArayuzManager implements IArayuzService {

	private IEyleyiciService eyleyiciService;
	private ISicaklikAlgiliayiciService sicaklikAlgiliayiciService;

	public ArayuzManager(IEyleyiciService eyleyiciService,
			ISicaklikAlgiliayiciService sicaklikAlgiliayiciService) {
		super();
		this.eyleyiciService = eyleyiciService;
		this.sicaklikAlgiliayiciService = sicaklikAlgiliayiciService;
	}

	@Override
	public void sogutucuAc(Kullanici kullanici) {
		eyleyiciService.sogutucuAc(kullanici);
	}

	@Override
	public void sogutucuKapat(Kullanici kullanici) {
		eyleyiciService.sogutucuKapat(kullanici);
	}

	@Override
	public void sicaklikGonder(Kullanici kullanici) {
		int sicaklik=sicaklikAlgiliayiciService.sicaklikOku(kullanici);
		System.out.println("Sicaklik: "+sicaklik+" derece\n");
		sicaklikAlgiliayiciService.notifyObserver();
	}

	@Override
	public void subscribe(Observer observer) {
		sicaklikAlgiliayiciService.subscribeObserver(observer);
	}

	@Override
	public void unsubscribe(Observer observer) {
		sicaklikAlgiliayiciService.unsubscribeObserver(observer);
	}

}
