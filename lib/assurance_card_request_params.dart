class AssuranceCardRequestParams {
	String carHeadPhoto;
	int driverId;
	String orderSn;
	num latitude;
	List<AssuranceCardRequestParamsTyreinfolist> tyreInfoList;
	String bigCustomOrderSn;
	String driverName;
	String driverPhone;
	String userType;
	String carLicense;
	num longitude;

	AssuranceCardRequestParams({this.carHeadPhoto, this.driverId, this.orderSn, this.latitude, this.tyreInfoList, this.bigCustomOrderSn, this.driverName, this.driverPhone, this.userType, this.carLicense, this.longitude});

	AssuranceCardRequestParams.fromJson(Map<String, dynamic> json) {
		carHeadPhoto = json['carHeadPhoto'];
		driverId = json['driverId'];
		orderSn = json['orderSn'];
		latitude = json['latitude'];
		if (json['tyreInfoList'] != null) {
			tyreInfoList = new List<AssuranceCardRequestParamsTyreinfolist>();
			(json['tyreInfoList'] as List)
					.forEach((v) {
						tyreInfoList.add(new AssuranceCardRequestParamsTyreinfolist.fromJson(v));
			     });
		}
		bigCustomOrderSn = json['bigCustomOrderSn'];
		driverName = json['driverName'];
		driverPhone = json['driverPhone'];
		userType = json['userType'];
		carLicense = json['carLicense'];
		longitude = json['longitude'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['carHeadPhoto'] = this.carHeadPhoto;
		data['driverId'] = this.driverId;
		data['orderSn'] = this.orderSn;
		data['latitude'] = this.latitude;
		if (this.tyreInfoList != null) {
      data['tyreInfoList'] =  this.tyreInfoList.map((v) => v.toJson()).toList();
    }
		data['bigCustomOrderSn'] = this.bigCustomOrderSn;
		data['driverName'] = this.driverName;
		data['driverPhone'] = this.driverPhone;
		data['userType'] = this.userType;
		data['carLicense'] = this.carLicense;
		data['longitude'] = this.longitude;
		return data;
	}
}

class AssuranceCardRequestParamsTyreinfolist {
	int itemId;
	String serialNum;
	String tyrecode;
	String storeName;
	int storeUserId;
	String title;
	int skuId;

	AssuranceCardRequestParamsTyreinfolist({this.itemId, this.serialNum, this.tyrecode, this.storeName, this.storeUserId, this.title, this.skuId});

	AssuranceCardRequestParamsTyreinfolist.fromJson(Map<String, dynamic> json) {
		itemId = json['itemId'];
		serialNum = json['serialNum'];
		tyrecode = json['tyrecode'];
		storeName = json['storeName'];
		storeUserId = json['storeUserId'];
		title = json['title'];
		skuId = json['skuId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['itemId'] = this.itemId;
		data['serialNum'] = this.serialNum;
		data['tyrecode'] = this.tyrecode;
		data['storeName'] = this.storeName;
		data['storeUserId'] = this.storeUserId;
		data['title'] = this.title;
		data['skuId'] = this.skuId;
		return data;
	}
}
