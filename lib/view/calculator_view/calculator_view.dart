import 'package:calculatorapp/util/constants.dart';
import 'package:calculatorapp/view/calculator_view/calculator_view_model.dart';
import 'package:calculatorapp/view/components/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final TextEditingController _textEditingController = TextEditingController();
  late CalculatorViewModel _calculatorViewModel;
  @override
  void initState() {
    _calculatorViewModel = CalculatorViewModel();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  double? firstNumber;
  double? secondNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.history,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextField(
                      controller: _textEditingController,
                      readOnly: true,
                      textAlign: TextAlign.end,
                      style: Constants.calculatorStyle.copyWith(fontSize: 42),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
                          alignLabelWithHint: true,
                          hintStyle:
                              Constants.calculatorStyle.copyWith(fontSize: 42)),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 8,
                childAspectRatio: Constants.isMobile ? 1 : 2 / 1,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                if (int.tryParse(Constants.buttons[index]) != null ||
                    Constants.buttons[index] == ".") {
                  return CalculatorButton(
                    text: Constants.buttons[index],
                    onTap: () {
                      _textEditingController.text += Constants.buttons[index];
                    },
                    color: const Color(0xFFEEF0F1),
                  );
                }
                return CalculatorButton(
                  text: Constants.buttons[index],
                  textColor:
                      Constants.buttons[index] == "=" ? Colors.white : null,
                  onTap: () {
                    _textEditingController.text =
                        _calculatorViewModel.onClickOperators(
                            Constants.buttons[index],
                            _textEditingController.text);
                  },
                  color: Color(Constants.buttons[index] == "="
                      ? 0xFF436DE7
                      : 0xFFD1D4D9),
                );
              },
              itemCount: Constants.buttons.length,
            )
          ],
        ),
      ),
    );
  }
}
