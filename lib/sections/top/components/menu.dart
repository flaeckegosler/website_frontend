import 'package:flutter/material.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/provider/scroll_singleton.dart';
import 'package:website_frontend/sections/AppSection.dart';

class Menu extends StatefulWidget {
  final List<AppSection> appSections;

  // Constructor to accept menu items
  Menu({required this.appSections});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;

  ScrollSingleton myScrollSingleton = ScrollSingleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
      constraints: const BoxConstraints(maxWidth: 1250),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          widget.appSections.length,
          (index) => (widget.appSections[index].isVisible)
              ? buildMenuItem(index)
              : SizedBox(),
        ),
      ),
    );
  }

  Widget buildMenuItem(int index) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
            myScrollSingleton.scrollToItem(widget.appSections[index].name);
          });
        },
        onHover: (value) {
          setState(() {
            value ? hoverIndex = index : hoverIndex = selectedIndex;
          });
        },
        child: Container(
          constraints: const BoxConstraints(minWidth: 122),
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                widget.appSections[index].name,
                style: const TextStyle(fontSize: 20, color: kTextColor),
              ),
              // Hover
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom:
                    selectedIndex != index && hoverIndex == index ? -20 : -32,
                child: Image.asset("assets/Hover.png"),
              ),
              // Select
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: selectedIndex == index ? -2 : -32,
                child: Image.asset(
                  "assets/Hover.png",
                  height: 25,
                ),
              ),
            ],
          ),
        ),
      );
}
