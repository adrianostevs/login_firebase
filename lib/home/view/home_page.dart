import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/app/bloc/app_bloc.dart';
import 'package:login_firebase/home/widgets/avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
              key: const Key('homePage_logout_iconButton'),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.email ?? '',
              style: textTheme.headline6,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.name ?? '',
              style: textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
