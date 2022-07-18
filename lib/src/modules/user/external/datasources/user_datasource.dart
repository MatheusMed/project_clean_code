import 'package:project_clean_code/src/modules/user/domain/errors/errors.dart';

import 'package:uno/uno.dart';

import '../../infra/datasources/user_datasource.dart';

class UserDatasource implements IUserDatasource {
  final Uno uno;

  UserDatasource(this.uno);

  @override
  Future<List> getUsers() async {
    try {
      final response =
          await uno.get('https://jsonplaceholder.typicode.com/users');
      return response.data;
    } catch (e, s) {
      throw DataSouceException(e.toString(), s);
    }
  }
}
