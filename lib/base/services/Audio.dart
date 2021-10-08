import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

enum AudioEvent { PLAY, STOP, RESUME, LOOP, NOTLOOP } //resume
enum AudioState { Completed, PLAYING, STOPPED }

abstract class AudioService {
  late AudioPlayer _audioPlayer;
  late AudioCache _audioCache;
  late AudioState _audioState;

  late Stream<Duration> _durationStream;
  late Stream<Duration> _positionStream;

  AudioService() {
    _audioPlayer = AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);

  }

  /// Use This if you will Loop Audio [ReleaseMode]
  event(AudioEvent mode,{String? file}) async{
    switch (mode) {
      case AudioEvent.PLAY:
        if( _audioState == AudioState.STOPPED ){
          await _audioCache.play(file!);
        }
        break;
      case AudioEvent.STOP:
        await _audioPlayer.stop();
        break;
      case AudioEvent.RESUME:
        if( _audioState == AudioState.Completed ){
          await _audioCache.play(file!);
        }else if( _audioState == AudioState.PLAYING ){
          await _audioPlayer.resume();
        }
        break;
      case AudioEvent.LOOP:
        await _audioPlayer.setReleaseMode(ReleaseMode.LOOP);
        break;
      case AudioEvent.NOTLOOP:
        await _audioPlayer.setReleaseMode(ReleaseMode.STOP);
        break;
    }
    _durationStream = _audioPlayer.onDurationChanged;
    _positionStream = _audioPlayer.onAudioPositionChanged;
  }

  moveTime(int time){
    _audioPlayer.seek( Duration(seconds: time) );
  }

  releaseController(ReleaseMode releaseMode) async {
    await _audioPlayer.setReleaseMode(releaseMode);
  }

  setVolume(double vol)async{
    await _audioPlayer.setVolume(vol);
  }

  /// This is [Getter] And [Setter]
  Stream<Duration> get positionStream => _positionStream;

  AudioState get audioState => _audioState;

  set audioState(AudioState value) {
    _audioState = value;
  }

  Stream<Duration> get durationStream => _durationStream;
}
