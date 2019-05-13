console.log("Webpack is working!");

const MovingObject = require('./moving_object.js');
window.MovingObject = MovingObject;
const Util = require('./utils.js');
window.Util = Util;
const Asteroid = require('./asteroid.js');
window.Asteroid = Asteroid;

document.addEventListener('DOMContentLoaded', () => {
    let canvas = document.getElementById('game-canvas');
    ctx = canvas.getContext('2d');
    const circle = new MovingObject({
        pos: [250, 250], 
        velocity: [10,10],
        radius: 20,
        color: 'green'
    });
    circle.draw(ctx);
    const asteroid = new Asteroid(Util.randomVec(400));
    asteroid.draw(ctx);
    setTimeout(()=>{
        ctx.clearRect(0, 0, 1000, 500);
        asteroid.move();
        circle.move();
        asteroid.draw(ctx);
        circle.draw(ctx);
    }, 1000);
});