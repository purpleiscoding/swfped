package org.papervision3d.core.material
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import org.papervision3d.core.geom.renderables.Triangle3D;
   import org.papervision3d.core.proto.MaterialObject3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.core.render.draw.ITriangleDrawer;
   
   public class TriangleMaterial extends MaterialObject3D implements ITriangleDrawer
   {
      public function TriangleMaterial()
      {
         super();
      }
      
      override public function drawTriangle(param1:Triangle3D, param2:Graphics, param3:RenderSessionData, param4:BitmapData = null, param5:Matrix = null) : void
      {
      }
   }
}

