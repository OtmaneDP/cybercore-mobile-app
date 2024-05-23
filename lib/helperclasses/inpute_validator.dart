


class InputValidator{

  bool isEmail(String email){
    // Regular expression pattern for email validation
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
  String? emailValidator (String? value){
    if(value!.isEmpty){
      return "the email field is required";
    }
    return !isEmail(value) ? "the input field value must be an email" : null;
  }
}