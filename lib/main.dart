import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:dragonhorde_client_flutter/creators.dart';
import 'package:dragonhorde_client_flutter/error.dart';
import 'package:dragonhorde_client_flutter/providers/search_provider.dart';
import 'package:dragonhorde_client_flutter/search.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class LoggingShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, KeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    if (result == KeyEventResult.handled) {
      print('Handled shortcut $event in $context');
    }
    return result;
  }
}

/// An ActionDispatcher that logs all the actions that it invokes.
class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);

    return null;
  }
}

class GoBackIntent extends Intent {
  const GoBackIntent();
}

Future<void> main() async {
  // await RustLib.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    apiClient.dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException exception, handler) async {
          debugPrint("Error Handler");
          navigatorKey.currentState!.push(
            MaterialPageRoute(
              builder:
                  (context) =>
                      ErrorPage(exception: exception, handler: handler),
            ),
          );
        },
      ),
    );
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(161, 141, 89, 132),
          brightness: Brightness.dark,
          // contrastLevel: -.5,
        ),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.people)),
              Tab(icon: Icon( Icons.folder)),
            ],
          ),
          body: TabBarView(
            children: [
              ChangeNotifierProvider(
                create: (context) => SearchProvider(),
                child: SearchPage(),
              ),
              CreatorsPage(),
              Text("Collections")
            ],
          ),
        ),
      ),
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.escape): const GoBackIntent(),
        LogicalKeySet(LogicalKeyboardKey.backspace): const GoBackIntent(),
      },
      actions: {
        GoBackIntent: CallbackAction<GoBackIntent>(
          onInvoke: (intent) => navigatorKey.currentState!.maybePop(context),
        ),
      },
      navigatorKey: navigatorKey,
    );
  }
}
