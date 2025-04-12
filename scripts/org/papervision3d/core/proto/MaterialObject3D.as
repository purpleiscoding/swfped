package org.papervision3d.core.proto
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.events.EventDispatcher;
   import flash.geom.Matrix;
   import flash.utils.Dictionary;
   import org.papervision3d.core.geom.renderables.Triangle3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.core.render.draw.ITriangleDrawer;
   import org.papervision3d.core.render.material.MaterialManager;
   import org.papervision3d.materials.WireframeMaterial;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class MaterialObject3D extends EventDispatcher implements ITriangleDrawer
   {
      private static var _totalMaterialObjects:Number = 0;
      
      public static var DEFAULT_COLOR:int = 0;
      
      public static var DEBUG_COLOR:int = 16711935;
      
      public var widthOffset:Number = 0;
      
      public var name:String;
      
      public var heightOffset:Number = 0;
      
      public var fillAlpha:Number = 0;
      
      public var fillColor:Number = DEFAULT_COLOR;
      
      public var id:Number;
      
      protected var objects:Dictionary;
      
      public var invisible:Boolean = false;
      
      public var smooth:Boolean = false;
      
      public var bitmap:BitmapData;
      
      public var lineColor:Number = DEFAULT_COLOR;
      
      public var lineAlpha:Number = 0;
      
      public var oneSide:Boolean = true;
      
      public var lineThickness:Number = 1;
      
      public var interactive:Boolean = false;
      
      public var opposite:Boolean = false;
      
      public var maxU:Number;
      
      public var tiled:Boolean = false;
      
      public var maxV:Number;
      
      public function MaterialObject3D()
      {
         super();
         this.id = _totalMaterialObjects++;
         MaterialManager.registerMaterial(this);
         objects = new Dictionary(true);
      }
      
      public static function get DEFAULT() : MaterialObject3D
      {
         var _loc1_:MaterialObject3D = null;
         _loc1_ = new WireframeMaterial();
         _loc1_.lineColor = 16777215 * Math.random();
         _loc1_.lineAlpha = 1;
         _loc1_.fillColor = DEFAULT_COLOR;
         _loc1_.fillAlpha = 1;
         _loc1_.doubleSided = false;
         return _loc1_;
      }
      
      public static function get DEBUG() : MaterialObject3D
      {
         var _loc1_:MaterialObject3D = null;
         _loc1_ = new MaterialObject3D();
         _loc1_.lineColor = 16777215 * Math.random();
         _loc1_.lineAlpha = 1;
         _loc1_.fillColor = DEBUG_COLOR;
         _loc1_.fillAlpha = 0.37;
         _loc1_.doubleSided = true;
         return _loc1_;
      }
      
      public function drawTriangle(param1:Triangle3D, param2:Graphics, param3:RenderSessionData, param4:BitmapData = null, param5:Matrix = null) : void
      {
      }
      
      public function get doubleSided() : Boolean
      {
         return !this.oneSide;
      }
      
      public function unregisterObject(param1:DisplayObject3D) : void
      {
         if(Boolean(objects) && objects[param1] != null)
         {
            delete objects[param1];
         }
      }
      
      public function set doubleSided(param1:Boolean) : void
      {
         this.oneSide = !param1;
      }
      
      public function registerObject(param1:DisplayObject3D) : void
      {
         objects[param1] = param1;
      }
      
      public function updateBitmap() : void
      {
      }
      
      override public function toString() : String
      {
         return "[MaterialObject3D] bitmap:" + this.bitmap + " lineColor:" + this.lineColor + " fillColor:" + fillColor;
      }
      
      public function copy(param1:MaterialObject3D) : void
      {
         this.bitmap = param1.bitmap;
         this.smooth = param1.smooth;
         this.lineColor = param1.lineColor;
         this.lineAlpha = param1.lineAlpha;
         this.fillColor = param1.fillColor;
         this.fillAlpha = param1.fillAlpha;
         this.oneSide = param1.oneSide;
         this.opposite = param1.opposite;
         this.invisible = param1.invisible;
         this.name = param1.name;
         this.maxU = param1.maxU;
         this.maxV = param1.maxV;
      }
      
      public function destroy() : void
      {
         objects = null;
         bitmap = null;
         MaterialManager.unRegisterMaterial(this);
      }
      
      public function clone() : MaterialObject3D
      {
         var _loc1_:MaterialObject3D = null;
         _loc1_ = new MaterialObject3D();
         _loc1_.copy(this);
         return _loc1_;
      }
   }
}

