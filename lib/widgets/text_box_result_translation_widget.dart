import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tradao/widgets/snack_bar_widget.dart';
import 'package:tradao/widgets/text_box_widget.dart';

class TextBoxResultTranslationWidget extends StatefulWidget {
  const TextBoxResultTranslationWidget(
      {super.key, required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  State<TextBoxResultTranslationWidget> createState() =>
      _TextBoxResultTranslationWidgetState();
}

class _TextBoxResultTranslationWidgetState
    extends State<TextBoxResultTranslationWidget> {
  final _isCopied = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(),
      height: 180,
      child: Stack(
        fit: StackFit.expand,
        children: [
          TextBoxWidget(
              editingController: widget.textEditingController,
              onFieldSubmitted: (va) {},
              hintText: "Tradução aqui..."),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: _copyToTransferArea,
                  icon: AnimatedBuilder(
                    animation: _isCopied,
                    builder: (context, child) {
                      return Icon(
                          _isCopied.value ? Icons.check_box : Icons.copy);
                    },
                  ),
                )),
          )
        ],
      ),
    );
  }

  void _copyToTransferArea() async {
    await Clipboard.setData(
        ClipboardData(text: widget.textEditingController.text));
    _isCopied.value = true;
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarWidget(
          text: "Texto copiado",
        ),
      );
    }
    await Future.delayed(const Duration(milliseconds: 300));
    _isCopied.value = false;
  }
}
