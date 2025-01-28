class City {
  String? cityId;
  String? cityName;
  String? searchName;
  // int? pincode;
  String? state;
  String? description;
  bool? isActiveForResidents = false;
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

  City(
      {this.isActiveForResidents,
      this.searchName,
      // this.pincode,
      this.cityId,
      this.cityName,
      this.state,
      this.description,
      this.createdDate,
      this.createdBy,
      this.createdTime});

  City.fromJson(Map<String, dynamic> json) {
    cityId = json['cityId'];
    // pincode = json['pincode'];
    cityName = json['cityName'];
    searchName = json['searchName'];
    state = json['state'];
    description = json['description'];
    isActiveForResidents = json['isActiveForResidents'];
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
    data['cityId'] = cityId;
    data['cityName'] = cityName;
    data['searchName'] = searchName;
    data['state'] = state;
    data['description'] = description;
    // data['pincode'] = pincode;
    data['isActiveForResidents'] = isActiveForResidents;

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