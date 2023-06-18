import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokeapi_project/boxes.dart';
import 'package:pokeapi_project/utils/color_list.dart';
import 'dart:math' as math;

import 'package:pokeapi_project/utils/strings.dart';

class CustomScaffold extends StatefulWidget {
  final String title;
  final Widget body;

  const CustomScaffold({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final GlobalKey _overlayKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showMenu(BuildContext context) {
    final RenderBox? overlay =
        _overlayKey.currentContext?.findRenderObject() as RenderBox?;
    final overlayPosition = overlay?.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - overlayPosition!.dy,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: overlayPosition.dy + AppBar().preferredSize.height),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: ColorList.colors.map((color) {
                      return GestureDetector(
                        onTap: () {
                          Boxes.setPrimaryColor(color);
                          _overlayEntry?.remove();
                          _overlayEntry = null;
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Overlay.of(_overlayKey.currentContext!).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          key: _overlayKey,
          onTap: () {
            _showMenu(context);
          },
          child: Transform.rotate(
            angle: -math.pi / 8,
            child: SvgPicture.asset(
              Strings.logo,
            ),
          ),
        ),
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: widget.body,
    );
  }
}
