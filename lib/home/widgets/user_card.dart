// flutter drawer Widget()
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdm_bloc/authentication/authentication.dart';

// flutter drawer Widget()
class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = context.select(
      (AuthenticationBloc bloc) => bloc.state.user,
    );
    final company = context.select(
      (AuthenticationBloc bloc) => bloc.state.companyOwner,
    );
    final expirationDate = context.select(
      (AuthenticationBloc bloc) => bloc.state.expirationDate,
    );
    return Card(
      margin: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 191, 235, 226),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 25,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.account_circle,
                color: Colors.blueAccent,
              ),
              title: Text(
                '${user?.first_name} ${user?.last_name}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              subtitle: const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone_rounded,
                color: Colors.blueAccent,
              ),
              title: Text(
                user?.phone != 'phone' && user?.phone != null
                    ? '${user!.phone}'
                    : 'No Phone Number',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_mail_outlined,
                color: Colors.blueAccent,
              ),
              title: Text(
                '${user?.mail}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.shield,
                color: Colors.blueAccent,
              ),
              title: Text(
                '${user?.role}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.business,
                color: Colors.blueAccent,
              ),
              title: Text(
                '${company?.name}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.date_range,
                color: Colors.blueAccent,
              ),
              title: Text(
                '$expirationDate',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
