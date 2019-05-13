function Game() {
    this.DIM_X = 1000;
    this.DIM_Y = 500;
    this.NUM_ASTEROIDS = 20;
    this.asteroids = [];
    this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
    for (let i = 0; i < this.NUM_ASTEROIDS; i++){
        const asteroid = new Asteroid(this.randomPosition());
        this.asteroids.push(asteroid);
    }
};

Game.prototype.randomPosition = function (){
    const x = Math.floor(Math.random() * this.DIM_X);
    const y = Math.floor(Math.random() * this.DIM_Y);
    return [x, y];
};

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, 1000, 500);
    this.asteroids.forEach(asteroid => {
        asteroid.draw(ctx);
    });
};

Game.prototype.moveObjects = function() {
    ctx.clearRect(0, 0, 1000, 500);
    this.asteroids.forEach(asteroid => {
        asteroid.move();
    });
};

module.exports = Game;