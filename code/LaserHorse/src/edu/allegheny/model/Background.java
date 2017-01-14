/****************************************
 * Michael Camara
 * Honor Code Pledge: This work is mine unless otherwise cited
 * CMPSC 382
 * Final Project: LaserHorse
 ****************************************/

package edu.allegheny.model;

import java.util.ArrayList;
import java.util.Iterator;

import edu.allegheny.util.MyColors;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;

// This class controls what is displayed in the background of the screen
public class Background {

	private Paint paint;
	
	// Record all orbs currently on screen
	private ArrayList<Orb> orbs;
	
	// Record current speed for all popped orbs
	private final int ORB_SPEED = 1;  // higher is faster

	public Background() {
		paint = new Paint();
		orbs = new ArrayList<Orb>();
	}

	// Iterate through orbs and create splash of color on ground
	public void update(Canvas canvas) {
		canvas.drawColor(MyColors.DARK_GRAY);
		Iterator<Orb> orbIterator = orbs.iterator();
		while(orbIterator.hasNext()) {
			Orb orb = orbIterator.next();
			if(orb.getX() + orb.getRadius()*2 <= 0) {
				orbIterator.remove();
			}
			else {
				int color = orb.getColor();

				float [] hsv = new float[3];
				Color.colorToHSV(color, hsv);
				hsv[1] *= 0.2;
				color = Color.HSVToColor(hsv);
				orb.decreaseX(ORB_SPEED);

				paint.setColor(color);
				canvas.drawCircle(orb.getX(), orb.getY(), 100, paint);
			}
		}
	}

	public void addOrb(Orb orb) {
		orbs.add(orb);
	}
}