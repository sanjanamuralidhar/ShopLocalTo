class UserModel {
 int id;
 String name;
 String nickname;
 String image;
 String link;
 String level;
 String description;
 String tag;
 double rate;
 String token;
  String email;
  String phone;
String location;
String address;
String city;
String province;
// String country;
 

  UserModel(
    this.id,
    this.name,
    this.nickname,
    this.image,
    this.link,
    this.level,
    this.description,
    this.tag,
    this.rate,
    this.token,
    this.email,
    this.location,
    this.phone,
    this.address,
    this.city,
    this.province,
  );

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    nickname = json['nickname'];
    image= json['profile_image'];
    link = json['link'];
    level = json['level'];
    description = json['description'];
    tag = json['tag'];
    rate = json['rate'];
    token = json['access_token'];
    email = json['email'];
    location = json['location'];
    phone=json['phone'];
    address=json['address'];
    city = json['city'];
    province=json['province'];
    
  }

  @override
  String toString() {
    return toJson().toString();
  }

 static List<UserModel> listFromJson(List<dynamic> json) {
    return json == null
        ? List<UserModel>()
        : json.map((value) => UserModel.fromJson(value)).toList();
  }
  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     json['id'] as int ?? 0,
  //     json['full_name'] as String ?? 'Unknown',
  //     json['nickname'] as String ?? 'Unknown',
  //     json['photo'] as String ?? 'Unknown',
  //     json['url'] as String ?? 'Unknown',
  //     json['level'] as String ?? 'Unknown',
  //     json['description'] as String ?? 'Unknown',
  //     json['tag'] as String ?? 'Unknown',
  //     json['rate'] as double ?? 0.0,
  //     json['token'] as String ?? 'Unknown',
  //     json['email'] as String ?? 'Unknown',
  //     json['phone'] as String ?? 'Unknown',
  //     json['location'] as String ?? 'Unknown',
  //   );
  // }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if(name!=null) json['name']=name;
    if(nickname!=null) json['nickname']=nickname;
    if(image!=null) json['photo']=image;
    if(link!=null) json['link']=link;
    if(level!=null) json['level']=level;
    if(description!=null) json['description']=description;
    if(tag!=null) json['tag']=tag;
    if(rate!=null) json['rate']=rate;
    if(token!=null) json['access_token']=token;
    if(email!=null) json['email']=email;
    if(location!=null) json['location']=location;
    if(phone!=null) json['phone']=phone;
    return json;
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'full_name': name,
  //     'nickname': nickname,
  //     'photo': image,
  //     'url': link,
  //     'level': level,
  //     'description': description,
  //     'tag': tag,
  //     'rate': rate,
  //     'token': token,
  //     'email': email,
  //     'phone':phone,
  //     'location': location
  //   };
  // }
}
