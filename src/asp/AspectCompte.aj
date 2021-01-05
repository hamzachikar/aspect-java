package asp;

import org.apache.log4j.Logger;

public aspect AspectCompte {
	private static Logger logger=Logger.getLogger(AspectCompte.class.getName());
	pointcut debiter():call(void application.beans.Compte.debiter(*));
	pointcut approvisionner():call(void application.beans.Compte.approvisionner(*));
	before() : debiter(){
		logger.info("before method debiter");
	}
	before() : approvisionner(){
		logger.info("before method approvisionner");
	}
}
