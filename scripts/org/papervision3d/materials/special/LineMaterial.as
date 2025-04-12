package org.papervision3d.materials.special
{
   import flash.display.Graphics;
   import org.papervision3d.core.geom.renderables.Line3D;
   import org.papervision3d.core.proto.MaterialObject3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.core.render.draw.ILineDrawer;
   
   public class LineMaterial extends MaterialObject3D implements ILineDrawer
   {
      public function LineMaterial(param1:Number = 16711680, param2:Number = 1)
      {
         super();
         this.lineColor = param1;
         this.lineAlpha = param2;
      }
      
      public function drawLine(param1:Line3D, param2:Graphics, param3:RenderSessionData) : void
      {
         param2.lineStyle(param1.size,lineColor,lineAlpha);
         param2.moveTo(param1.v0.vertex3DInstance.x,param1.v0.vertex3DInstance.y);
         if(param1.cV)
         {
            param2.curveTo(param1.cV.vertex3DInstance.x,param1.cV.vertex3DInstance.y,param1.v1.vertex3DInstance.x,param1.v1.vertex3DInstance.y);
         }
         else
         {
            param2.lineTo(param1.v1.vertex3DInstance.x,param1.v1.vertex3DInstance.y);
         }
         param2.moveTo(0,0);
         param2.lineStyle();
      }
   }
}

