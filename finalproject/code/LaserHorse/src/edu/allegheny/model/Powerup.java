/****************************************
 * Michael Camara
 * Honor Code Pledge: This work is mine unless otherwise cited
 * CMPSC 382
 * Final Project: LaserHorse
 ****************************************/

package edu.allegheny.model;

import java.util.Random;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.os.SystemClock;
import edu.allegheny.laserhorse.MainActivity;
import edu.allegheny.util.MyColors;

// Represents a powerup the user can pick-up
public class Powerup {
	
	// Custom paint object for powerups
	private Paint paint;
	
	// Coordinates for upper left corner of powerup
	private int x, y;
	
	// Indicate whether the powerup is traveling up (direction = 1) or down (direction = 2)
	private int direction;
	
	// Path object for creating custom star shape
	private Path star;
	
	// Initialize variables and create initial star shape path
	public Powerup() {
		
		Random rand = new Random();
		paint = new Paint();
		
		// Randomly set x position 
		// Note the powerup cannot appear on the very far right side of the screen
		// for fairness
		x = rand.nextInt((int) (MainActivity.getWidth() * (5.0/6.0)));
		
		// Randomly determine if powerup appears up and travels down, or vice versa
		if(Math.random() < 0.5) {
			direction = 1;
			y = 0;
			
		}
		else {
			direction = -1;
			y = MainActivity.getHeight();
		}
		
		// Outline a star pattern within a 100 x 100 box
		star = new Path();
		star.moveTo(50, 0);
		star.lineTo(60, 35);
		star.lineTo(100, 35);
		star.lineTo(70, 55);
		star.lineTo(80, 100);
		star.lineTo(50, 65);
		star.lineTo(20, 100);
		star.lineTo(30, 55);
		star.lineTo(0, 35);
		star.lineTo(40, 35);
		star.lineTo(50, 0);
	}
	
	// Create a bright green star that rotates and travels vertically along the screen
	public void update(Canvas canvas) {
		canvas.rotate(SystemClock.currentThreadTimeMillis() % 360, x + 50, y + 50);
		canvas.translate(x, y += 4 * direction);
		paint.setColor(MyColors.BRIGHT_GREEN);
		paint.setStyle(Paint.Style.FILL);
		canvas.drawPath(star, paint);
		paint.setColor(MyColors.BLACK);
		paint.setStyle(Paint.Style.STROKE);
		paint.setStrokeWidth(5);
		canvas.drawPath(star, paint);
	}
	
	public int getX() {
		return x;
	}
	
	public int getY() {
		return y;
	}
}