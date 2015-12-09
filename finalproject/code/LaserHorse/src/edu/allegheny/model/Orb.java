/****************************************
 * Michael Camara
 * Honor Code Pledge: This work is mine unless otherwise cited
 * CMPSC 382
 * Final Project: LaserHorse
 ****************************************/

package edu.allegheny.model;

import java.util.Random;

import edu.allegheny.laserhorse.MainActivity;
import edu.allegheny.util.MyColors;
import android.graphics.Canvas;
import android.graphics.Paint;

// Represents a sort of "balloon" that can be "popped" by lasers.
// When laser contacts an orb, the user gets a point; when the orb contacts the edge of the screen,
// the user loses a point; when the orb hits the horse, lose a life
public class Orb {

	// Current location and radius
	private float x, y;
	private int radius;
	
	// Custom paint object for this Orb
	private Paint paint;
	private int color;
	
	// Current left-ward speed of this Orb
	private double speed;
	
	// Initialize all starting values
	public Orb(double speed) {
		
		Random rand = new Random();
		paint = new Paint();
		this.speed = speed;
		radius = 50; 
		
		// Randomly start Orb on right side of screen at random Y position
		x = MainActivity.getWidth() + radius;
		y = (int) (MainActivity.getHeight() * 0.05 + rand.nextInt(MainActivity.getHeight()) * 0.8);
		
		// Change color of the orb randomly
		switch(rand.nextInt(5)) {
		case 0:
			color = MyColors.BRIGHT_YELLOW;
			break;
		case 1:
			color = MyColors.BRIGHT_BLUE;
			break;
		case 2:
			color = MyColors.BRIGHT_MAGENTA;
			break;
		case 3:
			color = MyColors.BRIGHT_ORANGE;
			break;
		case 4:
			color = MyColors.BRIGHT_CYAN;
			break;
		}
	}

	// Continually move orb to the left according to given speed/
	public void update(Canvas canvas) {

		x -= speed;
		paint.setColor(color);
		paint.setStyle(Paint.Style.FILL);
		canvas.drawCircle(x, y, radius, paint);
		paint.setColor(MyColors.BLACK);
		paint.setStrokeWidth(5);
		paint.setStyle(Paint.Style.STROKE);
		canvas.drawCircle(x, y, radius, paint);
	}
	
	public int getX() {
		return (int) x;
	}
	
	public int getY() {
		return (int) y;
	}
	
	public int getRadius() {
		return radius;
	}
	
	public int getColor() {
		return color;
	}
	
	public void decreaseX(int amt) {
		x -= amt;
	}
}