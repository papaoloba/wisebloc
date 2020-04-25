## Setup

### Libraries
- Install [`bloc`](https://bloclibrary.dev/#/);
- Install [`flutter_bloc`](https://pub.dev/packages/flutter_bloc);
- Install [`equatable`](https://pub.dev/packages/equatable).

### VSCode extensions
- _(optional)_ Install [the bloc extension](https://github.com/felangel/bloc/tree/master/extensions/vscode) by Felix Angelov.

### Main logic
The wisebloc architecture is a special implementation of the BLoC pattern ensuring a higher state management flexibility. The main features are:

- There exists an `AppBloc` responsible for the navigation between screens;
- Each screen has its own BLoC;
- Each screen BLoC can only yield the following pre-defined states: the `ScreenNameInitial` state, the `ScreenNameLoading` state and the `ScreenNameInitialized` state;
- All the information necessary to render a screen's state is contained inside an instance `screenName` of the `ScreenHandler` class object;
- All the `screenName` objects are attributes of the `AppHandler` class, which is instantiated as an `appHandler` variable inside the `main` method and eventually made available to each screen and BLoC of the app;
- The `state` attribute of any `screenName` instance, which holds the current state of the screen `ScreenName`, can be modified from any BLoC by calling the method `yieldState(appHandler.screenName,ScreenNameState)`, where `ScreenNameState` is the new screen state.








- Each BLoC can only yield the following pre-defined states: the `Initial` state, the `Loading` state and the `Initialized` state;
- The `Initial` state is only yielded the very first time the screen is rendered in a user session. The `Initialize` event is called immediately after, and the `mapEventToState` method of the screen BLoC is entered for the first time in the screen lifecycle;

#### Navigation
The `ÀppBloc` is responsible for the navigation between pages. It is made globally accessible by injecting it into the root widget through a `BlocProvider` instance defined inside the `runApp` method. The actual routing process is conducted in the build method of the `App` widget by returning a `BlocBuilder` of the `AppBloc` in which the `AppState` is branched each time a `NavigateTo` event is called in the UI. Each branch corresponds to a specific screen. If `AppState` matches `NavigationToScreenName`, then the `BlocBuilder` returns the rendering widget `ScreenName`, taking as unique input the `appHandler` instance of the `AppHandler` class created at the beginning of the `main` method.

#### State management
The `AppHandler` class stores all the information about the global state of the app and of each of its screens. It is made globally accessible by creating an instance `appHandler` inside the `main` method and by passing it as an input to each screen widget returned by the `build` method of the `App` widget and to each `Bloc` object provided to the widget tree through the `MultiBlocProvider` wrapping the root widget inside the `main` method.

### Flutter project folder structure
```
- .dart_tool
- .idea
- android
- ios

- assets
  - icons
  - images
  - fonts
	
- lib
  - repository.dart
  - main.dart
  - bloc
    - app_bloc.dart
    - app_event.dart
    - app_state.dart
    - app_handler.dart
  - custom_widgets
  - data_objects
  - utils
    - helper_functions.dart
  - views
    - ScreenName
      - ScreenName.dart
      - bloc
        - screen_name_bloc.dart
        - screen_name_event.dart
        - screen_name_state.dart
        - screen_name_handler.dart
      - ...
			
- test
- web
- .gitignore
- .metadata
- .packages
- pubspeck.lock
- pubspeck.yaml
- README.md
- project_name.iml
```

### main.dart

```dart

import 'package:flutter/material.dart';
import 'package:wisebloc_counter/bloc/app_bloc.dart';
import 'package:wisebloc_counter/bloc/app_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/views/HomePage/HomePage.dart';
import 'package:project_name/views/HomePage/ScreenName.dart';

void main() {

  final appHandler = AppHandler();

  runApp(
    BlocProvider(
    create: (context) => AppBloc(),
    child: App(appHandler: AppHandler())),
  );

}

class App extends StatelessWidget {

  final AppHandler appHandler;

  App({Key key, @required this.appHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      title: 'App',

      home: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {

              if (state is AppInitial) {
                return HomePage();
              }

              else if (state is HomePage) {
                return HomePage();
              }
	      
	      else if (state is ScreenName) {
                return ScreenName();
              }

            } 
      )

    );
  }

}


```



## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/papaoloba/wisebloc/edit/master/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/papaoloba/wisebloc/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
