# Gameplay sketch

### Some definition:

* __Rocket__: object that each player controls.
* __Hole__: object that sucks or spit. Should be easily identifiable.
* __Moon__: anything that is not a __rocket__ or a __hole__.


### Physic description

* You as a player, control a __rocket__.

* Originally, the __rocket__ orbits a random __moon__.

* You can _click/press_ on another __moon__ to start orbiting that __moon__.
The radius of orbiting is the current distance between your __rocket__ and the chosen __moon__.

* While orbiting a __moon__, the __rocket__ gradually _speeds up_, and the _orbiting radius_ get smaller.

* When you collide with a __moon__, you explode. The end.

* When you collide with __another rocket__ not in the head, that __rocket__ explodes.
The same principle apply when __another rocket__ hits your __rocket__.

* When you collide with another rocket in the head, both __rockets__ change direction opposite to their original
 direction. 
 Their _acceleration_ is the same as before collision.
 
### Winning condition:

* A game ends when there is one player left.
* Ranking based on _time lived_.


### Details

* __moons__ and __rockets__ should be dense.
* no isolated moon.
* Rocket's head ranges from +45 degree to -45 degree from symmetrical axis of the __rocket__.

ex:

    ROCKET DIRECTION: 
    head <----- tail 
       
    --
      --
        --
     HEAD -- 
    ----------------------------- 
     HEAD --
        --
      --
    --

* Synchronize players for consistency.
