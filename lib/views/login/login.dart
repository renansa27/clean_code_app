import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:tut_project/domain/model/model.dart';
import 'package:tut_project/views/login/login_viewmodel.dart';
import 'package:tut_project/views/resources/assets_manager.dart';
import 'package:tut_project/views/resources/color_manager.dart';
import 'package:tut_project/views/resources/values_manager.dart';

//import '../../data/external/external.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginViewModel _loginViewModel = LoginViewModel(GetIt.instance());
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _bind();
  }

  void _bind() {
    _loginViewModel.start();
    _emailController
        .addListener(() => _loginViewModel.setEmail(_emailController.text));
    _passwordController.addListener(
        () => _loginViewModel.setPassword(_passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: AppPadding.p100),
          color: ColorManager.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SvgPicture.asset(
                    SvgAssets.mainLogo,
                  ),
                ],
              ),
            ),
          ),
        )
        /* body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              child: const Text('Get All Users'),
              onPressed: () async {
                await _loginViewModel.login();
              },
            ),
            StreamBuilder<User?>(
                stream: _loginViewModel.user,
                builder: (context, snapshot) {
                  if (snapshot.hasData && !snapshot.hasError) {
                    return Column(
                      children: [
                        Text("Id: ${snapshot.data?.id.toString() ?? 'No id'}"),
                        Text("Nome: ${snapshot.data?.nome ?? 'No name'}"),
                        Text("E-mail: ${snapshot.data?.email ?? 'No email'}"),
                        Text(
                            "Age: ${snapshot.data?.age.toString() ?? 'No age'}"),
                      ],
                    );
                  } else {
                    return const Text("Error");
                  }
                }),
          ],
        ),
      ), */
        );
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    super.dispose();
  }
}
