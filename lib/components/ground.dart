

import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame>, CollisionCallbacks{

  Ground():super();


  @override
  FutureOr<void> onLoad() async{
    // TODO: implement onLoad
    size = Vector2(gameRef.size.x * 2, groundSize);
    position = Vector2(0, gameRef.size.y - groundSize);
    sprite = await Sprite.load('ground.png');
    add(RectangleHitbox()); // делаем его сталкиваемым объектом


  }

  @override
  void update(double dt) {
    // TODO: implement update
    position.x -= dt * groundScrollingSpeed;
  if(position.x + size.x/2 <= 0){
    position.x =0;
    /*
    position.x + size.x / 2 — это координата правого края компонента.
    Мы добавляем половину ширины компонента (поскольку position.x — это левая сторона объекта).

     <= 0 — проверка, если правый край компонента полностью выходит за
     левый край экрана (то есть если компонент ушёл за границу видимой области).
     */
  }
  }

}