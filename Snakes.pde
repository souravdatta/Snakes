final int GRID = 10;
final int WIDTH = 640;
final int HEIGHT = 480;

int pickRandomLocation(int limit) {
    int loc = (int)random(1, limit);
    
    if (loc % GRID != 0) {
        return loc - (loc % GRID);
    }
    else {
        return loc;
    }
}

Snake snake;

Food food;

void setup() {
    size(640, 480);
    frameRate(10);
    snake = new Snake(pickRandomLocation(WIDTH),
                      pickRandomLocation(HEIGHT),
                      GRID);
    food = new Food(pickRandomLocation(WIDTH),
                    pickRandomLocation(HEIGHT),
                    GRID);
}

void draw() {
    background(67);
    snake.update();
    snake.draw();
    food.draw();
    if (snake.canEat(food.getLocation())) {
        snake.eat();
        food = null;
        food = new Food(pickRandomLocation(WIDTH),
                        pickRandomLocation(HEIGHT),
                        GRID);
    }
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP) {
            snake.move(0, -1);
        }
        else if (keyCode == DOWN) {
            snake.move(0, 1);
        }
        else if (keyCode == LEFT) {
            snake.move(-1, 0);
        }
        else if (keyCode == RIGHT) {
            snake.move(1, 0);
        }
    }
}
