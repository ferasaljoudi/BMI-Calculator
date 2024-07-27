
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/bmi.dart';

void main() {
  group('Testing BMI', () {
    //****************************Test Page Title*****************************************
    testWidgets('BMI page should have a certain Title', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      final titleFinder = find.text('BMI Calculator');

      expect(titleFinder, findsOneWidget);
    });

    //****************************Test Having Wright Field*****************************************
    testWidgets('BMI page should have weight text', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      final weightTextFinder = find.widgetWithText(TextField, 'weight in lbs');

      expect(weightTextFinder, findsOneWidget);
    });

    //****************************Test Having Calculate Button*****************************************
    testWidgets('BMI page should have Calculate button', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      final calculateButtonFinder = find.widgetWithText(OutlinedButton, 'Calculate');

      expect(calculateButtonFinder, findsOneWidget);
    });

    //****************************Test Having Feet Field*****************************************
    testWidgets('BMI page should have Feet field', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      final feetFieldFinder = find.widgetWithText(DropdownButton<double>, 'Feet');

      expect(feetFieldFinder, findsOneWidget);
    });

    //****************************Test Having Inches Field*****************************************
    testWidgets('BMI page should have Inches field', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      final inchesFieldFinder = find.widgetWithText(DropdownButton<double>, 'Inches');

      expect(inchesFieldFinder, findsOneWidget);
    });

    //****************************Test Having Result Field*****************************************
    testWidgets('BMI page should have Result text', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      final resultTextFinder = find.text('Result');

      expect(resultTextFinder, findsOneWidget);
    });

    //****************************Test Valid Entries (Healthy Weight Range)*****************************************
    testWidgets('Test Valid Entries (Healthy Weight Range)', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      // Entering weight
      final weightFieldFinder = find.widgetWithText(TextField, 'weight in lbs');
      await tester.enterText(weightFieldFinder, '150');
      await tester.pump();

      // Selecting Feet
      final feetFieldFinder = find.widgetWithText(DropdownButton<double>, 'Feet');
      await tester.tap(feetFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('5.0').last);
      await tester.pumpAndSettle();

      // Selecting Inches
      final inchesFieldFinder = find.widgetWithText(DropdownButton<double>, 'Inches');
      await tester.tap(inchesFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('7.0').last);
      await tester.pumpAndSettle();

      // Clicking Calculate button
      final calculateButtonFinder = find.widgetWithText(OutlinedButton, 'Calculate');
      await tester.tap(calculateButtonFinder);
      await tester.pumpAndSettle();

      // Verifying the result
      final resultAsRange = find.textContaining('Healthy Weight Range');
      expect(resultAsRange, findsOneWidget);

      final resultAsNumber = find.textContaining('23.54');
      expect(resultAsNumber, findsOneWidget);
    });

    //****************************Test Valid Entries (Severely Overweight)*****************************************
    testWidgets('Test Valid Entries (Severely Overweight)', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      // Entering weight
      final weightFieldFinder = find.widgetWithText(TextField, 'weight in lbs');
      await tester.enterText(weightFieldFinder, '200');
      await tester.pump();

      // Selecting Feet
      final feetFieldFinder = find.widgetWithText(DropdownButton<double>, 'Feet');
      await tester.tap(feetFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('5.0').last);
      await tester.pumpAndSettle();

      // Selecting Inches
      final inchesFieldFinder = find.widgetWithText(DropdownButton<double>, 'Inches');
      await tester.tap(inchesFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('8.0').last);
      await tester.pumpAndSettle();

      // Clicking Calculate button
      final calculateButtonFinder = find.widgetWithText(OutlinedButton, 'Calculate');
      await tester.tap(calculateButtonFinder);
      await tester.pumpAndSettle();

      // Verifying the result
      final resultAsRange = find.textContaining('Severely Overweight');
      expect(resultAsRange, findsOneWidget);

      final resultAsNumber = find.textContaining('30.47');
      expect(resultAsNumber, findsOneWidget);
    });

    //****************************Test Valid Entries (Overweight)*****************************************
    testWidgets('Test Valid Entries (Overweight)', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      // Entering weight
      final weightFieldFinder = find.widgetWithText(TextField, 'weight in lbs');
      await tester.enterText(weightFieldFinder, '195');
      await tester.pump();

      // Selecting Feet
      final feetFieldFinder = find.widgetWithText(DropdownButton<double>, 'Feet');
      await tester.tap(feetFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('6.0').last);
      await tester.pumpAndSettle();

      // Selecting Inches
      final inchesFieldFinder = find.widgetWithText(DropdownButton<double>, 'Inches');
      await tester.tap(inchesFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('2.0').last);
      await tester.pumpAndSettle();

      // Clicking Calculate button
      final calculateButtonFinder = find.widgetWithText(OutlinedButton, 'Calculate');
      await tester.tap(calculateButtonFinder);
      await tester.pumpAndSettle();

      // Verifying the result
      final resultAsRange = find.textContaining('Overweight');
      expect(resultAsRange, findsOneWidget);

      final resultAsNumber = find.textContaining('25.09');
      expect(resultAsNumber, findsOneWidget);
    });

    //****************************Test Valid Entries (Underweight)*****************************************
    testWidgets('Test Valid Entries (Underweight)', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      // Entering weight
      final weightFieldFinder = find.widgetWithText(TextField, 'weight in lbs');
      await tester.enterText(weightFieldFinder, '110');
      await tester.pump();

      // Selecting Feet
      final feetFieldFinder = find.widgetWithText(DropdownButton<double>, 'Feet');
      await tester.tap(feetFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('5.0').last);
      await tester.pumpAndSettle();

      // Selecting Inches
      final inchesFieldFinder = find.widgetWithText(DropdownButton<double>, 'Inches');
      await tester.tap(inchesFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('6.0').last);
      await tester.pumpAndSettle();

      // Clicking Calculate button
      final calculateButtonFinder = find.widgetWithText(OutlinedButton, 'Calculate');
      await tester.tap(calculateButtonFinder);
      await tester.pumpAndSettle();

      // Verifying the result
      final resultAsRange = find.textContaining('Underweight');
      expect(resultAsRange, findsOneWidget);

      final resultAsNumber = find.textContaining('17.79');
      expect(resultAsNumber, findsOneWidget);
    });

    //****************************Test With Missing All Entries*****************************************
    testWidgets('Test With Missing All Entries', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      // Clicking Calculate button without entering any information
      final calculateButtonFinder = find.widgetWithText(OutlinedButton, 'Calculate');
      await tester.tap(calculateButtonFinder);
      await tester.pumpAndSettle();

      // Verifying the error messages
      final error = find.text('Enter feet');
      expect(error, findsOneWidget);
    });

    //****************************Test With Missing Inches And Weight*****************************************
    testWidgets('Test With Missing Inches And Weight', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      // Selecting Feet
      final feetFieldFinder = find.widgetWithText(DropdownButton<double>, 'Feet');
      await tester.tap(feetFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('4.0').last);
      await tester.pumpAndSettle();

      // Clicking Calculate button without entering inches and weight
      final calculateButtonFinder = find.widgetWithText(OutlinedButton, 'Calculate');
      await tester.tap(calculateButtonFinder);
      await tester.pumpAndSettle();

      // Verifying the error messages
      final error = find.text('Enter inches');
      expect(error, findsOneWidget);
    });

    //****************************Test With Missing Weight*****************************************
    testWidgets('Test With Missing Weight', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      // Selecting Feet
      final feetFieldFinder = find.widgetWithText(DropdownButton<double>, 'Feet');
      await tester.tap(feetFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('5.0').last);
      await tester.pumpAndSettle();

      // Selecting Inches
      final inchesFieldFinder = find.widgetWithText(DropdownButton<double>, 'Inches');
      await tester.tap(inchesFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('5.0').last);
      await tester.pumpAndSettle();

      // Clicking Calculate button without entering weight
      final calculateButtonFinder = find.widgetWithText(OutlinedButton, 'Calculate');
      await tester.tap(calculateButtonFinder);
      await tester.pumpAndSettle();

      // Verifying the error messages
      final error = find.text('Enter weight');
      expect(error, findsOneWidget);
    });

    //****************************Test With Entered Weight is Not a Number*****************************************
    testWidgets('Test With Entered Weight is Not a Number', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BMI()));

      // Selecting Feet
      final feetFieldFinder = find.widgetWithText(DropdownButton<double>, 'Feet');
      await tester.tap(feetFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('5.0').last);
      await tester.pumpAndSettle();

      // Selecting Inches
      final inchesFieldFinder = find.widgetWithText(DropdownButton<double>, 'Inches');
      await tester.tap(inchesFieldFinder);
      await tester.pumpAndSettle();
      await tester.tap(find.text('5.0').last);
      await tester.pumpAndSettle();

      // Entering non-numeric weight
      final weightFieldFinder = find.widgetWithText(TextField, 'weight in lbs');
      await tester.enterText(weightFieldFinder, 'ab');
      await tester.pump();

      // Clicking Calculate button without entering weight
      final calculateButtonFinder = find.widgetWithText(OutlinedButton, 'Calculate');
      await tester.tap(calculateButtonFinder);
      await tester.pumpAndSettle();

      // Verifying the error messages
      final error = find.text('Weight has to be a number');
      expect(error, findsOneWidget);
    });
  });
}
