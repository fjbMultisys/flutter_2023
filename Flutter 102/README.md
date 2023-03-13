Flutter for Native iOS App Developers ⊂(◕.◕⊂) 
//================================================================================

I. Quick Recap about Flutter
II. State Management
1. Provider
2. Bloc
3. Redux
4. MobX
5. GetX
III. Design Patterns
1. Structural
2. Creational
3. Behavioral
IV. References
- State Management
- Design Patterns
	- https://dev.to/blazebrain/design-patterns-flutter-9dh
	- https://devlibrary.withgoogle.com/products/flutter/repos/mkobuolys-flutter-design-patterns
- iOS developer's first impressions of Flutter
	- PART 1: https://blog.sentry.io/2022/09/16/an-ios-developers-first-impressions-of-flutter/
	- PART 2: https://blog.sentry.io/2022/09/21/an-ios-developers-first-impressions-of-flutter-part-2/
	- 
- TO DO
	- https://medium.com/the-web-tub/making-a-todo-app-with-flutter-5c63dab88190
	- https://www.section.io/engineering-education/how-to-build-a-flutter-todo-app/
	- 

//================================================================================
I. Quick Recap about Flutter  ⊂(◕.◕⊂) 
//================================================================================


//================================================================================
II. State Management  ⊂(◕.◕⊂) 
//================================================================================

State management techniques in Flutter
1. Provider
2. Bloc
3. Redux
4. MobX
5. GetX


In Flutter, there are several state management techniques available to manage the application state, including:

1. Provider: Provider is a simple, yet powerful state management library that is commonly used in Flutter. It allows you to easily manage and share data between different parts of your application. Provider uses the InheritedWidget and ChangeNotifier classes to update the state.

Example: https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple

Reference: https://pub.dev/packages/provider

2. Bloc: Bloc is a state management library that uses the concept of reactive programming to manage the application state. It allows you to separate the business logic from the UI, making your code more maintainable and testable.

Example: https://bloclibrary.dev/#/fluttertodostutorial

Reference: https://bloclibrary.dev/

3. Redux: Redux is a popular state management library that is widely used in web development. It follows a unidirectional data flow pattern, where the data flows in one direction from the store to the UI.

Example: https://flutter.dev/docs/development/data-and-backend/state-mgmt/complex#example

Reference: https://pub.dev/packages/flutter_redux

4. MobX: MobX is a state management library that uses observables to automatically track changes in the state. It provides a simple and easy-to-use API, making it a popular choice for many Flutter developers.

Example: https://mobx.pub/getting-started

Reference: https://pub.dev/packages/mobx

5. GetX: GetX is a state management library that provides a complete solution for state management, navigation, and dependency injection. It uses reactive programming to manage the application state and allows you to easily share data between different parts of your application.

Example: https://pub.dev/packages/get/example

Reference: https://pub.dev/packages/get

Overall, there are many state management techniques available in Flutter, and the best one for your application will depend on your specific needs and requirements.
