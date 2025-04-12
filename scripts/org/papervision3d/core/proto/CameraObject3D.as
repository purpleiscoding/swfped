package org.papervision3d.core.proto
{
   import flash.geom.Rectangle;
   import org.papervision3d.Papervision3D;
   import org.papervision3d.core.culling.IObjectCuller;
   import org.papervision3d.core.log.PaperLogger;
   import org.papervision3d.core.math.Matrix3D;
   import org.papervision3d.core.math.Number3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class CameraObject3D extends DisplayObject3D
   {
      public static var DEFAULT_POS:Number3D = new Number3D(0,0,-1000);
      
      public static var DEFAULT_UP:Number3D = new Number3D(0,1,0);
      
      public static var DEFAULT_VIEWPORT:Rectangle = new Rectangle(0,0,550,400);
      
      private static var _flipY:Matrix3D = Matrix3D.scaleMatrix(1,-1,1);
      
      protected var _orthoScale:Number = 1;
      
      protected var _orthoScaleMatrix:Matrix3D;
      
      protected var _useCulling:Boolean;
      
      public var eye:Matrix3D;
      
      public var culler:IObjectCuller;
      
      public var sort:Boolean;
      
      public var viewport:Rectangle;
      
      protected var _far:Number;
      
      protected var _ortho:Boolean;
      
      public var zoom:Number;
      
      public var yUP:Boolean;
      
      protected var _target:DisplayObject3D;
      
      public var focus:Number;
      
      protected var _useProjectionMatrix:Boolean;
      
      public function CameraObject3D(param1:Number = 500, param2:Number = 3)
      {
         super();
         this.x = DEFAULT_POS.x;
         this.y = DEFAULT_POS.y;
         this.z = DEFAULT_POS.z;
         this.zoom = param2;
         this.focus = param1;
         this.eye = Matrix3D.IDENTITY;
         this.viewport = DEFAULT_VIEWPORT;
         this.sort = true;
         _ortho = false;
         _orthoScaleMatrix = Matrix3D.scaleMatrix(1,1,1);
         if(Papervision3D.useRIGHTHANDED)
         {
            DEFAULT_UP.y = -1;
            this.yUP = false;
            this.lookAt(DisplayObject3D.ZERO);
         }
         else
         {
            this.yUP = true;
         }
      }
      
      public function get far() : Number
      {
         return _far;
      }
      
      public function set target(param1:DisplayObject3D) : void
      {
         _target = param1;
      }
      
      public function set ortho(param1:Boolean) : void
      {
         _ortho = param1;
      }
      
      public function set far(param1:Number) : void
      {
         if(param1 > this.focus)
         {
            _far = param1;
         }
      }
      
      public function get near() : Number
      {
         return this.focus;
      }
      
      override public function lookAt(param1:DisplayObject3D, param2:Number3D = null) : void
      {
         if(this.yUP)
         {
            super.lookAt(param1,param2);
         }
         else
         {
            super.lookAt(param1,param2 || DEFAULT_UP);
         }
      }
      
      public function projectVertices(param1:DisplayObject3D, param2:RenderSessionData) : Number
      {
         return 0;
      }
      
      public function set useProjectionMatrix(param1:Boolean) : void
      {
         _useProjectionMatrix = param1;
      }
      
      public function set useCulling(param1:Boolean) : void
      {
         _useCulling = param1;
      }
      
      public function set near(param1:Number) : void
      {
         if(param1 > 0)
         {
            this.focus = param1;
         }
      }
      
      public function unproject(param1:Number, param2:Number) : Number3D
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number3D = null;
         _loc3_ = focus * zoom / focus;
         _loc4_ = new Number3D(param1 / _loc3_,-param2 / _loc3_,focus);
         Matrix3D.multiplyVector3x3(transform,_loc4_);
         return _loc4_;
      }
      
      public function transformView(param1:Matrix3D = null) : void
      {
         if(this.yUP)
         {
            eye.calculateMultiply(param1 || this.transform,_flipY);
            eye.invert();
         }
         else
         {
            eye.calculateInverse(param1 || this.transform);
         }
      }
      
      public function get target() : DisplayObject3D
      {
         return _target;
      }
      
      public function pan(param1:Number) : void
      {
      }
      
      public function set fov(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(!viewport || viewport.isEmpty())
         {
            PaperLogger.warning("CameraObject3D#viewport not set, can\'t set fov!");
            return;
         }
         _loc2_ = 0;
         _loc3_ = 0;
         _loc4_ = 0;
         if(_target)
         {
            _loc2_ = _target.world.n14;
            _loc3_ = _target.world.n24;
            _loc4_ = _target.world.n34;
         }
         _loc5_ = this.x - _loc2_;
         _loc6_ = this.y - _loc3_;
         _loc7_ = this.z - _loc4_;
         _loc8_ = viewport.height / 2;
         _loc9_ = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_ + _loc7_ * _loc7_) + this.focus;
         _loc10_ = 180 / Math.PI;
         _loc11_ = param1 / 2 * (Math.PI / 180);
         this.focus = _loc8_ / Math.tan(_loc11_) / this.zoom;
      }
      
      public function get useProjectionMatrix() : Boolean
      {
         return _useProjectionMatrix;
      }
      
      public function get ortho() : Boolean
      {
         return _ortho;
      }
      
      public function get orthoScale() : Number
      {
         return _orthoScale;
      }
      
      public function tilt(param1:Number) : void
      {
      }
      
      public function get fov() : Number
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(!viewport || viewport.isEmpty())
         {
            PaperLogger.warning("CameraObject3D#viewport not set, can\'t calculate fov!");
            return NaN;
         }
         _loc1_ = 0;
         _loc2_ = 0;
         _loc3_ = 0;
         if(_target)
         {
            _loc1_ = _target.world.n14;
            _loc2_ = _target.world.n24;
            _loc3_ = _target.world.n34;
         }
         _loc4_ = this.x - _loc1_;
         _loc5_ = this.y - _loc2_;
         _loc6_ = this.z - _loc3_;
         _loc7_ = this.focus;
         _loc8_ = this.zoom;
         _loc9_ = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_) + _loc7_;
         _loc10_ = viewport.height / 2;
         _loc11_ = 180 / Math.PI;
         return Math.atan(_loc9_ / _loc7_ / _loc8_ * _loc10_ / _loc9_) * _loc11_ * 2;
      }
      
      public function orbit(param1:Number, param2:Number, param3:Boolean = true, param4:DisplayObject3D = null) : void
      {
      }
      
      public function get useCulling() : Boolean
      {
         return _useCulling;
      }
      
      public function set orthoScale(param1:Number) : void
      {
         _orthoScale = param1 > 0 ? param1 : 0.0001;
         _orthoScaleMatrix.n11 = _orthoScale;
         _orthoScaleMatrix.n22 = _orthoScale;
         _orthoScaleMatrix.n33 = _orthoScale;
      }
   }
}

