package org.papervision3d.materials
{
   import flash.display.BitmapData;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import org.papervision3d.core.log.PaperLogger;
   import org.papervision3d.core.render.draw.ITriangleDrawer;
   
   public class BitmapAssetMaterial extends BitmapMaterial implements ITriangleDrawer
   {
      private static var _library:Object = new Object();
      
      private static var _count:Object = new Object();
      
      public function BitmapAssetMaterial(param1:String, param2:Boolean = false)
      {
         super();
         texture = param1;
         this.precise = param2;
      }
      
      override public function get texture() : Object
      {
         return this._texture;
      }
      
      override public function set texture(param1:Object) : void
      {
         if(param1 is String == false)
         {
            PaperLogger.error("BitmapMaterial.texture requires a BitmapData object for the texture");
            return;
         }
         bitmap = createBitmapFromLinkageID(String(param1));
         _texture = param1;
      }
      
      protected function createBitmapFromLinkageID(param1:String) : BitmapData
      {
         var _loc2_:BitmapData = null;
         var _loc3_:BitmapData = null;
         var _loc4_:BitmapData = null;
         var _loc5_:Class = null;
         var _loc6_:XML = null;
         if(this._texture != param1)
         {
            --_count[this._texture];
            _loc4_ = _library[this._texture];
            if((Boolean(_loc4_)) && _count[this._texture] == 0)
            {
               _loc4_.dispose();
            }
         }
         _loc3_ = _library[param1];
         if(!_loc3_)
         {
            _loc5_ = getDefinitionByName(param1) as Class;
            _loc6_ = describeType(_loc5_);
            if(_loc6_..constructor.length() == 0)
            {
               _loc3_ = new _loc5_() as BitmapData;
            }
            else
            {
               _loc3_ = new _loc5_(0,0) as BitmapData;
            }
            _loc2_ = createBitmap(_loc3_);
            _library[param1] = _loc2_;
            _count[param1] = 0;
         }
         else
         {
            _loc2_ = _loc3_;
            maxU = maxV = 1;
            ++_count[param1];
         }
         return _loc2_;
      }
   }
}

