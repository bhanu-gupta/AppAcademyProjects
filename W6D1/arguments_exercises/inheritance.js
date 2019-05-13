Function.prototype.inherits = function(superClass) {
    // function Surrogate() {}
    // Surrogate.prototype = superClass.prototype;
    // this.prototype = new Surrogate();
    // this.prototype.constructor = this;
    this.prototype = Object.create(superClass.prototype);
};

function MovingObject(name) { 
    this.name = name;
}

function Ship(name) { 
    this.name = name;

}
Ship.inherits(MovingObject);
Ship.prototype.shoots = function() {
    console.log(`${this.name} says pew pew`);
};
MovingObject.prototype.says = function() {
    console.log(`${this.name} says Hey! I'm walking here!`);
};


function Asteroid(name) {
    this.name = name;
 }
Asteroid.inherits(MovingObject);
 Asteroid.prototype.sound = function(sound) {
    console.log(`${this.name} makes ${sound}`);
 };


const firefly = new Ship('Firefly');
const alien = new Asteroid('Alien');
const UFO = new MovingObject('UFO');
// console.log(firefly.__proto__);
firefly.says();
firefly.shoots();
// UFO.shoots();
// alien.shoots();