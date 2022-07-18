import 'package:project_clean_code/src/modules/user/infra/adapters/user_adapters.dart';
import 'package:project_clean_code/src/modules/user/infra/datasources/user_datasource.dart';

import '../../domain/errors/errors.dart';
import '../../domain/entities/user.dart';
import 'package:fpdart/src/either.dart';
import '../../domain/repositories/users_repository.dart';

class UserRepository extends IUsersRepository {
  final IUserDatasource userDatasource;

  UserRepository(this.userDatasource);

  @override
  Future<Either<IUserError, List<User>>> getUsers() async {
    try {
      final listUser = await userDatasource.getUsers();

      final user = listUser.map(UserAdapters.fromJson).toList();

      return right(user);
    } on IUserError catch (e) {
      return left(e);
    }
  }
}
