library code_input;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


//this is just a dummy implementation to help someone in SO
// i will make it better in the future 

class CodeInput extends StatefulWidget {
  final int length;

  const CodeInput({Key key, this.length}) : super(key: key);
  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  CodeInputModel codeModel;
  @override
  void initState() {
    super.initState();
    codeModel = CodeInputModel(widget.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: codeModel.inputs,
      ),
    );
  }
}

class InputWidget extends StatefulWidget {
  const InputWidget({
    Key key,
    this.index,
    this.codeModel,
  }) : super(key: key);

  final int index;
  final CodeInputModel codeModel;

  @override
  _InputWidgetState createState() {
    return _InputWidgetState();
  }
}

class _InputWidgetState extends State<InputWidget> {
  String text;
  @override
  void initState() {
    super.initState();
    text = widget.codeModel.editingControllers[widget.index].text;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: text.isNotEmpty
            ? const EdgeInsets.all(0.0)
            : const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(text.isNotEmpty ? 0.0 : 50.0),
            border: Border.all(
                color: text.isNotEmpty ? Colors.green : Colors.red,
                width: text.isNotEmpty ? 1.0 : 1.5,
                style: BorderStyle.solid),
          ),
          child: EditableText(
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            keyboardType: TextInputType.number,
            controller: widget.codeModel.editingControllers[widget.index],
            textAlign: TextAlign.center,
            focusNode: widget.codeModel.nodes[widget.index],
            onChanged: (value) {
              setState(() {
                //to change the color when the edit is filled
                text = value;
              });
              if (value.isEmpty) {
                handleDelete(context);
              } else {
                handleCodeInput(context);
              }
            },
            style: TextStyle(fontSize: 30.0, color: Colors.black),
            cursorColor: Colors.red,
          ),
        ),
      ),
    );
  }

  void handleDelete(BuildContext context) {
    int previousIndex = widget.index - 1;
    var textController = widget.codeModel.editingControllers[widget.index];
    if (textController.text.isNotEmpty) {}

    selectNode(context, previousIndex);
    selectText(previousIndex);
    // var selectAll = TextSelection(baseOffset: 1, extentOffset: 2);
    // widget.editingControllers[previousIndex].selection = selectAll;
  }

  void handleCodeInput(BuildContext context) {
    if (widget.index < widget.codeModel.nodes.length - 1) {
      int nextIndex = widget.index + 1;
      selectNode(context, nextIndex);
      selectText(nextIndex);
    } else {
      // if you want to loop the input
      // FocusScope.of(context).requestFocus(widget.focusNode[0]);
      // widget.editingControllers[0].selection =
      //     TextSelection.collapsed(offset: 0);
    }
  }

  void selectNode(BuildContext context, int index) {
    FocusScope.of(context).requestFocus(widget.codeModel.nodes[index]);
  }

  void selectText(int index) {
    var selectAll = TextSelection(baseOffset: 0, extentOffset: 1);
    widget.codeModel.editingControllers[index].selection = selectAll;
  }
}

class CodeInputModel {
  final nodes = List<FocusNode>();
  final inputs = List<InputWidget>();
  final editingControllers = List<TextEditingController>();
  CodeInputModel(int lenght) {
    for (var i = 0; i < lenght; i++) {
      nodes.add(FocusNode());
      editingControllers.add(TextEditingController(text: ""));
    }
    for (var i = 0; i < lenght; i++) {
      inputs.add(InputWidget(
        index: i,
        codeModel: this,
      ));
    }
  }
}
