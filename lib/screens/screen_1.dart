import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constant/colors.dart';
import '../widgets/close_button_widget.dart';

const _defaultPadding = 16.0;

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  static const routeName = '/screen_1';

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: HexColor("#B9B9B9"),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Stack(
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        _TitleWidget(),
                        _SubtitleWidget(),
                        _ContentWidget(),
                        _BottomButtonWidget(),
                      ],

                    ),
                    const Positioned(
                      right: 0,
                      top: 0,
                      child: CloseButtonWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _BottomButtonWidget extends StatelessWidget {
  const _BottomButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: _defaultPadding,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: HexColor("#DB00FF"),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 14,
          ),
          child: Text(
            'TEST BUTTON',
            style: GoogleFonts.roboto().copyWith(
              fontWeight: FontWeight.w700,
              color: ProjectColor.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  const _ContentWidget({
    Key? key,
  }) : super(key: key);
  static const _contentText = 'Lorem ipsum dolor sit amet, consectetur '
      'adipiscing elit. '
      'Duis convallis justo non nisi placerat maximus.'
      ' Praesent tincidunt ut dui fermentum '
      'aliquam. Donec nec sodales mi. Proin ultrices dignissim ullamcorper.'
      ' Nam eu consectetur nunc. Vivamus facilisis fermentum varius. '
      'Integer rutrum, ligula ac tempus maximus, erat justo molestie mauris, '
      'tempor porta tellus elit egestas ante. Proin ac leo quis felis posuere '
      'dapibus id et'
      ' felis. Aenean id mattis nulla. Sed at nibh et tortor tempor malesuada.'
      ' \n \nQuisque egestas urna tellus, in tristique risus ultricies laoreet.'
      'Donec fringilla, est non dapibus tempor, nulla metus lacinia arcu,'
      ' at mattis ex dui '
      'nec massa. Class aptent taciti sociosqu ad litora torquent per '
      'conubia nostra,'
      ' per inceptos himenaeos. Cras consequat id purus consectetur '
      'malesuada. '
      'Vestibulum eu varius orci. Nunc ornare neque sit amet volutpat'
      ' tempus. '
      'Aenean et magna nisl. Integer ornare nulla eget odio rutrum '
      'tincidunt.'
      ' Proin imperdiet in sapien id euismod. Sed interdum enim non'
      ' euismod pulvinar.'
      ' Quisque imperdiet eros lectus, vel tempus nibh tristique eu.'
      ' Pellentesque nisi ex,'
      ' fringilla varius nibh et, porta mollis sapien. Donec quis'
      'pulvinar nulla. In tempor a'
      ' massa et venenatis. Pellentesque scelerisque tempus '
      'tellus at venenatis. '
      'Aliquam sed nunc vel purus ultrices porttitor pharetra'
      ' fringilla arcu. Vestibulum '
      'ut dui id quam feugiat viverra at ut dui. Ut placerat '
      'consequat iaculis. Fusce at'
      ' urna quis libero vulputate sollicitudin et maximus est.'
      ' Pellentesque in massa '
      'id enim laoreet vehicula nec eu velit. '
      'Aliquam vestibulum dolor eu felis feugiat '
      'bibendum. Praesent maximus rhoncus elit in finibus. '
      'Interdum et malesuada '
      'fames '
      'ac ante ipsum primis in faucibus.';

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: HexColor("#E5E5E5"),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 400,
        ),
        child: const Scrollbar(
          isAlwaysShown: true,
          child: Padding(
            padding: EdgeInsets.only(
              left: _defaultPadding,
              right: _defaultPadding,
              top: _defaultPadding,
            ),
            child: SingleChildScrollView(
              child: Text(_contentText),
            ),
          ),
        ),
      ),
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    Key? key,
  }) : super(key: key);

  static const _subtitleText = 'Lorem ipsum dolor sit amet,'
      ' consectetur adipiscing elit. Duis '
      'convallis justo non nisi placerat '
      'maximus.';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _defaultPadding,
        right: _defaultPadding,
        bottom: _defaultPadding,
      ),
      child: Text(
        _subtitleText,
        style: GoogleFonts.roboto().copyWith(
          fontWeight: FontWeight.w400,
          color: ProjectColor.black,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _defaultPadding,
        right: _defaultPadding,
        bottom: _defaultPadding,
        top: _defaultPadding,
      ),
      child: Text(
        'Title',
        style: GoogleFonts.roboto().copyWith(
          fontWeight: FontWeight.w700,
          color: ProjectColor.black,
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
