import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test_prj/providers/horizontal_items.dart';

void main() => runZonedGuarded<void>(
      () => runApp(const App()),
      (error, stackTrace) => print(
        'Top level exception: $error',
      ),
    );

@immutable
class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('CheckProviders'),
          ),
          body: const _TestProvidersWidget(),
        ),
      );
}

class _TestProvidersWidget extends StatefulWidget {
  const _TestProvidersWidget({Key? key}) : super(key: key);

  @override
  State<_TestProvidersWidget> createState() => _TestProvidersWidgetState();
}

class _TestProvidersWidgetState extends State<_TestProvidersWidget> {
  // late HorizontalItemsProvider horizontalItemsProvider;
  // late VerticalItemsProvider verticalItemsProvider;

  @override
  void initState() {
    // horizontalItemsProvider = HorizontalItemsProvider();
    // verticalItemsProvider = VerticalItemsProvider();
    // print(horizontalItemsProvider.itemsCount);
    // print(verticalItemsProvider.itemsCount);

    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HorizontalItemsProvider>(
        create: (_) => HorizontalItemsProvider(),
        // we use `builder` to obtain
        // a new `BuildContext` that has access to the provider
        builder: (context, child) {
          return Text(
            context.watch<HorizontalItemsProvider>().itemsCount.toString(),
          );
        });
  }
}
