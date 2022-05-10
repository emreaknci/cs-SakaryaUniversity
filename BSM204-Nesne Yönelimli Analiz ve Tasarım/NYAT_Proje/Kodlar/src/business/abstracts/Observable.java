package business.abstracts;

public interface Observable {
	void subscribeObserver(Observer observer);

	void unsubscribeObserver(Observer observer);

	void notifyObserver();
}