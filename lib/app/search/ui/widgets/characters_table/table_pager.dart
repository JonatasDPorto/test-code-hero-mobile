import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste_code_hero_mobile/app/search/ui/extensions/theme.dart';

class TablePager extends StatelessWidget {
  final int numberPages;
  final int pageSelected;
  final void Function(int page) goToPage;
  final double arrowsMargin;
  final int maxNumberPages;
  final int centerPageNumber;
  const TablePager({
    super.key,
    required this.numberPages,
    required this.pageSelected,
    required this.goToPage,
    required this.arrowsMargin,
    required this.maxNumberPages,
    required this.centerPageNumber,
  });

  List<int> _getPagesToDisplay() {
    if (numberPages == 0 && pageSelected == 0) return [0];

    var np = maxNumberPages;
    var list = List<int>.generate(numberPages, (index) => index)
        .skip(max(pageSelected - centerPageNumber, 0))
        .take(np)
        .toList();
    if (list.length < np && pageSelected >= np - 1) {
      return List<int>.generate(numberPages, (index) => index)
          .skip(numberPages - np)
          .take(np)
          .toList();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<int> pagesToDisplay = _getPagesToDisplay();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ArrowLeft(
          isClickable: pageSelected != 0,
          goToPage: () {
            goToPage(pageSelected - 1);
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: arrowsMargin),
          child: SizedBox(
            height: 32,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                var p = pagesToDisplay[index] + 1;
                return _PageCircle(
                  page: p,
                  isSelected: p - 1 == pageSelected,
                  goToPage: goToPage,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: pagesToDisplay.length,
            ),
          ),
        ),
        _ArrowRight(
          isClickable: (pageSelected != numberPages - 1) &&
              !(pageSelected == 0 && numberPages == 0),
          goToPage: () {
            goToPage(pageSelected + 1);
          },
        ),
      ],
    );
  }
}

class _TriangleShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _ArrowLeft extends StatelessWidget {
  final bool isClickable;
  final void Function() goToPage;
  const _ArrowLeft({required this.isClickable, required this.goToPage});

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: true,
      child: _ArrowRight(isClickable: isClickable, goToPage: goToPage),
    );
  }
}

class _ArrowRight extends StatelessWidget {
  final bool isClickable;
  final void Function() goToPage;
  const _ArrowRight({required this.isClickable, required this.goToPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isClickable) {
          goToPage();
        }
      },
      child: ClipPath(
        clipper: _TriangleShape(),
        child: Container(
          width: 12,
          height: 16,
          color: (isClickable)
              ? const Color(0xFFD20A0A)
              : const Color(0xFFD20A0A).withOpacity(.35),
        ),
      ),
    );
  }
}

class _PageCircle extends StatelessWidget {
  final int page;
  final bool isSelected;
  final void Function(int page) goToPage;
  const _PageCircle(
      {required this.isSelected, required this.page, required this.goToPage});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (isSelected) {
      return ClipOval(
        child: Container(
          width: 32,
          height: 32,
          color: theme.textTheme.mainColor,
          child: Center(
            child: Text(
              page.toString(),
              style: theme.textTheme.pagerSelectedText,
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        goToPage(page - 1);
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: theme.textTheme.mainColor)),
        child: Center(
          child: Text(
            page.toString(),
            style: theme.textTheme.pagerUnselectedText,
          ),
        ),
      ),
    );
  }
}
