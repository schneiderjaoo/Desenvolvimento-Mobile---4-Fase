import 'package:audio_player_tutorial2/utils/utils.dart';
import 'package:audio_player_tutorial2/widgets/audio_info.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final AudioPlayer player;
  late final AssetSource path1;
  late final AssetSource path2;
  late final AssetSource path3;
  late final TabController _tabController;

  bool isPlaying = false;
  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    super.initState();
    initPlayer();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    player.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path1 = AssetSource('audios/meuNovoMundo.mp3');
    path2 = AssetSource('audios/Antes.mp3');
    path3 = AssetSource('audios/Namorando ou Não.mp3');
    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    player.onPlayerComplete.listen((_) {
      setState(() => _position = _duration);
    });
  }

  void playPause(int tabIndex) async {
    AssetSource path;

    if (tabIndex == 0) {
      path = path1;
    } else if (tabIndex == 1) {
      path = path2;
    } else {
      path = path3;
    }

    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(path);
      isPlaying = true;
    }
    setState(() {});
  }

  Future<void> _chooseMusic() async {
    int? choice = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione uma música'),
          content: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(1);
                },style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 0, 0),
                 ), 
                child: Text('Novo Mundo'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(2);
                },
                 style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 0, 0),
                 ), 
                child: Text('Antes'),
              ),
             ElevatedButton(
                onPressed: () {
                    Navigator.of(context).pop(3);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 0, 0), 
                  ),
                child: Text('Novo Mundo'),
              ),
            ],
          ),
        );
      },
    );

    if (choice != null) {
      playPause(choice - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 0, 78),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AudioInfo(),
            const SizedBox(height: 50),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildMusicPlayer(0),
                  buildMusicPlayer(1),
                  buildMusicPlayer(2),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _chooseMusic,
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 0, 0, 0), // Escolha a cor desejada aqui
              ),
              child: Text('Selecione uma Música'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMusicPlayer(int tabIndex) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Slider(
          value: _position.inSeconds.toDouble(),
          onChanged: (value) async {
            await player.seek(Duration(seconds: value.toInt()));
            setState(() {});
          },
          min: 0,
          max: _duration.inSeconds.toDouble(),
          inactiveColor: Color.fromARGB(255, 55, 0, 117),
          activeColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(_duration.format()),
          ],
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                player.seek(Duration(seconds: _position.inSeconds - 10));
                setState(() {});
              },
              child: Image.asset('assets/icons/rewind.png'),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () => playPause(tabIndex),
              child: Icon(
                isPlaying ? Icons.pause_circle : Icons.play_circle,
                color: const Color.fromARGB(255, 0, 0, 0),
                size: 100,
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                player.seek(Duration(seconds: _position.inSeconds + 10));
                setState(() {});
              },
              child: Image.asset('assets/icons/forward.png'),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
