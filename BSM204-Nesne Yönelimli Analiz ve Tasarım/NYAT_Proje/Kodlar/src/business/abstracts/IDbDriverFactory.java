package business.abstracts;

import core.dataAccess.IDbRepository;
import dataAccess.DbDriverType;

public interface IDbDriverFactory {
	IDbRepository getDbDriverByType(DbDriverType type);
}
