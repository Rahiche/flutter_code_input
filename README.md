# code_input

A Flutter widget for inputting content with a fixed length, visually treating each character as a separate segment.

- [Pub Package](https://pub.dartlang.org/packages/code_input)
- [GitHub Repository](https://github.com/rahiche/flutter_code_input)
- [API reference](https://pub.dartlang.org/documentation/code_input/)

## Usage

This is a small example:

```dart
CodeInput(
  length: 4,
  keyboardType: TextInputType.number,
  builder: CodeInputBuilders.lightCircle(),
  onFilled: (value) => print('Your input is $value.'),
)
```

<img src="https://github.com/Rahiche/flutter_code_input/blob/master/screenshots/new%20code%20input.gif?raw=true" width="200"/>

For more information about the properties, have a look at the [API reference](https://pub.dartlang.org/documentation/code_input/).

## LICENSE

```legal
Copyright (c) 2018 Marcel Garus & Rahiche

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
