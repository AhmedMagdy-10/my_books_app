import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/core/utils/get_it.dart';
import 'package:books_app/core/utils/simple_bloc_observer.dart';
import 'package:books_app/feature/home/domain/UseCase/get_main_books_use_case.dart';
import 'package:books_app/feature/home/domain/UseCase/get_newest_books_use_case.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/domain/repo/home_repo_implemention.dart';
import 'package:books_app/feature/presentation/manager/cubit/books_cubit.dart';
import 'package:books_app/feature/presentation/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(boxName);
  await Hive.openBox(newestBookBox);

  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(
        getMainBooksUseCase: GetMainBooksUseCase(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),

        getNewestBooksUseCase: GetNewestBooksUseCase(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mainColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),

        home: SplashView(),
      ),
    );
  }
}
