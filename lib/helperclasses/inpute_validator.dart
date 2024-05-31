


class InputValidator{

  bool isEmail(String email){
    
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
  String? emailValidator (String? value){
    if(value!.isEmpty){
      return "the email field is required";
    }
    return !isEmail(value) ? "the input field value must be an email" : null;
  }
 
  bool isPhonNumber(value){
    final RegExp regex = RegExp(r'^[0-9]{10}$');
    return regex.hasMatch(value);
  }
  String? phonNumberValidator(String? value){
    if(value!.isEmpty){
      return "the phon number input field is required";
    }
    return !isPhonNumber(value) ? "the input field must be phon number that consiste of 10 degits" : null;
  }

  bool notHaveInvalidCharachters(String value){
    final RegExp regex = RegExp(r'^[A-Z-a-z,\,.]{0,40}$');
    return regex.hasMatch(value);
  }
  String? invalidCharactersValidator(String? value, errorMessage){
    return notHaveInvalidCharachters(value!) ? null : "invalid charackters";
  }

  static bool isValidPassword(input){
    final RegExp regex = RegExp(r".*[0-9].*");
    return regex.hasMatch(input);
  }
}