abstract class SignUpState {}

class InitialSignUpState extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpFail extends SignUpState {
  final String message;

  SignUpFail(this.message);
}

class SignUpSuccess extends SignUpState {

}

class SignOutLoading extends SignUpState {}

class SignOutFail extends SignUpState {
  final String message;

  SignOutFail(this.message);
}

class SignOutSuccess extends SignUpState {}
