import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tut_project/views/common/log.dart';
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
  //final AuthCubit _authCubit = GetIt.instance<AuthCubit>();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocConsumer<AuthCubit, AuthState>(
                //bloc: _authCubit,
                listener: (context, state) {
                  if (state.error != null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error!)));
                  }
                },
                builder: ((context, state) {
                  AuthCubit authCubit = context.watch<AuthCubit>();
                  return Column(
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
                          await authCubit.loginWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      Text(state.user?.nome ?? ''),
                      Text(state.user?.age.toString() ?? ''),
                    ],
                  );

                  /* if (state is LoginLoading) {
                    return const Text('Logando...');
                  }
                  if (state is LoginSuccess) {
                    return Center(
                      child: Column(
                        children: [
                          Text(state.user?.nome ?? 'Sem Nome'),
                          Text(state.user?.email ?? 'Sem email'),
                          Text(state.user?.age.toString() ?? 'Sem Idade'),
                        ],
                      ),
                    );
                  }
                  if (state is LoginError) {
                    return Center(
                      child: Column(
                        children: [
                          Text(state?.nome ?? 'Sem Nome'),
                          Text(state?.email ?? 'Sem email'),
                          Text(state?.age.toString() ?? 'Sem Idade'),
                        ],
                      ),
                    );
                  }
                  return const Text('Sem estado emitido'); */
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //_loginViewModel.dispose();
    super.dispose();
  }
}
