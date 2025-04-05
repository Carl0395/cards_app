import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 240,
        width: double.infinity,
        color: Color(0xFFEAEAEA),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/box.svg',
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  height: 100,
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(left: 16, top: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: Icon(Icons.arrow_back_ios_new, size: 26),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
