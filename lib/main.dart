import 'package:flutter/material.dart';
import 'package:movies/app_blocs.dart';
import 'package:movies/app_cubits.dart';
import 'package:movies/app_repositories.dart';
import 'package:movies/constants/app_colors.dart';
import 'package:movies/screens/splash_screen/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AppRepositories(
      child: AppBlocs(
        child: AppCubits(
          child: MaterialApp(
            title: 'Movies',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.secondaryColor.withOpacity(0.6),
              ),
              useMaterial3: true,
              primarySwatch: Colors.purple,
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  backgroundColor: AppColors.secondaryColor,
                  padding: const EdgeInsets.all(8),
                  fixedSize: const Size(360, 60),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
