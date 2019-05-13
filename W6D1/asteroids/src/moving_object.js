function MovingObject(options) {
    this.pos = options.pos;
    this.velocity = options.velocity;
    this.radius = options.radius;
    this.color = options.color;
}

MovingObject.prototype.draw = function(ctx){
        ctx.beginPath();
        ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2); 
        ctx.fillStyle = this.color;
        ctx.fill();
        ctx.stroke();
};

MovingObject.prototype.move = function() {
    this.pos[0] += this.velocity[0];
    this.pos[1] += this.velocity[1];
};

module.exports = MovingObject;