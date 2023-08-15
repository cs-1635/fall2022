import 'package:test/test.dart';
import 'package:ui_testing/models/favorites.dart';

void main() {
  group('Testing App Provider', () {
    var favorites = Favorites();

    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('An item should be removed', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });

    test('An item should be removed', () {
      var numberA = 20;
      var numberB = 30;
      var numberC = 40;

      favorites.add(numberA);
      favorites.add(numberB);

      expect(favorites.items.contains(numberA), true);
      expect(favorites.items.contains(numberB), true);
      expect(favorites.items.contains(numberC), false);

      favorites.remove(numberA);

      expect(favorites.items.contains(numberA), false);
      expect(favorites.items.contains(numberB), true);
      expect(favorites.items.contains(numberC), false);


    });

  });
}