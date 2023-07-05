// Visitor interface
abstract interface class Visitor {
  void visitLion(Lion animal);

  void visitElephant(Elephant animal);

  void visitDog(Dog animal);
}

// Concrete visitor implementation
class FeedVisitor implements Visitor {
  @override
  void visitLion(Lion animal) => print('Feeding meat to a lion.');

  @override
  void visitElephant(Elephant animal) => print('Feeding hay to an elephant.');

  @override
  void visitDog(animal) => print('Feeding meat to a dog.');
}

class HealthCheckVisitor implements Visitor {
  @override
  void visitLion(Lion animal) => print('Conducting health check on a lion.');

  @override
  void visitElephant(Elephant animal) =>
      print('Conducting health check on an elephant.');

  @override
  void visitDog(animal) => print('Conducting health check on a dog.');
}

// Element interface
abstract interface class Animal {
  void accept(Visitor visitor);
}

// Concrete elements
class Lion implements Animal {
  @override
  void accept(Visitor visitor) => visitor.visitLion(this);
}

class Elephant implements Animal {
  @override
  void accept(Visitor visitor) => visitor.visitElephant(this);
}

class Dog implements Animal {
  @override
  void accept(Visitor visitor) => visitor.visitDog(this);
}

// Usage example
void main() {
  final animals = [
    Lion(),
    Elephant(),
    Dog(),
  ];

  final feedVisitor = FeedVisitor();
  final healthCheckVisitor = HealthCheckVisitor();

  for (final animal in animals) {
    animal.accept(feedVisitor);
    animal.accept(healthCheckVisitor);
  }
}
