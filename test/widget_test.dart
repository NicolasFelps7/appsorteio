import 'package:flutter_test/flutter_test.dart';
import 'package:sorteio/main.dart';

void main() {
  testWidgets('Teste inicial do App Sorteador', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('🎲 Sorteador de Decisões'), findsOneWidget);
    expect(find.text('Adicionar opção'), findsOneWidget);
  });
}