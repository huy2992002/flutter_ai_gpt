import 'package:flutter/material.dart';
import 'package:flutter_ai_gpt/constants/ag_text.dart';
import 'package:flutter_ai_gpt/gen/assets.gen.dart';
import 'package:svg_flutter/svg.dart';

class AGTextFormField extends StatelessWidget {
  const AGTextFormField({
    super.key,
    this.controller,
    this.onSubmit,
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final Function()? onSubmit;
  final Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInput({Color? color}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: color ?? Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      );
    }

    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      style: Theme.of(context).textTheme.titleMedium,
      cursorColor: Theme.of(context).colorScheme.onBackground,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
        contentPadding: const EdgeInsets.all(8.0),
        border: outlineInput(),
        enabledBorder: outlineInput(),
        focusedBorder: outlineInput(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        suffixIcon: GestureDetector(
          onTap: onSubmit,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              color: onSubmit != null
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SvgPicture.asset(Assets.icons.icSubmit),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 36),
        hintText: AGText.askAnyThing,
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
      ),
      onFieldSubmitted: (value) => onSubmit,
    );
  }
}
