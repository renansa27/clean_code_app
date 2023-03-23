import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_project/app/di.dart';
import 'package:tut_project/views/common/widgets/common_scaffold.dart';
import 'package:tut_project/views/login/cubit/auth_cubit.dart';
import 'package:tut_project/views/login/cubit/auth_state.dart';
import 'package:tut_project/views/resources/routes_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthCubit _authCubit = getItInstance.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.user == null) {
          //Navigator.pushReplacementNamed(context, Routes.loginRoute);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginRoute,
            (route) => false,
          );
        }
      },
      builder: (context, authState) {
        return CommonScaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
              leading: IconButton(
                  onPressed: _goLoginPage,
                  icon: const Icon(
                    Icons.logout_rounded,
                  )),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Cabeçalho'),
                    Text(_authCubit.getUserName()),
                    Text(_authCubit.state.user?.age.toString() ?? '')
                  ],
                ),
              ],
            ));
      },
    );
  }

  void _goLoginPage() {
    _authCubit.logout();
  }
}
