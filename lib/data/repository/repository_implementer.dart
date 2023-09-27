import '../../domain/repository/repository.dart';
import '../newtwok/app_api.dart';
import '../newtwok/network_info.dart';

class RepositoryImplementer extends Repository {
  final AppServiceClient appServiceClient;
  final NetworkInfo networkInfo;

  RepositoryImplementer(
      {required this.appServiceClient, required this.networkInfo});
}
