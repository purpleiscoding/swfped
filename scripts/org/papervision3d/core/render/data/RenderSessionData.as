package org.papervision3d.core.render.data
{
   import flash.display.Sprite;
   import org.papervision3d.core.culling.IParticleCuller;
   import org.papervision3d.core.culling.ITriangleCuller;
   import org.papervision3d.core.proto.CameraObject3D;
   import org.papervision3d.core.proto.SceneObject3D;
   import org.papervision3d.core.render.IRenderEngine;
   import org.papervision3d.view.Viewport3D;
   
   public class RenderSessionData
   {
      public var renderer:IRenderEngine;
      
      public var particleCuller:IParticleCuller;
      
      public var viewPort:Viewport3D;
      
      public var triangleCuller:ITriangleCuller;
      
      public var container:Sprite;
      
      public var scene:SceneObject3D;
      
      public var renderStatistics:RenderStatistics;
      
      public var renderObjects:Array;
      
      public var camera:CameraObject3D;
      
      public var renderLayers:Array;
      
      public var sorted:Boolean;
      
      public function RenderSessionData()
      {
         super();
         this.renderStatistics = new RenderStatistics();
      }
      
      public function destroy() : void
      {
         triangleCuller = null;
         particleCuller = null;
         viewPort = null;
         container = null;
         scene = null;
         camera = null;
         renderer = null;
         renderStatistics = null;
         renderObjects = null;
         renderLayers = null;
      }
      
      public function clone() : RenderSessionData
      {
         var _loc1_:RenderSessionData = null;
         _loc1_ = new RenderSessionData();
         _loc1_.triangleCuller = triangleCuller;
         _loc1_.particleCuller = particleCuller;
         _loc1_.viewPort = viewPort;
         _loc1_.container = container;
         _loc1_.scene = scene;
         _loc1_.camera = camera;
         _loc1_.renderer = renderer;
         _loc1_.renderStatistics = renderStatistics.clone();
         return _loc1_;
      }
   }
}

