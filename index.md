## Context
The BLoC pattern is one of the most powerful and appreciated state management techniques for Flutter. Of course, this is still far from "perfection". For instance, in a traditional BLoC architecture modifying the state of a screen A starting from a UI event happening in a screen B is not a trivial task. This is why many developers are already trying to get to the next level by proposing "leaner" and more flexible approaches. The [upstate](https://levelup.gitconnected.com/introducing-upstate-simplified-state-management-for-flutter-c987cac25b04) is one of these, introducing the possibility to "update your state anywhere and your app updates everywhere" by sacrifying one of the main features of the BLoC pattern: the formal separation between UI and Business Logic.

## Purpose
The wisebloc architecture is a special implementation of the BLoC pattern ensuring a higher state management flexibility without giving up the convenience of a formal distinction between the UI and the Business Logic environments. This is done by making the state of each screen of the app easily accessible and modifiable from any Business Logic Component (BLoC) of the app and by delegating the routing process to a dedicated and globally accessible `AppBloc`.

### Main logic
The main logic of the wisebloc architecture lies in the following features:

- Each `ScreenName` has its own `ScreenNameBloc`, which only responds to UI events coming from its associated screen;
- A globally accessible `AppBloc` is responsible for the navigation between screens;
- Each `ScreenNameBloc` can only yield the following pre-defined states: `ScreenNameInitial`, `ScreenNameLoading` and `ScreenNameInitialized`;
- Any other custom state is rendered as  particular realization of the `ScreenNameInitialized` state, which is always the last state yielded by the `mapEventToState` method inside the `ScreenNameBloc`; 
- The `ScreenNameLoading` state is yielded every time the program calls the `mapEventToState` method of the associated `ScreenNameBloc` (that is, after every BLoC event or after the initialization of the screen);
- The `ScreenNameInitial` state is only yielded the very first time the screen is rendered in a user session. The `InitializeScreenName` event is called immediately after, and the `mapEventToState` method of the `ScreenNameBloc` is entered for the first time in the screen's lifecycle;
- All the information necessary to render a screen's custom state is contained inside a `screenName` instance of the `ScreenHandler` class object. This information can be accessed and modified from anywhere in the app, as explained in the following point;
- All the `screenName` objects are attributes of the `AppHandler` class, which is always instantiated at the beginning of the `main` method and eventually made available as an `appHandler` object to each screen and BLoC of the app;
- The `state` attribute of each `screenName` instance, which hold all the current custom states of the screens, can be modified from anywhere in the app by calling the method `yieldState(appHandler.screenName,ScreenNameState)`, where `ScreenNameState` is the new custom state being assigned to `ScreenName`;
- The `Repository` class, containing all the static methods responsible for calling the APIs used in the app, is imported in each `ScreenNameBloc`.

#### Navigation
The `ÀppBloc` is responsible for the navigation between pages. It is made globally accessible by injecting it into the root widget through a `BlocProvider` instance defined inside the `runApp` method. The actual routing process is conducted in the build method of the `App` widget by returning a `BlocBuilder` of the `AppBloc` in which the `AppState` is branched each time a `NavigateTo` event is called in the UI. Each branch corresponds to a specific screen. If `AppState` matches `NavigationToScreenName`, then the `BlocBuilder` returns the rendering widget `ScreenName`, taking as unique input the `appHandler` instance of the `AppHandler` class created at the beginning of the `main` method.

#### State management
The `AppHandler` class stores all the information about the global state of the app and of each of its screens. It is made globally accessible by creating an instance `appHandler` inside the `main` method and by passing it as an input to each screen widget returned by the `build` method of the `App` widget and to each `Bloc` object provided to the widget tree through the `MultiBlocProvider` wrapping the root widget inside the `main` method.

## Setup

### Libraries
- Install [`bloc`](https://bloclibrary.dev/#/);
- Install [`flutter_bloc`](https://pub.dev/packages/flutter_bloc);
- Install [`equatable`](https://pub.dev/packages/equatable);
- Install [`after_layout`](https://pub.dev/packages/after_layout).

### VSCode extensions
- _(recommended)_ Install [the bloc extension](https://github.com/felangel/bloc/tree/master/extensions/vscode) by Felix Angelov.

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
