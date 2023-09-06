import 'package:bloc_learning/pages/signin/bloc/signin_events.dart';
import 'package:bloc_learning/pages/signin/bloc/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>((event, emit) => {
          print(event.password),
          emit(state.copyWith(password: event.password))
        });
  }
  //Seperating the event from the Body
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) => {
        print("This is the typed in email ${event.email}"),
        emit(state.copyWith(email: event.email))
      };

  // void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) =>
  //     emit(state.copyWith(password: event.password));
}
