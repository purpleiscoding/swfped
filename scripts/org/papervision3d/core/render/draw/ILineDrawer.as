package org.papervision3d.core.render.draw
{
   import flash.display.Graphics;
   import org.papervision3d.core.geom.renderables.Line3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   
   public interface ILineDrawer
   {
      function drawLine(param1:Line3D, param2:Graphics, param3:RenderSessionData) : void;
   }
}

