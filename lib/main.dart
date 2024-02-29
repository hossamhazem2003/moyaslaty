import 'package:flutter/material.dart';
import 'package:mwaslaty/ui/ahadeth%20screen/ahadeth_screen.dart';
import 'package:mwaslaty/ui/ahadeth%20screen/hadeth%20screen/hadeth_screen.dart';
import 'package:mwaslaty/ui/quran%20records%20screen/quran_records_screen.dart';
import 'package:mwaslaty/ui/quran%20records%20screen/quran_records_vm.dart';
import 'package:mwaslaty/ui/home%20screen/home_screen.dart';
import 'package:mwaslaty/ui/ogra%20screen/ogra_screen.dart';
import 'package:mwaslaty/ui/ogra%20screen/ogra_view_model.dart';
import 'package:mwaslaty/ui/quran%20records%20screen/souras_records_screen.dart';
import 'package:mwaslaty/ui/quran%20screen/quran_screen.dart';
import 'package:mwaslaty/ui/quran%20screen/soura%20screen/soura_screen.dart';
import 'package:mwaslaty/ui/splash%20screen/splash_screen.dart';
import 'package:mwaslaty/ui/books%20screen/books_caregories_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'ui/ahadeth screen/ahadeth_screen_vm.dart';
import 'ui/quran screen/quran_screen_vm.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OgraViewModel()),
        ChangeNotifierProvider(create: (_) => AhadethScreenVm()),
        ChangeNotifierProvider(create: (_) => SouraScreenVm()),
        ChangeNotifierProvider(create: (_) => BodcastScreenVM())
      ],
      child: MaterialApp(
        home: const Directionality(
            textDirection: TextDirection.rtl, child: SplashScreen()),
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          AhadethScreen.routeName: (context) => const AhadethScreen(),
          // ignore: equal_keys_in_map
          HadethScreen.routeName: (context) => const HadethScreen(),
          QuranRecordsScreen.routeName: (context) => const QuranRecordsScreen(),
          SouraRecScreen.routeName: (context) => const SouraRecScreen(),
          OgraScreen.routeName: (context) => const OgraScreen(),
          QuranScreen.routeName: (context) => const QuranScreen(),
          // ignore: equal_keys_in_map
          BooksCategoriesScreen.routeName: (context) =>
              const BooksCategoriesScreen(),
          // ignore: equal_keys_in_map
          SouraScreen.routeName: (context) => const SouraScreen(),
        },
      ),
    );
  }
}
