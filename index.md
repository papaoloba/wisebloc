## Setup

### Libraries
- Install [`bloc`](https://bloclibrary.dev/#/);
- Install [`flutter_bloc`](https://pub.dev/packages/flutter_bloc);
- Install [`equatable`](https://pub.dev/packages/equatable).

### VSCode extensions
- _(optional)_ Install [the bloc extension](https://github.com/felangel/bloc/tree/master/extensions/vscode) by Felix Angelov.

### Flutter folder structure
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
		- app_state_handler.dart
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
				- screenNameHandler.dart
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
