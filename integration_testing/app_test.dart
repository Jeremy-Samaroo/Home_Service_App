import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_service_app/views/loginView.dart';
import 'package:home_service_app/views/widgets/navBar.dart';
import 'package:integration_test/integration_test.dart';
// TODO 5: Import the app that you want to test
import 'package:home_service_app/main.dart' as app;

// flutter drive \ --driver=test_driver/integration_test_driver.dart \ --target=integration_testing/app_test.dart \--web-port=4444 --browser-name=chrome
//C:\Users\jiles\Documents\flutter_windows_2.10.0-stable\chromedrive_win32/chromedriver --port=4444
void main() {
  group('App Test', () {
    // TODO 3: Add the IntegrationTestWidgetsFlutterBinding and .ensureInitialized
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    // TODO 4: Create your test casecl
    testWidgets("full app test", (tester) async {
      // TODO 6: execute the app.main() function

      app.main();

      // TODO 7: Wait until the app has settled
      await tester.pumpAndSettle(const Duration(seconds: 5));
      // TODO 8: create finders for email, password and login
      final emailformfield = find.byKey(Key('email'));
      final passformfield = find.byKey(Key('password'));
      final loginbutton = find.byKey(Key('loginButton'));
      expect(emailformfield, findsOneWidget);
      expect(passformfield, findsOneWidget);
      expect(loginbutton, findsOneWidget);
      // TODO 9: Enter text for the email address
      await tester.enterText(emailformfield, "jilesramjattan@gmail.com");
      await tester.enterText(passformfield, "12345");
      await tester.pumpAndSettle();
      await tester.tap(loginbutton);
      print("tap Login\n");
      await FirebaseFirestore.instance.waitForPendingWrites();

      await tester.pumpAndSettle();

      await tester.pumpAndSettle(const Duration(seconds: 5));
      //await tester.pump();
      await FirebaseFirestore.instance.waitForPendingWrites();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      //final topbar = find.byKey(Key("TopBar"));
      final joblistingbutton = find.byKey(Key("TopbarJobListing"));
      //expect(joblistingbutton, findsOneWidget);
      print("tap jobListing\n");
      await tester.tap(joblistingbutton);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      final jobcard = find.byKey(Key("jobListing0"));
      print("job card\n");
      await tester.tap(jobcard);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      final requestButton = find.byKey(Key('Request Job'));
      expect(requestButton, requestButton);
      print("request\n");
      await tester.pumpAndSettle();
      await tester.tap(requestButton);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      print("pump");
    });

    testWidgets("Test add Job",(tester)async{
      app.main();

      // TODO 7: Wait until the app has settled
      await tester.pumpAndSettle(const Duration(seconds: 5));
      // TODO 8: create finders for email, password and login
      final emailformfield = find.byKey(Key('email'));
      final passformfield = find.byKey(Key('password'));
      final loginbutton = find.byKey(Key('loginButton'));
      expect(emailformfield, findsOneWidget);
      expect(passformfield, findsOneWidget);
      expect(loginbutton, findsOneWidget);
      // TODO 9: Enter text for the email address
      await tester.enterText(emailformfield, "jilesramjattan@gmail.com");
      await tester.enterText(passformfield, "12345");
      await tester.pumpAndSettle();
      await tester.tap(loginbutton);
      print("tap Login\n");
      await FirebaseFirestore.instance.waitForPendingWrites();

      await tester.pumpAndSettle();

      await tester.pumpAndSettle(const Duration(seconds: 5));
      //await tester.pump();
      await FirebaseFirestore.instance.waitForPendingWrites();
      await tester.pumpAndSettle(const Duration(seconds: 5));
    }); 
  });
}
