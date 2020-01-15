import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Listener/ListenerWidgetVideo.dart';
import 'Widget/WidgetLaunchPage.dart';

void main() => runApp(MaterialApp(
  title: "FLUTTER VIDEO CONTAINER TEST",
  home: HomePage(),
));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    debugPrint('_______built homepage______');
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ListenerWidgetVideo>(create: (_) => ListenerWidgetVideo()),
        ],
        child: WidgetLaunchPage()
    );
  }
}