package org.papervision3d.core.culling
{
   import flash.utils.Dictionary;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class ViewportObjectFilter implements IObjectCuller
   {
      protected var _mode:int;
      
      protected var objects:Dictionary;
      
      public function ViewportObjectFilter(param1:int)
      {
         super();
         this.mode = param1;
         init();
      }
      
      public function addObject(param1:DisplayObject3D) : void
      {
         objects[param1] = param1;
      }
      
      public function removeObject(param1:DisplayObject3D) : void
      {
         delete objects[param1];
      }
      
      public function set mode(param1:int) : void
      {
         _mode = param1;
      }
      
      public function get mode() : int
      {
         return _mode;
      }
      
      private function init() : void
      {
         objects = new Dictionary(true);
      }
      
      public function testObject(param1:DisplayObject3D) : int
      {
         if(objects[param1])
         {
            if(_mode == ViewportObjectFilterMode.INCLUSIVE)
            {
               return 1;
            }
            if(_mode == ViewportObjectFilterMode.EXCLUSIVE)
            {
               return 0;
            }
         }
         else
         {
            if(_mode == ViewportObjectFilterMode.INCLUSIVE)
            {
               return 0;
            }
            if(_mode == ViewportObjectFilterMode.EXCLUSIVE)
            {
               return 1;
            }
         }
         return 0;
      }
      
      public function destroy() : void
      {
         objects = null;
      }
   }
}

