package business.concretes;

import business.abstracts.IDbDriverFactory;
import core.dataAccess.IDbRepository;
import dataAccess.DbDriverType;
import dataAccess.PostgreSQLSurucusu;
import dataAccess.SanalVeritabaniSurucusu;

public class DbDriverFactory implements IDbDriverFactory {

	@Override
	public IDbRepository getDbDriverByType(DbDriverType type) {
		IDbRepository dbDriver = null;
		switch (type) {
		case Postgre:
			dbDriver = new PostgreSQLSurucusu();
			break;
		case Sanal:
			dbDriver = new SanalVeritabaniSurucusu();
			break;

		default:
			break;
		}

		return dbDriver;
	}

}
