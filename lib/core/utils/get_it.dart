import 'package:books_app/feature/home/data/data_source/home_local_data_source.dart';
import 'package:books_app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:books_app/feature/home/domain/repo/home_repo_implemention.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(),
    ),
  );
}
