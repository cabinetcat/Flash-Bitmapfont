# Flash-Bitmapfont
A Movieclip object in Actionscript 2.0 used for drawing oldskool Bitmap fonts.


## Usage
- put Bitmapfont.as in your project folder
- create an empty Movieclip from your library and link it with the Bitmapfont class
- import a bitmap into your library containing the font. You can find a collection of oldskool Amiga, font must
```actionscript
var font:BitmapData = BitmapData.loadBitmap("bmp"); // load the bitmap
var charwidth = 32; // width of each character
var charheight = 33; // height of each character
var fontchars = "abcdefghijklmnopqrstuvwxyz!"; // each character contained in the font in order 
var outputtext = "hello! this is a bitmap test"; // the text that is drawn from the font
var charhorizspace = 3; // horizontal space between chars
var charvertspace = 14; // vertical space between lines (if you )
var formattingrect = new Rectangle(0, 0, 300, Stage.height) // the rectangle bounds by which to position and wrap the text, if width = 0 then it wont wrap.

var target = this.attachMovie("clip1","clip",0);
target.Display(font, charwidth, charheight, fontchars, outputtext, charhorizspace, charvertspace); // draws the text at coords 0,0
target.Format(formattingrect); //wrap and position the text within formattingrect
```
