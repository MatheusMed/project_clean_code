import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:project_clean_code/src/modules/user/presenter/states/user_states.dart';
import 'package:project_clean_code/src/modules/user/presenter/store/user_store.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    context.read<UserStore>().fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<UserStore>();

    final state = store.value;

    Widget child = Container();

    if (state is LoadingUserStates) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is ErrorUserStates) {
      child = Center(
        child: Text(state.message),
      );
    }

    if (state is SucessUserStates) {
      final listUser = state.users;
      child = ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (_, idx) {
          final user = listUser[idx];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: child,
    );
  }
}
