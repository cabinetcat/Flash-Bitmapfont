# Flash-Bitmapfont
A Movieclip object in Actionscript 2.0 used for drawing oldskool Bitmap fonts.
example 


## Usage
- put Bitmapfont.as in your project folder
- create an empty Movieclip from your library and link it with the Bitmapfont class
```actionscript
var font:BitmapData = BitmapData.loadBitmap("bmp");
var charwidth = 32;
var charheight = 33;
var fontchars = "abcdefghijklmnopqrstuvwxyz!";
var outputtext = "hello! this is a bitmap test";
var charhorizspace = 3;
var charvertspace = 14;

var target = this.attachMovie("clip1","clip",0);
target.Display(font, charwidth, charheight, fontchars, outputtext, charhorizspace, charvertspace);
target.Format(new Rectangle(0, 0, 300, Stage.height));
```
