import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../providers/horizontal_items.dart';
import '../providers/vertical_items.dart';
import '../widgets/close_button_widget.dart';

const _defaultPadding = 16.0;

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _horizontalPageController = PageController(
    initialPage: 0,
    viewportFraction: 0.86,
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: CloseButtonWidget(),
              ),
              Consumer<HorizontalItemsProvider>(
                builder: (context, value, child) => _SectionWidget(
                  'Section 1  (${value.itemsCount})',
                ),
              ),
              _HorizontalPageView(
                horizontalPageController: _horizontalPageController,
              ),
              Consumer<VerticalItemsProvider>(
                builder: (context, value, child) => _SectionWidget(
                  'Section 2  (${value.itemsCount})',
                ),
              ),
              const _VerticalListView(),
            ],
          ),
        ),
      );
}

class _VerticalListView extends StatelessWidget {
  const _VerticalListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<VerticalItemsProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: value.itemsCount,
          itemBuilder: (context, index) {
            var itemAt = value.itemAt(index);
            if (itemAt == null) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.only(top: _defaultPadding),
              child: _ItemCardWidget(
                child: Text(itemAt),
                itemType: _ItemCardType.vertical,
              ),
            );
          },
        );
      },
    );
  }
}

class _HorizontalPageView extends StatelessWidget {
  const _HorizontalPageView({
    Key? key,
    required PageController horizontalPageController,
  })  : _horizontalPageController = horizontalPageController,
        super(key: key);

  final PageController _horizontalPageController;

  @override
  Widget build(BuildContext context) {
    return Consumer<HorizontalItemsProvider>(
      builder: (context, value, child) => SizedBox(
        height: 182,
        child: PageView.builder(
          itemCount: value.itemsCount,
          itemBuilder: (context, index) {
            var itemAt = value.itemAt(index);
            if (itemAt == null) {
              return const SizedBox.shrink();
            }
            return _ItemCardWidget(
              child: Text(itemAt),
              itemType: _ItemCardType.horizontal,
            );
          },
          controller: _horizontalPageController,
        ),
      ),
    );
  }
}

class _SectionWidget extends StatelessWidget {
  const _SectionWidget(
    this.text, {
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _defaultPadding,
        right: _defaultPadding,
        top: 15.51,
        bottom: _defaultPadding,
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto().copyWith(
          fontWeight: FontWeight.w700,
          color: ProjectColor.black,
          fontSize: 24,
        ),
      ),
    );
  }
}

enum _ItemCardType {
  horizontal,
  vertical,
}

class _ItemCardWidget extends StatelessWidget {
  const _ItemCardWidget({
    required this.itemType,
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final _ItemCardType itemType;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: EdgeInsets.symmetric(
            // ignore: lines_longer_than_80_chars
            horizontal: itemType == _ItemCardType.horizontal ? _defaultPadding / 2 : _defaultPadding,
          ),
          child: Card(
            elevation: 16,
            color: ProjectColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(_defaultPadding),
              child: Center(
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto().copyWith(
                    fontWeight: FontWeight.w700,
                    color: ProjectColor.black,
                    fontSize: 24,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
