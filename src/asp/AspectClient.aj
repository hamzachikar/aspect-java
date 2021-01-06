package asp;

import java.util.Date;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

import application.beans.Client;

public aspect AspectClient {
	private static Logger logger=Logger.getLogger(AspectClient.class.getName());
	
	pointcut retirer():call(void application.beans.Client.retirer(*));
	pointcut verser():call(void application.beans.Client.verser(*));
	
	Object around():retirer(){
		
		Client client=(Client) (thisJoinPoint.getTarget());
		logger.info("init method : retirer()=====>client name: "+client.getNom());
		Date initDate=new Date();
		double price=((Double)(thisJoinPoint.getArgs()[0])).doubleValue();
		System.out.println(price);
		if(price<client.getCp().getSolde()) {
			Object ret=proceed();
			logger.info("end method retirer======> time process: "+(System.currentTimeMillis()-initDate.getTime()));
			return ret;
		}
		else{
			logger.error("the wanted price is greater than the credits");
			return null;
		}
			
		
	}
	Object around():verser(){
		Client client=(Client) (thisJoinPoint.getTarget());
		Date initDate=new Date();
		logger.info("init method : verser()=====>client name: "+client.getNom());
		Object ret=proceed();
		logger.info("end method retirer======> time process: "+(System.currentTimeMillis()-initDate.getTime()));
		return ret;
	}
	
}
