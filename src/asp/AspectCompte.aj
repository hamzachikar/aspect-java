package asp;

import java.util.Date;

import org.apache.log4j.Logger;

public aspect AspectCompte {
	private static Logger logger=Logger.getLogger(AspectCompte.class.getName());
	private Date initDate;
	private Date endDate; 
	pointcut debiter():call(void application.beans.Compte.debiter(*));
	pointcut approvisionner():call(void application.beans.Compte.approvisionner(*));
	before() : debiter(){
		this.initDate=new Date(System.currentTimeMillis());
		logger.info("start method debiter");
	}
	before() : approvisionner(){
		this.initDate=new Date(System.currentTimeMillis());
		logger.info("start method approvisionner");
	}
	after() : debiter(){
		this.endDate=new Date(System.currentTimeMillis());
		logger.info("end method debiter======> time process: "+(this.endDate.getTime()-this.initDate.getTime()));
	}
	after() : approvisionner(){
		this.endDate=new Date(System.currentTimeMillis());
		logger.info("end method approvisionner======> time process:"+(this.endDate.getTime()-this.initDate.getTime()));
	}
}
