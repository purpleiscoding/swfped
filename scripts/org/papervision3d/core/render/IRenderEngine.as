package org.papervision3d.core.render
{
   import org.papervision3d.core.proto.CameraObject3D;
   import org.papervision3d.core.proto.SceneObject3D;
   import org.papervision3d.core.render.command.IRenderListItem;
   import org.papervision3d.core.render.data.RenderStatistics;
   import org.papervision3d.view.Viewport3D;
   
   public interface IRenderEngine
   {
      function addToRenderList(param1:IRenderListItem) : int;
      
      function removeFromRenderList(param1:IRenderListItem) : int;
      
      function renderScene(param1:SceneObject3D, param2:CameraObject3D, param3:Viewport3D, param4:Boolean = true) : RenderStatistics;
   }
}

