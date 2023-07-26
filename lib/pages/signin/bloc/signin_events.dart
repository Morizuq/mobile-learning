/*We need an abstract class because the use of an
 abstract class provides a clear and structured way to 
 represent the different events that can occur*/
abstract class SignInEvent {
  const SignInEvent(); //Constructor
}

class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(this.password);
}
