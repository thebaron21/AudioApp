import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:test_getx/app/models/Audio.dart';
import 'package:test_getx/app/utils/list_auios.dart';
enum AudioEvent { PLAY, STOP, RESUME, LOOP, NOTLOOP , PAUSE }
enum AudioState { Completed, PLAYING, STOPPED , RESUME, PAUSE }
enum AudioLoopState{ NOTLOOP , LOOP }
class AppController extends GetxController{

  AudioPlayer audioPlayer = AudioPlayer();


  var _audioState = AudioState.STOPPED.obs;
  var _audioLoopState = AudioLoopState.NOTLOOP;
  get status => _audioState;
  AudioCache? _audioCache;
  Stream<Duration>? _durationStream;
  Stream<Duration>? _positionStream;
  List<Audio> audios = AudioServiceList.listPath2();
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
    await _audioPlayer.setReleaseMode(ReleaseMode.STOP);
    await _audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  back(int index) async{
    await _audioCache!.play(  audios[realAudio.value--].path , isNotification: true);
    realAudio(realAudio.value--);
    _audioState(AudioState.PLAYING);
  }

  next(int index) async{
    if( audios.length>(realAudio.value+1) ) {
      await _audioCache!.play(audios[realAudio.value++].path , isNotification: true );
      realAudio(realAudio.value++);
      _audioState(AudioState.PLAYING);
    }
  }


  pause() async{
    await _audioPlayer.pause();
    _audioState(AudioState.PAUSE);
  }


  play(int index) async{
    if( _audioState.value == AudioState.PLAYING ){
      stop();
      realAudio(index);
    }else{
      realAudio(index);
      await _audioCache!.play( index < audios.length ? audios.last.path : audios[index].path );
      _audioState(AudioState.PLAYING);
    }

  }


  resume()async {
    await _audioPlayer.resume();
    _audioState(AudioState.RESUME);
  }


  stop() async{
    await _audioPlayer.stop();
    await _audioCache!.fixedPlayer!.stop();
    _audioState(AudioState.STOPPED);
  }


  moveTime(int time) {
    _audioPlayer.seek( Duration(seconds: time) );
  }

}