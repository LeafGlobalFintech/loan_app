import 'package:loan_app/features/authentication/authentication.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationResult> login({
    required String username,
    required String password,
  });
}