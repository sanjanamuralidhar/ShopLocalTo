abstract class UpdateEvent {}

class OnUpdate extends UpdateEvent {
  final String username;
  final String email;
  final String phone;
  final String address;
  final String info;
  final String website;

OnUpdate({this.phone, this.address, this.info, this.website, this.username,this.email,});
}

class AfterUpdate extends UpdateEvent {
  AfterUpdate();
}