import 'package:good_dream/fun/toast.dart';
import 'package:good_dream/models/data_provider.dart';
import 'package:good_dream/fun/foreground_service.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../fun/arrays_1_2.dart';

class TabViewOne extends StatefulWidget {
  const TabViewOne({super.key});
  @override
  State createState() => _State();
}

class _State extends State<TabViewOne> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (
      context,
      cart,
      child,
    ) {
      return GridView.builder(
        itemCount: arrays.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.0, crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Column(
            children: [
              TextButton(
                onPressed: () async {
                  if (cart.count <= 5) {
                    arrays[index].isFav = !arrays[index].isFav!;
                    arrays[index].isFav!
                        ? arrays[index].player!.open(
                            Audio(arrays[index].sounds!),
                            volume: 0.5,
                            loopMode: LoopMode.single)
                        : arrays[index].player!.pause();

                    /// Add image to page two
                    arrays[index].isFav!
                        ? cart.add(arrays[index])
                        : cart.remove(arrays[index]);
                  } else if (cart.count == 6) {
                    cart.remove(arrays[index]);
                    arrays[index].isFav = false;
                    arrays[index].player!.pause();
                    //Toast Text
                    if (cart.count == 6) {
                      toast();
                    }
                  }

                  /// foregroundService START or STOP
                  if (cart.count == 1) {
                    foregroundService();
                  } else if (cart.count == 0 && cart.count2 == 0) {
                    foregroundServiceStop();
                  }
                },
                child: Column(
                  children: [
                    Image(
                      height: 50,
                      width: 120,
                      image: AssetImage(arrays[index].isFav!
                          ? arrays[index].picOn!
                          : arrays[index].picOff!),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    arrays[index].isFav!
                        ? AnimatedOpacity(
                            duration: const Duration(milliseconds: 800),
                            opacity: arrays[index].isFav!
                                ? arrays[index].opacityOn!
                                : arrays[index].opacityOff!,
                            child: PlayerBuilder.volume(
                                player: arrays[index].player!,
                                builder: (context, volume) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.grey,
                                    child: Slider(
                                        value: volume,
                                        min: 0,
                                        max: 1,
                                        divisions: 50,
                                        onChanged: (v) {
                                          setState(() {
                                            arrays[index].player!.setVolume(v);
                                          });
                                        }),
                                  );
                                }),
                          )
                        : Text(
                            arrays[index].title!,
                            style: const TextStyle(
                                fontSize: 13.0,
                                //   height: 2.5,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
