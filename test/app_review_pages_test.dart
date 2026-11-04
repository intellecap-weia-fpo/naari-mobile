import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naari_survey/pages/delete_account_page.dart';
import 'package:naari_survey/pages/privacy_policy_page.dart';

void main() {
  testWidgets('privacy policy is available from bundled assets without login', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: PrivacyPolicyPage()));
    await tester.pumpAndSettle();
    expect(find.text('NAARI Survey Privacy Policy'), findsOneWidget);
    expect(
      find.text('Privacy contact: dpg@invarya.com'),
      findsOneWidget,
    );
    await tester.scrollUntilVisible(
      find.text('Retention and deleting your account'),
      350,
    );
    expect(find.text('Retention and deleting your account'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('deletion requires a password before confirmation', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: DeleteAccountPage()));
    await tester.ensureVisible(find.text('Delete Account Permanently'));
    await tester.tap(find.text('Delete Account Permanently'));
    await tester.pumpAndSettle();
    expect(find.text('Enter your current password.'), findsOneWidget);
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('deletion can be cancelled before contacting the server', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: DeleteAccountPage()));
    await tester.enterText(find.byType(TextField), 'test-password');
    await tester.ensureVisible(find.text('Delete Account Permanently'));
    await tester.tap(find.text('Delete Account Permanently'));
    await tester.pumpAndSettle();
    expect(find.text('Permanently delete account?'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    expect(find.byType(DeleteAccountPage), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
