import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayButtonWidget extends StatefulWidget {
  final PlayButton playButton;

  PlayButtonWidget({
    @required this.playButton,
  });

  @override
  _PlayButtonWidgetState createState() =>
      _PlayButtonWidgetState(this.playButton);
}

class _PlayButtonWidgetState extends State<PlayButtonWidget> {
  PlayButton playButton;

  _PlayButtonWidgetState(this.playButton);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: playButton.color(),
      child: InkWell(onTap: () {
        setState(() {
          playButton.setNextColor();
        });
      }),
    );
  }
}

class PlayButton {
  List<Color> orderedColors = [
    Colors.grey,
    Colors.green,
    Colors.red,
  ];
  int currentIndexColor = 0;
  Color color() => orderedColors[currentIndexColor];

  PlayButton({Color color}) {
    if (color != null) {
      currentIndexColor = orderedColors.indexOf(color);
    }
  }

  void setNextColor() {
    currentIndexColor = currentIndexColor == orderedColors.length - 1
        ? 0
        : currentIndexColor + 1;
  }
}
