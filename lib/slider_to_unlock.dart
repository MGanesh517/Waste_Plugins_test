
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Slide to act Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SlideToUnlock(),
//     );
//   }
// }

class SlideToUnlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Builder(
              builder: (context) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SlideAction(),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                    innerColor: Colors.black,
                    outerColor: Colors.white,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                    alignment: Alignment.centerRight,
                    sliderButtonIcon: const Icon(Icons.lock),
                    child: const Text(
                      'Unlock',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                    height: 100,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                    sliderButtonIconSize: 48,
                    sliderButtonYOffset: -20,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                    elevation: 24,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                    borderRadius: 16,
                    animationDuration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                    reversed: true,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                    submittedIcon: const Icon(
                      Icons.done_all,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    key: _key,
                    onSubmit: () {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () => _key.currentState!.reset(),
                      );
                    },
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SlideAction(
                    sliderRotate: false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}