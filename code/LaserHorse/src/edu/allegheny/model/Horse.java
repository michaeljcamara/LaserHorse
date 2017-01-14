/****************************************
 * Michael Camara
 * Honor Code Pledge: This work is mine unless otherwise cited
 * CMPSC 382
 * Final Project: LaserHorse
 ****************************************/
package edu.allegheny.model;

import java.util.ArrayList;
import java.util.Iterator;

import edu.allegheny.laserhorse.MainActivity;
import edu.allegheny.util.CollisionDetector;
import edu.allegheny.util.MyColors;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;

// This class represents a horse that is capable of shooting lasers froms its eyes
public class Horse {
	private Canvas canvas;
	private Paint paint;
	
	// Store paths for each segment of the horse's boddy
	private Path trunk, tail, hindBackLeg, hindBackHoof, hindForeLeg, hindForeHoof, frontBackLeg, frontBackHoof, frontForeLeg, frontForeHoof,
		neckAndHead, muzzle, mouth;
	
	// Create list of all lasers currently on screen
	private ArrayList<Laser> lasers;

	public Horse() {
		paint = new Paint();
		
		createHindBackLeg();   // Background 
		createFrontBackLeg();  // Foreground
		createTrunk();
		createHindForeLeg();   // Background
		createFrontForeLeg();  // Foreground
		createHead();
		
		lasers = new ArrayList<Laser>();
	}

	// Create each component of the horse indidividually
	public void update(Canvas canvas) {
		this.canvas = canvas;
		
		fillWithBorder(hindBackLeg, MyColors.MED_BROWN);
		fillWithBorder(hindBackHoof, MyColors.WHITE);
		
		fillWithBorder(frontBackLeg, MyColors.MED_BROWN);
		fillWithBorder(frontBackHoof, MyColors.WHITE);
		
		fillWithBorder(tail, MyColors.MED_BROWN);
		fillWithBorder(trunk, MyColors.MED_BROWN);
		
		fillWithBorder(hindForeLeg, MyColors.MED_BROWN);
		fillWithBorder(hindForeHoof, MyColors.WHITE);
		
		fillWithBorder(frontForeLeg, MyColors.MED_BROWN);
		fillWithBorder(frontForeHoof, MyColors.WHITE);
		
		fillWithBorder(neckAndHead, MyColors.MED_BROWN);
		fillWithBorder(muzzle, MyColors.DARK_BROWN);
		fillWithBorder(mouth, MyColors.BLACK);

		paint.setColor(MyColors.LIGHT_BROWN);
		canvas.drawOval(new RectF(965, 105, 985, 115), paint);
		paint.setColor(MyColors.BLACK);
		canvas.drawOval(new RectF(979, 105, 982, 113), paint);

		// Nostril
		canvas.drawOval(new RectF(1047, 190, 1060, 210), paint);

	}
	
	// Create a brand new laser for this effect
	public void createLaser(Canvas canvas, CollisionDetector detector, int x, int y) {
		
		paint.setColor(MyColors.BRIGHT_RED);
		paint.setStyle(Paint.Style.FILL);
		canvas.drawOval(new RectF(x -15, y-5, x, y + 5), paint);
		
		Laser laser = new Laser(x, y);
		lasers.add(laser);
		
		detector.addLaser(laser);
	}
	
	// Update all lasers with new location info
	public void shootLasers(Canvas canvas) {
		
		Iterator<Laser> laserIterator = lasers.iterator();
		while(laserIterator.hasNext()) {
			Laser laser = laserIterator.next();
			
			if(laser.hasCollided() || laser.getX() > MainActivity.getWidth()) {
				laserIterator.remove();
			}
			else {
				laser.update(canvas);//, paint);
			}
			
		}
	}

	// Create the indicated part of the body
	private void createHindBackLeg() {

		// Hind back leg
		hindBackLeg = new Path();
		hindBackLeg.moveTo(150, 50);
		hindBackLeg.lineTo(150, 100);
		hindBackLeg.lineTo(50, 200);
		hindBackLeg.lineTo(50, 300);
		hindBackLeg.lineTo(75, 325);
		hindBackLeg.lineTo(85, 350);
		hindBackLeg.lineTo(5, 350);
		hindBackLeg.lineTo(5, 325);
		hindBackLeg.lineTo(-15, 300);
		hindBackLeg.lineTo(-15, 200);
		hindBackLeg.lineTo(-25, 180);
		hindBackLeg.lineTo(20, 125);
		hindBackLeg.lineTo(20, 50);
		hindBackLeg.offset(200, 350);

		// Hind back hoof
		hindBackHoof = new Path();
		hindBackHoof.moveTo(50, 300);
		hindBackHoof.lineTo(75, 325);
		hindBackHoof.lineTo(85, 350);
		hindBackHoof.lineTo(5, 350);
		hindBackHoof.lineTo(5, 325);
		hindBackHoof.lineTo(-15, 300);
		hindBackHoof.offset(200, 350);
	}

	public void fillWithBorder(Path path, int color) {
		paint.setColor(color);
		paint.setStyle(Paint.Style.FILL);
		canvas.drawPath(path, paint);
		paint.setStyle(Paint.Style.STROKE);
		paint.setStrokeWidth(10);
		paint.setColor(MyColors.BLACK);
		canvas.drawPath(path, paint);
	}

	private void createFrontBackLeg() {
		// Front back leg
		frontBackLeg = new Path();
		frontBackLeg.moveTo(0, 0);
		frontBackLeg.lineTo(25, 23);
		frontBackLeg.lineTo(35, 60);
		frontBackLeg.lineTo(35, 92);
		frontBackLeg.lineTo(28, 181);
		frontBackLeg.lineTo(35, 201); // Right elbow edge
		frontBackLeg.lineTo(25, 231);
		frontBackLeg.lineTo(32, 302); // Begin hoof
		frontBackLeg.lineTo(40, 316); 
		frontBackLeg.lineTo(65, 361);
		frontBackLeg.lineTo(29, 366);
		frontBackLeg.lineTo(-35, 361);
		frontBackLeg.lineTo(-26, 328); 
		frontBackLeg.lineTo(-36, 307); // End hoof
		frontBackLeg.lineTo(-34, 229);
		frontBackLeg.lineTo(-45, 205);
		frontBackLeg.lineTo(-39, 179);
		frontBackLeg.lineTo(-70, 145);
		frontBackLeg.lineTo(-101, 122);
		frontBackLeg.lineTo(-127, 88);
		frontBackLeg.lineTo(-143, 42);
		frontBackLeg.offset(815, 344);

		// Front back hoof
		frontBackHoof = new Path();
		frontBackHoof.moveTo(32, 302); // Begin hoof
		frontBackHoof.lineTo(40, 316); 
		frontBackHoof.lineTo(65, 361);
		frontBackHoof.lineTo(29, 366);
		frontBackHoof.lineTo(-35, 361);
		frontBackHoof.lineTo(-26, 328); 
		frontBackHoof.lineTo(-36, 307); // End hoof
		frontBackHoof.offset(815, 344);

	}

	public void createTrunk() {
		tail = new Path();
		tail.moveTo(275, 203);
		tail.lineTo(129, 243);
		tail.lineTo(97, 343);
		tail.lineTo(97, 506);
		tail.lineTo(105, 469);
		tail.lineTo(108, 509);
		tail.lineTo(122, 472);
		tail.lineTo(121, 510);
		tail.lineTo(138, 466);
		tail.lineTo(143, 366);
		tail.lineTo(155, 320);
		tail.lineTo(180, 270);
		tail.lineTo(189, 289);

		// Trunk
		trunk = new Path();
		trunk.moveTo(220, 240);
		trunk.lineTo(270, 205);
		trunk.lineTo(331, 194);
		trunk.lineTo(450, 209);
		trunk.lineTo(548, 225);
		trunk.lineTo(631, 226);
		trunk.lineTo(685, 206);
		trunk.lineTo(736, 197);
		trunk.lineTo(857, 242); // Upper right corner
		trunk.lineTo(844, 323);
		trunk.lineTo(848, 396);
		trunk.lineTo(809, 449);
		trunk.lineTo(722, 488);
		trunk.lineTo(624, 485);
		trunk.lineTo(528, 470);
		trunk.lineTo(438, 445);
		trunk.lineTo(378, 458);
		trunk.lineTo(318, 466);
		trunk.lineTo(196, 456);
		trunk.lineTo(164, 383);
		trunk.lineTo(171, 295);
		trunk.lineTo(223, 239);

	}

	private void createHindForeLeg() {

		// Hind fore leg
		hindForeLeg = new Path();
		//	      hindForeLeg.moveTo(50, 50);
		hindForeLeg.moveTo(150, 0);
		hindForeLeg.lineTo(150, 100);
		hindForeLeg.lineTo(50, 200);
		hindForeLeg.lineTo(50, 300);
		hindForeLeg.lineTo(75, 325);
		hindForeLeg.lineTo(85, 350);
		hindForeLeg.lineTo(5, 350);
		hindForeLeg.lineTo(5, 325);
		hindForeLeg.lineTo(-15, 300);
		hindForeLeg.lineTo(-15, 200);
		hindForeLeg.lineTo(-25, 180);
		hindForeLeg.lineTo(0, 125);
		hindForeLeg.lineTo(0, 50);
		hindForeLeg.lineTo(15, 0);
		hindForeLeg.lineTo(15, -50);
		hindForeLeg.offset(150, 350);

		// Hind fore hoof
		hindForeHoof = new Path();
		hindForeHoof.moveTo(50, 300);
		hindForeHoof.lineTo(75, 325);
		hindForeHoof.lineTo(85, 350);
		hindForeHoof.lineTo(5, 350);
		hindForeHoof.lineTo(5, 325);
		hindForeHoof.lineTo(-15, 300);
		hindForeHoof.offset(150, 350);

	}

	private void createFrontForeLeg() {
		// Front fore leg
		frontForeLeg = new Path();
		frontForeLeg.lineTo(25, 23);
		frontForeLeg.lineTo(35, 60);
		frontForeLeg.lineTo(35, 92);
		frontForeLeg.lineTo(28, 181);
		frontForeLeg.lineTo(35, 201); // Right elbow edge
		frontForeLeg.lineTo(25, 231);
		frontForeLeg.lineTo(32, 302); // Begin hoof
		frontForeLeg.lineTo(40, 316); 
		frontForeLeg.lineTo(65, 361);
		frontForeLeg.lineTo(29, 366);
		frontForeLeg.lineTo(-35, 361);
		frontForeLeg.lineTo(-26, 328); 
		frontForeLeg.lineTo(-36, 307); // End hoof
		frontForeLeg.lineTo(-34, 229);
		frontForeLeg.lineTo(-45, 205);
		frontForeLeg.lineTo(-39, 179);
		frontForeLeg.lineTo(-70, 145);
		frontForeLeg.lineTo(-101, 122);
		frontForeLeg.lineTo(-127, 88);
		frontForeLeg.lineTo(-143, 42);
		frontForeLeg.offset(795, 344);

		// Front fore hoof
		frontForeHoof = new Path();
		frontForeHoof.moveTo(32, 302); // Begin hoof
		frontForeHoof.lineTo(40, 316); 
		frontForeHoof.lineTo(65, 361);
		frontForeHoof.lineTo(29, 366);
		frontForeHoof.lineTo(-35, 361);
		frontForeHoof.lineTo(-26, 328); 
		frontForeHoof.lineTo(-36, 307); // End hoof
		frontForeHoof.offset(795, 344);

	}

	private void createHead() {

		// Neck and head
		neckAndHead = new Path();
		neckAndHead.moveTo(700, 210);
		neckAndHead.lineTo(717, 189);
		neckAndHead.lineTo(751, 153);
		neckAndHead.lineTo(774, 131);
		neckAndHead.lineTo(793, 103);
		neckAndHead.lineTo(816, 79);
		neckAndHead.lineTo(847, 62);
		neckAndHead.lineTo(875, 47);
		neckAndHead.lineTo(895, 41);
		neckAndHead.lineTo(923, 11);
		neckAndHead.lineTo(915, 46);
		neckAndHead.lineTo(923, 46);
		neckAndHead.lineTo(942, 14);
		neckAndHead.lineTo(937, 44);
		neckAndHead.lineTo(954, 50);
		neckAndHead.lineTo(968, 59);
		neckAndHead.lineTo(979, 72);
		neckAndHead.lineTo(1001, 117);
		neckAndHead.lineTo(1016, 148);
		neckAndHead.lineTo(1040, 165);
		neckAndHead.lineTo(1061, 191);
		neckAndHead.lineTo(1062, 231);
		neckAndHead.lineTo(1042, 259);
		neckAndHead.lineTo(1020, 264);  // Rostro-caudal border
		neckAndHead.lineTo(995, 254);
		neckAndHead.lineTo(969, 239);
		neckAndHead.lineTo(913, 231);
		neckAndHead.lineTo(895, 220);  // Ramus
		neckAndHead.lineTo(880, 204);
		neckAndHead.lineTo(856, 287);
		neckAndHead.lineTo(832, 315);
		


		// Shade muzzle slightly darker shade
		muzzle = new Path();;
		muzzle.moveTo(1016, 148);
		muzzle.lineTo(1040, 165);
		muzzle.lineTo(1061, 191);
		muzzle.lineTo(1062, 231);
		muzzle.lineTo(1042, 259);
		muzzle.lineTo(1020, 264);  // Rostro-caudal border
		muzzle.lineTo(995, 254);
		muzzle.lineTo(969, 239);
		

		// Mouth
		mouth = new Path();
		mouth.moveTo(1002, 222);
		mouth.lineTo(1012, 234);
		mouth.lineTo(1027, 247);
		mouth.lineTo(1038, 253);
		mouth.lineTo(1038, 253);
		
	}
}
