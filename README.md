# Flash-Bitmapfont
A Movieclip object in Actionscript 2.0 used for drawing Bitmap fonts.

## Usage
- put Bitmapfont.as in your project folder
- create an empty Movieclip from your library and link it with the Bitmapfont class
- import a bitmap into your library containing the font. **You can find a collection of oldskool Amiga bitmap fonts [here](https://github.com/ianhan/BitmapFonts)**

```actionscript
var font:BitmapData = BitmapData.loadBitmap("bmp"); // load the bitmap
var charwidth = 32; // width of each character on the spritesheet
var charheight = 33; // height of each character on the spritesheet
var fontchars = "abcdefghijklmnopqrstuvwxyz!"; // each character contained in the spritesheet in order 
var outputtext = "hello! this is a bitmap test"; // the text to be printed 
var charhorizspace = 3; // horizontal space between chars
var charvertspace = 14; // vertical space between lines (if your text wraps)
var rect = new Rectangle(0, 0, 300, Stage.height) // the rectangle bounds by which to position and wrap the text, if width = 0 then it wont wrap.

var target = this.attachMovie("clip1","clip",0);
target.Display(font, charwidth, charheight, fontchars, outputtext, charhorizspace, charvertspace); // print a collection characters within the MovieClip at coords 0,0
target.SetFontSize(10); // optionally, set the height of the printed text in pixels. If called after Format() it will retain it's old spacing and wrapping..
target.Format(rect); // wrap and position the text within a rectangle
```
