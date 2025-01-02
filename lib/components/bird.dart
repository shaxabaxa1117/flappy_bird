import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks{
  Bird()
      : super(
            position: Vector2(birdStartX, birdStartY),
            size: Vector2(birdWidth, birdHeight));

  // physical world properties
  double velocity = 0;


  // LOAD

  @override
  FutureOr<void> onLoad() async {
    sprite =  await Sprite.load('bird.png');
    add(RectangleHitbox()); // делаем его сталкиваемым объектом
  }

  void flap() {
    velocity = jumpStrength;
  }

  @override
  void update(double dt) {
    velocity += gravity * dt; //  V = g*t
    position.y += velocity * dt;

  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    // проверка на сталкивание
    if(other is Ground){
      (parent as FlappyBirdGame).gameOver();
    }
    if(other is Pipe){
      (parent as FlappyBirdGame).gameOver();
    }
  }





}
