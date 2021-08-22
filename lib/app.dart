import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant/colors.dart';
import 'screens/screen_0.dart';
import 'screens/screen_1.dart';
import 'screens/screen_2.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WidgetsApp(
        color: ProjectColor.white,
        textStyle: GoogleFonts.roboto(),
        debugShowCheckedModeBanner: false,
        routes: {
          Screen1.routeName: (context) => const Screen1(),
          Screen0.routeName: (context) => const Screen0(),
          Screen2.routeName: (context) => const Screen2(),
        },
        pageRouteBuilder: _pageRouteBuilder,
      );

  PageRoute<T> _pageRouteBuilder<T>(
    RouteSettings settings,
    WidgetBuilder builder,
  ) =>
      PageRouteBuilder(
        settings: settings,
        transitionDuration: Duration.zero,
        pageBuilder: (context, _, __) => builder(context),
      );
}
