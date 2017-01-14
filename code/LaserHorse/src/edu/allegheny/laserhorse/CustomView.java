/****************************************
 * Michael Camara
 * Honor Code Pledge: This work is mine unless otherwise cited
 * CMPSC 382
 * Final Project: LaserHorse
 * 
 * Acknowledgement:
 * Background music: "Fog Lands" created by Eric Matyas,
 * 	http://soundimage.org/fantasywonder/
 ****************************************/

package edu.allegheny.laserhorse;

import java.util.ArrayList;
import java.util.Iterator;

import edu.allegheny.laserhorse.R;
import edu.allegheny.model.Background;
import edu.allegheny.model.GameUI;
import edu.allegheny.model.Horse;
import edu.allegheny.model.Orb;
import edu.allegheny.model.Powerup;
import edu.allegheny.util.CollisionDetector;
import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.media.MediaPlayer;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;

// This class controls the majority of the program's sequence of events
@SuppressLint("NewApi")
public class CustomView extends View {

	private Horse horse;					// Horse image
	private Background background;			// Handles background event
	private CollisionDetector detector;		// Detects collisions of objects with eachother or edges
	private Context context;				// The current context, inherited from parent activity
	private GameUI ui;						// UI for score/lives/power display
	private MediaPlayer music;				// Allow for background music
	
	// Most recent times that laser was fired, orb was created, and powerup was created
	private long prevLaserTime = 0, prevOrbTime = 0, prevPowerupTime;
	private long currentTime;				// Indicate the current system time
	private boolean isFirstTime;			// Indicate is the program was just started
	private boolean isTouched;				// Indicate if the user is currently touching the screen
	private int newX = 200, newY = 500;		// Current location the user is touching
	
	private ArrayList<Orb> orbs;			// Maintain list of all orbs currently active
	private ArrayList<Powerup> powerups;	// Maintain list of current powerup
	
	private int LASER_FREQ = 100;			// Frequency lasers fire (lower = faster)
	private int ORB_FREQ = 175;				// Frequency orbs are created (lower = faster)
	private int POWERUP_FREQ = 1000;		// Frequency powerups are created (lower = faster)
	private double ORB_SPEED = 2.8;			// Speed that orbs more from right to left (higher = faster)

	// Initialize all values to default
	@SuppressLint("NewApi")
	public CustomView(Context context) {
		super(context);
		this.context = context;
		horse = new Horse();
		orbs = new ArrayList<Orb>();
		powerups = new ArrayList<Powerup>();
		detector = new CollisionDetector(context);
		ui = new GameUI();
		background = new Background();
		isFirstTime = true;
		isTouched = false;
		
		// Start plaing music sample by Eric Matyas
		music = MediaPlayer.create(context, R.raw.foglands);
		music.setLooping(true);
		music.start();
	}
	
	// Reset all values to their default after a game is reset
	private void reset() {
		horse = new Horse();
		orbs = new ArrayList<Orb>();
		powerups = new ArrayList<Powerup>();
		detector = new CollisionDetector(context);
		ui = new GameUI();
		background = new Background();
		
		LASER_FREQ = 100;
		ORB_FREQ = 175;
		POWERUP_FREQ = 1000;
		ORB_SPEED = 2.8;
		prevLaserTime = prevOrbTime = prevPowerupTime = 0;
		
		music = MediaPlayer.create(context, R.raw.foglands);
		music.setLooping(true);
		music.start();
	}

	// Create all images, apply transformations and handle collision detection events
	@Override
	protected void onDraw(Canvas canvas) {
		
		// Always draw background first
		background.update(canvas);
		
		// If this is the first time the program has been run (since launch), display
		// simple title screen until user touches the screen
		if(isFirstTime == true) {
			ui.showTitle(canvas);
			return;
		}

		// Create and move a horse image to the user's touch location
		canvas.save();
		canvas.translate(newX-250, newY-200);
		canvas.scale(0.5F, 0.5F);
		horse.update(canvas);
		canvas.restore();
		canvas.save();
		
		// Update location of all lasers shot by the horse
		horse.shootLasers(canvas);
		
		// Record the current time
		currentTime = SystemClock.currentThreadTimeMillis();
		
		// Shoot laser from horse as long as user touches the screen
		// (Always wait an interval of time specified by LASER_FREQ
		if(isTouched == true && currentTime - prevLaserTime > LASER_FREQ) {
			horse.createLaser(canvas, detector, newX + 240, newY - 150);
			prevLaserTime = SystemClock.currentThreadTimeMillis();
		}
		
		// Create new orbs from the right of the screen according to an interval
		// specified by ORB_FREQ.  Note the frequency decreases and orb speed
		// decreases over time
		if(currentTime - prevOrbTime > ORB_FREQ) {
			Orb orb = new Orb(ORB_SPEED);
			orbs.add(orb);
			prevOrbTime = SystemClock.currentThreadTimeMillis();
			if(ORB_FREQ > 85) {
				ORB_FREQ -= 1;
			}
			if(ORB_SPEED < 12) {
				 ORB_SPEED += 0.05;
			}
		}
		
		// Create a new powerup following an interval determined by POWERUP_FREQ
		// (NOTE: Only 1 powerup on screen allowed at a time)
		if(powerups.size() == 0 && currentTime - prevPowerupTime > POWERUP_FREQ) {
			Powerup powerup = new Powerup();
			powerups.add(powerup);
		}
		
		// Iterate through all created orbs, update their positions,
		// and check for multiple collision events
		Iterator<Orb> orbIterator = orbs.iterator();
		while(orbIterator.hasNext()) {
			Orb orb = orbIterator.next();
			orb.update(canvas);
			
			// If laser hits orb, increment score and destroy orb
			if(detector.checkLaserOrbCollision(orb) == true) {
				background.addOrb(orb);
				orbIterator.remove();
				ui.adjustScore(1);
			}
			
			// If orb hits left edge of screen, decrement score and destroy orb
			else if(detector.checkEdgeOrbCollision(orb) == true) {
				background.addOrb(orb);
				orbIterator.remove();
				ui.adjustScore(-1);
			}
			
			// If horse hits orb, decrement number of horse lives and destroy orb
			else if(detector.checkHorseOrbCollision(newX, newY, orb) == true) {
				background.addOrb(orb);
				orbIterator.remove();
				ui.adjustScore(-5);
				ui.adjustLives(-1);
			}
		}
		
		// Iterate through all powerups and handle collision events
		Iterator<Powerup> powerupIterator = powerups.iterator();
		while(powerupIterator.hasNext()) {
			Powerup powerup = powerupIterator.next();
			powerup.update(canvas);
			
			// Remove powerup if it goes off screen
			if(detector.checkEdgePowerupCollision(powerup) == true) {
				powerupIterator.remove();
				prevPowerupTime = SystemClock.currentThreadTimeMillis();
			}
			
			// If horse hits powerup, decrease frequency of laser shooting
			else if(detector.checkHorsePowerupCollision(newX, newY, powerup) == true) {
				if(LASER_FREQ > 60) {
					LASER_FREQ -= 4;
				}
				ui.adjustPowerups(1);
				powerupIterator.remove();
				prevPowerupTime = SystemClock.currentThreadTimeMillis();
			}
		}
		
		// Restore canvas transformations to default value
		canvas.restore();
		
		// Update UI with lives, power level, and scores
		ui.update(canvas);

		// Continue to draw and and update game if horse has lives
		if(ui.getLives() != 0) {
			invalidate();
		}
		// If horse has no lives, continue to show game over screen
		else {
			ui.gameOver(canvas);
			music.release();
		}
	}

	// This method activates whenever any touch event occurs
	// Indicates the coordinates of a user's touch
	@Override
	public boolean onTouchEvent(MotionEvent event) {

		// Maintain booleans that indicate whether the user is continually touching the screen
		if(event.getAction() == MotionEvent.ACTION_UP) {
			isTouched = false;
		}
		else {
			isTouched = true;
		}
		
		// Store the new x/y coordinates
		newX = (int) event.getX();
		newY = (int) event.getY();

		// Require user to touch screen again after getting a 'Game Over'
		if(ui.getLives() == 0 && event.getAction() == MotionEvent.ACTION_DOWN) {
			reset();
			invalidate();
		}
		
		// Require user to touch screen after starting program for the first time
		else if(isFirstTime == true && event.getAction() == MotionEvent.ACTION_DOWN) {
			isFirstTime = false;
			invalidate();
		}
					
		return true; // Indicates that a touch event was handled	
	}
}