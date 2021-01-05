package asp;

import org.apache.log4j.Logger;

public aspect AspectClient {
	private static Logger logger=Logger.getLogger(AspectClient.class.getName());
	pointcut retirer():call(void application.beans.Client.retirer(*));
	pointcut verser():call(void application.beans.Client.verser(*));
	before() : retirer(){
		logger.info("before method retirer");
	}
	before() : verser(){
		logger.info("before method verser");
	}
	
}
