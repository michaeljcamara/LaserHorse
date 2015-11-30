package edu.allegheny.util;

import java.util.ArrayList;
import java.util.Iterator;

import android.content.Context;
import android.media.MediaPlayer;
import edu.allegheny.firstgame.R;
import edu.allegheny.laserhorse.SecondActivity;
import edu.allegheny.model.Laser;
import edu.allegheny.model.Orb;

public class CollisionDetector {// implements Runnable{

	private ArrayList<Orb> orbs;
	private ArrayList<Laser> lasers;
	
	public CollisionDetector() {
		orbs = new ArrayList<Orb>();
		lasers = new ArrayList<Laser>();
		
//		thread = new Thread()
	}
	
	public void addOrb(Orb orb) {
		orbs.add(orb);
	}
	
	public void addLaser(Laser laser) {
		lasers.add(laser);
	}
	
	public boolean checkCollision(Context context, Orb orb) {
		
		//**Think, throw exception that hit end, penalty
		if(orb.getX() - orb.getRadius() <= 0) {
			return true;
		}
		
		Iterator<Laser> laserIterator = lasers.iterator();
		while(laserIterator.hasNext()) {
			Laser laser = laserIterator.next();
			
			if(laser.getX() > SecondActivity.getWidth()) {
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
				
				MediaPlayer mp = MediaPlayer.create(context, R.raw.hit);
				mp.start();
				
				return true;
			}
		}
		
		return false;
	}

//	@Override
//	public void run() {
//		
//		Iterator iterator = orbs.iterator();
//		
//		while(true) {
//			
//			while(iterator.hasNext()) {
//				
//			}
//			
//		}
//		
//	}
	
	
	
}
