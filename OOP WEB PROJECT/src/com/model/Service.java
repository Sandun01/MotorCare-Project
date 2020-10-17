package com.model;

/**
 * Class implementation Service class
 * @author IT19804316 R.M.K.D.Kumarasiri
 */

public class Service {
	
	private String ServiceNo;
	private String ServiceName;
	private String ServiceDescription;
	private String ServiceAmount;
	
	public Service(String serviceNo, String serviceName, String servicedescription, String serviceAmount) {
		ServiceNo = serviceNo;
		ServiceName = serviceName;
		ServiceDescription = servicedescription;
		ServiceAmount = serviceAmount;
	}

	public String getServiceNo() {
		return ServiceNo;
	}

	public String getServiceName() {
		return ServiceName;
	}

	public String getServicedescription() {
		return ServiceDescription;
	}

	public String getServiceAmount() {
		return ServiceAmount;
	}

}
