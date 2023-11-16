import '../../../import.dart';

class TextInputField extends StatelessWidget {

  final  String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Widget suffixIcon;
  final FocusNode focusNode;
  final FocusNode? requestFocusNode;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function()? onEditingComplete;

  TextInputField({super.key, required this.hintText, required this.labelText, required this.keyboardType, required this.textInputAction,
   required this.obscureText, required this.suffixIcon,
    required this.focusNode, this.requestFocusNode, required this.controller, required this.validator, this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        contentPadding: EdgeInsets.all(15.0),
        suffixIcon: suffixIcon,
        errorStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.kSecColorText,
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.kSecColorText,
        ), // Inside box padding
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.textFieldBorderColor,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.kPrimaryColorText,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.kPrimaryColor,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      controller: controller,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(requestFocusNode);
      },
      onEditingComplete: onEditingComplete,
      validator: validator,
    );
  }
}
