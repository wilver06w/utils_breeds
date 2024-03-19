part of '../input.dart';

class XigoTextArea extends StatelessWidget {
  const XigoTextArea({
    super.key,
    this.controller,
    this.counterStyle,
    this.maxLength,
    this.title,
    this.hintText,
    this.validator,
    this.fillColor,
    this.inputTextStyle,
    this.hintTextStyle,
    this.onChanged,
    this.maxLines = 8,
    this.isFilled = false,
    this.minLines = 4,
    this.hintMaxLines = 1,
    this.textInputType = TextInputType.text,
    required this.textCapitalization,
    this.hintColor,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.focusedBorder,
  });

  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final Color? fillColor;
  final TextStyle? inputTextStyle;
  final Color? textColor;
  final int? maxLines;
  final bool isFilled;
  final int? minLines;
  final int? hintMaxLines;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final InputBorder? focusedBorder;
  final Color? hintColor;
  final FontWeight fontWeight;
  final int? maxLength;
  final TextStyle? counterStyle;

  @override
  Widget build(BuildContext context) {
    return XigoTextField(
      counterStyle: counterStyle,
      controller: controller,
      title: title,
      maxLength: maxLength,
      titleStyle: const TextStyle(
        fontFamily: XigoTypography.inter,
        color: ProTiendasUiColors.disabledColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        letterSpacing: -0.12,
      ),
      hintText: hintText,
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      minLines: minLines,
      alignLabelWithHint: true,
      inputTextStyle: inputTextStyle ??
          TextStyle(
            fontWeight: fontWeight,
            color: textColor,
          ),
      hintTextStyle: hintTextStyle ??
          TextStyle(
            fontFamily: XigoTypography.inter,
            color: hintColor ?? ProTiendasUiColors.silver,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: -0.16,
          ),
      hintMaxLines: hintMaxLines,
      focusedBorder: focusedBorder ??
          const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: ProTiendasUiColors.information,
              width: 1.0,
            ),
          ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: ProTiendasUiColors.chineseSilver,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: ProTiendasUiColors.dangerColor,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: ProTiendasUiColors.dangerColor,
          width: 1.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: ProTiendasUiColors.dividerColor,
          width: 1.0,
        ),
      ),
      keyboardType: textInputType,
      validator: validator,
      contentPadding: const EdgeInsets.all(16.0),
      onChanged: onChanged,
      filled: isFilled,
      fillColor: fillColor ?? Colors.white,
    );
  }
}
