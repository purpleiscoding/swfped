package org.papervision3d.materials.utils
{
   import flash.display.BitmapData;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class LightMaps
   {
      private static var origin:Point = new Point();
      
      public function LightMaps()
      {
         super();
      }
      
      public static function getGouraudMaterialMap(param1:int, param2:int) : BitmapData
      {
         var _loc3_:BitmapData = null;
         var _loc4_:Sprite = null;
         var _loc5_:Matrix = null;
         _loc3_ = new BitmapData(256,3,false,16777215);
         _loc4_ = new Sprite();
         _loc5_ = new Matrix();
         _loc5_.createGradientBox(256,3,0,0,0);
         _loc4_.graphics.beginGradientFill(GradientType.LINEAR,[param2,param1],[1,1],[119,255],_loc5_);
         _loc4_.graphics.drawRect(0,0,256,3);
         _loc4_.graphics.endFill();
         _loc3_.draw(_loc4_);
         return _loc3_;
      }
      
      public static function getPhongMap(param1:int, param2:int, param3:int, param4:int = 255, param5:int = 255) : BitmapData
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Sprite = null;
         var _loc9_:Matrix = null;
         var _loc10_:BitmapData = null;
         _loc6_ = param4;
         _loc7_ = param5;
         _loc8_ = new Sprite();
         _loc9_ = new Matrix();
         _loc9_.createGradientBox(_loc6_,_loc6_,0,0,0);
         _loc8_.graphics.beginGradientFill(GradientType.RADIAL,[param1,param2,param2],[1,1,1],[0,255 - param3,255],_loc9_);
         _loc8_.graphics.drawRect(0,0,_loc6_,_loc6_);
         _loc8_.graphics.endFill();
         _loc10_ = new BitmapData(_loc6_,_loc6_,false,255);
         _loc10_.draw(_loc8_);
         return _loc10_;
      }
      
      public static function getCellMap(param1:int, param2:int, param3:int) : BitmapData
      {
         var _loc4_:BitmapData = null;
         var _loc5_:Number = NaN;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         _loc4_ = LightMaps.getPhongMap(param1,param2,0,255,255);
         _loc5_ = 0;
         _loc6_ = (param1 & 0xFF0000) >> 16;
         _loc7_ = (param2 & 0xFF0000) >> 16;
         _loc8_ = _loc7_ - _loc6_;
         _loc9_ = new Array();
         _loc10_ = new Array();
         _loc11_ = new Array();
         _loc12_ = 0;
         while(_loc12_ <= 255)
         {
            _loc9_[_loc12_] = _loc12_ - _loc12_ % Math.round(256 / param3) << 16;
            _loc10_[_loc12_] = _loc12_ - _loc12_ % Math.round(256 / param3) << 8;
            _loc11_[_loc12_] = _loc12_ - _loc12_ % Math.round(256 / param3);
            _loc12_++;
         }
         _loc4_.paletteMap(_loc4_,_loc4_.rect,origin,_loc9_,_loc10_,_loc11_);
         _loc4_.applyFilter(_loc4_,_loc4_.rect,origin,new BlurFilter(2,2,2));
         return _loc4_;
      }
      
      public static function getGouraudMap(param1:int, param2:int) : BitmapData
      {
         var _loc3_:BitmapData = null;
         var _loc4_:Sprite = null;
         var _loc5_:Matrix = null;
         _loc3_ = new BitmapData(255,3,false,16777215);
         _loc4_ = new Sprite();
         _loc5_ = new Matrix();
         _loc5_.createGradientBox(255,3,0,0,0);
         _loc4_.graphics.beginGradientFill(GradientType.LINEAR,[param2,param1],[1,1],[0,255],_loc5_);
         _loc4_.graphics.drawRect(0,0,255,3);
         _loc4_.graphics.endFill();
         _loc3_.draw(_loc4_);
         return _loc3_;
      }
      
      public static function getFlatMapArray(param1:int, param2:int, param3:int) : Array
      {
         var _loc4_:Array = null;
         var _loc5_:BitmapData = null;
         var _loc6_:Sprite = null;
         var _loc7_:Matrix = null;
         var _loc8_:int = 0;
         _loc4_ = new Array();
         _loc5_ = new BitmapData(256,1,false,0);
         _loc6_ = new Sprite();
         _loc7_ = new Matrix();
         _loc7_.createGradientBox(255,1,0,0,0);
         _loc6_.graphics.beginGradientFill(GradientType.LINEAR,[param1,param2],[1,1],[0,255],_loc7_);
         _loc6_.graphics.drawRect(0,0,255,1);
         _loc6_.graphics.endFill();
         _loc5_.draw(_loc6_);
         _loc8_ = 256;
         while(_loc8_--)
         {
            _loc4_.push(_loc5_.getPixel(_loc8_,0));
         }
         return _loc4_;
      }
      
      public static function getFlatMap(param1:int, param2:int, param3:int) : BitmapData
      {
         var _loc4_:Array = null;
         var _loc5_:BitmapData = null;
         var _loc6_:Sprite = null;
         var _loc7_:Matrix = null;
         _loc4_ = new Array();
         _loc5_ = new BitmapData(255,1,false,0);
         _loc6_ = new Sprite();
         _loc7_ = new Matrix();
         _loc7_.createGradientBox(255,1,0,0,0);
         _loc6_.graphics.beginGradientFill(GradientType.LINEAR,[param2,param1],[1,1],[0,255],_loc7_);
         _loc6_.graphics.drawRect(0,0,255,1);
         _loc6_.graphics.endFill();
         _loc5_.draw(_loc6_);
         return _loc5_;
      }
   }
}

