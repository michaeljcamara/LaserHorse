# LaserHorse

LaserHorse is a game developed for Android devices in which the player controls a horse that shoots lasers from its eyes, because...why not?

In the game, a small horse can be moved by touching and dragging a finger on the screen.  As long as the user continues to touch the screen, the horse will continue to shoot red, rectangular lasers from left to right in regular intervals.  Additionally, filled circles of different colors appear randomly from the right side of the screen and gradually move to the left.  The basic goal is for the user to shoot lasers at these circles to destroy them, which increments a visible score counter, while collecting occasional powerups to increase the horse's firing speed.  However, if one of these circles collides with the left edge of the screen then the user will lose points; and if a circle collides with the horse then it will lose one life.  The game ends when the horse runs out of lives, at which point the user’s final score is displayed prominently and the game can be restarted if desired.

This game was originally developed for a class on visual computing, and thus particular attention was given to luminance contrast, pre-attentive processes, motion parallax, color-blind friendliness, and other principles.  See the report in the `docs` directory for more information on the underlying structure of the program, and usage of these visual computing concepts.

# Running the game

Copy the LaserHorse.apk file onto your Android device.  Use a file manager to navigate to the file and install it, then it should appear in your regular app directory.  The game was originally made using Android 6.0, but has been updated to work using up to Android 7.1.

![1](/screenshots/1.PNG)
