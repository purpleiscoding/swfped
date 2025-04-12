package org.papervision3d.core.render.command
{
   import flash.display.Graphics;
   import org.papervision3d.core.render.data.RenderSessionData;
   
   public class AbstractRenderListItem implements IRenderListItem
   {
      public var screenDepth:Number;
      
      public function AbstractRenderListItem()
      {
         super();
      }
      
      public function render(param1:RenderSessionData, param2:Graphics) : void
      {
      }
   }
}

