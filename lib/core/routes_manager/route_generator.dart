import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manager/routes.dart';
import 'package:movies_app/features/home_tab/home_screen.dart';
import 'package:movies_app/features/splash/splash_screen.dart';


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case Routes.onBoardingScreenRoute:
      //   return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      // case Routes.welcome:
      //   return MaterialPageRoute(builder: (_) => WelcomeScreen());
      // case Routes.search:
      //   return MaterialPageRoute(builder: (_) => SearchScreen());
      // case Routes.map:
      //   return MaterialPageRoute(builder: (_) => MapSample());
      // case Routes.messages:
      //   return MaterialPageRoute(builder: (_) => ChatScreen());
      // case Routes.profile:
      //   return MaterialPageRoute(builder: (_) => ProfileScreen());
      // case Routes.mainLayout:
      //   return MaterialPageRoute(builder: (_) => MainLayout());
      //
      // case Routes.signInWorker:
      //   return MaterialPageRoute(builder: (_) => const SignInWorker());
      //
      // case Routes.signInWorkerLogin:
      //   return MaterialPageRoute(
      //     builder: (_) => const SignInWorkerLoginScreen(),
      //   );
      //
      // case Routes.workerMainLayout:
      //   return MaterialPageRoute(builder: (_) => const WorkerMainLayout());
      //
      // case Routes.signInRoute:
      //   return MaterialPageRoute(builder: (_) => const SignInScreen());
      //
      // case Routes.signUpRoute:
      //   return MaterialPageRoute(builder: (_) => SignUpScreen());
      // case Routes.searchResultsRoute:
      //   final searchTerm = settings.arguments as String? ?? '';
      //   return MaterialPageRoute(
      //     builder: (_) => SearchResultsScreen(searchTerm: searchTerm),
      //   );
      // case Routes.workerProfileRoute:
      //   final worker = settings.arguments as SearchWorker?;
      //   if (worker == null) {
      //     return unDefinedRoute();
      //   }
      //   return MaterialPageRoute(
      //     builder: (_) => WorkerProfileScreen(worker: worker),
      //   );
      // case Routes.favoritesRoute:
      //   return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      // case Routes.editProfileRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<WorkerProfileCubit>(
      //       create: (_) => getIt<WorkerProfileCubit>()..getProfile(),
      //       child: const WorkerEditProfileScreen(),
      //     ),
      //   );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
