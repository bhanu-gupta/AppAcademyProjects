function Game() {
    this.DIM_X = 1000;
    this.DIM_Y = 500;
    this.NUM_ASTEROIDS = 20;
}

Game.prototype.addAsteroids = function() {

};

Game.prototype.randomPosition = function() {
    return Util.randomVec(50);
};