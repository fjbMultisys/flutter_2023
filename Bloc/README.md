# Flutter Architecture

Bloc

Bloc architecture is a popular state management pattern used in Flutter applications. It separates the presentation layer from the business logic layer and simplifies the code structure of an application. Bloc stands for Business Logic Component, which is an independent component that handles the logic of a specific feature of the application.

The core of the Bloc architecture is the separation of concerns. The UI layer only handles the display and user interaction, while the Bloc layer manages the business logic and data flow. The UI layer communicates with the Bloc layer through events, and the Bloc layer sends state updates to the UI layer.



Here's an example of implementing a simple counter application using the Bloc architecture in Flutter:

1. Add the flutter_bloc package to your pubspec.yaml file:

```
dependencies:
  flutter_bloc: ^7.0.0

```


2. Create an event class for the counter:

```
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}


```

3. Create a state class for the counter:

```
abstract class CounterState {}

class InitialCounterState extends CounterState {
  final int count;

  InitialCounterState({this.count = 0});
}

class UpdatedCounterState extends CounterState {
  final int count;

  UpdatedCounterState({required this.count});
}


```



Create a Bloc class for the counter:
```
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialCounterState());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield UpdatedCounterState(count: state.count + 1);
    } else if (event is DecrementEvent) {
      yield UpdatedCounterState(count: state.count - 1);
    }
  }
}
```


5. Implement the UI layer:

```
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is InitialCounterState) {
                  return Text('0');
                } else if (state is UpdatedCounterState) {
                  return Text('${state.count}');
                }
                return Text('Error');
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


```


In this example, the UI layer consists of a CounterPage widget that displays the current count and two buttons to increment and decrement the count. The BlocBuilder widget listens to state changes from the CounterBloc and updates the UI accordingly. The ElevatedButton widgets send events to the CounterBloc when pressed.

To use the CounterPage widget in your app, you need to add it to the MaterialApp widget and provide the CounterBloc to the widget tree:
```

import 'package:flutter/material.dart
```

