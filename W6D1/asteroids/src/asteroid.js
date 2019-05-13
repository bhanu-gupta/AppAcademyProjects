// const MovingObject = require('./moving_object.js');

function Asteroid(pos) {
    this.COLOR = 'orange';
    this.RADIUS = 10;
    MovingObject.call(this,({
        pos: pos,
        velocity: Util.randomVec(20),
        radius: this.RADIUS,
        color: this.COLOR
    }));
}
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;