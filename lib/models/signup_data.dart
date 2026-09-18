class SignupData {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final bool termsAccepted;

  const SignupData({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.termsAccepted = false,
  });

  SignupData copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    bool? termsAccepted,
  }) {
    return SignupData(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      termsAccepted: termsAccepted ?? this.termsAccepted,
    );
  }
}
