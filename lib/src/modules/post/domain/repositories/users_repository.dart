import 'package:fpdart/fpdart.dart';
import 'package:project_clean_code/src/modules/post/domain/entities/user.dart';

import '../errors/errors.dart';

abstract class IUsersRepository {
  Future<Either<IUserError, List<User>>> getUsers();
}
