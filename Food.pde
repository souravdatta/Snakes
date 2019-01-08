public class Food {
    private PVector loc;
    private int gridLength = 0;
    
    public Food(int x, int y, int grid) {
        loc = new PVector(x, y);
        gridLength = grid;
    }
    
    public PVector getLocation() {
        return new PVector(loc.x, loc.y);
    }
    
    public void draw() {
        fill(230, 90, 80);
        rect(loc.x, loc.y, gridLength, gridLength);
    }
}
