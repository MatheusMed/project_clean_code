import '../../domain/entities/user.dart';

abstract class UserStates {}

class SucessUserStates implements UserStates {
  final List<User> users;

  SucessUserStates(this.users);
}

class EmpityUserStates extends SucessUserStates {
  EmpityUserStates() : super([]);
}

class LoadingUserStates extends UserStates {}

class ErrorUserStates extends UserStates {
  final String message;
  ErrorUserStates(this.message);
}
