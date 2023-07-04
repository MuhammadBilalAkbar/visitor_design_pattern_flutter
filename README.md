# visitor_design_pattern_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 1. Research: Visitor Design Pattern Flutter

- Keywords:
    - visitor design pattern
    - visitor design pattern flutter
    - visitor design pattern flutter example
    - behavioural design patterns in flutter
    - behavioural design patterns
    - visitor pattern with example
- Video Title: Visitor Design Pattern in Flutter | Behavioural Design Patterns in Flutter | Visitor
  Design Pattern with Example

## 2. Research: Competitors

**Flutter Videos/Articles**

- 261K: https://youtu.be/pL4mOUDi54o
- https://scottt2.github.io/design-patterns-in-dart/visitor/
- https://medium.com/flutter-community/flutter-design-patterns-21-visitor-af5def0699be

**Android/Swift/React Videos**

- 21K: https://youtu.be/UQP5XqMqtqQ
- 3.3K: https://youtu.be/CL_YZ7YUfCY
- 2K: https://youtu.be/CstJm7tXAVQ
- 7.9K: https://youtu.be/UKmNGiaTN40
- 11K: https://youtu.be/vG9gEI1dr1o
- 13K: https://youtu.be/ZHQEXEArzyw?list=PLmCsXDGbJHdjUb3QvU3HYjhn8TP6Eak5i
- 50K: https://youtu.be/TeZqKnC2gvA
- 1.8K: https://youtu.be/-fO77I9Xvhk
- https://www.geeksforgeeks.org/visitor-design-pattern/
- https://refactoring.guru/design-patterns/visitor
- https://www.tutorialspoint.com/design_pattern/visitor_pattern.htm
- https://sourcemaking.com/design_patterns/visitor
- https://www.digitalocean.com/community/tutorials/visitor-design-pattern-java
- https://www.javatpoint.com/visitor-design-pattern-java
- https://www.baeldung.com/java-visitor-pattern
- https://cs.uwaterloo.ca/~m2nagapp/courses/CS446/1195/Arch_Design_Activity/Visitor.pdf
- https://refactoring.guru/design-patterns/visitor/swift/example
- https://theswiftdev.com/swift-visitor-design-pattern/
- https://lazarevzubov.medium.com/visitor-design-pattern-in-ios-and-swift-universe-e7a953341a6f
- https://itnext.io/making-visitor-pattern-obsolete-using-swift-c16e49a2e52f
- https://github.com/kingreza/Swift-Visitor
- https://blog.quadiontech.com/the-visitor-pattern-in-swift-a9bd3b0fb1a
- https://sudonull.com/post/7200-Architectural-pattern-Visitor-Visitor-in-the-universe-of-iOS-and-Swift
- https://softwarehut.com/blog/tech/design-patterns-visitor-pattern
- http://coursegalaxy.com/design-patterns/visitor.html

**Great Features**

- The visitor design pattern can be used to separate the algorithms from the objects on which they
  operate. This makes it possible to add new operations to objects without modifying the objects
  themselves.

**Problems from Videos**

- NA

**Problems from Flutter Stackoverflow**

- https://stackoverflow.com/questions/255214/when-should-i-use-the-visitor-design-pattern
- https://stackoverflow.com/questions/67815554/confused-about-the-visitor-design-pattern
- https://stackoverflow.com/questions/2604169/visitor-patterns-purpose-with-examples

## 3. Video Structure

**Main Points / Purpose Of Lesson**

1. In this video lesson, you will learn how to add new operations to existing object structures
   without modifying those structures with the help of visitor design pattern.
2. Main points:
    - Visitor
    - Concrete visitors
    - Element
    - Concrete elements
3. The Visitor pattern allows us to add new operations (visitors) to the element structure without
   modifying the elements themselves. This makes it easy to extend the functionality of the
   document structure by introducing new visitors for different operations while keeping the
   elements decoupled from the operations.

**The Structured Main Content**

# Visitor Design Pattern Flutter

## Definition

Visitor belongs to the category of behavioural design patterns.

It represents an operation to be performed on the elements of an object structure. Visitor lets you
define a new operation without changing the classes of the elements on which it operates.

## Analysis:

**Visitor** declares a visit operation for each concrete element class in the object structure. If
the programming language supports function overloading, visit operations could have the same name (
Dart does not support that at the moment), but the type of their parameters must be different.

**Concrete visitors** implements each operation declared by Visitor.

**Element** declares an accept method that takes Visitor as an argument.

**Concrete elements** implements the acceptance method declared by Element. The implementation
should rely on redirecting the request to the proper visitor’s method corresponding to the current
element class.

**Client** usually contains a collection or a complex object structure, initialises the concrete
visitor object and then traverses the object structure by visiting each element with the visitor.

## Implementation:

In `main.dart`:

### Visitor Interface

Here is detail of visitor interface.

1. Define abstract class named `Visitor`.

```dart
// Visitor interface
abstract interface class Visitor {
  void visitLion(Lion animal);

  void visitElephant(Elephant animal);

  void visitDog(Dog animal);
}
```

2. Then, define Concrete Visitors named `FeedVisitor` and `HealthCheckVisitor`. Both of them are
   implementing `Visitor` class which has `visitLion`, `visitElephant`, and `visitDog` methods.<br/>
   So, both concrete classes will implement all the methods of `Visitor` class.

```dart
// Concrete visitor implementation
class FeedVisitor implements Visitor {
  @override
  void visitLion(Lion animal) => print("Feeding meat to a lion.");

  @override
  void visitElephant(Elephant animal) => print("Feeding hay to an elephant.");

  @override
  void visitDog(animal) => print("Feeding meat to a dog.");
}

class HealthCheckVisitor implements Visitor {
  @override
  void visitLion(Lion animal) => print("Conducting health check on a lion.");

  @override
  void visitElephant(Elephant animal) =>
      print("Conducting health check on an elephant.");

  @override
  void visitDog(animal) => print("Conducting health check on a dog.");
}
```

### Element Interface

Here is detail of element interface.

3. Define abstract class named `Animal`.

```dart
// Element interface
abstract interface class Animal {
  void accept(Visitor visitor);
}
```

4. Then, define Concrete elements named `Lion`, `Lion`, and `Dog`. All of them are
   implementing `Animal` class which has `accept(Visitor visitor)` method. It accepts visitor object
   of concrete classes. All these classes are implementing `accept()`method of `Animal` class.

```dart
// Concrete elements
class Lion implements Animal {
  @override
  void accept(Visitor visitor) => visitor.visitLion(this);
}

class Lion implements Animal {
  @override
  void accept(Visitor visitor) => visitor.visitElephant(this);
}

class Dog implements Animal {
  @override
  void accept(Visitor visitor) => visitor.visitDog(this);
}
```

5. `main()` function is client side.
    - Initialize a list of animals named `animals` of type `Animal` class. These are lion, elephant
      and dog.
    - Initialize visitor objects: `feedVisitor` and `healthCheckVisitor`.
    - In for loop, call `accept(Visitor visitor)` method of element class `Animal`.
    - It will print feed text for `feedVisitor` and health related text `healthCheckVisitor`
      according to the different animals.
    - This allows the visitors to perform their specific actions on each animal.

```dart
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
```

The Visitor pattern allows us to define new operations (visitors) that can be applied to a complex
object structure (animals) without modifying the objects themselves. It enables us to separate the
operations from the objects and provide flexibility in adding new functionalities to the objects in
a modular and extensible manner.
