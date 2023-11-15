import '../../../import.dart';

class TextInputField extends StatelessWidget {

  String hintText;
  String labelText;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  bool obscureText;
  Widget suffixIcon;
  FocusNode focusNode;
  FocusNode requestFocusNode;
  TextEditingController controller;
  String? Function(String?)? validator;

  TextInputField({super.key, required this.hintText, required this.labelText, required this.keyboardType, required this.textInputAction,
   required this.obscureText, required this.suffixIcon,
    required this.focusNode, required this.requestFocusNode, required this.controller, required this.validator});

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
          fontWeight: FontWeight.w500,
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
      validator: validator,
    );
  }
}
