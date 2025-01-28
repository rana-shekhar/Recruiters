class Area {
  String? areaId;
  String? cityId;
  String? areaName;
  String? searchName;
  String? areaMc;
  String? landmark;
  String? areaContactNumber;
  int?count;

  String? groupId = "1";
  bool? isVerified = false;
  bool? isActive = true;
  String? lastUpdatedBy = "";
  String? lastUpdatedDate = "";
  String? lastUpdatedTime = "";
  String? createdBy = "";
  String? createdDate = "";
  String? createdTime = "";

  Area(
      {required this.areaId,
      this.cityId,
      this.areaName,
      this.areaMc,
      this.landmark,
      this.areaContactNumber,
      this.createdDate,
      this.createdBy,
      this.searchName,
      this.createdTime});

  Area.fromJson(Map<String, dynamic> json) {
    areaId = json['areaId'];
    cityId = json['cityId'];
    areaName = json['areaName'];
    searchName = json['searchName'];
    areaMc = json['areaMc'];
    landmark = json['landmark'];
    areaContactNumber = json['areaContactNumber'];
    count = json['count'];

    groupId = json['groupId'];
    isVerified = json['isVerified'];
    isActive = json['isActive'];
    lastUpdatedBy = json['lastUpdatedBy'];
    lastUpdatedDate = json['lastUpdatedDate'];
    lastUpdatedTime = json['lastUpdatedTime'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    createdTime = json['createdTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['areaId'] = areaId;
    data['cityId'] = cityId;
    data['areaName'] = areaName;
    data['areaMc'] = areaMc;
    data['landmark'] = landmark;
    data['areaContactNumber'] = areaContactNumber;
    data['searchName'] = searchName;
    data['groupId'] = groupId;
    data['isVerified'] = isVerified;
    data['isActive'] = isActive;
    data['lastUpdatedBy'] = lastUpdatedBy;
    data['lastUpdatedDate'] = lastUpdatedDate;
    data['lastUpdatedTime'] = lastUpdatedTime;
    data['createdBy'] = createdBy;
    data['createdDate'] = createdDate;
    data['createdTime'] = createdTime;

    return data;
  }
}