import '../entities/user.dart';
import '../errors/errors.dart';
import '../repositories/users_repository.dart';

import 'package:fpdart/fpdart.dart';

abstract class IGetUsers {
  Future<Either<IUserError, List<User>>> call();
}

class GetUsers implements IGetUsers {
  final IUsersRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<IUserError, List<User>>> call() async {
    return await repository.getUsers();
  }
}
