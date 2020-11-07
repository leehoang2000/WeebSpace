# A brief guide to developing with git

* __main__ only contains playable versions. 
Don't commit straight up here.

* __develop__ hosts all development process. 
Don't commit straight up here.

* When you want to develop something, make a new branch from __develop__.
 Play with it, then create a pull request to
 __develop__.
 
* Branch names should have a prefix indicating there usage 
(ex: _feature/add_health_bar_, _doc
/health_bar_enlargement_).
Possible prefixes: __feature__, __doc__, __ci__, __chore__, __fix__.

* A pull request to __develop__ or __main__ should be reviewed by 2 to 3 people.
