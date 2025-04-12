package org.papervision3d.core.geom.renderables
{
   import flash.geom.Rectangle;
   import org.papervision3d.core.render.command.IRenderListItem;
   import org.papervision3d.core.render.command.RenderParticle;
   import org.papervision3d.materials.special.ParticleMaterial;
   
   public class Particle extends AbstractRenderable implements IRenderable
   {
      public var size:Number;
      
      public var renderScale:Number;
      
      public var vertex3D:Vertex3D;
      
      public var renderRect:Rectangle;
      
      public var renderCommand:RenderParticle;
      
      public var material:ParticleMaterial;
      
      public function Particle(param1:ParticleMaterial, param2:Number = 1, param3:Number = 0, param4:Number = 0, param5:Number = 0)
      {
         super();
         this.material = param1;
         this.size = param2;
         this.renderCommand = new RenderParticle(this);
         this.renderRect = new Rectangle();
         vertex3D = new Vertex3D(param3,param4,param5);
      }
      
      public function get y() : Number
      {
         return vertex3D.y;
      }
      
      public function updateRenderRect() : void
      {
         material.updateRenderRect(this);
      }
      
      public function set z(param1:Number) : void
      {
         vertex3D.z = param1;
      }
      
      public function set x(param1:Number) : void
      {
         vertex3D.x = param1;
      }
      
      public function set y(param1:Number) : void
      {
         vertex3D.y = param1;
      }
      
      public function get x() : Number
      {
         return vertex3D.x;
      }
      
      public function get z() : Number
      {
         return vertex3D.z;
      }
      
      override public function getRenderListItem() : IRenderListItem
      {
         return renderCommand;
      }
   }
}

