package org.papervision3d.core.geom.renderables
{
   import org.papervision3d.core.math.Number3D;
   import org.papervision3d.core.math.NumberUV;
   import org.papervision3d.core.proto.MaterialObject3D;
   import org.papervision3d.core.render.command.IRenderListItem;
   import org.papervision3d.core.render.command.RenderTriangle;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class Triangle3D extends AbstractRenderable implements IRenderable
   {
      private static var _totalFaces:Number = 0;
      
      public var vertices:Array;
      
      public var v1:Vertex3D;
      
      public var face3DInstance:Triangle3DInstance;
      
      public var _uvArray:Array;
      
      public var visible:Boolean;
      
      public var id:Number;
      
      public var material:MaterialObject3D;
      
      public var renderCommand:RenderTriangle;
      
      public var screenZ:Number;
      
      public var uv0:NumberUV;
      
      public var uv1:NumberUV;
      
      public var uv2:NumberUV;
      
      public var faceNormal:Number3D;
      
      public var _materialName:String;
      
      public var v0:Vertex3D;
      
      public var v2:Vertex3D;
      
      public function Triangle3D(param1:DisplayObject3D, param2:Array, param3:MaterialObject3D = null, param4:Array = null)
      {
         super();
         this.instance = param1;
         this.renderCommand = new RenderTriangle(this);
         face3DInstance = new Triangle3DInstance(this,param1);
         faceNormal = new Number3D();
         if(Boolean(param2) && param2.length == 3)
         {
            this.vertices = param2;
            v0 = param2[0];
            v1 = param2[1];
            v2 = param2[2];
            createNormal();
         }
         else
         {
            param2 = new Array();
            v0 = param2[0] = new Vertex3D();
            v1 = param2[1] = new Vertex3D();
            v2 = param2[2] = new Vertex3D();
         }
         this.material = param3;
         this.uv = param4;
         this.id = _totalFaces++;
      }
      
      public function set uv(param1:Array) : void
      {
         if(Boolean(param1) && param1.length == 3)
         {
            uv0 = NumberUV(param1[0]);
            uv1 = NumberUV(param1[1]);
            uv2 = NumberUV(param1[2]);
         }
         _uvArray = param1;
      }
      
      public function createNormal() : void
      {
         var _loc1_:Number3D = null;
         var _loc2_:Number3D = null;
         var _loc3_:Number3D = null;
         _loc1_ = v0.getPosition();
         _loc2_ = v1.getPosition();
         _loc3_ = v2.getPosition();
         _loc2_.minusEq(_loc1_);
         _loc3_.minusEq(_loc1_);
         faceNormal = Number3D.cross(_loc2_,_loc3_,faceNormal);
         faceNormal.normalize();
      }
      
      public function get uv() : Array
      {
         return _uvArray;
      }
      
      public function updateVertices() : void
      {
         v0 = vertices[0];
         v1 = vertices[1];
         v2 = vertices[2];
      }
      
      override public function getRenderListItem() : IRenderListItem
      {
         return renderCommand;
      }
   }
}

