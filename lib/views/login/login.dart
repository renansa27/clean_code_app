import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:tut_project/views/common/log.dart';
import 'package:tut_project/views/common/widgets/common_scaffold.dart';
import 'package:tut_project/views/login/cubit/auth_cubit.dart';
import 'package:tut_project/views/login/cubit/auth_state.dart';
import 'package:tut_project/views/resources/assets_manager.dart';
import 'package:tut_project/views/resources/routes_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final LoginViewModel _loginViewModel = LoginViewModel(GetIt.instance());
  final AuthCubit _authCubit = GetIt.instance<AuthCubit>();
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  bool _isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  void setObscurePassword() {
    setState(() {
      _isObscurePassword = !_isObscurePassword;
    });
  }

  Widget _getContentWidget() {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: _authCubit,
      listener: (context, state) {
        if (_authCubit.state.error != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(_authCubit.state.error!)));
          _authCubit.cleanErrorMessage();
        }
        if (_authCubit.state.user != null) {
          _goHomePage();
        }
      },
      builder: (context, state) {
        return CommonScaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          avoidBottomOnSafeArea: false,
          resizeToAvoidBottomInset: false,
          hasGovLogo: true,
          bgImage: SvgPicture.asset(
            SvgAssets.sesaBottom,
            fit: BoxFit.fitWidth,
          ),
          isLoading: _authCubit.state.isLoading,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset(SvgAssets.ceGovLogo),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _emailController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: _isObscurePassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: setObscurePassword,
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black),
                    child: const Text('ACESSAR'),
                    onPressed: () async {
                      await _authCubit.loginWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    },
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'CADASTRE-SE',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  onPressed: () async {
                    log.d('Ir para tela de cadastro');
                    /* await _authCubit.loginWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ); */
                  },
                ),
                const SizedBox(height: 30),
                Text(state.user?.nome ?? ''),
                Text(state.user?.age.toString() ?? ''),
              ],
            ),
          ),
        );
      },
    );
  }

  void _goHomePage() {
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }

  @override
  void dispose() {
    //_loginViewModel.dispose();
    super.dispose();
  }
}
