import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/services.dart';

final _assetsAudioPlayer = AssetsAudioPlayer();


startForegroundService() {
  _assetsAudioPlayer.open(
      Audio(
        "assets/audio/silence.mp3",
        metas: Metas(
          title: "Currently playing",
          image: const MetasImage.asset(
              "assets/images/binaural_on.png"),
        ),
      ),
      loopMode: LoopMode.single,
      showNotification: true,
      notificationSettings: NotificationSettings(
          nextEnabled: false,
          prevEnabled: false,
          seekBarEnabled: false,
          playPauseEnabled: false,
          customStopAction: (player) {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }));
}

stopForegroundService() {
  _assetsAudioPlayer.stop();

}
