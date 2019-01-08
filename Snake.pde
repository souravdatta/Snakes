import java.util.ArrayList;

public class Snake {
    private int gridLength = 20;
    private int xdir = 1, ydir = 0;
    private PVector head;
    private ArrayList<PVector> tail;
    private int foodCount = 0;
    
    public Snake(int x, int y, int grid) {
        head = new PVector(x, y);
        gridLength = grid;
        tail = new ArrayList<PVector>();
    }
    
    public void draw() {
        fill(255);
        rect(head.x, head.y, gridLength, gridLength);
        
        for (PVector v : tail) {
            rect(v.x, v.y, gridLength, gridLength);
        }
    }
    
    public void move(int x, int y) {
        xdir = x;
        ydir = y;
    }
    
    private void die() {
        foodCount = 0;
        tail.clear();
    }
    
    public void update() {
        if (tail.size() < foodCount) {
            tail.add(0, new PVector(head.x, head.y));
        }
        else {
            for (int i = tail.size() - 2; i >= 0; i--) {
                PVector t1 = tail.get(i + 1);
                PVector t2 = tail.get(i);
                t1.x = t2.x;
                t1.y = t2.y;
            }
            
            if (tail.size() > 0) {
                PVector t1 = tail.get(0);
                t1.x = head.x;
                t1.y = head.y;
            }
        }
        
        int nx = xdir * gridLength;
        int ny = ydir * gridLength;
        
        head.x += nx;
        head.y += ny;
        
        if (head.x <= 0) {
            head.x = 0;
        }
        
        if (head.x >= (width - gridLength)) {
            head.x = width - gridLength;
        }
        
        if (head.y <= 0) {
            head.y = 0;
        }
        
        if (head.y >= (height - gridLength)) {
            head.y = height - gridLength;
        }
        
        // Check for eating itself
        boolean isDead = false;
        for (PVector v : tail) {
            if (dist(v.x, v.y, head.x, head.y) < 0.05) {
                isDead = true;
                break;
            }
        }
        
        if (isDead) {
            die();
        }
    }
    
    public boolean canEat(PVector foodVector) {
        return dist(head.x, head.y, foodVector.x, foodVector.y) <= 0.05;
    }
    
    public void eat() {
        foodCount++;
    }
}
