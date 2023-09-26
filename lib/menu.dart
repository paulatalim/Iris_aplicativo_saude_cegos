import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'devices.dart';
import 'home.dart';
import 'dados.dart';
import 'perfil.dart';

class Menubar extends StatefulWidget {
  const Menubar({super.key});

  @override
  State<Menubar> createState() => _MenubarState();
}

class _MenubarState extends State<Menubar> {
  int _currentIndex = 0;

  // Colocar nomes das telas na lista
  final List<Widget> screens = [
    const HomeScreen(),
    const Devices(),
    const Dados(),
    const UserScreen(title: 'Nome Usuário'),
  ];

  final Color _iconColorPressed = const Color(0xFFA000FF);
  final Color _iconColorNotPressed = const Color(0xFF6B86EB);

  final List<Color> _iconColor = [
    const Color(0xFFA000FF),
    const Color(0xFF6B86EB),
    const Color(0xFF6B86EB),
    const Color(0xFF6B86EB)
  ];

  void _colorSelection(int index) {
    for (int i = 0; i < _iconColor.length; i++) {
      if (i != index) {
        _iconColor[i] = _iconColorNotPressed;
      } else {
        _iconColor[i] = _iconColorPressed;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdba0ff),
      body: screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(FontAwesomeIcons.microphone),
      ),
      bottomNavigationBar: BottomAppBar(
          color: const Color(0xFFE6E6E6),
          height: 0.08 * MediaQuery.of(context).size.height,
          notchMargin: 6.0,
          padding: const EdgeInsets.all(0),
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                color: _iconColor[0],
                icon: const Icon(FontAwesomeIcons.house),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                    _colorSelection(_currentIndex);
                  });
                },
              ),
              IconButton(
                color: _iconColor[1],
                icon: const Icon(FontAwesomeIcons.computer),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                    _colorSelection(_currentIndex);
                  });
                },
              ),

              //Espacamento entre icone e button action bar
              const SizedBox(
                width: 30,
              ),

              IconButton(
                color: _iconColor[2],
                icon: const Icon(FontAwesomeIcons.heartPulse),
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                    _colorSelection(_currentIndex);
                  });
                },
              ),
              IconButton(
                color: _iconColor[3],
                icon: const Icon(FontAwesomeIcons.lock),
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                    _colorSelection(_currentIndex);
                  });
                },
              ),
            ],
          )),
    );
  }
}
