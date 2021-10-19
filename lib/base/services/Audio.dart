import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart' as e;


enum AudioEvent { PLAY, STOP, RESUME, LOOP, NOTLOOP , PAUSE }
enum AudioState { Completed, PLAYING, STOPPED , RESUME, PAUSE }
enum AudioLoopState{ NOTLOOP , LOOP }

class AudioService extends ChangeNotifier {
  AudioPlayer? _audioPlayer;
  AudioCache? _audioCache;
  AudioState? _audioState;
  AudioLoopState? audioLoopState;
  Stream<Duration>? _durationStream;
  Stream<Duration>? _positionStream;

  AudioService() {
    _audioPlayer = AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);
    _audioState = AudioState.STOPPED;
    audioLoopState = AudioLoopState.NOTLOOP;

  }

  /// Use This if you will Loop Audio [ReleaseMode]
  @e.protected
  @e.mustCallSuper
  event(AudioEvent mode,{String? file}) async{
    switch (mode) {
      case AudioEvent.PLAY:
        if( _audioState == AudioState.STOPPED ){
          await _audioCache!.play(file!);
        }
        break;
      case AudioEvent.STOP:
        await _audioPlayer!.stop();
        break;
      case AudioEvent.RESUME:
          await _audioPlayer!.resume();
        break;
      case AudioEvent.LOOP:
        await _audioPlayer!.setReleaseMode(ReleaseMode.LOOP);
        break;
      case AudioEvent.NOTLOOP:
        await _audioPlayer!.setReleaseMode(ReleaseMode.STOP);
        break;
      case AudioEvent.PAUSE:
        await _audioPlayer!.pause();
        break;
    }
    _durationStream = _audioPlayer!.onDurationChanged;
    _positionStream = _audioPlayer!.onAudioPositionChanged;
  }

  moveTime(int time){
    _audioPlayer!.seek( Duration(seconds: time) );
  }

  releaseController(ReleaseMode releaseMode) async {
    await _audioPlayer!.setReleaseMode(releaseMode);
  }

  setVolume(double vol)async{
    await _audioPlayer!.setVolume(vol);
  }

  /// This is [Getter] And [Setter]

//
  AudioState get audioState => _audioState!;
//
  set audioState(AudioState value) {
    _audioState = value;
    notifyListeners();
  }
  Stream<Duration> get positionStream => _positionStream!;
  Stream<Duration> get durationStream => _durationStream!;
}
