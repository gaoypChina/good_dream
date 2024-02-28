import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:good_dream/models/audio_clip.dart';

List<AudioClip> get musicSounds => _musicSounds;
final _musicSounds = [
  AudioClip(
      disableIcon: 'assets/images/lotus_w.png',
      enableIcon: 'assets/images/lotus_on.png',
      iconTitleText: 'Meditation',
      audioFile: "assets/audio/flowing_river2.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/healing_w.png',
      enableIcon: 'assets/images/healing_on.png',
      iconTitleText: 'Healing meditation',
      audioFile: "assets/audio/healing_meditation.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/yoga_w.png',
      enableIcon: 'assets/images/yoga_on.png',
      iconTitleText: 'Yoga',
      audioFile: "assets/audio/morning_sun.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/piano3_w.png',
      enableIcon: 'assets/images/piano3_on.png',
      iconTitleText: 'Asian piano',
      audioFile: "assets/audio/asian_piano.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/piano6_w.png',
      enableIcon: 'assets/images/piano6_on.png',
      iconTitleText: 'Piano',
      audioFile: "assets/audio/love_piano.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/piano5_w.png',
      enableIcon: 'assets/images/piano5_on.png',
      iconTitleText: 'Background Piano ',
      audioFile: "assets/audio/background_piano.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/binaural_w.png',
      enableIcon: 'assets/images/binaural_on.png',
      iconTitleText: 'Binaural',
      audioFile: "assets/audio/binaural.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/guitar_w.png',
      enableIcon: 'assets/images/guitar_on.png',
      iconTitleText: 'Guitar Song',
      audioFile: "assets/audio/ambient_guitars.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/guitar_w.png',
      enableIcon: 'assets/images/guitar_on.png',
      iconTitleText: 'Background Guitar',
      audioFile: "assets/audio/background_guitar.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/om_w.png',
      enableIcon: 'assets/images/om_on.png',
      iconTitleText: 'Om surrounding',
      audioFile: "assets/audio/om.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/zen_w.png',
      enableIcon: 'assets/images/zen_on.png',
      iconTitleText: 'Zen',
      audioFile: "assets/audio/zen.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
  AudioClip(
      disableIcon: 'assets/images/flute_w.png',
      enableIcon: 'assets/images/flute_on.png',
      iconTitleText: 'Flute',
      audioFile: "assets/audio/flute.ogg",
      isControlActive: false,
      player: AssetsAudioPlayer()),
];
