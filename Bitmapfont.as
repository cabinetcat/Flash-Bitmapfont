import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
class Bitmapfont extends MovieClip {
	public var rectformat: Rectangle;
	public var target:MovieClip;
	public var font:BitmapData;
	public var fontchars;
	public var outputtext;
	public var charwidth = 0;
	public var charheight = 0;
	public var charvertspace = 0;
	public var charhorizspace = 0;
	public var spacewidthratio = 0.8;
	public var formattingrect:Rectangle; 
	private var letterindices:Object = {};
	private var letters = [];
	private var words;
	
  public function Display(font:BitmapData, charwidth, charheight, fontchars, outputtext, charhorizspace, charvertspace) 
  {
	  this.font = font;
	  this.charwidth = charwidth;
	  this.charheight = charheight;
	  this.fontchars = fontchars;
	  this.outputtext = outputtext;
	  this.charhorizspace = charhorizspace;
	  this.charvertspace = charvertspace;
	  
	  words = outputtext.split(' ');
	for (var i=0; i<fontchars.length; i++) {
	letterindices[fontchars.charAt(i)] = i;
	}
		initchars();
  }
	public function Format(rect:Rectangle)
	{
		var a = 0;
	var line = 0;
	var cursor:Point = new Point(0,0);
	var line;
	trace('formattingrect = ' + rect.width);
	for (var i=0; i<words.length; i++) {
		trace (rect.x);
		if (words[i].length*(charwidth+charhorizspace) + (charwidth*spacewidthratio) > rect.width - cursor.x && cursor.x != 0) {
			cursor.y += 1;
			cursor.x = 0;
			//linespace = formattingrect.width-words[i].length*fontletterwidth;
			
		} else if(cursor.x != 0) {
			cursor.x += (charwidth*spacewidthratio);
		}
			
		for (var j=0; j<words[i].length; j++) {
			this.getInstanceAtDepth(a)._x = rect.x + cursor.x;
			this.getInstanceAtDepth(a)._y = rect.y + cursor.y*(charheight+charvertspace);
			//trace (cursor.y);
			cursor.x += (charwidth+charhorizspace);
			a++;
		}
	}
	}
	private function initchars() {
	var a = 0;
	for (var i=0; i<words.length; i++) {
		for (var j=0; j<words[i].length; j++) {
			this.createEmptyMovieClip("letter"+a, a);
			var currentindex = letterindices[words[i].charAt(j)];
			//trace(currentindex);
			var sourcerect:Rectangle = new Rectangle((currentindex*charwidth)%font.width, Math.floor((currentindex*charwidth)/font.width)*charheight, charwidth, charheight);
			var bmpdata = new BitmapData(charwidth, charheight);
			bmpdata.copyPixels(font, sourcerect, new Point(0, 0));
			this.getInstanceAtDepth(a).attachBitmap(bmpdata, 0);
			//letters[a]._x = ((fontletterwidth*a)+charhorizspacing)%formattingrect.width;
			//letters[a]._y = Math.floor(((a*fontletterwidth)+charhorizspacing)/formattingrect.width)*(fontletterheight+charvertspacing);
			a++;
		}
	}
}
}
