import 'test_datasource_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:delivery/core/api/api_manager/api_manager.dart';

@Injectable(as: TestDatasourceRepo)
class TestDatasourceRepoImpl implements TestDatasourceRepo {
  final ApiService apiService;
  TestDatasourceRepoImpl(this.apiService);

}
