import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_clean_code/src/modules/post/domain/repositories/users_repository.dart';
import 'package:project_clean_code/src/modules/post/domain/usecases/get_users.dart';
import 'package:project_clean_code/src/modules/post/infra/repositories/user_repository.dart';
import 'package:project_clean_code/src/modules/post/presenter/pages/post_page.dart';
import 'package:uno/uno.dart';
import 'external/datasources/user_datasource.dart';
import 'infra/datasources/user_datasource.dart';
import 'presenter/store/user_store.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        // Utils
        Bind.factory((i) => Uno()),

        // datasource
        Bind.factory<IUserDatasource>((i) => UserDatasource(i())),

        // repository
        Bind.factory<IUsersRepository>((i) => UserRepository(i())),

        //usercase
        Bind.factory((i) => GetUsers(i())),

        //stores
        Bind.singleton((i) => UserStore(i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const UserPage()),
      ];
}
