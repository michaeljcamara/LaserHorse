/****************************************
 * Michael Camara
 * Honor Code Pledge: This work is mine unless otherwise cited
 * CMPSC 382
 * Final Project: LaserHorse
 * 
 * Acknowledgments:
 * The following sound effects are being used under the Creative Commons 0 license:
 * laser, laser2, laser3: https://www.freesound.org/people/kafokafo/sounds/128349/ by user kafokafo
 * pop: https://www.freesound.org/people/wubitog/sounds/188381/ by user wubitog
 * powerup: https://www.freesound.org/people/RandomationPictures/sounds/138491/ by user RandomationPictures
 * horse: https://www.freesound.org/people/shadoWisp/sounds/269571/ by user shadoWisp
 ****************************************/

package edu.allegheny.util;

import java.util.ArrayList;
import java.util.Iterator;

import android.content.Context;
import android.media.MediaPlayer;
import edu.allegheny.laserhorse.R;
import edu.allegheny.laserhorse.MainActivity;
import edu.allegheny.model.Laser;
import edu.allegheny.model.Orb;
import edu.allegheny.model.Powerup;

// Detemine whether certain interactive elements have collided with each other 
public class CollisionDetector {

	// List of all Orbs currently on screen
	private ArrayList<Orb> orbs;
	
	// List of all Lasers currently on screen
	private ArrayList<Laser> lasers;
	
	// Utilities for playing sound effects
	private MediaPlayer pop, laserSound, laserSound2, laserSound3, powerupSound, horseSound;
	
	// Initialize variables
	public CollisionDetector(Context context) {
		orbs = new ArrayList<Orb>();
		lasers = new ArrayList<Laser>();
		
		pop = MediaPlayer.create(context, R.raw.pop);
		laserSound = MediaPlayer.create(context, R.raw.laser);
		laserSound2 = MediaPlayer.create(context, R.raw.laser2);
		laserSound3 = MediaPlayer.create(context, R.raw.laser3);
		powerupSound = MediaPlayer.create(context, R.raw.powerup);
		horseSound = MediaPlayer.create(context, R.raw.horse);
	}
	
	// Add an Orb to list of all Orbs currently on screen
	public void addOrb(Orb orb) {
		orbs.add(orb);
	}
	
	// Add Laser to list of all Lasers currently on s screen, and play sound effect
	public void addLaser(Laser laser) {
		lasers.add(laser);
		
		if(!laserSound.isPlaying()) {
			laserSound.start();
		}
		else if (!laserSound2.isPlaying()){
			laserSound2.start();
		}
		else if(!laserSound3.isPlaying()){
			laserSound3.start();
		}
	}
	
	// Check if powerup has reached edge of screen
	public boolean checkEdgePowerupCollision(Powerup powerup) {
		if(powerup.getY() + 100 <= 0 || powerup.getY() - 100 >= MainActivity.getHeight()) {
			return true;
		}
		else {
			return false;
		}
	}
	
	// Check if horse has collided with a powerup and play sound effect if true
	public boolean checkHorsePowerupCollision(int horseX, int horseY, Powerup powerup) {
		
		if(horseX + 110 <= powerup.getX() + 100
				&& horseY - 200 <= powerup.getY() + 100
				&& horseX + 110 + 175 >= powerup.getX()
				&& horseY - 200 + 140 >= powerup.getY()
				) {
			
			powerupSound.start();
			return true;
		}
		
		else if(horseX - 200 <= powerup.getX() + 100
				&& horseY - 100 <= powerup.getY() + 100
				&& horseX -200 + 385 >= powerup.getX()
				&& horseY - 100 + 250 >= powerup.getY()
				) {
			
			powerupSound.start();
			return true;
		}
		else {
			return false;
		}
	}
	
	// Check if horse has collided with an orb and play sound effect if true
	public boolean checkHorseOrbCollision(int horseX, int horseY, Orb orb) {
		
		if(horseX + 110 <= orb.getX() + orb.getRadius()
				&& horseY - 200 <= orb.getY() + orb.getRadius()
				&& horseX + 110 + 175 >= orb.getX() - orb.getRadius()
				&& horseY - 200 + 140 >= orb.getY() - orb.getRadius()
				) {
			
			horseSound.start();
			pop.start();
			return true;
		}
		
		else if(horseX - 200 <= orb.getX() + orb.getRadius()
				&& horseY - 100 <= orb.getY() + orb.getRadius()
				&& horseX -200 + 385 >= orb.getX() - orb.getRadius()
				&& horseY - 100 + 250 >= orb.getY() - orb.getRadius()
				) {
			
			horseSound.start();
			pop.start();
			return true;
		}
		else {
			return false;
		}
	}
	
	// Check if orb has reached edge of screen and play sound effect if true
	public boolean checkEdgeOrbCollision(Orb orb) {
		if(orb.getX() - orb.getRadius() <= 0) {
			
			pop.start();
			
			return true;
		}
		else {
			return false;
		}
	}
	
	// Check if laser has hit orb and play sound effect if true
	public boolean checkLaserOrbCollision(Orb orb) {
		
		Iterator<Laser> laserIterator = lasers.iterator();
		while(laserIterator.hasNext()) {
			Laser laser = laserIterator.next();
			
			if(laser.getX() > MainActivity.getWidth()) {
				laser.setCollided(true);
				laserIterator.remove();
			}
			else if(laser.getX() <= orb.getX() + orb.getRadius()
					&& laser.getY() <= orb.getY() + orb.getRadius()
					&& laser.getX() + laser.getWidth() >= orb.getX() - orb.getRadius()
					&& laser.getY() + laser.getHeight() >= orb.getY() - orb.getRadius()
					) {
				laser.setCollided(true);
				laserIterator.remove();
				
				pop.start();
				
				return true;
			}
		}
		
		return false;
	}
}