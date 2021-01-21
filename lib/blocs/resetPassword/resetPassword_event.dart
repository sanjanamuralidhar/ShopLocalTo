abstract class ResetEvent {}

class OnReset extends ResetEvent {
  final String password;
  final String confirm_password;

OnReset({this.confirm_password,this.password});
}

class AfterReset extends ResetEvent {
  AfterReset();
}