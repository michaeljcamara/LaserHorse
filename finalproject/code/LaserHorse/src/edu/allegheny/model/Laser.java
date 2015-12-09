/****************************************
 * Michael Camara
 * Honor Code Pledge: This work is mine unless otherwise cited
 * CMPSC 382
 * Final Project: LaserHorse
 ****************************************/

package edu.allegheny.model;

import edu.allegheny.util.MyColors;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;

// Represents a single laser (red rectangle on screen)
public class Laser {
	
	// Store dimensions of laser
	private int x, y, width, height;
	
	// Store custom paint object for all lasers
	private static Paint laserPaint = new Paint();
	
	// Indicate whether laser has collided with something
	private boolean collided;

	// Initialize all variables
	public Laser(int x, int y) {
		this.x = x;
		this.y = y;
		width = 50;
		height = 20;
		collided = false;

		laserPaint.setColor(MyColors.BRIGHT_RED);
		laserPaint.setStyle(Paint.Style.FILL);
	}
	
	// Move laser gradually to the right as each update is called
	public void update(Canvas canvas) {//, Paint paint) {
		x += 10;
		canvas.drawRect(new Rect(x,y,x+width,y+height), laserPaint);
	}
	
	// Simple get/set methods below:
	
	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public int getWidth() {
		return width;
	}

	public int getHeight() {
		return height;
	}
	
	public void setCollided(boolean status) {
		collided = status;
	}
	
	public boolean hasCollided() {
		return collided;
	}
}