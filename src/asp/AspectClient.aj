package asp;

import java.util.Date;

import org.apache.log4j.Logger;

public aspect AspectClient {
	private static Logger logger=Logger.getLogger(AspectClient.class.getName());
	private Date initDate;
	private Date endDate; 
	pointcut retirer():call(void application.beans.Client.retirer(*));
	pointcut verser():call(void application.beans.Client.verser(*));
	before() : retirer(){
		this.initDate=new Date(System.currentTimeMillis());
		logger.info("start method retirer");
	}
	before() : verser(){
		this.initDate=new Date(System.currentTimeMillis());
		logger.info("start method verser");
	}
	after() : retirer(){
		this.endDate=new Date(System.currentTimeMillis());
		logger.info("end method retirer======> time process: "+(this.endDate.getTime()-this.initDate.getTime()));
	}
	after() : verser(){
		this.endDate=new Date(System.currentTimeMillis());
		logger.info("end method verser======> time process: "+(this.endDate.getTime()-this.initDate.getTime()));
	}
	
}
