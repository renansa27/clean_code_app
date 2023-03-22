import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tut_project/views/common/log.dart';
import 'package:tut_project/views/common/widgets/common_scaffold.dart';
import 'package:tut_project/views/login/cubit/auth_cubit.dart';
import 'package:tut_project/views/login/cubit/auth_state.dart';

//import '../../data/external/external.dart';

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
        //log.d('Teste listener');
        if (_authCubit.state.error != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(_authCubit.state.error!)));
          _authCubit.cleanErrorMessage();
        }
      },
      builder: (context, state) {
        //log.d('Teste builder');
        return CommonScaffold(
          appBar: AppBar(
            title: const Text('Login Page'),
          ),
          isLoading: _authCubit.state.isLoading,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _emailController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
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
                  OutlinedButton(
                    child: const Text('Login'),
                    onPressed: () async {
                      await _authCubit.loginWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(state.user?.nome ?? ''),
                  Text(state.user?.age.toString() ?? ''),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    //_loginViewModel.dispose();
    super.dispose();
  }
}
