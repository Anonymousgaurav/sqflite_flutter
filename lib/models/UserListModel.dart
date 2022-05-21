import 'package:ilaz/models/BaseModel.dart';

class UserListModel extends BaseModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? profileImage;
  Address? address;
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  String? website;

  UserListModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.profileImage,
      this.address,
      this.street,
      this.zipcode,
      this.suite,
      this.city,
      this.website});

  UserListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;

    street = json['street'];
    name = json['name'];
    zipcode = json['zipcode'];
    suite = json['suite'];
    city = json['city'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['website'] = this.website;
    if (this.address != null) {
      Map<String, dynamic> addressMap = this.address!.toJson();
      addressMap.forEach((key, value) {
        if (key == 'street') {
          data['street'] = value;
          this.street = data['street'];
        } else if (key == 'suite') {
          data['suite'] = value;
          this.suite = data['suite'];
        } else if (key == 'city') {
          data['city'] = value;
          this.city = data['city'];
        } else if (key == 'zipcode') {
          data['zipcode'] = value;
          this.zipcode = data['zipcode'];
        }
      });
    }
    return data;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'] as String;
    suite = json['suite'] as String;
    city = json['city'] as String;
    zipcode = json['zipcode'] as String;
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    if (this.geo != null) {
      data['geo'] = this.geo!.toJson();
    }
    return data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catchPhrase'] = this.catchPhrase;
    data['bs'] = this.bs;
    return data;
  }
}
