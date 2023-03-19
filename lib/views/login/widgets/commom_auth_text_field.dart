import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_project/utils/validator.dart';
import 'package:tut_project/views/login/enums/errors_enum.dart';
import 'package:tut_project/views/login/enums/state_enum.dart';
import 'package:tut_project/views/login/widgets/field_strength.dart';
import 'package:tut_project/views/resources/assets_manager.dart';
import 'package:tut_project/views/resources/color_manager.dart';

class CommomTextFieldAuth extends StatefulWidget {
  final String? hintText;
  final GlobalKey<FormState>? formKey;
  final String? warningText;
  final TextEditingController textController;
  final VoidCallback function;
  final bool isStrengthField;
  final TextInputFormatter? inputFormatter;
  final bool? isObscureText;
  final TextEditingController? confirmPasswordController;
  final String? loginError;
  final bool? readOnly;

  const CommomTextFieldAuth({
    Key? key,
    required this.hintText,
    this.formKey,
    required this.warningText,
    required this.textController,
    required this.function,
    required this.isStrengthField,
    this.readOnly,
    this.inputFormatter,
    this.isObscureText,
    this.confirmPasswordController,
    this.loginError,
  }) : super(key: key);

  @override
  State<CommomTextFieldAuth> createState() => _CommomTextFieldAuthState();
}

class _CommomTextFieldAuthState extends State<CommomTextFieldAuth> {
  bool? _obscureText;
  final FocusNode _myFocusNode = FocusNode();
  String _iconState = StateEnum.unfocused;
  int _strength = 0;
  bool _isHover = false;
  String? _loginError;
  bool _isToShowError = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;
    _myFocusNode.addListener(
      () => _myFocusNode.hasFocus
          ? setFocusedColorIcon()
          : setUnfocusedColorIcon(),
    );
    _checkFields();
  }

  @override
  void didUpdateWidget(covariant CommomTextFieldAuth oldWidget) {
    super.didUpdateWidget(oldWidget);
    setUnfocusedColorIcon();
    if (_loginError != null) {
      _setLoginError(_loginError);
    } else if (widget.loginError != null) {
      _setLoginError(widget.loginError);
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (_loginError != null) {
        widget.formKey?.currentState?.validate();
        _checkFields();
      }
    });
  }

  void _setLoginError(String? loginError) {
    setState(() {
      _loginError = loginError;
    });
  }

  void _setHover(PointerEvent details) {
    setState(() {
      _isHover = true;
    });
  }

  void _setNotHover(PointerEvent details) {
    setState(() {
      _isHover = false;
    });
  }

  void setFocusedColorIcon() {
    _setIsToShowError(false);
    if (isEmailField() && checkEmailErrors()) {
      _setLoginError(null);
    } else if (isPasswordField() && checkPasswordErrors()) {
      _setLoginError(null);
    } else if (isConfirmPasswordField() && checkConfirmPasswordErrors()) {
      _setLoginError(null);
    }
    setIconColor(StateEnum.focused);
  }

  void setUnfocusedColorIcon() {
    if (widget.textController.text == '') {
      setIconColor(StateEnum.unfocused);
      _setIsToShowError(false);
    } else if (_loginError == null) {
      setFilledColorIcon();
      _setIsToShowError(false);
    }
  }

  void _setIsToShowError(bool showError) {
    _isToShowError = showError;
  }

  void setErrorColorIcon() {
    setIconColor(StateEnum.error);
    _setIsToShowError(true);
  }

  void setFilledColorIcon() {
    setIconColor(StateEnum.filled);
    _setIsToShowError(false);
  }

  void setIconColor(String state) {
    setState(() {
      _iconState = state;
    });
  }

  void toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText!;
    });
  }

  void setPasswordStrength(int strength) {
    setState(() {
      _strength = strength;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(context),
        if (_iconState == StateEnum.focused && widget.isStrengthField)
          Column(
            children: [
              const SizedBox(height: 12),
              FieldStrength(strength: _strength),
            ],
          ),
      ],
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.0),
            color: ColorManager.white,
            boxShadow: [
              BoxShadow(
                color: ColorManager.darkPrimary,
                blurRadius: 18.0,
                spreadRadius: 1,
                offset: const Offset(10.0, 10.0),
              )
            ],
          ),
          child: MouseRegion(
            onEnter: _setHover,
            onExit: _setNotHover,
            child: TextFormField(
              readOnly: widget.readOnly ?? false,
              inputFormatters:
                  widget.inputFormatter != null ? [widget.inputFormatter!] : [],
              focusNode: _myFocusNode,
              controller: widget.textController,
              obscureText: _obscureText!,
              keyboardType: widget.hintText!.contains('Email')
                  ? TextInputType.emailAddress
                  : widget.hintText!.contains('Password')
                      ? TextInputType.visiblePassword
                      : TextInputType.multiline,
              style: Theme.of(context).textTheme.subtitle1,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: _iconState == StateEnum.error
                          ? ColorManager.error
                          : ColorManager.grey,
                    ),
                contentPadding: const EdgeInsets.only(top: 5, left: 19),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                suffixIcon: _buildIconPosition(context),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
              onChanged: (value) {
                _setLoginError(null);
                if (widget.isStrengthField) {
                  setPasswordStrength(
                      getStreghtPassword(widget.textController.text));
                }
              },
              onFieldSubmitted: (value) {
                if (kIsWeb) {
                  widget.function();
                } else {
                  widget.textController.text.isEmpty
                      ? setFilledColorIcon()
                      : setUnfocusedColorIcon();
                }
              },
              validator: (value) {
                //Validate email field
                if (isEmailField() && checkEmailErrors()) {
                  setErrorColorIcon();
                } else if (isEmailField()) {
                  final isEmailValidated =
                      validateEmail(widget.textController.text);
                  if (!isEmailValidated) {
                    _setLoginError(ErrorsEnum.invalidEmail);
                    _setIsToShowError(true);
                    setErrorColorIcon();
                  }
                }
                //Validate password field
                if (isPasswordField() && checkPasswordErrors()) {
                  setErrorColorIcon();
                } else if (isPasswordField()) {
                  final isPasswordValidated =
                      validatePassword(widget.textController.text);
                  if (!isPasswordValidated) {
                    _setLoginError(
                      widget.textController.text.length < 6
                          ? ErrorsEnum.passwordLenght
                          : ErrorsEnum.invalidPassword,
                    );
                    _setIsToShowError(true);
                    setErrorColorIcon();
                  }
                }
                //Validate password field
                if (isConfirmPasswordField() && checkConfirmPasswordErrors()) {
                  setErrorColorIcon();
                } else if (isConfirmPasswordField()) {
                  final isConfirmEmailValidated = validateConfirmPassword(
                    widget.textController.text,
                    widget.confirmPasswordController?.text,
                  );
                  if (!isConfirmEmailValidated) {
                    _setLoginError(ErrorsEnum.passwordMustMatch);
                    _setIsToShowError(true);
                    setErrorColorIcon();
                  }
                }
                return null;
              },
            ),
          ),
        ),
        if (_isToShowError) warningText(_getErrorText(_loginError)),
      ],
    );
  }

  String? _getErrorText(String? errorCode) {
    if (_loginError == ErrorsEnum.invalidEmailAndPassword) {
      if (isEmailField()) {
        return ErrorsEnum.invalidEmail;
      }
      if (isPasswordField()) {
        return widget.textController.text.length < 6
            ? ErrorsEnum.passwordLenght
            : ErrorsEnum.invalidPassword;
      }
    }
    return _loginError;
  }

  Widget warningText(String? text) {
    final _text = ErrorsEnum.valueOf(text, context);
    if (_text != 'unknow error') {
      return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(top: 10, left: 20),
        child: Text(
          _text,
          style: const TextStyle(
            fontFamily: 'Roboto',
            color: Colors.red,
            fontSize: 12,
            letterSpacing: 0,
          ),
        ),
      );
    } else {
      setUnfocusedColorIcon();
      return const SizedBox(height: 0, width: 0);
    }
  }

  Widget _buildIconPosition(BuildContext context) {
    return Builder(builder: (context) {
      if (widget.hintText!.contains('password')) {
        return Container(
          padding: const EdgeInsetsDirectional.only(end: 16),
          width: 85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(
                  _obscureText! ? Icons.visibility_off : Icons.visibility,
                  color: ColorManager.grey1,
                ),
                onPressed: toggleVisibility,
              ),
              if (_iconState == StateEnum.focused)
                SvgPicture.asset(
                  SvgAssets.unlock,
                  color: Colors.blue,
                )
              else
                _iconState == StateEnum.error
                    ? SvgPicture.asset(
                        SvgAssets.unlock,
                        color: ColorManager.error,
                      )
                    : _iconState == StateEnum.filled
                        ? SvgPicture.asset(
                            SvgAssets.lock,
                            color: Colors.blue,
                          )
                        : _isHover
                            ? SvgPicture.asset(
                                SvgAssets.unlock,
                                color: ColorManager.grey1,
                              )
                            : SvgPicture.asset(
                                SvgAssets.lock,
                                color: ColorManager.grey1,
                              ),
            ],
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.all(16),
          child: _iconState == StateEnum.focused
              ? SvgPicture.asset(
                  SvgAssets.envelopeClosed,
                  color: Colors.blue,
                )
              : _iconState == StateEnum.error
                  ? SvgPicture.asset(
                      SvgAssets.envelopeOpenError,
                    )
                  : _iconState == StateEnum.filled
                      ? SvgPicture.asset(
                          SvgAssets.envelopeClosed,
                          color: Colors.blue,
                        )
                      : SvgPicture.asset(
                          SvgAssets.envelopeClosed,
                          color: ColorManager.grey1,
                        ),
        );
      }
    });
  }

  void _checkFields() {
    if (_myFocusNode.hasFocus) {
      if (isEmailField() && !checkEmailErrors()) {
        _setLoginError(null);
        setFocusedColorIcon();
      } else {
        setUnfocusedColorIcon();
      }
      if (isPasswordField() && !checkPasswordErrors()) {
        _setLoginError(null);
        setFocusedColorIcon();
      } else {
        setUnfocusedColorIcon();
      }

      if (isConfirmPasswordField() && !checkConfirmPasswordErrors()) {
        _setLoginError(null);
        setFocusedColorIcon();
      } else {
        setUnfocusedColorIcon();
      }
    }
  }

  bool isWrongPassword() {
    if (widget.loginError != null) {
      if (ErrorsEnum.wrongPassword == _loginError) {
        return true;
      }
    }
    return false;
  }

  bool isInvalidUser() {
    if (widget.loginError != null) {
      if (ErrorsEnum.userNotFound == _loginError) {
        return true;
      }
    }
    return false;
  }

  //Aqui
  bool isInvalidEmail() {
    if (_loginError != null) {
      if (ErrorsEnum.invalidEmail == _loginError) {
        return true;
      }
    }
    return false;
  }

  bool isInvalidPassword() {
    if (_loginError != null) {
      if (ErrorsEnum.invalidPassword == _loginError) {
        return true;
      }
    }
    return false;
  }

  bool isInvalidEmailAndPassword() {
    if (_loginError != null) {
      if (ErrorsEnum.invalidEmailAndPassword == _loginError) {
        return true;
      }
    }
    return false;
  }

  //New
  bool isAlreayUsedEmail() {
    if (_loginError != null) {
      if (ErrorsEnum.emailAlreadyUsed == _loginError) {
        return true;
      }
    }
    return false;
  }

  bool isPasswordLenght() {
    if (_loginError != null) {
      if (ErrorsEnum.passwordLenght == _loginError) {
        return true;
      }
    }
    return false;
  }

  bool isPasswordMustMatch() {
    if (_loginError != null) {
      if (ErrorsEnum.passwordMustMatch == _loginError) {
        return true;
      }
    }
    return false;
  }

  bool isNetworkProblem() {
    if (_loginError != null) {
      if (ErrorsEnum.networkProblem == _loginError) {
        return true;
      }
    }
    return false;
  }

  bool isTooManyRequests() {
    if (_loginError != null) {
      if (ErrorsEnum.tooManyRequests == _loginError) {
        return true;
      }
    }
    return false;
  }

  bool checkEmailErrors() {
    return isInvalidUser() ||
        isInvalidEmail() ||
        isInvalidEmailAndPassword() ||
        isTooManyRequests() ||
        isAlreayUsedEmail() ||
        isNetworkProblem();
  }

  bool checkPasswordErrors() {
    return isWrongPassword() ||
        isInvalidPassword() ||
        isInvalidEmailAndPassword() ||
        isPasswordLenght();
  }

  bool checkConfirmPasswordErrors() {
    return isPasswordMustMatch();
  }

  bool isEmailField() {
    return widget.hintText!.startsWith('Email');
  }

  bool isPasswordField() {
    return widget.hintText!.startsWith('Senha');
  }

  bool isConfirmPasswordField() {
    final aux = widget.hintText!.startsWith('Confirmar Senha');
    return aux;
  }

  @override
  void dispose() {
    super.dispose();
    _myFocusNode.dispose();
  }
}
