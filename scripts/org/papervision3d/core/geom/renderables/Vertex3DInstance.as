package org.papervision3d.core.geom.renderables
{
   import org.papervision3d.core.math.Number3D;
   
   public class Vertex3DInstance
   {
      public var visible:Boolean;
      
      public var normal:Number3D;
      
      public var extra:Object;
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public function Vertex3DInstance(param1:Number = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.x = param1;
         this.y = param2;
         this.z = param3;
         this.visible = false;
         this.normal = new Number3D();
      }
      
      public static function cross(param1:Vertex3DInstance, param2:Vertex3DInstance) : Number
      {
         return param1.x * param2.y - param2.x * param1.y;
      }
      
      public static function dot(param1:Vertex3DInstance, param2:Vertex3DInstance) : Number
      {
         return param1.x * param2.x + param1.y * param2.y;
      }
      
      public static function subTo(param1:Vertex3DInstance, param2:Vertex3DInstance, param3:Vertex3DInstance) : void
      {
         param3.x = param2.x - param1.x;
         param3.y = param2.y - param1.y;
      }
      
      public static function sub(param1:Vertex3DInstance, param2:Vertex3DInstance) : Vertex3DInstance
      {
         return new Vertex3DInstance(param2.x - param1.x,param2.y - param1.y);
      }
      
      public function clone() : Vertex3DInstance
      {
         var _loc1_:Vertex3DInstance = null;
         _loc1_ = new Vertex3DInstance(x,y,z);
         _loc1_.visible = visible;
         _loc1_.extra = extra;
         return _loc1_;
      }
   }
}

