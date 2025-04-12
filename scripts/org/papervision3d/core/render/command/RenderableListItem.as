package org.papervision3d.core.render.command
{
   import flash.geom.Point;
   import org.papervision3d.core.geom.renderables.AbstractRenderable;
   import org.papervision3d.core.render.data.RenderHitData;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class RenderableListItem extends AbstractRenderListItem
   {
      public var renderableInstance:AbstractRenderable;
      
      public var renderable:Class;
      
      public var instance:DisplayObject3D;
      
      public function RenderableListItem()
      {
         super();
      }
      
      public function hitTestPoint2D(param1:Point, param2:RenderHitData) : RenderHitData
      {
         return param2;
      }
   }
}

