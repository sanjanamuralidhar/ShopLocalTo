// ignore: avoid_web_libraries_in_flutter
abstract class UpdateEvent {}

class OnUpdate extends UpdateEvent {
  final String username;
  final String email;
  final String phone;
  final String address;
  final String info;
  final String website;

  OnUpdate({this.username, this.email, this.phone, this.address, this.info, this.website});
}

class AfterUpdate extends UpdateEvent {
  AfterUpdate();
}