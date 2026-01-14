import 'package:books_app/core/utils/constants.dart';
import 'package:books_app/core/utils/get_it.dart';
import 'package:books_app/core/utils/simple_bloc_observer.dart';
import 'package:books_app/feature/home/domain/UseCase/get_main_books_use_case.dart';
import 'package:books_app/feature/home/domain/UseCase/get_newest_books_use_case.dart';
import 'package:books_app/feature/home/domain/entities/book_entity.dart';
import 'package:books_app/feature/home/domain/repo/home_repo_implemention.dart';
import 'package:books_app/feature/home/presentation/manager/cubit/books_cubit.dart';
import 'package:books_app/feature/home/presentation/manager/newestBook/newest_book_cubit.dart';
import 'package:books_app/feature/splashView/presentation/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(boxName);
  await Hive.openBox<BookEntity>(newestBookBox);
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BooksCubit(
            getMainBooksUseCase: GetMainBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..getMainBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getNewestBooksUseCase: GetNewestBooksUseCase(
              homeRepo: getIt.get<HomeRepoImpl>(),
            ),
          )..getNewestBooks(),
        ),
      ],

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
