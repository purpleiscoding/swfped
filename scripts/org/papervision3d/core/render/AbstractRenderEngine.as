package org.papervision3d.core.render
{
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import org.papervision3d.core.proto.CameraObject3D;
   import org.papervision3d.core.proto.SceneObject3D;
   import org.papervision3d.core.render.command.IRenderListItem;
   import org.papervision3d.core.render.data.RenderStatistics;
   import org.papervision3d.view.Viewport3D;
   
   public class AbstractRenderEngine extends EventDispatcher implements IRenderEngine
   {
      public function AbstractRenderEngine(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function removeFromRenderList(param1:IRenderListItem) : int
      {
         return 0;
      }
      
      public function addToRenderList(param1:IRenderListItem) : int
      {
         return 0;
      }
      
      public function renderScene(param1:SceneObject3D, param2:CameraObject3D, param3:Viewport3D, param4:Boolean = true) : RenderStatistics
      {
         return null;
      }
   }
}

