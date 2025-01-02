

import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe_manager.dart';
import 'package:flappy_bird/constants.dart';

import 'package:flutter/material.dart';

import 'components/pipe.dart';

class FlappyBirdGame extends FlameGame with TapDetector,HasCollisionDetection{


  late Bird bird;
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;

  @override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad


    background = Background((size));
    add(background);

    bird = Bird();
    add(bird);

    ground = Ground();
    add(ground);

    pipeManager = PipeManager();
    add(pipeManager);
  }


  @override
  void onTap() async{
    // TODO: implement onTap
    bird.flap();
  }


  bool isGameOver = false;

  void gameOver(){
    
    if(isGameOver) return;

    isGameOver = true;
    pauseEngine();
    
    showDialog(context: buildContext!, builder: (context) => AlertDialog(
      title: Text('Game Over'),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);

          resetGame();
        }, child: Text('Start over'))
      ],
    ),);
    
    
    
  }
  void resetGame(){
    bird.position = Vector2(birdStartX,birdStartY);
    bird.velocity = 0;
    isGameOver = false;
    children.whereType<Pipe>().forEach((Pipe pipe) => pipe.removeFromParent());

resumeEngine();

  }

}