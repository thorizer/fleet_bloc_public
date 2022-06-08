// flutter drawer Widget()
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdm_bloc/authentication/authentication.dart';
import 'package:gdm_bloc/home/widgets/user_card.dart';

// flutter drawer Widget()
class RightDrawer extends StatelessWidget {
  const RightDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 160,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              curve: Curves.easeInCubic,
              child: Card(
                elevation: 4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/user/profile.png'),
                      radius: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(padding: EdgeInsets.all(8)),
                          Text(
                            context.select(
                              (AuthenticationBloc bloc) =>
                                  '${bloc.state.user!.first_name} ${bloc.state.user!.last_name}',
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(4)),
                          Text(
                            context.select(
                              (AuthenticationBloc bloc) =>
                                  '${bloc.state.companyOwner!.name}',
                            ),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(15),
                        ),
                        elevation: MaterialStateProperty.all<double>(10),
                        enableFeedback: true,
                        fixedSize:
                            MaterialStateProperty.all(const Size(50, 50)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: const Icon(Icons.logout),
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(AuthenticationLogoutRequested());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const UserCard(),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
