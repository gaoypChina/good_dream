import 'package:good_dream/models/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../services/foreground_service.dart';
import '../utils/toast_notifications.dart';
import '../sounds/music_sounds.dart';
import '../style/theme_text_styles.dart';

class TabViewThree extends StatefulWidget {
  const TabViewThree({super.key});
  @override
  State createState() => _State();
}

class _State extends State<TabViewThree> {
  ThemeMode themeMode = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    Map<String, double> imageSize = MediaQuerySize.getImageSize(context);
    return Consumer<DataProvider>(builder: (
      context,
      cart,
      child,
    ) {
      return Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: GridView.builder(
            itemCount: musicSounds.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio:
                    MediaQuery.of(context).size.width > 450 ? 1.3 : 1.0,
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (cart.count <= 5) {
                    musicSounds[index].isControlActive =
                        !musicSounds[index].isControlActive;
                    musicSounds[index].isControlActive
                        ? musicSounds[index].player.open(
                            Audio(musicSounds[index].audioFile!),
                            volume: 0.5,
                            loopMode: LoopMode.single)
                        : musicSounds[index].player.pause();
                    /// Add image to page two
                    musicSounds[index].isControlActive
                        ? cart.add(musicSounds[index])
                        : cart.remove(musicSounds[index]);
                  } else if (cart.count == 6) {
                    cart.remove(musicSounds[index]);
                    musicSounds[index].isControlActive = false;
                    musicSounds[index].player.pause();
                    if (cart.count == 6) {
                      notifyMaxSoundsReached();
                    }
                  }
                  if (cart.count == 1) {
                    startForegroundService();
                  } else if (cart.count == 0 && cart.count2 == 0) {
                    stopForegroundService();
                  }
                },
                child: Column(
                  children: [
                    Image(
                      height: imageSize['height'],
                      width: imageSize['width'],
                      image: AssetImage(musicSounds[index].isControlActive
                          ? musicSounds[index].enableIcon!
                          : musicSounds[index].disableIcon!),
                    ),
                    musicSounds[index].isControlActive
                        ? PlayerBuilder.volume(
                            player: musicSounds[index].player,
                            builder: (context, volume) {
                              return Shimmer.fromColors(
                                baseColor: Colors.white,
                                highlightColor: Colors.grey,
                                child: Slider(
                                    activeColor: Colors.grey,
                                    value: volume,
                                    min: 0,
                                    max: 1,
                                    divisions: 50,
                                    onChanged: (v) {
                                      setState(() {
                                        musicSounds[index].player.setVolume(v);
                                      });
                                    }),
                              );
                            })
                        : Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              musicSounds[index].iconTitleText!,
                              style: ThemeTextStyles.textStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ],
                ),
              );
            },
          ));
    });
  }
}
