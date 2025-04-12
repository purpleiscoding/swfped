package org.papervision3d.core.geom
{
   import org.papervision3d.core.culling.IObjectCuller;
   import org.papervision3d.core.geom.renderables.Vertex3D;
   import org.papervision3d.core.math.Matrix3D;
   import org.papervision3d.core.math.Number3D;
   import org.papervision3d.core.proto.GeometryObject3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class Vertices3D extends DisplayObject3D
   {
      public function Vertices3D(param1:Array, param2:String = null)
      {
         super(param2,new GeometryObject3D());
         this.geometry.vertices = param1 || new Array();
      }
      
      public function projectFrustum(param1:DisplayObject3D, param2:RenderSessionData) : Number
      {
         return 0;
      }
      
      override public function project(param1:DisplayObject3D, param2:RenderSessionData) : Number
      {
         super.project(param1,param2);
         if(this.culled)
         {
            return 0;
         }
         if(param2.camera is IObjectCuller)
         {
            return projectFrustum(param1,param2);
         }
         return param2.camera.projectVertices(this,param2);
      }
      
      override public function clone() : DisplayObject3D
      {
         var _loc1_:DisplayObject3D = null;
         var _loc2_:Vertices3D = null;
         _loc1_ = super.clone();
         _loc2_ = new Vertices3D(null,_loc1_.name);
         _loc2_.material = _loc1_.material;
         if(_loc1_.materials)
         {
            _loc2_.materials = _loc1_.materials.clone();
         }
         if(this.geometry)
         {
            _loc2_.geometry = this.geometry.clone(_loc2_);
         }
         _loc2_.copyTransform(this.transform);
         return _loc2_;
      }
      
      public function transformVertices(param1:Matrix3D) : void
      {
         geometry.transformVertices(param1);
      }
      
      public function boundingBox() : Object
      {
         var _loc1_:Array = null;
         var _loc2_:Object = null;
         var _loc3_:Vertex3D = null;
         _loc1_ = this.geometry.vertices;
         _loc2_ = new Object();
         _loc2_.min = new Number3D(Number.MAX_VALUE,Number.MAX_VALUE,Number.MAX_VALUE);
         _loc2_.max = new Number3D(-Number.MAX_VALUE,-Number.MAX_VALUE,-Number.MAX_VALUE);
         _loc2_.size = new Number3D();
         for each(_loc3_ in _loc1_)
         {
            _loc2_.min.x = Math.min(_loc3_.x,_loc2_.min.x);
            _loc2_.min.y = Math.min(_loc3_.y,_loc2_.min.y);
            _loc2_.min.z = Math.min(_loc3_.z,_loc2_.min.z);
            _loc2_.max.x = Math.max(_loc3_.x,_loc2_.max.x);
            _loc2_.max.y = Math.max(_loc3_.y,_loc2_.max.y);
            _loc2_.max.z = Math.max(_loc3_.z,_loc2_.max.z);
         }
         _loc2_.size.x = _loc2_.max.x - _loc2_.min.x;
         _loc2_.size.y = _loc2_.max.y - _loc2_.min.y;
         _loc2_.size.z = _loc2_.max.z - _loc2_.min.z;
         return _loc2_;
      }
   }
}

