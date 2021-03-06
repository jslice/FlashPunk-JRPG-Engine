package entities.spells 
{
	import net.flashpunk.*;
	import net.flashpunk.utils.*;
	import net.flashpunk.graphics.*;
	import utility.*;
	import flash.geom.Point;
	import entities.*;
	import worlds.*;
	
	/**
	 * ...
	 * @author dolgion1
	 */
	public class FireSpell extends Entity
	{
		public var spritemap:Spritemap;
		public var curAnimation:String = "left";
		
		public function FireSpell(_x:int, _y:int) 
		{
			setupSpritesheet();
			graphic = spritemap;
			
			// play the animation immediately
			// since the animation doesn't loop, 
			// the callback get called
			spritemap.play(curAnimation);
			
			x = _x;
			y = _y;
		}
		
		override public function update():void
		{
			super.update();
			
			spritemap.play(curAnimation);
		}
		
		public function setupSpritesheet():void
		{
			spritemap = new Spritemap(GFX.FIRE_SPELL, GC.FIRE_SPELL_SPRITE_WIDTH, GC.FIRE_SPELL_SPRITE_HEIGHT);
			spritemap.add("left", [0, 1, 2, 3, 4, 5], 9, false);
			spritemap.add("right", [6, 7, 8, 9, 10, 11], 9, false);
			spritemap.callback = animationCallback;
		}
		
		public function animationCallback():void
		{
			// and the callback removes this entity from the stage it's on
			// the entity lives only as long as its animation plays
			this.world.remove(this);
			Battle.enterNextTurn = true;
		}
	}

}

