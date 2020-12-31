abstract class SignUpEvent {}

class OnSignUp extends SignUpEvent {
  final String username;
  final String email;
  final String password;
  final String phone;
  final String location;

  OnSignUp({this.username,this.email, this.password,this.phone,this.location});
}

class OnSignOut extends SignUpEvent {
  OnSignOut();
}