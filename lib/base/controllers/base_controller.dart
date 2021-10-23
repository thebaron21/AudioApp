import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/app/models/Audio.dart';
import 'package:test_getx/app/utils/local.dart';
import 'package:test_getx/core/contracts/controllers.dart';
enum AudioEvent { PLAY, STOP, RESUME, LOOP, NOTLOOP , PAUSE }
enum AudioState { Completed, PLAYING, STOPPED , RESUME, PAUSE }
enum AudioLoopState{ NOTLOOP , LOOP }
enum AudioHome{ PLAY , PAUSE }
class BaseController extends Controller{

  AudioPlayer audioPlayer = AudioPlayer();
  RxInt current = 0.obs;
  var _audioState = AudioState.STOPPED.obs;
  var _audioHome = AudioHome.PAUSE.obs;
  Rx<AudioLoopState> _audioLoopState = AudioLoopState.NOTLOOP.obs;


  AudioCache? _audioCache;
  Stream<Duration>? _durationStream;
  Stream<Duration>? _positionStream;
  List<Audio> audios =  api;
  IconData iconPlayer =  Icons.play_arrow ;
  AudioPlayer _audioPlayer = AudioPlayer();
  RxInt realAudio = 0.obs;


  @override
  void onInit() {
    super.onInit();
    d();
  }
  d(){
    _audioCache = AudioCache(fixedPlayer: this.audioPlayer , prefix: "");
  }


  loop() async{
    if( _audioLoopState.value == AudioLoopState.LOOP ){
      await _audioCache!.fixedPlayer!.setReleaseMode(ReleaseMode.STOP);
      _audioLoopState(AudioLoopState.NOTLOOP);
    }else {
      await _audioCache!.fixedPlayer!.setReleaseMode(ReleaseMode.LOOP);
      _audioLoopState(AudioLoopState.LOOP);
    }
  }

  back() async{
    realAudio(realAudio.value--);
    await _audioCache!.play( audios[realAudio.value].path , isNotification: true);
    current(realAudio.value);
    _audioState(AudioState.PLAYING);
  }

  next() async{
    realAudio(realAudio.value++);
    await _audioCache!.play(audios[realAudio.value].path , isNotification: true );
    _audioState(AudioState.PLAYING);
    current(realAudio.value);

  }


  _pause() async{
    await _audioCache!.fixedPlayer!.pause();
    _audioState(AudioState.PAUSE);
  }


  play(int index) async{
      try{
        if( index == realAudio.value ) {
          if (_audioCache!.fixedPlayer!.state == PlayerState.PLAYING) {
            _pause();
          } else {
            realAudio(index);
            await _audioCache!.play(audios[index].path);
            _audioState(AudioState.PLAYING);
          }
        }else{
          realAudio(index);
          await _audioCache!.play(audios[index].path);
          _audioState(AudioState.PLAYING);
        }
      }on Exception catch(e){
        _audioPlayer.dispose();
        _audioCache!.fixedPlayer!.dispose();
        throw Exception(e);
      }
  }

  get audioHome => _audioHome;

  resume()async {
    await _audioCache!.fixedPlayer!.resume();
    _audioState(AudioState.RESUME);
  }


  stop() async{
    iconPlayer=Icons.play_arrow;
    update();
    await _audioPlayer.stop();
    await _audioCache!.fixedPlayer!.stop();
    _audioState(AudioState.STOPPED);
  }

  get audioState => _audioState;

  moveTime(int time) {
    _audioCache!.fixedPlayer!.seek( Duration(seconds: time) );

  }

  Stream<Duration> get positionStream => _audioCache!.fixedPlayer!.onAudioPositionChanged;
  Stream<Duration> get durationStream => _audioCache!.fixedPlayer!.onDurationChanged;
  Rx<AudioLoopState> get audioLoopState => _audioLoopState;
  Stream<PlayerState> get state => _audioCache!.fixedPlayer!.onPlayerStateChanged;

  @override
  void onClose() {
    _audioCache!.clearAll();
    _audioCache!.fixedPlayer!.dispose();
    _audioPlayer.dispose();
    super.onClose();
  }

}