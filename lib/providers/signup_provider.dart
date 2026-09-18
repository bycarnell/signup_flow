import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:signup_flow/models/signup_data.dart';

part 'signup_provider.g.dart';

@riverpod
class Signup extends _$Signup {
  @override
  SignupData build() => const SignupData();

  void updatePersonalInfo({required String firstName, required String lastName}) {
    state = state.copyWith(firstName: firstName, lastName: lastName);
  }

  void updateContact({required String email, required String password}) {
    state = state.copyWith(email: email, password: password);
  }

  void updateTermsAccepted(bool accepted) {
    state = state.copyWith(termsAccepted: accepted);
  }
}
