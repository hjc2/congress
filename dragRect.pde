public class DragRect {
    PApplet parent;
    float x, y;
    float width, height;
    boolean dragging = false;
    boolean resizing = false;
    float offsetX, offsetY;
    float offsetWidth, offsetHeight;

    public DragRect(PApplet p, float x, float y, float width, float height) {
        parent = p;
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    
    public boolean isMouseInside() {
        return (parent.mouseX > x && parent.mouseX < x + width && parent.mouseY > y && parent.mouseY < y + height);
    }

    public void display() {
        parent.stroke(0);
        parent.fill(175);
        parent.rect(x, y, width, height);
    }

    public void update() {
        if (parent.mousePressed) {
            if (dragging) {
                x = parent.mouseX + offsetX;
                y = parent.mouseY + offsetY;
            } else if (resizing) {
                width = parent.mouseX - x + offsetWidth;
                height = parent.mouseY - y + offsetHeight;
            } else if (isMouseInside()) {
                dragging = true;
                offsetX = x - parent.mouseX;
                offsetY = y - parent.mouseY;
            }
        } else {
            dragging = false;
            resizing = false;
        }
    }

    public boolean isMouseOnEdge() {
        float edgeThreshold = 5; // Adjust this threshold as needed
        return (parent.abs(parent.mouseX - (x + width)) < edgeThreshold && parent.abs(parent.mouseY - (y + height)) < edgeThreshold);
    }

    public void startResize() {
        if (isMouseOnEdge()) {
            resizing = true;
            offsetWidth = width - parent.mouseX;
            offsetHeight = height - parent.mouseY;
        }
    }
}
