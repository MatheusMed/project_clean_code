import 'package:flutter/material.dart';
import 'package:project_clean_code/src/modules/user/domain/usecases/get_users.dart';
import 'package:project_clean_code/src/modules/user/presenter/states/user_states.dart';

class UserStore extends ValueNotifier<UserStates> {
  UserStore(this.getUsers) : super(EmpityUserStates());

  final IGetUsers getUsers;

  void emit(UserStates newState) => value = newState;

  Future<void> fetchUser() async {
    emit(LoadingUserStates());

    final result = await getUsers.call();

    final newState = result.fold((l) {
      return ErrorUserStates(l.message);
    }, (r) {
      return SucessUserStates(r);
    });

    emit(newState);
  }
}
