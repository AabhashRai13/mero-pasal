import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/app/constants/app_constants.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:pasal/presentation/widgets/custom_surfix_icon.dart';
import 'package:pasal/presentation/widgets/default_button.dart';
import 'package:pasal/presentation/widgets/form_error.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpController.formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: _signUpController.errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: AppStrings.continueText,
            press: () {
              if (_signUpController.formKey.currentState!.validate()) {
                _signUpController.formKey.currentState!.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, Routes.completeProfileScreen);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _signUpController.conformPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _signUpController.removeError(error: AppStrings.kPassNullError);
        } else if (value.isNotEmpty &&
            _signUpController.password == _signUpController.conformPassword) {
          _signUpController.removeError(error: AppStrings.kMatchPassError);
        }
        _signUpController.conformPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          _signUpController.addError(error: AppStrings.kPassNullError);
          return AppStrings.emptyString;
        } else if ((_signUpController.password != value)) {
          _signUpController.addError(error: AppStrings.kMatchPassError);
          return AppStrings.emptyString;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: AppStrings.confirmPassword,
        hintText: AppStrings.reenterYourPassword,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: ImageAssets.lockIcon),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _signUpController.password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _signUpController.removeError(error: AppStrings.kPassNullError);
        } else if (value.length >= 8) {
          _signUpController.removeError(error: AppStrings.kShortPassError);
        }
        _signUpController.password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          _signUpController.addError(error: AppStrings.kPassNullError);
          return AppStrings.emptyString;
        } else if (value.length < 8) {
          _signUpController.addError(error: AppStrings.kShortPassError);
          return AppStrings.emptyString;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: AppStrings.password,
        hintText: AppStrings.enterPassword,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: ImageAssets.lockIcon),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _signUpController.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _signUpController.removeError(error: AppStrings.kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          _signUpController.removeError(error: AppStrings.kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          _signUpController.addError(error: AppStrings.kEmailNullError);
          return AppStrings.emptyString;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          _signUpController.addError(error: AppStrings.kInvalidEmailError);
          return AppStrings.emptyString;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: AppStrings.email,
        hintText: AppStrings.enterEmail,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: ImageAssets.emailIcon),
      ),
    );
  }
}
